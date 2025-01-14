local players = {}
local playernames = {}
ESX = nil
local loaded = false
local jobtable = {}
playerinfo = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
CreateThread(function()
    Wait(200)
    local registeredjobs = {}
    playerinfo = Database(config.Mysql,'fetchAll','SELECT * FROM users', {})
    jobs = Database(config.Mysql,'fetchAll','SELECT * FROM job_grades', {})
    existing = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs', {})

    for k,v in pairs(jobs) do

        if jobtable[v.job_name] == nil then jobtable[v.job_name] = {} end
        if jobtable[v.job_name][tostring(v.grade)] == nil then jobtable[v.job_name][tostring(v.grade)] = v.label end
    end
    for k,v in pairs(existing) do
        registeredjobs[v.name] = v
    end
    for k,v in pairs(config.Jobs) do
        if registeredjobs[k] == nil then
            Database(config.Mysql,'execute','INSERT INTO renzu_jobs (name, accounts, inventory, garage) VALUES (@name, @accounts, @inventory, @garage)', {
                ['@name']   = k,
                ['@accounts']   = json.encode({money = 0, black_money = 0}),
                ['@inventory']   = '[]',
                ['@garage'] = '[]'
            })
        end
    end
    if config.useSociety then
        for k,v in pairs(config.Jobs) do
            TriggerEvent("esx_addonaccount:getSharedAccount","society_"..k,function(account)
                local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = k})
                if result[1] and account.money > 0 then
                    local account = account
                    local jobaccount = json.decode(result[1].accounts)
                    jobaccount['money'] = jobaccount['money'] + account.money -- transfer
                    Database(config.Mysql,'execute','UPDATE renzu_jobs SET accounts = @accounts WHERE name = @name', {
                        ['@name'] = name,
                        ['@accounts'] = json.encode(jobaccount)
                    })
                    account.removeMoney(account.money)
                else
                    print(account.money,'transfer already done from society account to renzu_jobs')
                end
            end)
        end
    end
    loaded = true
    print("Renzu Jobs LOADED")
end)

function JobMoney(job)
    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = job})
    local ret = json.decode(result[1].accounts)

    return ret or {money=0,black_money=0}
end

function removeMoney(amount,job,source,money_type,export)
    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = job})
    local jobaccount = json.decode(result[1].accounts)
    jobaccount[money_type] = tonumber(jobaccount[money_type]) - tonumber(amount)
    Database(config.Mysql,'execute','UPDATE renzu_jobs SET accounts = @accounts WHERE name = @name', {
        ['@name'] = job,
        ['@accounts'] = json.encode(jobaccount)
    })
    if not export then
        TriggerClientEvent('renzu_jobs:updatemoney',source,jobaccount)
    end
end

function addMoney(amount,job,source,money_type,export)

    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = job})
    local jobaccount = json.decode(result[1].accounts)
    jobaccount[money_type] = tonumber(jobaccount[money_type]) + tonumber(amount)
    Database(config.Mysql,'execute','UPDATE renzu_jobs SET accounts = @accounts WHERE name = @name', {
        ['@name'] = job,
        ['@accounts'] = json.encode(jobaccount)
    })
    if not export then
        TriggerClientEvent('renzu_jobs:updatemoney',source,jobaccount)
    end
end

exports('JobMoney', function(job)
    return JobMoney(job)
end)

exports('addMoney', function(amount,job,source,money_type,e)
    return addMoney(amount,job,source,money_type,e)
end)

exports('removeMoney', function(amount,job,source,money_type,e)
    return removeMoney(amount,job,source,money_type,e)
end)

