function seshdir
    mkdir -p $argv[1]
    zoxide add $argv[1]
    sesh connect $argv[1]
end
