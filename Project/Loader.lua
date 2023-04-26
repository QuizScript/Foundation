

local gamelist = {
    [1335695570] = "https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/Ninja.lua", -- Ninja legend
    [210851291] = "https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/Build.lua", -- Build a boat
    [1650291138] = "https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/DemonFall.lua", -- Demon fall
    [380704901] = "https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/RoGhoul.lua", -- Ro ghoul
    [111958650] = "https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/Arsenal.lua", -- Arsenal
    [2655311011] = "https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/AnimeDimension.lua", -- Anime dimension simulator
}

local namelist = {
    [1335695570] = "Ninja legend", 
    [210851291] = "Build a boat for treasure",
    [380704901] = "Ro Ghoul",
    [1650291138] = "Demon Fall",
    [2655311011] = "Anime Dimension Simulator",
    [111958650] = "Arsenal",
    [1511883870] = "Shindo Life",
}

local placeid = game.PlaceId
local gameid = game.gameId
local checklist = gamelist[gameid]
local gnamelist = namelist[gameid]

-- Load [1]

if gamelist[gameid] then
    warn(namelist)
    if gnamelist ~= "" or not gnamelist ~= nil then
        print("[Game]"..gnamelist)
        if checklist ~= "" or not checklist ~= nil then
            print(checklist)
            loadstring(game:HttpGet(checklist))()
        end
    end
end

-- Load [2]

if gameid == 1511883870 or 
    placeId == 4616652839 or 
    placeId == 6986372023 or 
    placeId == 5431069982 or 
    placeId == 5431071837 or
    placeId == 4601350394 or
    placeId == 5743370338 or
    placeId == 5447073001 or
    placeId == 5824792748 or
    placeId == 4601350760 or
    placeId == 4601350656 or
    placeId == 6341670805 or
    placeId == 5943872934 or
    placeId == 4601350214 or
    placeId == 4601350809 or
    placeId == 5451401540 or
    placeId == 5451401540 or
    placeId == 5084678830 or
    placeId == 5451398863 or
    placeId == 590798306 or
    placeId == 7923764447 or
    placeId == 6901575446 or
    placeId == 7554179068 or
    placeId == 5307141034 or
    placeId == 6986372023 or
    placeId == 4616652839 or
    placeId == 6984568732 or
    placeId == 7214033433 or
    placeId == 8184506020 or
    placeId == 8472733618 or
    placeId == 9310522814 or
    placeId == 7524809704 or
    placeId == 7524811367
then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/QuizScript/Foundation/main/Project/Game/Shindo.lua"))()
end