function addItem(job,item,amount,source,type,xPlayer)

    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = job})
    local inventory = json.decode(result[1].inventory)
    local slots = config.Jobs[job]['inventory'][type].slots
    local foundslot = false
    if inventory[type] == nil then inventory[type] = {} end
    if type == 'Personal' then
        if inventory[type][xPlayer.identifier] == nil then inventory[type][xPlayer.identifier] = {} end
        if not string.find(item:upper(), "WEAPON_") then -- only items that supports multiple amount
            for i=1, slots, 1 do
                local i = tostring(i)
                if inventory[type][xPlayer.identifier][i] ~= nil then  -- checking if slot is not nil
                    if inventory[type][xPlayer.identifier][i][item] ~= nil then -- checking if item is already in slot
                        foundslot = true -- ignore more condition checks below and save to database
                        inventory[type][xPlayer.identifier][i][item] = inventory[type][xPlayer.identifier][i][item] + tonumber(amount)
                        break
                    end
                end
            end
        end
        if not foundslot then -- if no slot has been found
            for i=1, slots, 1 do
                local i = tostring(i)
                if inventory[type][xPlayer.identifier][i] == nil then -- create new slot specially dedicated for weapons ( to support multiple the same weapons in inventory )
                    inventory[type][xPlayer.identifier][i] = {}
                    if string.find(item:upper(), "WEAPON_") then -- weapon condition to save components
                        if inventory[type][xPlayer.identifier][i][item] == nil then
                            inventory[type][xPlayer.identifier][i][item] = {}
                            inventory[type][xPlayer.identifier][i][item]['data'] = {}
                            inventory[type][xPlayer.identifier][i][item]['data'].ammo = 0
                            local loadoutNum, weapon = xPlayer.getWeapon(item)
                            inventory[type][xPlayer.identifier][i][item]['data'].components = xPlayer.loadout[loadoutNum].components
                        end
                        inventory[type][xPlayer.identifier][i][item]['data'].ammo = tonumber(inventory[type][xPlayer.identifier][i][item]['data'].ammo) + tonumber(amount)
                        break
                    else -- else just add new slot and create new item
                        if inventory[type][xPlayer.identifier][i][item] == nil then
                            inventory[type][xPlayer.identifier][i][item] = 0
                        end
                        inventory[type][xPlayer.identifier][i][item] = tonumber(inventory[type][xPlayer.identifier][i][item]) + tonumber(amount)
                        break
                    end
                end
            end
        end
    else
        if not string.find(item:upper(), "WEAPON_") then
            for i=1, slots, 1 do
                local i = tostring(i)
                if inventory[type][i] ~= nil then
                    if inventory[type][i][item] ~= nil then
                        foundslot = true
                        inventory[type][i][item] = inventory[type][i][item] + tonumber(amount)
                    end
                end
            end
        end
        if not foundslot then
            for i=1, slots, 1 do
                local i = tostring(i)
                if inventory[type][i] == nil then
                    inventory[type][i] = {}
                    if string.find(item:upper(), "WEAPON_") then -- weapon condition to save components
                        if inventory[type][i][item] == nil then
                            inventory[type][i][item] = {}
                            inventory[type][i][item]['data'] = {}
                            inventory[type][i][item]['data'].ammo = 0
                            local loadoutNum, weapon = xPlayer.getWeapon(item)
                            inventory[type][i][item]['data'].components = xPlayer.loadout[loadoutNum].components
                        end
                        inventory[type][i][item]['data'].ammo = tonumber(inventory[type][i][item]['data'].ammo) + tonumber(amount)
                        break
                    else -- else just add new slot and create new item
                        if inventory[type][i][item] == nil then
                            inventory[type][i][item] = 0
                        end
                        inventory[type][i][item] = tonumber(inventory[type][i][item]) + tonumber(amount)
                        break
                    end
                end
            end
        end
    end
    Database(config.Mysql,'execute','UPDATE renzu_jobs SET inventory = @inventory WHERE name = @name', {
        ['@name'] = job,
        ['@inventory'] = json.encode(inventory)
    })
end

function removeItem(job,item,amount,source,type,xPlayer,slot)

    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = job})
    local inventory = json.decode(result[1].inventory)
    if type == 'Personal' then
        if string.find(item:upper(), "WEAPON_") then
            inventory[type][xPlayer.identifier][slot] = nil
        else
            inventory[type][xPlayer.identifier][slot][item] = tonumber(inventory[type][xPlayer.identifier][slot][item]) - tonumber(amount)
            if inventory[type][xPlayer.identifier][slot][item] <= 0 then
                inventory[type][xPlayer.identifier][slot] = nil
            end
        end
    else
        if string.find(item:upper(), "WEAPON_") then
            inventory[type][slot] = nil
        else
            inventory[type][slot][item] = tonumber(inventory[type][slot][item]) - tonumber(amount)
            if inventory[type][slot][item] <= 0 then
                inventory[type][slot] = nil
            end
        end
    end
    Database(config.Mysql,'execute','UPDATE renzu_jobs SET inventory = @inventory WHERE name = @name', {
        ['@name'] = job,
        ['@inventory'] = json.encode(inventory)
    })
end

function GetItems(job,type,xPlayer)

    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {['@name'] = job})
    local inventory = json.decode(result[1].inventory)
    if inventory[type] == nil then inventory[type] = {} end
    if type == 'Personal' then
        if inventory[type][xPlayer.identifier] == nil then inventory[type][xPlayer.identifier] = {} end
        inventory = inventory[type][xPlayer.identifier]
    else
        inventory = inventory[type]
    end
    return inventory
end

function SaveClothes(clothename,clothe,xPlayer)
    local result = Database(config.Mysql,'fetchAll','SELECT * FROM saveclothes WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
    if result[1] == nil then -- save new wardrobe to db
        local wardrobe = {}
        wardrobe[clothename] = clothe
        Database(config.Mysql,'execute','INSERT INTO saveclothes (identifier, wardrobe) VALUES (@identifier, @wardrobe)', {
            ['@identifier']   = xPlayer.identifier,
            ['@wardrobe']   = json.encode(wardrobe)
        })
    elseif result[1] then -- replace existing or save new

        local wardrobe = json.decode(result[1].wardrobe)

        wardrobe[clothename] = clothe
        Database(config.Mysql,'execute','UPDATE saveclothes SET wardrobe = @wardrobe WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier,
            ['@wardrobe'] = json.encode(wardrobe)
        })
    end
    -- save skin
    Database(config.Mysql,'execute','UPDATE users SET skin = @skin WHERE identifier = @identifier', {
		['@skin'] = json.encode(clothe),
		['@identifier'] = xPlayer.identifier
	})
end

ESX.RegisterServerCallback('renzu_jobs:selectclothe',function(source, cb, skin)
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    Database(config.Mysql,'execute','UPDATE users SET skin = @skin WHERE identifier = @identifier', {
        ['@skin'] = json.encode(skin),
        ['@identifier'] = xPlayer.identifier
    })
end)

function UpdateJob(identifier, job, grade)
    Database(config.Mysql,'execute','UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier',
        {
            ['@job'] = job,
            ['@job_grade'] = grade,
            ['@identifier'] = identifier
    })
end

