-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 获取不同等级的曲虹球
local function get_four_random_arcospheres(tier_name)
    local tier_arcospheres = {}
    -- 根据等级选择对应的曲虹球
    for _, item in pairs(data.raw["item"]) do
        if item.subgroup == tier_name then
            if not string.find(item.name, "^tier") then
                table.insert(tier_arcospheres, item.name)
            end
        end
    end

    -- 随机选四个不同的曲虹球
    local selected = {}
    local selected_set = {}

    while #selected < 4 do
        local item = tier_arcospheres[math.random(#tier_arcospheres)]
        if not selected_set[item] then
            table.insert(selected, item)
            selected_set[item] = true
        end
    end

    return selected[1], selected[2], selected[3], selected[4]
end

-- 用于追踪已经处理过的配方，避免重复添加
local processed_recipes_list = {}

-- 通用函数：处理配方，添加随机曲虹球
for _, tech in pairs(data.raw.technology) do
    if tech and tech.unit and tech.unit.ingredients then
        local ing_count = #tech.unit.ingredients + 1

        -- 只处理 1~5 级 和 大于5 的科技
        if ing_count >= 1 then
            local tier_num = ing_count > 5 and 5 or ing_count
            local tier_name = "tier-" .. tier_num .. "-arcosphere"

            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe then
                        local recipe = data.raw.recipe[effect.recipe]
                        if recipe and recipe.ingredients and recipe.results and
                            recipe.category ~= "smelting" and
                            not string.find(recipe.name, "-arcosphere") and
                            not string.find(recipe.name, "-barrel") and
                            not string.find(recipe.name, "empty%-") and
                            not string.find(recipe.name, "fill%-") and
                            not processed_recipes_list[recipe.name] then

                            -- 设置 main_product
                            if not recipe.main_product then
                                local results = recipe.results
                                if results and results[1] then
                                    recipe.main_product = results[1].name
                                end
                            end

                            -- 获取四个曲虹球
                            local ing1, ing2, res1, res2 =
                                get_four_random_arcospheres(tier_name)

                            -- 检查是否已包含这些曲虹球
                            local function contains_arcosphere(list, arcosphere)
                                for _, item in pairs(list) do
                                    if item.name == arcosphere then
                                        return true
                                    end
                                end
                                return false
                            end

                            local skip = false
                            if contains_arcosphere(recipe.ingredients or {},
                                                   ing1) or
                                contains_arcosphere(recipe.ingredients or {},
                                                    ing2) or
                                contains_arcosphere(recipe.results or {}, res1) or
                                contains_arcosphere(recipe.results or {}, res2) then
                                skip = true
                            end

                            if not skip then
                                -- 添加 ingredients
                                if ing1 and ing2 then
                                    table.insert(recipe.ingredients, {
                                        type = "item",
                                        name = ing1,
                                        amount = 1
                                    })
                                    table.insert(recipe.ingredients, {
                                        type = "item",
                                        name = ing2,
                                        amount = 1
                                    })
                                end
                                -- 添加 results
                                if res1 and res2 then
                                    table.insert(recipe.results, {
                                        type = "item",
                                        name = res1,
                                        amount = 1
                                    })
                                    table.insert(recipe.results, {
                                        type = "item",
                                        name = res2,
                                        amount = 1
                                    })
                                end
                                -- 标记为已处理
                                processed_recipes_list[recipe.name] = true
                            end
                        end
                    end
                end
            end
        end
    end
    ::continue::
end

-- 额外处理：对于 tier 1，处理所有 enabled = true 的配方
for _, recipe in pairs(data.raw.recipe) do
    if recipe.ingredients and recipe.results and recipe.enabled ~= false and
        recipe.category ~= "smelting" and
        not string.find(recipe.name, "-arcosphere") and
        not string.find(recipe.name, "-barrel") and
        not string.find(recipe.name, "empty%-") and
        not string.find(recipe.name, "fill%-") and
        not processed_recipes_list[recipe.name] then

        -- 设置 main_product（仅限于有 results 的情况）
        if not recipe.main_product then
            local results = recipe.results
            if results and results[1] then
                recipe.main_product = results[1].name
            end
        end

        local ing1, ing2, res1, res2 = get_four_random_arcospheres(
                                           "tier-1-arcosphere")

        -- 跳过已有的曲虹球
        local function contains_arcosphere(list, arcosphere)
            for _, item in pairs(list) do
                if item.name == arcosphere then return true end
            end
            return false
        end

        local skip = false
        if contains_arcosphere(recipe.ingredients or {}, ing1) or
            contains_arcosphere(recipe.ingredients or {}, ing2) or
            contains_arcosphere(recipe.results or {}, res1) or
            contains_arcosphere(recipe.results or {}, res2) then
            skip = true
        end

        if not skip then
            -- 添加 ingredients
            if ing1 and ing2 then
                table.insert(recipe.ingredients,
                             {type = "item", name = ing1, amount = 1})
                table.insert(recipe.ingredients,
                             {type = "item", name = ing2, amount = 1})
            end
            -- 添加 results
            if res1 and res2 then
                table.insert(recipe.results,
                             {type = "item", name = res1, amount = 1})
                table.insert(recipe.results,
                             {type = "item", name = res2, amount = 1})
            end
            -- 标记为已处理
            processed_recipes_list[recipe.name] = true
        end
    end
end

-- 为特定科技（electronics，steam-power，automation-science-pack）添加曲虹球
local special_techs = {"electronics", "steam-power", "automation-science-pack"}

for _, tech_name in ipairs(special_techs) do
    local tech = data.raw.technology[tech_name]
    if tech and tech.effects then
        for _, effect in pairs(tech.effects) do
            if effect.type == "unlock-recipe" and effect.recipe then
                local recipe = data.raw.recipe[effect.recipe]
                if recipe and recipe.ingredients and recipe.results and
                    recipe.category ~= "smelting" and
                    not string.find(recipe.name, "-arcosphere") and
                    not string.find(recipe.name, "-barrel") and
                    not string.find(recipe.name, "empty%-") and
                    not string.find(recipe.name, "fill%-") and
                    not processed_recipes_list[recipe.name] then

                    -- 设置 main_product（仅限于有 results 的情况）
                    if not recipe.main_product then
                        local results = recipe.results
                        if results and results[1] then
                            recipe.main_product = results[1].name
                        end
                    end

                    -- 用 tier-1-arcosphere 处理
                    local ing1, ing2, res1, res2 =
                        get_four_random_arcospheres("tier-1-arcosphere")

                    local function contains_arcosphere(list, arcosphere)
                        for _, item in pairs(list) do
                            if item.name == arcosphere then
                                return true
                            end
                        end
                        return false
                    end

                    local skip = false
                    if contains_arcosphere(recipe.ingredients or {}, ing1) or
                        contains_arcosphere(recipe.ingredients or {}, ing2) or
                        contains_arcosphere(recipe.results or {}, res1) or
                        contains_arcosphere(recipe.results or {}, res2) then
                        skip = true
                    end

                    if not skip then
                        -- 添加 ingredients
                        if ing1 and ing2 then
                            table.insert(recipe.ingredients, {
                                type = "item",
                                name = ing1,
                                amount = 1
                            })
                            table.insert(recipe.ingredients, {
                                type = "item",
                                name = ing2,
                                amount = 1
                            })
                        end
                        -- 添加 results
                        if res1 and res2 then
                            table.insert(recipe.results, {
                                type = "item",
                                name = res1,
                                amount = 1
                            })
                            table.insert(recipe.results, {
                                type = "item",
                                name = res2,
                                amount = 1
                            })
                        end
                        -- 标记为已处理
                        processed_recipes_list[recipe.name] = true
                    end
                end
            end
        end
    end
end

-- 修复科技的问题
table.insert(data.raw.technology["logistic-science-pack"].prerequisites,
             "tier-2-arcosphere")

table.insert(data.raw.technology["military-science-pack"].prerequisites,
             "tier-3-arcosphere")

table.insert(data.raw.technology["chemical-science-pack"].prerequisites,
             "tier-3-arcosphere")

table.insert(data.raw.technology["production-science-pack"].prerequisites,
             "tier-4-arcosphere")

table.insert(data.raw.technology["utility-science-pack"].prerequisites,
             "tier-4-arcosphere")

