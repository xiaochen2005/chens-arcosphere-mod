-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 定义所有曲虹球的子组及其图标列表
local arcosphere_tiers = {
    ["tier-1-arcosphere"] = {"tier-1", "gold", "wood", "water", "fire", "soil"},
    ["tier-2-arcosphere"] = {
        "tier-2", "one-point", "two-point", "three-point", "four-point",
        "five-point", "six-point"
    },
    ["tier-3-arcosphere"] = {
        "tier-3", "brown", "red", "orange", "yellow", "green", "blue", "purple"
    },
    ["tier-4-arcosphere"] = {
        "tier-4", "up", "up-right", "right", "down-right", "down", "down-left",
        "left", "up-left"
    },
    ["tier-5-arcosphere"] = {
        "tier-5", "sun", "mercury", "venus", "earth", "mars", "jupiter",
        "saturn", "uranus", "neptune"
    }
}

-- 转换数字为字母序列
local function index_to_letters(index)
    local letters = ""
    index = index - 1
    repeat
        letters = string.char((index % 26) + 97) .. letters
        index = math.floor(index / 26) - 1
    until index < 0
    return letters
end

-- 注册所有子组
local subgroups = {}
for subgroup, _ in pairs(arcosphere_tiers) do
    table.insert(subgroups, {
        type = "item-subgroup",
        name = subgroup,
        group = "production"
    })
end
data:extend(subgroups)

-- 注册所有曲虹球物品
local all_arcosphere_items = {}

for subgroup, icons in pairs(arcosphere_tiers) do
    for index, icon in ipairs(icons) do
        table.insert(all_arcosphere_items, {
            type = "item",
            name = icon .. "-arcosphere",
            icon = "__chens-arcosphere-mod__/graphics/icons/" .. icon ..
                "-arcosphere.png",
            icon_size = 64,
            order = index_to_letters(index),
            subgroup = subgroup,
            stack_size = 100
        })
    end
end

data:extend(all_arcosphere_items)