function addMoneyOffline(identifier,amount)
    local result = Database(config.Mysql,'fetchAll','SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = identifier})
    if result[1] then
        local res = json.decode(result[1].accounts)
        res['bank'] = res['bank'] + amount
        Database(config.Mysql,'execute','UPDATE users SET accounts = @accounts WHERE identifier = @identifier',
        {
            ['@accounts'] = json.encode(res),
            ['@identifier'] = identifier
        })
    end
end

ESX.RegisterServerCallback('renzu_jobs:playerlist', function (source, cb)
    playerinfo = Database(config.Mysql,'fetchAll','SELECT * FROM users', {})
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jobs = Database(config.Mysql,'fetchAll','SELECT * FROM job_grades', {})
    local salary = {}
    local job =  xPlayer.job.name
    local done = false
    local count = 0
    CreateThread(function() -- anti bobo
        for i=1, #jobs, 1 do
            if jobs[i].job_name == job then
                salary[tostring(jobs[i].grade)] = jobs[i]
            end
        end

        for k,v in pairs(config.Jobs[xPlayer.job.name].grade) do
            if salary[tostring(k)] then
                v.salary = salary[tostring(k)].salary
                v.label = salary[tostring(k)].label
            end
        end
        done = true
    end)
    while not done and count < 2000 do count = count + 100 Wait(1) end
    local list = {}
    for k,v in pairs(playerinfo) do
        local initials = math.random(1,#config.RandomAvatars)
        local letters = config.RandomAvatars[initials]
        if v.identifier ~= nil and v.job ~= nil and v.job == xPlayer.job.name and v.firstname ~= '' and v.firstname ~= nil then
            --table.insert(list, )
            if jobtable[v.job] == nil then jobtable[xPlayer.job.name] = {} end
            list[v.identifier] = {id = v.identifier, job = jobtable[v.job][tostring(v.job_grade)], name = v.name or v.firstname, firstname = v.firstname, lastname = v.lastname, image = 'https://ui-avatars.com/api/?name='..v.firstname..'+'..v.lastname..'&background='..letters.background..'&color='..letters.color..''}
        end
    end
    local count = 0
    for k,v in pairs(playerinfo) do count = count + 1 end
    cb(list, count, true,'',xPlayer.job.name,JobMoney(xPlayer.job.name), config.Jobs[xPlayer.job.name])
end)

function SendtoDiscord(webhook,color,title,desc)
    if not config.discordwebhook then return end
    local K = {
        {
            ["color"] = color,
            ["title"] = "**" .. title .. "**",
            ["description"] = desc,
            ["footer"] = {["text"] = "^7[^2Renzu_Jobs^7]"}}
    }
    PerformHttpRequest(webhook,function(p, q, r) end, "POST",
        json.encode({username = l, embeds = K, avatar_url = k}), {
            ["Content-Type"] = "application/json"}
    )
end

function DiscordMessage(xPlayer,action,val,receiver)
    return "**\nname: **" ..
    GetPlayerName(xPlayer.source) ..
        "**\n Identifier: **" ..
        xPlayer.identifier ..
                "**\n Action: **" ..
                    action.." " .. val ..
                    "**\n Receiver: **" ..
                    receiver
end

ESX.RegisterServerCallback('renzu_jobs:getJobmoney',function(source, cb, job, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = JobMoney(job)[type]
    return money or 0
end)

ESX.RegisterServerCallback('renzu_jobs:sendbonus',function(source, cb, identifier, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local toPlayer = ESX.GetPlayerFromIdentifier(identifier)
    if config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name].grade[xPlayer.job.grade]['access'].givebonus then

        if toPlayer then
            if tonumber(amount) > 0 and JobMoney(xPlayer.job.name).money >= tonumber(amount) then
                removeMoney(tonumber(amount),xPlayer.job.name,source,'money')
                toPlayer.addMoney(tonumber(amount))
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Tu donne $'..tonumber(amount)..' à '..toPlayer.name)
                TriggerClientEvent('renzu_notify:Notify',toPlayer.source, 'success','Job', 'Vous recevez $'..tonumber(amount)..' Bonus from '..xPlayer.job.grade_label..' '..xPlayer.name..'')
                if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                    SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,'Send',amount,toPlayer.name))
                end
                cb(true)
            else
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Pas assez d argent en stock')
            end
        else

            if tonumber(amount) > 0 and JobMoney(xPlayer.job.name).money >= tonumber(amount) then
                removeMoney(tonumber(amount),xPlayer.job.name,source,'money')
                local name =  xPlayer.job.name..' Member'
                for k,v in pairs(playerinfo) do
                    if v.identifier == identifier and v.firstname ~= '' and v.firstname ~= nil then
                        name = v.firstname
                    end
                end
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Vous donnez $'..tonumber(amount)..' à '..name)
                addMoneyOffline(identifier,tonumber(amount))
                if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                    SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,'Send',amount,name))
                end
                cb(true)
            else
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Pas assez d&#39;argent en stock')
            end
        end
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Vous n&#39;avez pas accès')
        cb(false)
    end
end)

GetExtendedPlayers = function(key, val) -- compatibility with non esx_legacy
	local xPlayers = {}
	for k, v in pairs(ESX.Players) do
		if key then
			if (key == 'job' and v.job.name == val) or v[key] == val then
				table.insert(xPlayers, v)
			end
		else
			table.insert(xPlayers, v)
		end
	end
	return xPlayers
end

