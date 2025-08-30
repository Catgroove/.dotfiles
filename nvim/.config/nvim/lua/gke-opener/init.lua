-- A Neovim plugin to open the GKE deployment view in GCP for the current buffer.
--
-- This version infers GCP details from the file path structure:
-- .../<team>/<service-name>/<cluster>/deployment.yaml
--
-- Prerequisites:
-- 1. yq: A command-line YAML processor.
-- 2. open (macOS) to open URLs in the browser.

local M = {}

local environment_to_cluster = {
	["development"] = "development-v2",
	["stage"] = "stage-v2",
	["production"] = "production-v2",
}

-- Helper function to run a shell command and get its output.
local function get_command_output(cmd)
	local handle = io.popen(cmd)
	if not handle then
		return nil
	end
	local output = handle:read("*a")
	handle:close()
	-- Trim whitespace, especially trailing newlines
	return output:match("^%s*(.-)%s*$")
end

-- The main function that will be called to open the GKE deployment URL.
function M.open_in_gcp()
	local current_buf = vim.api.nvim_get_current_buf()
	local full_path = vim.api.nvim_buf_get_name(current_buf)

	vim.print(full_path)

	-- Use yq to check if the file is a Kubernetes Deployment
	local kind = get_command_output("yq e '.kind' " .. vim.fn.shellescape(full_path))
	if kind ~= "Deployment" then
		vim.notify("Not a Kubernetes Deployment file. (Kind: " .. (kind or "N/A") .. ")", vim.log.levels.INFO)
		return
	end

	vim.notify("✅ File identified as a Kubernetes Deployment. Extracting details...")

	-- --- Extract information from the file path ---
	-- We expect a path structure like: <team>/<service>/<cluster>/deployment.yaml
	local team, _, environment = full_path:match("([^/]+)/([^/]+)/([^/]+)/deployment%.yaml$")

	if not team or not environment then
		vim.notify(
			"File path does not match expected structure: .../<team>/<service>/<cluster>/deployment.yaml",
			vim.log.levels.ERROR
		)
		return
	end

	-- Assume the 'team' directory corresponds to the GCP project ID.
	local project_id = team

	-- Determine the cluster's location from the configuration.
	local location = "europe-west1-b"

	-- --- Extract information from the file content ---
	-- Get the actual deployment name and namespace from the manifest, as it's the source of truth.
	local query = table.concat({
		'.metadata.namespace // "default"', -- Use default if namespace is null
		".metadata.name",
	}, ' + "\\n" + ')

	local command = "yq e '" .. query .. "' " .. vim.fn.shellescape(full_path)
	local details_str = get_command_output(command)

	if not details_str then
		vim.notify("Failed to execute yq command.", vim.log.levels.ERROR)
		return
	end

	local details = vim.split(details_str, "\n")
	local namespace, deployment_name = unpack(details)

	-- --- Validate extracted information ---
	if not deployment_name or deployment_name == "null" then
		vim.notify("Could not find metadata.name in the deployment file.", vim.log.levels.ERROR)
		return
	end

	-- --- Construct the URL ---
	local url = string.format(
		"https://console.cloud.google.com/kubernetes/deployment/%s/%s/%s/%s/overview?project=ingrid-head",
		location,
		environment_to_cluster[environment],
		namespace,
		deployment_name,
		project_id
	)

	vim.notify("🚀 Opening in browser: " .. url, vim.log.levels.INFO)

	vim.fn.jobstart("open " .. vim.fn.shellescape(url), { detach = true })
end

return M
