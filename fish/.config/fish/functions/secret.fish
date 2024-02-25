function secret
    kubectl get secret "$argv[1]" -o jsonpath='{.data}' | jq -r '.'"$argv[2]" | base64 --decode
end