ESX.RegisterServerCallback('renzu_jobs:changesalary', function (source, cb, grade, amount) -- basecode esx_society - Credits
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local grade = tonumber(grade)
    local amount = tonumber(amount)
    if config.Jobs[xPlayer.job.name].grade[xPlayer.job.grade]['access'].salarychange then
        if amount <= config.Jobs[xPlayer.job.name]['max_salary'] then
            Database(config.Mysql,'execute','UPDATE job_grades SET salary = @salary WHERE job_name = @job_name AND grade = @grade', {
                ['@salary']   = amount,
                ['@job_name'] = xPlayer.job.name,
                ['@grade']    = grade
            }, function(rowsChanged)
                local xPlayers = GetExtendedPlayers('job', xPlayer.job.name)
                for _, xTarget in pairs(xPlayers) do
                    if xTarget.job.grade == grade then
                        xTarget.setJob(xPlayer.job.name, grade)
                    end
                end
                if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                    SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,'Changement de salaire',amount,config.Jobs[xPlayer.job.name]['grade'][tonumber(grade)].label))
                end
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Vous avez réussi à modifier le salaire')
                cb(true)
            end)
        else
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Dépassement du budget pour le montant du salaire')
            cb(false)
        end
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Vous n&#39;avez pas accès')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:buyitem',function(source, cb, item, amount, job, shopindex)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if config.Jobs[xPlayer.job.name] ~= nil and xPlayer.job.grade >= config.Jobs[xPlayer.job.name]['shop'][shopindex].grade or config.Jobs[job] ~= nil and config.Jobs[job]['shop'][shopindex].public then
        local found = false
        local value = 0
        for k,v in pairs(config.Jobs[job]['shop'][shopindex]['items']) do
            if v.name == item then
                found = true
                if tonumber(v.value) then
                    value = v.value
                end
                break
            end
        end
        value = value * amount

        if found and tonumber(amount) > 0 and xPlayer.getMoney() >= tonumber(value) then
            addMoney(tonumber(value),job,source,'money')
            xPlayer.removeMoney(tonumber(value))
            local label = nil
            if not string.find(item:upper(), "WEAPON_") then
                label = ESX.GetItemLabel(item)
                xPlayer.addInventoryItem(item,tonumber(amount))
            else
                label = ESX.GetWeaponLabel(item)
                xPlayer.addWeapon(item, 100)
                xPlayer.addWeaponAmmo(item, 100)
            end
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You Bought '..label)
            if config.Jobs[xPlayer.job.name]['shop'][shopindex].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['shop'][shopindex].webhook,16711680,config.Jobs[xPlayer.job.name]['shop'][shopindex].label,DiscordMessage(xPlayer,'Acheter un article',label..' '..amount,' '))
            end
            cb(true)
        elseif found then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Vous n&#39;avez pas assez d&#39;argent')
            cb(false)
        else
            -- item is not register to config (EXPLOITING?)
            -- ban trigger here
            cb(false)
        end
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Vous n&#39;avez pas accès')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:withdraw_deposit',function(source, cb, type, amount, money_type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name then
        local wperm = config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name].grade[xPlayer.job.grade]['access'].withdraw
        local dperm = config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name].grade[xPlayer.job.grade]['access'].deposit
        if wperm and type == 0 and tonumber(amount) > 0 and JobMoney(xPlayer.job.name)[money_type] >= tonumber(amount) then
            removeMoney(tonumber(amount),xPlayer.job.name,source,money_type)
            if xPlayer.getAccount(money_type) == nil then -- money accounts does not exist in ancient frameworks, only bank and black_money
                xPlayer.addMoney(tonumber(amount))
            else
                xPlayer.addAccountMoney(money_type, tonumber(amount))
            end
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You Withdraw '..amount..' from '..xPlayer.job.name..' money')
            if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'menu du patron',DiscordMessage(xPlayer,'Retirer',amount,money_type))
            end
        elseif type == 0 and wperm then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'pas assez d&#39;argent en stock')
        elseif type == 0 then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Aucune autorisation')
        end

        local esxold = false
        local account = xPlayer.getAccount(money_type)
        if money_type ~= 'black_money' and account == nil then -- assume a old esx if this account is nil, ancient framework only have bank and black_money
            account = {}
            account.money = xPlayer.getMoney()
            esxold = true
        end
        if dperm and type == 1 and tonumber(amount) > 0 and tonumber(account.money) >= tonumber(amount) then
            addMoney(tonumber(amount),xPlayer.job.name,source,money_type)
            if esxold then
                xPlayer.removeMoney(tonumber(amount))
            else
                xPlayer.removeAccountMoney(money_type, tonumber(amount))
            end
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You Deposit '..amount..' from '..xPlayer.job.name..' money')
            if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,'Deposit',amount,money_type))
            end
        elseif type == 1 and dperm then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have enough money')
        elseif type == 1 then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'No permission')
        end
    end
end)

