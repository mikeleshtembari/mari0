toUpload = {}

function addToUpload(short, name, json, frames)
    local repData = {
        short = short,
        name = name,
        json = json,
        frames = frames,
    }
    
    table.insert(toUpload, repData)
end

function processUploads()
    local toRemove = {}
    print("Processing " .. #toUpload .. " uploads.")
    
    for _, v in ipairs(toUpload) do
        print(v.name, v.frames, type(v.json), API_PASS, v.short)
        
        local body = "name=" .. v.name .. "&" ..
            "frames=" .. v.frames .. "&" ..
            "data=" .. v.json .. "&" ..
            "event=" .. "GC2017" .. "&" ..
            "pass=" .. API_PASS .. "&" .. 
            "short=" .. v.short

        -- Upload replay data
        if http.request('http://timetrial.dev/api/replays', body) then
            table.insert(toRemove, i)
        else
            break
        end
    end
    
	local delete = {}
	
	table.sort(delete, function(a,b) return a>b end)
	
	for _, v in ipairs(delete) do
		table.remove(toUpload, v)
	end
end