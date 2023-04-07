--[[
    primordial.dev
    By: henpett1 :)
]] local accent_color = {}
accent_color.is_enabled = menu.add_checkbox("color changer", "enable", false)
accent_color.mode = menu.add_selection("color changer", "type",
    {"dreamy", "rainbow", "vaporwave", "tropical", "the end"})
accent_color.color_speed = menu.add_slider("color changer", "speed", 1, 10)
accent_color.color_speed:set(6)
accent_color.menu_option = select(2, unpack(menu.find("misc", "main", "config", "accent color")))
accent_color.last_time_update = -1

function Split(s, delimiter)
    result = {};
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match);
    end
    return result;
end

accent_color.update = function(color)
    local current_tick = global_vars.tick_count()
    local colorstr = Split(color, ",")
    local r, g, b = tonumber(colorstr[1]), tonumber(colorstr[2]), tonumber(colorstr[3])
    if current_tick > accent_color.last_time_update then
        accent_color.menu_option:set(color_t(r, g, b, 255))
        accent_color.last_time_update = current_tick + 16
    end
end

accent_color.pink_blue = {"255, 113, 237", "247, 120, 243", "239, 126, 249", "230, 132, 254", "222, 138, 255",
                          "213, 143, 255", "204, 148, 255", "196, 153, 255", "187, 157, 255", "179, 162, 255",
                          "171, 165, 255", "163, 169, 255", "156, 172, 255", "150, 176, 255", "144, 178, 255",
                          "138, 181, 255", "134, 184, 255", "131, 186, 255", "128, 188, 255", "127, 190, 255",
                          "128, 188, 255", "131, 186, 255", "134, 184, 255", "138, 181, 255", "144, 178, 255",
                          "150, 176, 255", "156, 172, 255", "163, 169, 255", "171, 165, 255", "179, 162, 255",
                          "187, 157, 255", "196, 153, 255", "204, 148, 255", "213, 143, 255", "222, 138, 255",
                          "230, 132, 254", "239, 126, 249", "247, 120, 243"}

accent_color.red_purple_blue = {"255, 0, 0", "255, 0, 12", "255, 0, 21", "255, 0, 29", "255, 0, 36", "255, 0, 42",
                                "255, 0, 48", "255, 0, 54", "255, 0, 60", "255, 0, 66", "255, 0, 71", "255, 0, 77",
                                "255, 0, 83", "255, 0, 89", "255, 0, 95", "255, 0, 101", "255, 0, 107", "255, 0, 113",
                                "255, 0, 119", "255, 0, 125", "255, 0, 131", "255, 0, 137", "255, 0, 144",
                                "255, 0, 150", "255, 0, 157", "255, 0, 163", "255, 0, 170", "255, 0, 176",
                                "255, 0, 183", "255, 0, 189", "255, 0, 196", "255, 0, 203", "255, 0, 209",
                                "255, 0, 216", "255, 0, 222", "255, 0, 229", "255, 0, 236", "255, 0, 242",
                                "255, 0, 249", "255, 0, 255", "251, 0, 255", "248, 0, 255", "244, 0, 255",
                                "240, 0, 255", "237, 0, 255", "233, 0, 255", "229, 0, 255", "225, 0, 255",
                                "221, 0, 255", "217, 0, 255", "213, 0, 255", "209, 0, 255", "205, 0, 255",
                                "200, 0, 255", "196, 0, 255", "192, 0, 255", "187, 0, 255", "183, 0, 255",
                                "178, 0, 255", "173, 0, 255", "168, 0, 255", "163, 0, 255", "158, 0, 255",
                                "153, 0, 255", "148, 0, 255", "142, 0, 255", "136, 0, 255", "130, 0, 255",
                                "124, 0, 255", "118, 0, 255", "111, 0, 255", "104, 0, 255", "96, 0, 255", "87, 0, 255",
                                "78, 0, 255", "67, 0, 255", "54, 0, 255", "37, 0, 255", "0, 0, 255", "68, 0, 250",
                                "96, 0, 244", "116, 0, 238", "133, 0, 232", "147, 0, 226", "160, 0, 220", "171, 0, 213",
                                "181, 0, 206", "191, 0, 200", "199, 0, 193", "207, 0, 186", "214, 0, 179",
                                "220, 0, 172", "226, 0, 166", "232, 0, 159", "237, 0, 152", "241, 0, 145",
                                "245, 0, 138", "249, 0, 132", "252, 0, 125", "255, 0, 119", "255, 0, 112",
                                "255, 0, 106", "255, 0, 100", "255, 0, 94", "255, 0, 88", "255, 0, 82", "255, 0, 76",
                                "255, 0, 70", "255, 0, 64", "255, 0, 59", "255, 0, 53", "255, 0, 47", "255, 0, 42",
                                "255, 0, 35", "255, 0, 29", "255, 0, 21", "255, 0, 12"}