ESX.RegisterServerCallback('renzu_jobs:setjob',function(source, cb, grade, identifier)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name].grade[xPlayer.job.grade]['access'].gradechange then
        local toPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if toPlayer then
            text = 'Promoted'
            notify = 'success'
            if toPlayer.job.grade < tonumber(grade) then
                text = 'Demoted'
                notify = 'warning'
            end
            toPlayer.setJob(xPlayer.job.name, tonumber(grade))
            playerinfo = Database(config.Mysql,'fetchAll','SELECT * FROM users', {})
            Wait(100)
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You '..text..' '..toPlayer.name..' as a '..xPlayer.job.grade_label)
            TriggerClientEvent('renzu_notify:Notify',toPlayer.source, notify,'Job', 'You have been '..text..' by '..xPlayer.name..' to '..config.Jobs[xPlayer.job.name].grade[tonumber(grade)].label)
            if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,text,'',xPlayer.name..' to '..config.Jobs[xPlayer.job.name].grade[tonumber(grade)].label))
            end
            cb(true)
        else
            text = 'Promoted'
            notify = 'success'
            local name =  xPlayer.job.name..' Member'
            local jobgrade = 0
            for k,v in pairs(playerinfo) do
                if v.identifier == identifier and v.firstname ~= '' and v.firstname ~= nil then
                    name = v.firstname
                    if v.job_grade then
                        jobgrade = v.job_grade
                    end
                end
            end
            UpdateJob(identifier, xPlayer.job.name, tonumber(grade))
            playerinfo = Database(config.Mysql,'fetchAll','SELECT * FROM users', {})
            Wait(100)

            if tonumber(jobgrade) > tonumber(grade) then
                text = 'Demoted'
                notify = 'warning'
            end

            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You '..text..' '..name..' as a '..config.Jobs[xPlayer.job.name].grade[tonumber(grade)].label)
            if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,text,'',name..' to '..config.Jobs[xPlayer.job.name].grade[tonumber(grade)].label))
            end
            cb(true)
        end

    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have access')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:kick',function(source, cb, identifier)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name].grade[xPlayer.job.grade]['access'].fire then
        local toPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if toPlayer then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You Kicked '..toPlayer.name..' from '..xPlayer.job.label)
            TriggerClientEvent('renzu_notify:Notify',toPlayer.source, 'info','Job', 'You have been fired by '..xPlayer.name..' from '..xPlayer.job.label)
            toPlayer.setJob(config.defaultjob, 0)
            if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,'Fired','',toPlayer.name))
            end
            cb(true)
        else
            local name =  xPlayer.job.name..' Member'
            local jobgrade = 0
            for k,v in pairs(playerinfo) do
                if v.identifier == identifier and v.firstname ~= '' and v.firstname ~= nil then
                    name = v.firstname
                    jobgrade = v.job_grade
                end
            end
            UpdateJob(identifier, config.defaultjob, 0)
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You Kicked '..name..' from '..config.Jobs[xPlayer.job.name].grade[tonumber(jobgrade)].label)
            if config.Jobs[xPlayer.job.name]['bossmenu'].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['bossmenu'].webhook,16711680,'boss menu',DiscordMessage(xPlayer,'Fired','',name))
            end
            cb(true)
        end

    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have access')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:itemfunc', function(source, cb, type, amount, item, inv_type, slot)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local i = xPlayer.getInventoryItem(item)
    if item == 'black_money' and not config.black_money_item then
        i = {count = xPlayer.getAccount('black_money').money}
    end
    local amount = tonumber(amount)
    --
    local isweapon = string.find(item:upper(), "WEAPON_")
    if config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name]['inventory'][inv_type].grade <= xPlayer.job.grade then
        if not isweapon and type == 1 and amount ~= nil and amount > 0 and i.count >= amount or type == 1 and isweapon and xPlayer.hasWeapon(item) then -- deposit item
            addItem(xPlayer.job.name,item,amount,source,inv_type,xPlayer)
            local label = nil
            if isweapon then
                label = ESX.GetWeaponLabel(item)
                xPlayer.removeWeapon(item)
            elseif item ~= 'black_money' or config.black_money_item and item == 'black_money' then
                label = ESX.GetItemLabel(item)
                xPlayer.removeInventoryItem(item, amount)
            elseif item == 'black_money' and not config.black_money_item then
                label = 'Black Money'
                xPlayer.removeAccountMoney('black_money',tonumber(amount))
            end
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You deposit '..label..' x'..amount)
            if config.Jobs[xPlayer.job.name]['inventory'][inv_type].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['inventory'][inv_type].webhook,16711680,'Inventory',DiscordMessage(xPlayer,'Deposit Item',label..' x'..amount,inv_type..' Inventory'))
            end
            cb(true)
        elseif type == 1 then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have enough')
            cb(false)
        end
        if not isweapon and type == 0 and tonumber(amount) > 0 and GetItems(xPlayer.job.name,inv_type,xPlayer)[slot][item] >= amount
        or type == 0 and isweapon and GetItems(xPlayer.job.name,inv_type,xPlayer)[slot][item]['data'] ~= nil then
            local label = nil
            if isweapon then
                label = ESX.GetWeaponLabel(item)
                xPlayer.addWeapon(item, tonumber(GetItems(xPlayer.job.name,inv_type,xPlayer)[slot][item]['data'].ammo))
                xPlayer.addWeaponAmmo(item, tonumber(GetItems(xPlayer.job.name,inv_type,xPlayer)[slot][item]['data'].ammo))
                SetCurrentPedWeapon(GetPlayerPed(source),GetHashKey(item),true)
                Wait(200)


                if GetItems(xPlayer.job.name,inv_type,xPlayer)[slot][item]['data'].components then
                    for k,v in pairs(GetItems(xPlayer.job.name,inv_type,xPlayer)[slot][item]['data'].components) do

                        xPlayer.removeWeaponComponent(tostring(item), tostring(v))
                        Wait(100)
                        xPlayer.addWeaponComponent(tostring(item), tostring(v))
                    end
                end
            elseif item ~= 'black_money' or config.black_money_item then
                label = ESX.GetItemLabel(item)
                xPlayer.addInventoryItem(item, tonumber(amount))
            elseif item == 'black_money' and not config.black_money_item then
                label = 'Black Money'
                xPlayer.addAccountMoney('black_money',tonumber(amount))
            end
            removeItem(xPlayer.job.name,item,amount,source,inv_type,xPlayer,slot)
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'You withdraw '..label..' x'..amount)
            if config.Jobs[xPlayer.job.name]['inventory'][inv_type].webhook then
                SendtoDiscord(config.Jobs[xPlayer.job.name]['inventory'][inv_type].webhook,16711680,'Inventory',DiscordMessage(xPlayer,'Withdraw Item',label..' x'..amount,inv_type..' Inventory'))
            end
            cb(true)
        elseif type == 0 then
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Not enough stock')
            cb(false)
        end

    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have a permission to access')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:getPlayerWeapons', function(source, cb, job, type)
    local source = source
    local xPlayer    = ESX.GetPlayerFromId(source)
    Wait(1000)
    cb(xPlayer.getLoadout())
