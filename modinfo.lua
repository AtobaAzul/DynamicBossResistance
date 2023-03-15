name = "Dynamic Boss Resistance"
version = "0.2.4.4"
description = [[
Bosses gain defense when taking several hits, scaling with players.
v0.2.4.4]]
author = "Atobá Azul"
forumthread = ""
api_version = 10
dst_compatible = true
all_clients_require_mod = true

icon_atlas = "dbr_modicon.xml"
icon = "dbr_modicon.tex"
server_filter_tags = {"dbr", "Dynamic"}
priority = -347

local function Header(title)
	return { name = "", label = title, hover = "", options = { {description = "", data = false}, }, default = false, }
end

local function SkipSpace()
	return { name = "", label = "", hover = "", options = { {description = "", data = false}, }, default = false, }
end

local function BinaryConfig(name, label, hover, default)
    return { name = name, label = label, hover = hover, options = { {description = "Enabled", data = true, hover = "Enabled."}, {description = "Disabled", data = false, hover = "Disabled."}, }, default = default, }
end

--BRO table.insert can't be used in modinfo :(
local function TuningConfig(name, label, hover, min, max, step, default)
    local return_table = {name = name, label = label, hover = hover, options = {}, default = default}
    for i = min or 1, max, step or 1 do
        return_table.options[#return_table.options + 1] = {description = i.."x", data = i}
    end
    return return_table
end

configuration_options = {
    Header("Bosses"),
	BinaryConfig("static_scaling", "Static Scaling", "Resistance is based purely on the amount of players around.", false),
    BinaryConfig("lowerbosshp", "Lowered Boss HP", "Lowers the HP of the tankier bosses.", true),
    -- SkipSpace(),
    --  TODO
    --    Header("Tuning"),

}


