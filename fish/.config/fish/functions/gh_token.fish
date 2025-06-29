function gh_token
    git config --global --get-regexp 'url.*insteadOf' | sed -E 's|.*https://Catgroove:(.*)@.*|\1|'
end