end)

ESX.RegisterServerCallback('renzu_jobs:getweapon', function(source, cb, weapon)
    local source = source
    local xPlayer    = ESX.GetPlayerFromId(source)
    if xPlayer.hasWeapon(weapon) then
        xPlayer.removeWeapon(weapon)
        cb(true)
    else
        xPlayer.addWeapon(weapon, 100)
        SetCurrentPedWeapon(GetPlayerPed(source),GetHashKey(weapon),true)
        xPlayer.addWeaponAmmo(weapon, 100)
        if config.Jobs[xPlayer.job.name]['weapon_armory'].webhook then
            SendtoDiscord(config.Jobs[xPlayer.job.name]['weapon_armory'].webhook,16711680,'Weapon Armory',DiscordMessage(xPlayer,'Get Weapon',weapon,' '))
        end
        Wait(100)
        cb(true)
    end
end)

local ongoingcrafting = {}
ESX.RegisterServerCallback('renzu_jobs:craftitem', function(source, cb, item, amount, type)
    local source = source
	local xPlayer    = ESX.GetPlayerFromId(source)
    local conf = config.Jobs[xPlayer.job.name]['crafting']['craftable'][item]
    local isweapon = string.find(item:upper(), "WEAPON_")
    if isweapon and tonumber(amount) > 1 then
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You can only craft weapons one at a time')
    elseif ongoingcrafting[source] == nil then
        if conf ~= nil then
            local notenoughcabron = false
            for k,v in pairs(conf.requirements) do

                local hasitem = xPlayer.getInventoryItem(v.name)
                local require = v.amount * tonumber(amount)
                if hasitem.count ~= nil and hasitem.count < require then
                    notenoughcabron = true
                end
            end
            if notenoughcabron then
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'Not enough requirement')
            else
                ongoingcrafting[source] = true
                Citizen.CreateThread(function() -- incase lower fxserver
                    FreezeEntityPosition(GetPlayerPed(source),true)
                    return
                end)
                for k,v in pairs(conf.requirements) do

                    local hasitem = xPlayer.getInventoryItem(v.name)
                    local require = v.amount * tonumber(amount)
                    if hasitem.count ~= nil and hasitem.count >= require then
                        xPlayer.removeInventoryItem(v.name, require)
                    end
                end
                option = {
                    icons = true, -- show or hide icons default true
                    pool = 0, -- Default: 0 Limits the number of concurrent notification elements that can be rendered within the notifications container at any given time. A value of 0 means that there is no limit.
                    sticky = false, -- Default: false A boolean designating whether the notification elements should be removed automatically when they expire or whether they should stay in the DOM until they are removed manually.
                    pauseOnHover = false, -- Default: true A boolean designating whether the notifications expiration control should pause when hovering over the wrapper element. Can only be set on class instantiation.
                    life = conf.seconds * tonumber(amount) * 1000, -- Default: 3000 Expiration time for non-sticky notification elements in milliseconds.
                    progressbar = true, -- A boolean designating whether the life time progress bar will be displayed for each notification element
                    effect = 'slide', -- The animation effect when adding or removing notification elements. Accepted values: fade or slide.
                    easing = 'ease-in-out', -- linear, ease, ease-in, ease-out, ease-in-out or a custom cubic-bezier value.
                }
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'default','Crafting Table', 'in Progress Please Wait ', option)
                Wait(conf.seconds * tonumber(amount) * 1000)
                if isweapon then
                    xPlayer.addWeapon(item, 0)
                else
                    xPlayer.addInventoryItem(item, tonumber(amount))
                end
                option = {
                    icons = true, -- show or hide icons default true
                    pool = 0, -- Default: 0 Limits the number of concurrent notification elements that can be rendered within the notifications container at any given time. A value of 0 means that there is no limit.
                    sticky = false, -- Default: false A boolean designating whether the notification elements should be removed automatically when they expire or whether they should stay in the DOM until they are removed manually.
                    pauseOnHover = false, -- Default: true A boolean designating whether the notifications expiration control should pause when hovering over the wrapper element. Can only be set on class instantiation.
                    life = 3000, -- Default: 3000 Expiration time for non-sticky notification elements in milliseconds.
                    progressbar = true, -- A boolean designating whether the life time progress bar will be displayed for each notification element
                    effect = 'slide', -- The animation effect when adding or removing notification elements. Accepted values: fade or slide.
                    easing = 'ease-in-out', -- linear, ease, ease-in, ease-out, ease-in-out or a custom cubic-bezier value.
                }
                ongoingcrafting[source] = nil
                Citizen.CreateThread(function() -- incase lower fxserver
                    FreezeEntityPosition(GetPlayerPed(source),false)
                    return
                end)
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Crafting Table', 'Successfully Crafted a '..item, option)
                if config.Jobs[xPlayer.job.name]['crafting'].webhook then
                    SendtoDiscord(config.Jobs[xPlayer.job.name]['crafting'].webhook,16711680,config.Jobs[xPlayer.job.name]['crafting'].label,DiscordMessage(xPlayer,'Craft a item ',item..' x'..amount,' '))
                end
            end
        else
            TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Crafting Table', 'item not exist in this crafting table')
        end
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'warning','Crafting Table', 'Ongoing crafting..')
    end
