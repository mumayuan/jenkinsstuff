# Run parameters  username password jenkinsURL
# Then prune the unnecessary plugins , such as blueocean
# replace the result spaces with :



echo curl -u $1:$2 "$3/pluginManager/api/xml?depth=1&x‌​path=/*/*/shortName|‌​/*/*/version&wrapper‌​=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'
curl --insecure -u $1:$2 "$3/pluginManager/api/xml?depth=1&x‌​path=/*/*/shortName|‌​/*/*/version&wrapper‌​=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'