accent_color.rainbow = {"255, 0, 0", "255, 64, 0", "255, 128, 0", "255, 191, 0", "255, 255, 0", "191, 255, 0",
                        "128, 255, 0", "64, 255, 0", "0, 255, 0", "0, 255, 64", "0, 255, 128", "0, 255, 191",
                        "0, 255, 255", "0, 191, 255", "0, 128, 255", "0, 64, 255", "0, 0, 255", "64, 0, 255",
                        "128, 0, 255", "191, 0, 255", "255, 0, 255", "255, 0, 191", "255, 0, 128", "255, 0, 64",
                        "255, 0, 0"}

accent_color.tropical = {"168, 0, 255", "164, 6, 255", "159, 13, 255", "155, 19, 255", "151, 25, 255", "146, 32, 255",
                         "142, 38, 255", "138, 44, 255", "134, 50, 255", "129, 57, 255", "125, 63, 255", "121, 69, 255",
                         "116, 76, 255", "112, 82, 255", "108, 88, 255", "103, 95, 255", "99, 101, 255", "95, 107, 255",
                         "90, 114, 255", "86, 120, 255", "82, 126, 255", "78, 132, 255", "73, 139, 255", "69, 145, 255",
                         "65, 151, 255", "60, 158, 255", "56, 164, 255", "52, 170, 255", "47, 177, 255", "43, 183, 255",
                         "39, 189, 255", "34, 196, 255", "30, 202, 255", "26, 208, 255", "22, 214, 255", "17, 221, 255",
                         "13, 227, 255", "9, 233, 255", "4, 240, 255", "0, 246, 255", "7, 240, 253", "13, 233, 251",
                         "20, 227, 249", "26, 221, 247", "33, 214, 245", "39, 208, 243", "46, 202, 240", "52, 196, 238",
                         "59, 189, 236", "65, 183, 234", "72, 177, 232", "78, 170, 230", "85, 164, 228", "92, 158, 226",
                         "98, 151, 224", "105, 145, 222", "111, 139, 220", "118, 132, 218", "124, 126, 216",
                         "131, 120, 213", "137, 114, 211", "144, 107, 209", "150, 101, 207", "157, 95, 205",
                         "163, 88, 203", "170, 82, 201", "177, 76, 199", "183, 69, 197", "190, 63, 195", "196, 57, 193",
                         "203, 50, 191", "209, 44, 189", "216, 38, 186", "222, 32, 184", "229, 25, 182", "235, 19, 180",
                         "242, 13, 178", "248, 6, 176", "255, 0, 174", "255, 4, 170", "255, 7, 165", "255, 11, 161",
                         "255, 15, 156", "255, 18, 152", "255, 22, 147", "255, 26, 143", "255, 30, 138", "255, 33, 134",
                         "255, 37, 129", "255, 41, 125", "255, 44, 120", "255, 48, 116", "255, 52, 112", "255, 55, 107",
                         "255, 59, 103", "255, 63, 98", "255, 66, 94", "255, 70, 89", "255, 74, 85", "255, 78, 80",
                         "255, 81, 76", "255, 85, 71", "255, 89, 67", "255, 92, 62", "255, 96, 58", "255, 100, 54",
                         "255, 103, 49", "255, 107, 45", "255, 111, 40", "255, 114, 36", "255, 118, 31", "255, 122, 27",
                         "255, 126, 22", "255, 129, 18", "255, 133, 13", "255, 137, 9", "255, 140, 4", "255, 144, 0",
                         "253, 140, 7", "251, 137, 13", "248, 133, 20", "246, 129, 26", "244, 126, 33", "242, 122, 39",
                         "239, 118, 46", "237, 114, 52", "235, 111, 59", "233, 107, 65", "230, 103, 72", "228, 100, 78",
                         "226, 96, 85", "224, 92, 92", "222, 89, 98", "219, 85, 105", "217, 81, 111", "215, 78, 118",
                         "213, 74, 124", "210, 70, 131", "208, 66, 137", "206, 63, 144", "204, 59, 150", "201, 55, 157",
                         "199, 52, 163", "197, 48, 170", "195, 44, 177", "193, 41, 183", "190, 37, 190", "188, 33, 196",
                         "186, 30, 203", "184, 26, 209", "181, 22, 216", "179, 18, 222", "177, 15, 229", "175, 11, 235",
                         "172, 7, 242", "170, 4, 248", "168, 0, 255"}