end)

ESX.RegisterServerCallback('renzu_jobs:saveclothes', function(source, cb, name, data)
    local xPlayer    = ESX.GetPlayerFromId(source)
    SaveClothes(name,data,xPlayer)
    cb(true)
end)

ESX.RegisterServerCallback('renzu_jobs:setweaponcomponents', function(source, cb, weapon, component)
    local xPlayer    = ESX.GetPlayerFromId(source)
    local component = tostring(component)
    local weapon = tostring(weapon)
    if xPlayer.hasWeaponComponent(weapon, component) then
        xPlayer.removeWeaponComponent(weapon, component)
        cb(true)
    else
        xPlayer.addWeaponComponent(weapon, component)
        cb(true)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:getPlayerWardrobe', function(source, cb)
    local xPlayer    = ESX.GetPlayerFromId(source)
    local result = Database(config.Mysql,'fetchAll','SELECT * FROM saveclothes WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
    local wardrobe = {}
    if result[1] then
        wardrobe = json.decode(result[1].wardrobe)
    end
    cb(wardrobe)
end)

ESX.RegisterServerCallback('renzu_jobs:getvehicles', function(source, cb)
    local xPlayer    = ESX.GetPlayerFromId(source)
    local result = Database(config.Mysql,'fetchAll','SELECT * FROM owned_vehicles WHERE owner = @owner', {['@owner'] = xPlayer.identifier})
    local garage = {}
    if result[1] then
        if config.Jobs[xPlayer.job.name]['garage'].unique then
            local jobgarage = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {
                ['@name'] = xPlayer.job.name
            })

            if jobgarage[1] then

                local jobvehicles = json.decode(jobgarage[1].garage)
                for k,v in pairs(result) do
                    local prop = json.decode(v.vehicle)

                    if jobvehicles[prop.plate] ~= nil then

                        garage[prop.plate] = v
                    end
                end
            end
        else
            garage = result
        end
    end
    vehicles = Database(config.Mysql,'fetchAll','SELECT * FROM vehicles', {})

    cb(garage,vehicles)
end)