-- 注册配方
data:extend({ -- 注册1级复合曲虹球
    {
        type = "recipe",
        name = "tier-1-arcosphere",
        ingredients = {
            {type = "item", name = "iron-ore", amount = 5},
            {type = "item", name = "copper-ore", amount = 5}
        },
        results = {{type = "item", name = "tier-1-arcosphere", amount = 10}},
        main_product = "tier-1-arcosphere",
        energy_required = 1,
        enabled = true,
        category = "crafting"
    }, -- 注册所有1级复合曲虹球
    {
        type = "recipe",
        name = "tier-1-arcosphere-dismantle",
        icon = "__chens-arcosphere-mod__/graphics/icons/all-tier-1-arcosphere.png",
        icon_size = 64,
        ingredients = {{type = "item", name = "tier-1-arcosphere", amount = 5}},
        results = {
            {type = "item", name = "gold-arcosphere", amount = 1},
            {type = "item", name = "wood-arcosphere", amount = 1},
            {type = "item", name = "water-arcosphere", amount = 1},
            {type = "item", name = "fire-arcosphere", amount = 1},
            {type = "item", name = "soil-arcosphere", amount = 1}
        },
        energy_required = 1,
        enabled = true,
        category = "crafting",
        group = "production",
        subgroup = "tier-1-arcosphere",
        order = "z"
    }, -- 注册金 曲虹球
    {
        type = "recipe",
        name = "gold-arcosphere",
        ingredients = {
            {type = "item", name = "wood-arcosphere", amount = 1},
            {type = "item", name = "water-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "gold-arcosphere", amount = 1}},
        main_product = "gold-arcosphere",
        energy_required = 1,
        enabled = true,
        category = "crafting"
    }, -- 注册木 曲虹球
    {
        type = "recipe",
        name = "wood-arcosphere",
        ingredients = {
            {type = "item", name = "water-arcosphere", amount = 1},
            {type = "item", name = "fire-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "wood-arcosphere", amount = 1}},
        main_product = "wood-arcosphere",
        energy_required = 1,
        enabled = true,
        category = "crafting"
    }, -- 注册水 曲虹球
    {
        type = "recipe",
        name = "water-arcosphere",
        ingredients = {
            {type = "item", name = "fire-arcosphere", amount = 1},
            {type = "item", name = "soil-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "water-arcosphere", amount = 1}},
        main_product = "water-arcosphere",
        energy_required = 1,
        enabled = true,
        category = "crafting"
    }, -- 注册火 曲虹球 
    {
        type = "recipe",
        name = "fire-arcosphere",
        ingredients = {
            {type = "item", name = "soil-arcosphere", amount = 1},
            {type = "item", name = "gold-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "fire-arcosphere", amount = 1}},
        main_product = "fire-arcosphere",
        energy_required = 1,
        enabled = true,
        category = "crafting"
    }, -- 注册土 曲虹球  
    {
        type = "recipe",
        name = "soil-arcosphere",
        ingredients = {
            {type = "item", name = "gold-arcosphere", amount = 1},
            {type = "item", name = "wood-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "soil-arcosphere", amount = 1}},
        main_product = "soil-arcosphere",
        energy_required = 1,
        enabled = true,
        category = "crafting"
    }, -- 注册2级复合曲虹球
    {
        type = "recipe",
        name = "tier-2-arcosphere",
        ingredients = {
            {type = "item", name = "automation-science-pack", amount = 1}
        },
        results = {{type = "item", name = "tier-2-arcosphere", amount = 12}},
        main_product = "tier-2-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册所有2级复合曲虹球
    {
        type = "recipe",
        name = "tier-2-arcosphere-dismantle",
        icon = "__chens-arcosphere-mod__/graphics/icons/all-tier-2-arcosphere.png",
        icon_size = 64,
        ingredients = {{type = "item", name = "tier-2-arcosphere", amount = 6}},
        results = {
            {type = "item", name = "one-point-arcosphere", amount = 1},
            {type = "item", name = "two-point-arcosphere", amount = 1},
            {type = "item", name = "three-point-arcosphere", amount = 1},
            {type = "item", name = "four-point-arcosphere", amount = 1},
            {type = "item", name = "five-point-arcosphere", amount = 1},
            {type = "item", name = "six-point-arcosphere", amount = 1}
        },
        energy_required = 1,
        enabled = false,
        category = "crafting",
        group = "production",
        subgroup = "tier-2-arcosphere",
        order = "z"
    }, -- 注册一点 曲虹球  
    {
        type = "recipe",
        name = "one-point-arcosphere",
        ingredients = {
            {type = "item", name = "two-point-arcosphere", amount = 1},
            {type = "item", name = "three-point-arcosphere", amount = 1},
            {type = "item", name = "four-point-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "one-point-arcosphere", amount = 1}},
        main_product = "one-point-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册二点 曲虹球  
    {
        type = "recipe",
        name = "two-point-arcosphere",
        ingredients = {
            {type = "item", name = "three-point-arcosphere", amount = 1},
            {type = "item", name = "four-point-arcosphere", amount = 1},
            {type = "item", name = "five-point-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "two-point-arcosphere", amount = 1}},
        main_product = "two-point-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册三点 曲虹球  
    {
        type = "recipe",
        name = "three-point-arcosphere",
        ingredients = {
            {type = "item", name = "four-point-arcosphere", amount = 1},
            {type = "item", name = "five-point-arcosphere", amount = 1},
            {type = "item", name = "six-point-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "three-point-arcosphere", amount = 1}},
        main_product = "three-point-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册四点 曲虹球  
    {
        type = "recipe",
        name = "four-point-arcosphere",
        ingredients = {
            {type = "item", name = "five-point-arcosphere", amount = 1},
            {type = "item", name = "six-point-arcosphere", amount = 1},
            {type = "item", name = "one-point-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "four-point-arcosphere", amount = 1}},
        main_product = "four-point-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册五点 曲虹球  
    {
        type = "recipe",
        name = "five-point-arcosphere",
        ingredients = {
            {type = "item", name = "six-point-arcosphere", amount = 1},
            {type = "item", name = "one-point-arcosphere", amount = 1},
            {type = "item", name = "two-point-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "five-point-arcosphere", amount = 1}},
        main_product = "five-point-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册六点 曲虹球  
    {
        type = "recipe",
        name = "six-point-arcosphere",
        ingredients = {
            {type = "item", name = "one-point-arcosphere", amount = 1},
            {type = "item", name = "two-point-arcosphere", amount = 1},
            {type = "item", name = "three-point-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "six-point-arcosphere", amount = 1}},
        main_product = "six-point-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册3级复合曲虹球
    {
        type = "recipe",
        name = "tier-3-arcosphere",
        ingredients = {
            {type = "item", name = "logistic-science-pack", amount = 1}
        },
        results = {{type = "item", name = "tier-3-arcosphere", amount = 14}},
        main_product = "tier-3-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册所有3级复合曲虹球
    {
        type = "recipe",
        name = "tier-3-arcosphere-dismantle",
        icon = "__chens-arcosphere-mod__/graphics/icons/all-tier-3-arcosphere.png",
        icon_size = 64,
        ingredients = {{type = "item", name = "tier-3-arcosphere", amount = 7}},
        results = {
            {type = "item", name = "brown-arcosphere", amount = 1},
            {type = "item", name = "red-arcosphere", amount = 1},
            {type = "item", name = "orange-arcosphere", amount = 1},
            {type = "item", name = "yellow-arcosphere", amount = 1},
            {type = "item", name = "green-arcosphere", amount = 1},
            {type = "item", name = "blue-arcosphere", amount = 1},
            {type = "item", name = "purple-arcosphere", amount = 1}
        },
        energy_required = 1,
        enabled = false,
        category = "crafting",
        group = "production",
        subgroup = "tier-3-arcosphere",
        order = "z"
    }, -- 注册棕色 曲虹球  
    {
        type = "recipe",
        name = "brown-arcosphere",
        ingredients = {
            {type = "item", name = "red-arcosphere", amount = 1},
            {type = "item", name = "orange-arcosphere", amount = 1},
            {type = "item", name = "yellow-arcosphere", amount = 1},
            {type = "item", name = "green-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "brown-arcosphere", amount = 1}},
        main_product = "brown-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册红色 曲虹球  
    {
        type = "recipe",
        name = "red-arcosphere",
        ingredients = {
            {type = "item", name = "orange-arcosphere", amount = 1},
            {type = "item", name = "yellow-arcosphere", amount = 1},
            {type = "item", name = "green-arcosphere", amount = 1},
            {type = "item", name = "blue-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "red-arcosphere", amount = 1}},
        main_product = "red-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册橙色 曲虹球  
    {
        type = "recipe",
        name = "orange-arcosphere",
        ingredients = {
            {type = "item", name = "yellow-arcosphere", amount = 1},
            {type = "item", name = "green-arcosphere", amount = 1},
            {type = "item", name = "blue-arcosphere", amount = 1},
            {type = "item", name = "purple-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "orange-arcosphere", amount = 1}},
        main_product = "orange-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册黄色 曲虹球  
    {
        type = "recipe",
        name = "yellow-arcosphere",
        ingredients = {
            {type = "item", name = "green-arcosphere", amount = 1},
            {type = "item", name = "blue-arcosphere", amount = 1},
            {type = "item", name = "purple-arcosphere", amount = 1},
            {type = "item", name = "brown-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "yellow-arcosphere", amount = 1}},
        main_product = "yellow-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册绿色 曲虹球  
    {
        type = "recipe",
        name = "green-arcosphere",
        ingredients = {
            {type = "item", name = "blue-arcosphere", amount = 1},
            {type = "item", name = "purple-arcosphere", amount = 1},
            {type = "item", name = "brown-arcosphere", amount = 1},
            {type = "item", name = "red-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "green-arcosphere", amount = 1}},
        main_product = "green-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册蓝色 曲虹球  
    {
        type = "recipe",
        name = "blue-arcosphere",
        ingredients = {
            {type = "item", name = "purple-arcosphere", amount = 1},
            {type = "item", name = "brown-arcosphere", amount = 1},
            {type = "item", name = "red-arcosphere", amount = 1},
            {type = "item", name = "orange-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "blue-arcosphere", amount = 1}},
        main_product = "blue-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册紫色 曲虹球  
    {
        type = "recipe",
        name = "purple-arcosphere",
        ingredients = {
            {type = "item", name = "brown-arcosphere", amount = 1},
            {type = "item", name = "red-arcosphere", amount = 1},
            {type = "item", name = "orange-arcosphere", amount = 1},
            {type = "item", name = "yellow-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "purple-arcosphere", amount = 1}},
        main_product = "purple-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册4级复合曲虹球
    {
        type = "recipe",
        name = "tier-4-arcosphere",
        ingredients = {
            {type = "item", name = "military-science-pack", amount = 1},
            {type = "item", name = "chemical-science-pack", amount = 1}
        },
        results = {{type = "item", name = "tier-4-arcosphere", amount = 16}},
        main_product = "tier-4-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册所有4级复合曲虹球
    {
        type = "recipe",
        name = "tier-4-arcosphere-dismantle",
        icon = "__chens-arcosphere-mod__/graphics/icons/all-tier-4-arcosphere.png",
        icon_size = 64,
        ingredients = {{type = "item", name = "tier-4-arcosphere", amount = 7}},
        results = {
            {type = "item", name = "up-arcosphere", amount = 1},
            {type = "item", name = "up-right-arcosphere", amount = 1},
            {type = "item", name = "right-arcosphere", amount = 1},
            {type = "item", name = "down-right-arcosphere", amount = 1},
            {type = "item", name = "down-arcosphere", amount = 1},
            {type = "item", name = "down-left-arcosphere", amount = 1},
            {type = "item", name = "left-arcosphere", amount = 1},
            {type = "item", name = "up-left-arcosphere", amount = 1}
        },
        energy_required = 1,
        enabled = false,
        category = "crafting",
        group = "production",
        subgroup = "tier-4-arcosphere",
        order = "z"
    }, -- 注册上 曲虹球  
    {
        type = "recipe",
        name = "up-arcosphere",
        ingredients = {
            {type = "item", name = "up-right-arcosphere", amount = 1},
            {type = "item", name = "right-arcosphere", amount = 1},
            {type = "item", name = "down-right-arcosphere", amount = 1},
            {type = "item", name = "down-arcosphere", amount = 1},
            {type = "item", name = "down-left-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "up-arcosphere", amount = 1}},
        main_product = "up-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册右上 曲虹球  
    {
        type = "recipe",
        name = "up-right-arcosphere",
        ingredients = {
            {type = "item", name = "right-arcosphere", amount = 1},
            {type = "item", name = "down-right-arcosphere", amount = 1},
            {type = "item", name = "down-arcosphere", amount = 1},
            {type = "item", name = "down-left-arcosphere", amount = 1},
            {type = "item", name = "left-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "up-right-arcosphere", amount = 1}},
        main_product = "up-right-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册右 曲虹球  
    {
        type = "recipe",
        name = "right-arcosphere",
        ingredients = {
            {type = "item", name = "down-right-arcosphere", amount = 1},
            {type = "item", name = "down-arcosphere", amount = 1},
            {type = "item", name = "down-left-arcosphere", amount = 1},
            {type = "item", name = "left-arcosphere", amount = 1},
            {type = "item", name = "up-left-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "right-arcosphere", amount = 1}},
        main_product = "right-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册右下 曲虹球  
    {
        type = "recipe",
        name = "down-right-arcosphere",
        ingredients = {
            {type = "item", name = "down-arcosphere", amount = 1},
            {type = "item", name = "down-left-arcosphere", amount = 1},
            {type = "item", name = "left-arcosphere", amount = 1},
            {type = "item", name = "up-left-arcosphere", amount = 1},
            {type = "item", name = "up-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "down-right-arcosphere", amount = 1}},
        main_product = "down-right-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册下 曲虹球  
    {
        type = "recipe",
        name = "down-arcosphere",
        ingredients = {
            {type = "item", name = "down-left-arcosphere", amount = 1},
            {type = "item", name = "left-arcosphere", amount = 1},
            {type = "item", name = "up-left-arcosphere", amount = 1},
            {type = "item", name = "up-arcosphere", amount = 1},
            {type = "item", name = "up-right-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "down-arcosphere", amount = 1}},
        main_product = "down-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册左下 曲虹球  
    {
        type = "recipe",
        name = "down-left-arcosphere",
        ingredients = {
            {type = "item", name = "left-arcosphere", amount = 1},
            {type = "item", name = "up-left-arcosphere", amount = 1},
            {type = "item", name = "up-arcosphere", amount = 1},
            {type = "item", name = "up-right-arcosphere", amount = 1},
            {type = "item", name = "right-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "down-left-arcosphere", amount = 1}},
        main_product = "down-left-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册左 曲虹球  
    {
        type = "recipe",
        name = "left-arcosphere",
        ingredients = {
            {type = "item", name = "up-left-arcosphere", amount = 1},
            {type = "item", name = "up-arcosphere", amount = 1},
            {type = "item", name = "up-right-arcosphere", amount = 1},
            {type = "item", name = "right-arcosphere", amount = 1},
            {type = "item", name = "down-right-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "left-arcosphere", amount = 1}},
        main_product = "left-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册左上 曲虹球  
    {
        type = "recipe",
        name = "up-left-arcosphere",
        ingredients = {
            {type = "item", name = "up-arcosphere", amount = 1},
            {type = "item", name = "up-right-arcosphere", amount = 1},
            {type = "item", name = "right-arcosphere", amount = 1},
            {type = "item", name = "down-right-arcosphere", amount = 1},
            {type = "item", name = "down-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "up-left-arcosphere", amount = 1}},
        main_product = "up-left-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册5级复合曲虹球
    {
        type = "recipe",
        name = "tier-5-arcosphere",
        ingredients = {
            {type = "item", name = "production-science-pack", amount = 1},
            {type = "item", name = "utility-science-pack", amount = 1}
        },
        results = {{type = "item", name = "tier-5-arcosphere", amount = 18}},
        main_product = "tier-5-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册所有5级复合曲虹球
    {
        type = "recipe",
        name = "tier-5-arcosphere-dismantle",
        icon = "__chens-arcosphere-mod__/graphics/icons/all-tier-5-arcosphere.png",
        icon_size = 64,
        ingredients = {{type = "item", name = "tier-5-arcosphere", amount = 7}},
        results = {
            {type = "item", name = "sun-arcosphere", amount = 1},
            {type = "item", name = "mercury-arcosphere", amount = 1},
            {type = "item", name = "venus-arcosphere", amount = 1},
            {type = "item", name = "earth-arcosphere", amount = 1},
            {type = "item", name = "mars-arcosphere", amount = 1},
            {type = "item", name = "jupiter-arcosphere", amount = 1},
            {type = "item", name = "saturn-arcosphere", amount = 1},
            {type = "item", name = "uranus-arcosphere", amount = 1},
            {type = "item", name = "neptune-arcosphere", amount = 1}
        },
        energy_required = 1,
        enabled = false,
        category = "crafting",
        group = "production",
        subgroup = "tier-5-arcosphere",
        order = "z"
    }, -- 注册太阳 曲虹球  
    {
        type = "recipe",
        name = "sun-arcosphere",
        ingredients = {
            {type = "item", name = "mercury-arcosphere", amount = 1},
            {type = "item", name = "venus-arcosphere", amount = 1},
            {type = "item", name = "earth-arcosphere", amount = 1},
            {type = "item", name = "mars-arcosphere", amount = 1},
            {type = "item", name = "jupiter-arcosphere", amount = 1},
            {type = "item", name = "saturn-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "sun-arcosphere", amount = 1}},
        main_product = "sun-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册水星 曲虹球  
    {
        type = "recipe",
        name = "mercury-arcosphere",
        ingredients = {
            {type = "item", name = "venus-arcosphere", amount = 1},
            {type = "item", name = "earth-arcosphere", amount = 1},
            {type = "item", name = "mars-arcosphere", amount = 1},
            {type = "item", name = "jupiter-arcosphere", amount = 1},
            {type = "item", name = "saturn-arcosphere", amount = 1},
            {type = "item", name = "uranus-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "mercury-arcosphere", amount = 1}},
        main_product = "mercury-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册金星 曲虹球  
    {
        type = "recipe",
        name = "venus-arcosphere",
        ingredients = {
            {type = "item", name = "earth-arcosphere", amount = 1},
            {type = "item", name = "mars-arcosphere", amount = 1},
            {type = "item", name = "jupiter-arcosphere", amount = 1},
            {type = "item", name = "saturn-arcosphere", amount = 1},
            {type = "item", name = "uranus-arcosphere", amount = 1},
            {type = "item", name = "neptune-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "venus-arcosphere", amount = 1}},
        main_product = "venus-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册地球 曲虹球  
    {
        type = "recipe",
        name = "earth-arcosphere",
        ingredients = {
            {type = "item", name = "mars-arcosphere", amount = 1},
            {type = "item", name = "jupiter-arcosphere", amount = 1},
            {type = "item", name = "saturn-arcosphere", amount = 1},
            {type = "item", name = "uranus-arcosphere", amount = 1},
            {type = "item", name = "neptune-arcosphere", amount = 1},
            {type = "item", name = "sun-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "earth-arcosphere", amount = 1}},
        main_product = "earth-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册火星 曲虹球  
    {
        type = "recipe",
        name = "mars-arcosphere",
        ingredients = {
            {type = "item", name = "jupiter-arcosphere", amount = 1},
            {type = "item", name = "saturn-arcosphere", amount = 1},
            {type = "item", name = "uranus-arcosphere", amount = 1},
            {type = "item", name = "neptune-arcosphere", amount = 1},
            {type = "item", name = "sun-arcosphere", amount = 1},
            {type = "item", name = "mercury-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "mars-arcosphere", amount = 1}},
        main_product = "mars-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册木星 曲虹球  
    {
        type = "recipe",
        name = "jupiter-arcosphere",
        ingredients = {
            {type = "item", name = "saturn-arcosphere", amount = 1},
            {type = "item", name = "uranus-arcosphere", amount = 1},
            {type = "item", name = "neptune-arcosphere", amount = 1},
            {type = "item", name = "sun-arcosphere", amount = 1},
            {type = "item", name = "mercury-arcosphere", amount = 1},
            {type = "item", name = "venus-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "jupiter-arcosphere", amount = 1}},
        main_product = "jupiter-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册土星 曲虹球  
    {
        type = "recipe",
        name = "saturn-arcosphere",
        ingredients = {
            {type = "item", name = "uranus-arcosphere", amount = 1},
            {type = "item", name = "neptune-arcosphere", amount = 1},
            {type = "item", name = "sun-arcosphere", amount = 1},
            {type = "item", name = "mercury-arcosphere", amount = 1},
            {type = "item", name = "venus-arcosphere", amount = 1},
            {type = "item", name = "earth-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "saturn-arcosphere", amount = 1}},
        main_product = "saturn-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册天王星 曲虹球  
    {
        type = "recipe",
        name = "uranus-arcosphere",
        ingredients = {
            {type = "item", name = "neptune-arcosphere", amount = 1},
            {type = "item", name = "sun-arcosphere", amount = 1},
            {type = "item", name = "mercury-arcosphere", amount = 1},
            {type = "item", name = "venus-arcosphere", amount = 1},
            {type = "item", name = "earth-arcosphere", amount = 1},
            {type = "item", name = "mars-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "uranus-arcosphere", amount = 1}},
        main_product = "uranus-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }, -- 注册海王星 曲虹球  
    {
        type = "recipe",
        name = "neptune-arcosphere",
        ingredients = {
            {type = "item", name = "sun-arcosphere", amount = 1},
            {type = "item", name = "mercury-arcosphere", amount = 1},
            {type = "item", name = "venus-arcosphere", amount = 1},
            {type = "item", name = "earth-arcosphere", amount = 1},
            {type = "item", name = "mars-arcosphere", amount = 1},
            {type = "item", name = "jupiter-arcosphere", amount = 1}
        },
        results = {{type = "item", name = "neptune-arcosphere", amount = 1}},
        main_product = "neptune-arcosphere",
        energy_required = 1,
        enabled = false,
        category = "crafting"
    }
})

-- 注册科技
data:extend({ -- 注册2级曲虹球
    {
        type = "technology",
        name = "tier-2-arcosphere",
        icon = "__chens-arcosphere-mod__/graphics/icons/tier-2-arcosphere.png",
        icon_size = 64,
        prerequisites = {"automation-science-pack"},
        unit = {
            count = 10,
            ingredients = {{"automation-science-pack", 1}},
            time = 10
        },
        effects = {
            {type = "unlock-recipe", recipe = "tier-2-arcosphere"},
            {type = "unlock-recipe", recipe = "tier-2-arcosphere-dismantle"},
            {type = "unlock-recipe", recipe = "one-point-arcosphere"},
            {type = "unlock-recipe", recipe = "two-point-arcosphere"},
            {type = "unlock-recipe", recipe = "three-point-arcosphere"},
            {type = "unlock-recipe", recipe = "four-point-arcosphere"},
            {type = "unlock-recipe", recipe = "five-point-arcosphere"},
            {type = "unlock-recipe", recipe = "six-point-arcosphere"}
        }
    }, -- 注册3级曲虹球
    {
        type = "technology",
        name = "tier-3-arcosphere",
        icon = "__chens-arcosphere-mod__/graphics/icons/tier-3-arcosphere.png",
        icon_size = 64,
        prerequisites = {"logistic-science-pack"},
        unit = {
            count = 10,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1}
            },
            time = 10
        },
        effects = {
            {type = "unlock-recipe", recipe = "tier-3-arcosphere"},
            {type = "unlock-recipe", recipe = "tier-3-arcosphere-dismantle"},
            {type = "unlock-recipe", recipe = "brown-arcosphere"},
            {type = "unlock-recipe", recipe = "red-arcosphere"},
            {type = "unlock-recipe", recipe = "orange-arcosphere"},
            {type = "unlock-recipe", recipe = "yellow-arcosphere"},
            {type = "unlock-recipe", recipe = "green-arcosphere"},
            {type = "unlock-recipe", recipe = "blue-arcosphere"},
            {type = "unlock-recipe", recipe = "purple-arcosphere"}
        }
    }, -- 注册4级曲虹球
    {
        type = "technology",
        name = "tier-4-arcosphere",
        icon = "__chens-arcosphere-mod__/graphics/icons/tier-4-arcosphere.png",
        icon_size = 64,
        prerequisites = {"military-science-pack", "chemical-science-pack"},
        unit = {
            count = 10,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"military-science-pack", 1}, {"chemical-science-pack", 1}
            },
            time = 10
        },
        effects = {
            {type = "unlock-recipe", recipe = "tier-4-arcosphere"},
            {type = "unlock-recipe", recipe = "tier-4-arcosphere-dismantle"},
            {type = "unlock-recipe", recipe = "up-arcosphere"},
            {type = "unlock-recipe", recipe = "up-right-arcosphere"},
            {type = "unlock-recipe", recipe = "right-arcosphere"},
            {type = "unlock-recipe", recipe = "down-right-arcosphere"},
            {type = "unlock-recipe", recipe = "down-arcosphere"},
            {type = "unlock-recipe", recipe = "down-left-arcosphere"},
            {type = "unlock-recipe", recipe = "left-arcosphere"},
            {type = "unlock-recipe", recipe = "up-left-arcosphere"}
        }
    }, -- 注册5级曲虹球
    {
        type = "technology",
        name = "tier-5-arcosphere",
        icon = "__chens-arcosphere-mod__/graphics/icons/tier-5-arcosphere.png",
        icon_size = 64,
        prerequisites = {"production-science-pack", "utility-science-pack"},
        unit = {
            count = 10,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"military-science-pack", 1}, {"chemical-science-pack", 1},
                {"production-science-pack", 1}, {"utility-science-pack", 1}
            },
            time = 10
        },
        effects = {
            {type = "unlock-recipe", recipe = "tier-5-arcosphere"},
            {type = "unlock-recipe", recipe = "tier-5-arcosphere-dismantle"},
            {type = "unlock-recipe", recipe = "sun-arcosphere"},
            {type = "unlock-recipe", recipe = "mercury-arcosphere"},
            {type = "unlock-recipe", recipe = "venus-arcosphere"},
            {type = "unlock-recipe", recipe = "earth-arcosphere"},
            {type = "unlock-recipe", recipe = "mars-arcosphere"},
            {type = "unlock-recipe", recipe = "jupiter-arcosphere"},
            {type = "unlock-recipe", recipe = "saturn-arcosphere"},
            {type = "unlock-recipe", recipe = "uranus-arcosphere"},
            {type = "unlock-recipe", recipe = "neptune-arcosphere"}
        }
    }
})