accent_color.the_end = {"255, 230, 152", "254, 227, 155", "252, 224, 157", "251, 221, 160", "250, 218, 163",
                        "249, 215, 165", "247, 212, 168", "246, 209, 170", "245, 206, 173", "244, 203, 176",
                        "242, 199, 178", "241, 196, 181", "240, 193, 184", "239, 190, 186", "237, 187, 189",
                        "236, 184, 192", "235, 181, 194", "234, 178, 197", "232, 175, 200", "231, 172, 202",
                        "230, 169, 205", "229, 166, 207", "227, 163, 210", "226, 160, 213", "225, 157, 215",
                        "224, 154, 218", "222, 151, 221", "221, 148, 223", "220, 145, 226", "219, 142, 229",
                        "217, 138, 231", "216, 135, 234", "215, 132, 237", "214, 129, 239", "212, 126, 242",
                        "211, 123, 244", "210, 120, 247", "209, 117, 250", "207, 114, 252", "206, 111, 255",
                        "206, 111, 255", "207, 114, 252", "209, 117, 250", "210, 120, 247", "211, 123, 244",
                        "212, 126, 242", "214, 129, 239", "215, 132, 237", "216, 135, 234", "217, 138, 231",
                        "219, 142, 229", "220, 145, 226", "221, 148, 223", "222, 151, 221", "224, 154, 218",
                        "225, 157, 215", "226, 160, 213", "227, 163, 210", "229, 166, 207", "230, 169, 205",
                        "231, 172, 202", "232, 175, 200", "234, 178, 197", "235, 181, 194", "236, 184, 192",
                        "237, 187, 189", "239, 190, 186", "240, 193, 184", "241, 196, 181", "242, 199, 178",
                        "244, 203, 176", "245, 206, 173", "246, 209, 170", "247, 212, 168", "249, 215, 165",
                        "250, 218, 163", "251, 221, 160", "252, 224, 157", "254, 227, 155", "255, 230, 152"}

accent_color.disabled = true
accent_color.on_paint = function()

    local is_enabled = accent_color.is_enabled:get()
    if not is_enabled then
        if not is_enabled and not accent_color.disabled then
            accent_color.disabled = true
        end

        accent_color.last_time_update = -1
        return
    end

    local color_speed = accent_color.color_speed:get()

    if accent_color.mode:get() == 1 then
        local current_color = math.floor(global_vars.cur_time() * color_speed % #accent_color.pink_blue) + 1
        current_color = accent_color.pink_blue[current_color]
        accent_color.disabled = false
        accent_color.update(current_color)
    end
    if accent_color.mode:get() == 2 then
        local current_color = math.floor(global_vars.cur_time() * color_speed % #accent_color.rainbow) + 1
        current_color = accent_color.rainbow[current_color]
        accent_color.disabled = false
        accent_color.update(current_color)
    end
    if accent_color.mode:get() == 3 then
        local current_color = math.floor(global_vars.cur_time() * color_speed % #accent_color.red_purple_blue) + 1
        current_color = accent_color.red_purple_blue[current_color]
        accent_color.disabled = false
        accent_color.update(current_color)
    end
    if accent_color.mode:get() == 4 then
        local current_color = math.floor(global_vars.cur_time() * color_speed % #accent_color.tropical) + 1
        current_color = accent_color.tropical[current_color]
        accent_color.disabled = false
        accent_color.update(current_color)
    end
    if accent_color.mode:get() == 5 then
        local current_color = math.floor(global_vars.cur_time() * color_speed % #accent_color.the_end) + 1
        current_color = accent_color.the_end[current_color]
        accent_color.disabled = false
        accent_color.update(current_color)
    end
end

callbacks.add(e_callbacks.PAINT, accent_color.on_paint)