ESX.RegisterServerCallback('renzu_jobs:takeoutvehicle', function(source, cb, plate)
    local xPlayer    = ESX.GetPlayerFromId(source)

    local result = Database(config.Mysql,'fetchAll','SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    })
    local garage = {}

    if result[1] then
        Database(config.Mysql,'execute','UPDATE owned_vehicles SET stored = @stored WHERE plate = @plate', {
            ['@plate'] = plate,
            ['@stored'] = 0,
        })
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Successfully take out a vehicle')
        cb(true)
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont owned the vehicle')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:storevehicle', function(source, cb, plate, prop)
    local xPlayer    = ESX.GetPlayerFromId(source)

    local result = Database(config.Mysql,'fetchAll','SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    })
    local garage = {}

    if result[1] then
        Database(config.Mysql,'execute','UPDATE owned_vehicles SET stored = @stored, vehicle = @vehicle WHERE plate = @plate', {
            ['@plate'] = plate,
            ['@vehicle'] = json.encode(prop),
            ['@stored'] = 1,
        })
        if config.Jobs[xPlayer.job.name]['garage'].unique then
            local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {
                ['@name'] = xPlayer.job.name
            })
            local vehicles = {}
            if result[1] then
                vehicles = json.decode(result[1].garage)
                vehicles[plate] = 1
            end
            Database(config.Mysql,'execute','UPDATE renzu_jobs SET garage = @garage WHERE name = @name', {
                ['@name'] = xPlayer.job.name,
                ['@garage'] = json.encode(vehicles),
            })
        end
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Successfully Store a vehicle')
        cb(true)
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont owned the vehicle')
        cb(false)
    end
end)

ESX.RegisterServerCallback('renzu_jobs:returnvehicle', function(source, cb, plate)
    local xPlayer    = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 500 then
        xPlayer.removeMoney(500)
        cb(true)
    else
        TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have enough money to pay valet')
        cb(false)
    end
end)

RegisterNetEvent('renzu_jobs:updatejob')
AddEventHandler('renzu_jobs:updatejob', function(job)
    local source = source
    local xPlayer    = ESX.GetPlayerFromId(source)

    UpdateJob(xPlayer.identifier, xPlayer.job.name, tonumber(xPlayer.job.grade))
end)

RegisterNetEvent('renzu_jobs:duty')
AddEventHandler('renzu_jobs:duty', function(job,state)
    local source = source
    local xPlayer    = ESX.GetPlayerFromId(source)
    local grade = xPlayer.job.grade
    local job = job
    local text = 'Onduty'
    if not state then
        job = config.Jobs[job]['duty'].offdutyname
        text = 'Offduty'
    end
    xPlayer.setJob(job, grade)
    Wait(500)
    TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Successfully '..text)
    UpdateJob(xPlayer.identifier, job, grade)
end)

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding
-- encoding
function veh(data)
	data = tostring(data)
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

local NumberCharset = {}
for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GenPlate()
    local plate = nil
    if config.Mysql == 'mysql-async' then
        Database(config.Mysql,'fetchAll','SELECT * FROM owned_vehicles', {}, function (result)
            local p = veh(tonumber(#result))
            p = p:gsub("=", "")
            total = 7 - p:len()
            if total ~= 0 then
                p = string.upper(""..veh(tonumber(#result)).." "..GetRandomNumber(total).."")
                p = p:gsub("=", "")
            end

            plate = p:upper()
        end)
    else
        exports['ghmattimysql']:execute('SELECT * FROM owned_vehicles', {}, function(result)
            local p = veh(tonumber(#result))
            p = p:gsub("=", "")
            local total = 8 - p:len()
            if total ~= 0 then
                p = veh(tonumber(#result))..GetRandomNumber(total)
                p = p:gsub("=", "")
            end
            plate = p:upper()
        end)
    end
    while plate == nil do Wait(0) end
    return plate
end

ESX.RegisterServerCallback('renzu_jobs:buyvehicle', function(source, cb, model)
    local xPlayer    = ESX.GetPlayerFromId(source)
    local conf = config.Jobs[xPlayer.job.name]['vehicleshop'].vehicles
    for k,v in pairs(conf) do

        if v.model == model then
            if xPlayer.job.grade >= v.grade then
                if xPlayer.getMoney() >= tonumber(v.value) then
                    xPlayer.removeMoney(tonumber(v.value))
                    local plate = GenPlate()

                    Database(config.Mysql,'execute','INSERT INTO owned_vehicles (plate, vehicle, owner, stored) VALUES (@plate, @vehicle, @owner, @stored)', {
                        ['@plate']   = plate,
                        ['@vehicle']   = json.encode({model = GetHashKey(model), plate = plate}),
                        ['@owner']   = xPlayer.identifier,
                        ['@stored'] = 1
                    })
                    local result = Database(config.Mysql,'fetchAll','SELECT * FROM renzu_jobs WHERE name = @name', {
                        ['@name'] = xPlayer.job.name
                    })
                    local vehicles = {}
                    if result[1] then
                        vehicles = json.decode(result[1].garage)
                        vehicles[plate] = 1
                    end
                    Database(config.Mysql,'execute','UPDATE renzu_jobs SET garage = @garage WHERE name = @name', {
                        ['@name'] = xPlayer.job.name,
                        ['@garage'] = json.encode(vehicles),
                    })
                    TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'success','Job', 'Successfully Bought a Vehicle - Check your Garage')
                    if config.Jobs[xPlayer.job.name]['vehicleshop'].webhook then
                        SendtoDiscord(config.Jobs[xPlayer.job.name]['vehicleshop'].webhook,16711680,config.Jobs[xPlayer.job.name]['vehicleshop'].label,DiscordMessage(xPlayer,'Buy Vehicle',model,' '))
                    end
                    cb(true)
                else
                    TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have enough money')
                    cb(false)
                end
            else
                TriggerClientEvent('renzu_notify:Notify',xPlayer.source, 'error','Job', 'You dont have a permmision to buy this vehicle')
                cb(false)
            end
            break
        end
    end

end)

ESX.RegisterServerCallback('renzu_jobs:getPlayerInventory', function(source, cb, job, type)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory
    local jobinventory = {}

    if config.Jobs[xPlayer.job.name] ~= nil and config.Jobs[xPlayer.job.name]['inventory'][type] then
        -- job inventory
        for slot,v in pairs(GetItems(xPlayer.job.name,type,xPlayer)) do

            for k,v in pairs(v) do

                local item_type = 'item'
                local label = nil
                local amount = v
                if string.find(k:upper(), "WEAPON_") then
                    item_type = 'weapon'
                    label = ESX.GetWeaponLabel(k)
                    amount = v['data'].ammo
                elseif k == 'black_money' and not config.black_money_item then
                    label = 'Black Money'
                else
                    label = ESX.GetItemLabel(k)
                end
                table.insert(jobinventory, {
                    label = label .. ' x' .. amount,
                    type  = item_type,
                    slot = slot,
                    name = k
                })

            end
        end
        -- player inventory
        local playerinventory = {}
        for i=1, #items, 1 do
			local item = items[i]
			if item.count > 0 then

				table.insert(playerinventory, {
					label = item.label .. ' x' .. item.count,
					type  = 'item',
					name = item.name
				})
			end
		end
        for k,v in pairs(xPlayer.getLoadout()) do
            if v.label then
                table.insert(playerinventory, {
                    label = v.label .. ' x' .. v.ammo,
                    ammo = v.ammo,
                    type  = 'weapon',
                    name = v.name
                })
            end
        end
        table.insert(playerinventory, {
            label = 'Black Money' .. ' x' .. blackMoney,
            type  = 'account',
            name = 'black_money'
        })

        cb({
            playerinventory      = playerinventory,
            weapons    = xPlayer.getLoadout(),
            inventory = jobinventory
        })
    else
        cb(false)
    end
end)

function Database(plugin,type,query,var)
    local query = query
    local type= type
    local var = var
    local plugin = plugin
    if type == 'fetchAll' and plugin == 'mysql-async' then
        return MySQL.Sync.fetchAll(query, var)
    end
    if type == 'execute' and plugin == 'mysql-async' then
        MySQL.Sync.execute(query,var)
    end
    if type == 'execute' and plugin == 'ghmattisql' then
        exports['ghmattimysql']:execute(query, var)
    end
    if type == 'fetchAll' and plugin == 'ghmattisql' then
        local data = nil
        exports.ghmattimysql:execute(query, var, function(result)
            data = result
        end)
        while data == nil do Wait(0) end
        return data
    end
end
