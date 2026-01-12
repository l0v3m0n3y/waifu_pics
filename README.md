# waifu_pics
api for waifu.pics Image sharing platform and API for anime images, entirely user curated (joke gone too far)
# main
```lua
local Client = require("waifu_pics")
local client = Client.new()
local result, err = client:many_pics("nsfw","trap")
if result then
    print(table.concat(result.files, "\n"))
end
```

# Launch (your script)
```
lua main.lua
```
