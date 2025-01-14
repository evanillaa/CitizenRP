config = {}
-- MAIN CONFIG
config.Mysql = 'mysql-async' -- "ghmattisql", "msyql-async"
config.css = 'new' -- new or old -- new = 4 column, old 2 column
config.logo = 'https://media.discordapp.net/attachments/881848472028971038/885874868334243840/myLogo.png?width=683&height=683' -- url of logo

config.RandomAvatars = { -- if player pedshot is not uploaded yet, we will use Initials avatar
    [1] = {background = 'ffffff', color = '308BFF'},
    [2] = {background = 'E2E519', color = '222'},
    [3] = {background = 'FF306E', color = 'ffffff'},
    [4] = {background = 'F000FF', color = 'ffffff'},
    [5] = {background = '2F2730', color = 'ffffff'},
}

-- EXTRA CONFIG
config.useSociety = true -- if using esx_society, society money will transfer to owned database renzu_jobs.accounts (first load only) -- set this to false if you are unsure, and manually transfer your society money to this script
config.defaultjob = 'unemployed' -- will be use for firing employee
config.black_money_item = false -- if true you want to use a black_money as item not accounts from ESX

--IMAGE CONFIG
config.inventory = 'inventory' -- resource name of your inventory script, with image folder
config.inventoryImageUrl = 'https://cfx-nui-'..config.inventory..'/web/assets/icons/' -- a path from your inventory image -- verify the path
config.vehicleimage = 'https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/vehicle/' -- URL of vehicle image or path, default git contains local car image and some addon car image
-- vehicleimage can be path ex. img/items, img/vehicle -- you have to mannually upload all to this resource folder or use existing folder from resource ex. https://cfx-nui-RESOURCENAME/html/img/items/
-- images are configured to set extension as png for items, and jpg for vehicles
-- if image config is setup incorrectly, default images from github will be use and your custom item will be not showed

-- INTERACTION CONFIG
config.showmarker = true -- show drawmarker to show location point
config.usePopui = false -- https://github.com/renzuzu/renzu_popui -- if false, will only use drawmarker with floating text and Native isControlPressed
--config.zonemanage = true -- manually trigger the  interaction via Zone management, ex. polyzone -- if this is enable, you wont see any marker without adding the zone to your polyzone

-- WEBHOOK
config.discordwebhook = true -- enable disable webhook logs to discord

-- JOB Config
-- SAMPLE CONFIG
-- All Coordinates and permission for grades must be change for your own liking
config.Jobs = {
    -- example config for police job, you can copy the police config for other jobs
    -- ['police'] = {
    --     ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
    --     ['bossmenu'] = {
    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --         grade = 9, -- minimum grade to access
    --         coord = vector3(448.97439575195,-974.89404296875,30.689573287964),
    --         label = 'Boss Action',
    --         event = 'renzu_jobs:openbossmenu',
    --     },
    --     ['inventory'] = {
    --         ['Boss'] = { -- path inventory['Boss']
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             grade = 9, -- minimum job grade can access this feature
    --             coord = vector3(451.96508789062,-973.236328125,30.689609527588),
    --             label = 'Boss Inventory',
    --             slots = 100,
    --             event = 'renzu_jobs:openinventory',
    --         },
    --         ['Personal'] = { -- path inventory['Personal'][identifier]
    --             webhook = false, -- false to not logs else a string of discord webhook link
    --             grade = 0,
    --             coord = vector3(456.47772216797,-988.44299316406,30.689609527588),
    --             label = 'Personal Inventory',
    --             slots = 20,
    --             event = 'renzu_jobs:openinventory',
    --         },
    --         ['Stash'] = { -- path inventory['Stash']
    --             webhook = false, -- false to not logs else a string of discord webhook link
    --             grade = 0, -- minimum job grade can access this feature
    --             coord = vector3(459.76635742188,-979.64660644531,30.689588546753),
    --             label = 'Police Armory', -- same as stash
    --             slots = 20,
    --             event = 'renzu_jobs:openinventory',
    --         },
    --     },
    --     ['weapon_armory'] = {
    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --         grade = 0, -- minimum job grade can access this feature
    --         coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
    --         label = 'Weapon Armory',
    --         event = 'renzu_jobs:openweapons',
    --     },
    --     ['wardrobe'] = {
    --         grade = 0,
    --         coord = vector3(458.83407592773,-993.37579345703,30.689599990845),
    --         label = 'Wardrobe',
    --         event = 'renzu_jobs:openwardrobe',
    --     },
    --     ['shop'] = {
    --         [1] = {
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             public = false, -- if shop is public or for this job only. (income money will go to this job money)
    --             grade = 0, -- minimum job grade can access this feature,
    --             ['items'] = {
    --                 [1] = {name = 'bread', label = 'Bread', value = 50},
    --                 [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
    --                 [3] = {name = 'WEAPON_PISTOL', label = 'Pistol', value = 15000}, -- use capitalize for weapon to avoid bugs
    --             },
    --             label = 'Police Shop 1',
    --             coord = vector3(452.42401123047,-980.31774902344,30.689605712891),
    --             event = 'renzu_jobs:openshop',
    --         },
    --         [2] = {
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             public = true, -- if shop is public or for this job only. (income money will go to this job money)
    --             grade = 0, -- minimum job grade can access this feature
    --             ['items'] = {
    --                 [1] = {name = 'bread', label = 'Pain', value = 50},
    --                 [2] = {name = 'water', label = 'Eau', value = false}, -- if false its free
    --             --    [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
    --             },
    --             label = 'Police Shop 2',
    --             coord = vector3(436.20028686523,-986.38391113281,30.689611434937),
    --             event = 'renzu_jobs:openshop',
    --         },
    --     },
    --     ['crafting'] = {
    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --         grade = 0,
    --         coord = vector3(438.80059814453,-992.654296875,30.689607620239),
    --         label = 'Police Crafting Table',
    --         event = 'renzu_jobs:opencrafting',
    --         craftable = {
    --             ['bread'] = {name = 'bread', label = 'Bread', type = 'item', seconds = 50, -- index/array name must be the same with item name, so we can fetch it easily later
    --                 requirements = {
    --                     [1] = {name = 'bread', amount = 1},
    --                 },
    --             },
    --             ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
    --                 requirements = {
    --                     [1] = {name = 'bread', amount = 1},
    --                     [2] = {name = 'water', amount = 1},
    --                     [3] = {name = 'lplparmor', amount = 1},
    --                 },
    --             },
    --         }
    --     },
    --     -- ['vehicleshop'] = {
    --     --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --     --     grade = 0, -- minimum job grade can access this feature
    --     --     label = 'Vehicle Shop',
    --     --     coord = vector3(444.59100341797,-1014.3021240234,28.588003158569),
    --     --     event = 'renzu_jobs:openvehicleshop',
    --     --     vehicles = {
    --     --         [1] = {model = 'police', label = 'Police Sedan', value = 10000, grade = 0},
    --     --         [2] = {model = 'police2', label = 'Police Sedan 2', value = 5000, grade = 0},
    --     --         [3] = {model = 'police3', label = 'Police Sedan 3', value = 5000, grade = 0},
    --     --         -- [4] = {model = 'police', label = 'Police Sedan', value = 10000, grade = 0},
    --     --         -- [5] = {model = 'police2', label = 'Police Sedan 2', value = 5000, grade = 0},
    --     --         -- [6] = {model = 'police3', label = 'Police Sedan 3', value = 5000, grade = 0},
    --     --     }
    --     -- },
    --     -- ['garage'] = {
    --     --     unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
    --     --     grade = 0, -- minimum job grade can access this feature
    --     --     label = 'Garage',
    --     --     coord = vector3(438.91528320312,-1013.6430664062,28.63551902771),
    --     --     spawn = vector4(435.22979736328,-1027.3572998047,28.454689025879,5.9837808609009),
    --     --     event = 'renzu_jobs:opengarage',
    --     -- },
    --     -- ['duty'] = {
    --     --     grade = 0,
    --     --     offdutyname = 'offpolice',
    --     --     coord = vector3(440.97512817383,-981.16265869141,30.689613342285),
    --     --     label = 'On/Off Duty',
    --     --     event = 'renzu_jobs:duty',
    --     -- },
    --     ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
    --         [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [1] = {
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [2] = {
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [3] = {
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [4] = {
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [5] = {
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [6] = {
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = true},
    --         },
    --         [7] = {
    --             access = {fire = false, withdraw = true, deposit = true, gradechange = true},
    --         },
    --         [8] = {
    --             access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true},
    --         },
    --         [9] = {
    --             access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = false},
    --         },
    --         [10] = {
    --             access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
    --         },
    --         [11] = {
    --             access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
    --         },
    --     }
    -- },







    -- other jobs sample
    ['redline'] = {
        ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 4, -- minimum grade to access
            coord = vector3(-605.478515625,-920.29302978516,23.88662147522),
            label = 'Menu Patron',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 2, -- minimum job grade can access this feature
                coord = vector3(-595.47271728516,-914.18908691406,28.143661499023),
                label = 'Boss Inventory',
                public = false,
                slots = 100,
                event = 'inventory:openredbossInventory',
            },
            ['Stash'] = { -- path inventory['Stash']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-573.05267333984,-939.09033203125,23.886629104614),
                label = 'RedLine Performance', -- same as stash
                public = false, -- stash mode or public inventory
                slots = 2000,
                event = 'inventory:openredline',
            },
        },
        -- ['weapon_armory'] = { -- DISABLE weapon armory?
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        ['wardrobe'] = {
            grade = 0,
            coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
            label = 'Dressing',
            event = 'renzu_jobs:openwardrobe',
        },
       ['shop'] = {
        --     [1] = {
        --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
        --         grade = 0, -- minimum job grade can access this feature
        --         ['items'] = {
        --             [1] = {name = 'bread', label = 'Bread', value = 50},
        --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
        --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
        --         },
        --         label = 'Bennys Shop 1',
        --         coord = vector3(-215.87023925781,-1317.8905029297,30.890377044678),
        --         event = 'renzu_jobs:openshop',
        --     },
        --     [2] = {
        --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
        --         grade = 0, -- minimum job grade can access this feature
        --         ['items'] = {
        --             [1] = {name = 'bread', label = 'Bread', value = 50},
        --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
        --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
        --         },
        --         label = 'Bennys Shop 2',
        --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
        --         event = 'renzu_jobs:openshop',
        --     },
       },
        ['crafting'] = {
        --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --     grade = 0,
        --     coord = vector3(-196.37414550781,-1318.5646972656,31.089338302612),
        --     label = 'Bennys Crafting Table',
        --     event = 'renzu_jobs:opencrafting',
        --     craftable = {
        --         ['turbo_sports'] = {name = 'turbo_sports', label = 'Turbo Sports', type = 'item', seconds = 150, -- index/array name must be the same with item name, so we can fetch it easily later
        --             requirements = {
        --                 [1] = {name = 'steel', amount = 5},
        --             },
        --         },
        --         ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
        --             requirements = {
        --                 [1] = {name = 'bread', amount = 1},
        --                 [2] = {name = 'water', amount = 1},
        --                 [3] = {name = 'lplparmor', amount = 1},
        --             },
        --         },
        --     }
       },
        ['vehicleshop'] = {
            -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            -- grade = 0, -- minimum job grade can access this feature
            -- label = 'Vehicle Shop',
            -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
            -- event = 'renzu_jobs:openvehicleshop',
            -- vehicles = {
            --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
            --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
            -- }
        },
        ['garage'] = {
            unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
            grade = 0, -- minimum job grade can access this feature
            label = 'Garage',
            coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
            spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
            event = 'renzu_jobs:opengarage',
        },
        ['duty'] = {
            grade = 0,
            offdutyname = 'offmechanic',
            coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
            label = 'On/Off Duty',
            event = 'renzu_jobs:duty',
        },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = true, withdraw = false, deposit = true, gradechange = true},
            },
            [4] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true},
            },
        }
    },

    ['gym'] = {
        ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 4, -- minimum grade to access
            coord = vector3(-605.478515625,-920.29302978516,23.88662147522),
            label = 'Menu Patron',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 2, -- minimum job grade can access this feature
                coord = vector3(-595.47271728516,-914.18908691406,28.143661499023),
                label = 'Inventaire Patron',
                public = false,
                slots = 100,
                event = 'inventory:opengymbossInventory',
            },

            ['Stash'] = { -- path inventory['Stash']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(254.59608459473,-273.88314819336,53.963542938232),
                label = 'LA FITNSESS', -- same as stash
                public = false, -- stash mode or public inventory
                slots = 2000,
                event = 'inventory:opengym',
            },
        },
        -- ['weapon_armory'] = { -- DISABLE weapon armory?
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        ['wardrobe'] = {
            grade = 0,
            coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
            label = 'Dressing',
            event = 'renzu_jobs:openwardrobe',
        },
       ['shop'] = {
            [1] = {
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = true, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                    [1] = {name = 'gym_membership', label = 'Carte de Membre', value = 3000},
                },
                label = 'LA FITNESS',
                coord = vector3(258.99462890625,-270.11535644531,53.963531494141),
                event = 'renzu_jobs:openshop',
            },
        --     [2] = {
        --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
        --         grade = 0, -- minimum job grade can access this feature
        --         ['items'] = {
        --             [1] = {name = 'bread', label = 'Bread', value = 50},
        --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
        --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
        --         },
        --         label = 'Bennys Shop 2',
        --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
        --         event = 'renzu_jobs:openshop',
        --     },
       },
        ['crafting'] = {
        --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --     grade = 0,
        --     coord = vector3(-196.37414550781,-1318.5646972656,31.089338302612),
        --     label = 'Bennys Crafting Table',
        --     event = 'renzu_jobs:opencrafting',
        --     craftable = {
        --         ['turbo_sports'] = {name = 'turbo_sports', label = 'Turbo Sports', type = 'item', seconds = 150, -- index/array name must be the same with item name, so we can fetch it easily later
        --             requirements = {
        --                 [1] = {name = 'steel', amount = 5},
        --             },
        --         },
        --         ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
        --             requirements = {
        --                 [1] = {name = 'bread', amount = 1},
        --                 [2] = {name = 'water', amount = 1},
        --                 [3] = {name = 'lplparmor', amount = 1},
        --             },
        --         },
        --     }
       },
        ['vehicleshop'] = {
            -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            -- grade = 0, -- minimum job grade can access this feature
            -- label = 'Vehicle Shop',
            -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
            -- event = 'renzu_jobs:openvehicleshop',
            -- vehicles = {
            --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
            --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
            -- }
        },
        ['garage'] = {
            -- unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
            -- grade = 0, -- minimum job grade can access this feature
            -- label = 'Garage',
            -- coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
            -- spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
            -- event = 'renzu_jobs:opengarage',
        },
        ['duty'] = {
            -- grade = 0,
            -- offdutyname = 'offmechanic',
            -- coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
            -- label = 'On/Off Duty',
            -- event = 'renzu_jobs:duty',
        },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true},
            },
        }
    },



        ['unicorn'] = {
            ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
            ['bossmenu'] = {
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 4, -- minimum grade to access
                coord = vector3(95.676872253418,-1293.9968261719,29.263521194458),
                label = 'Menu Patron',
                event = 'renzu_jobs:openbossmenu',
            },
            ['inventory'] = {
                ['Boss'] = { -- path inventory['Boss']
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    grade = 4, -- minimum job grade can access this feature
                    coord = vector3(93.936599731445,-1291.0380859375,29.263521194458),
                    label = 'Inventaire Patron',
                    public = false,
                    slots = 100,
                    event = 'inventory:unicornBoss',
                },

                ['Stash'] = { -- path inventory['Stash']
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    grade = 0, -- minimum job grade can access this feature
                    coord = vector3(129.24775695801,-1280.9157714844,29.269317626953),
                    label = 'UNICORN', -- same as stash
                    public = false, -- stash mode or public inventory
                    slots = 2000,
                    event = 'inventory:unicorn',
                },
            },
            -- ['weapon_armory'] = { -- DISABLE weapon armory?
            --     grade = 0, -- minimum job grade can access this feature
            --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
            --     label = 'Weapon Armory',
            --     event = 'renzu_jobs:openweapons',
            -- },
            ['wardrobe'] = {
                grade = 0,
                coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
                label = 'Dressing',
                event = 'renzu_jobs:openwardrobe',
            },
           ['shop'] = {
                [1] = {
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    public = true, -- if shop is public or for this job only. (income money will go to this job money)
                    grade = 0, -- minimum job grade can access this feature
                    ['items'] = {
                        [1] = {name = 'gym_membership', label = 'Carte de Membre', value = 3000},
                    },
                    label = 'LA FITNESS',
                    coord = vector3(258.99462890625,-270.11535644531,53.963531494141),
                    event = 'renzu_jobs:openshop',
                },
            --     [2] = {
            --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
            --         grade = 0, -- minimum job grade can access this feature
            --         ['items'] = {
            --             [1] = {name = 'bread', label = 'Bread', value = 50},
            --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
            --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
            --         },
            --         label = 'Bennys Shop 2',
            --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
            --         event = 'renzu_jobs:openshop',
            --     },
           },
            ['crafting'] = {
            --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            --     grade = 0,
            --     coord = vector3(-196.37414550781,-1318.5646972656,31.089338302612),
            --     label = 'Bennys Crafting Table',
            --     event = 'renzu_jobs:opencrafting',
            --     craftable = {
            --         ['turbo_sports'] = {name = 'turbo_sports', label = 'Turbo Sports', type = 'item', seconds = 150, -- index/array name must be the same with item name, so we can fetch it easily later
            --             requirements = {
            --                 [1] = {name = 'steel', amount = 5},
            --             },
            --         },
            --         ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
            --             requirements = {
            --                 [1] = {name = 'bread', amount = 1},
            --                 [2] = {name = 'water', amount = 1},
            --                 [3] = {name = 'lplparmor', amount = 1},
            --             },
            --         },
            --     }
           },
            ['vehicleshop'] = {
                -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                -- grade = 0, -- minimum job grade can access this feature
                -- label = 'Vehicle Shop',
                -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
                -- event = 'renzu_jobs:openvehicleshop',
                -- vehicles = {
                --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
                --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
                -- }
            },
            ['garage'] = {
                -- unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
                -- grade = 0, -- minimum job grade can access this feature
                -- label = 'Garage',
                -- coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
                -- spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
                -- event = 'renzu_jobs:opengarage',
            },
            ['duty'] = {
                -- grade = 0,
                -- offdutyname = 'offmechanic',
                -- coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
                -- label = 'On/Off Duty',
                -- event = 'renzu_jobs:duty',
            },
            ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
                [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [1] = {
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [2] = {
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [3] = {
                    access = {fire = true, withdraw = true, deposit = true, gradechange = true},
                },
            }
        },



                ['bayview'] = {
                    ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
                    ['bossmenu'] = {
                        webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                        grade = 4, -- minimum grade to access
                        coord = vector3(-680.96923828125,5810.5483398438,17.330940246582),
                        label = 'Menu Patron',
                        event = 'renzu_jobs:openbossmenu',
                    },
                    ['inventory'] = {
                        ['Boss'] = { -- path inventory['Boss']
                            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                            grade = 4, -- minimum job grade can access this feature
                            coord = vector3(-688.77105712891,5793.9194335938,17.330932617188),
                            label = 'Inventaire Patron',
                            public = false,
                            slots = 100,
                            event = 'inventory:unicornBoss',
                        },

                        ['Stash'] = { -- path inventory['Stash']
                            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                            grade = 0, -- minimum job grade can access this feature
                            coord = vector3(1-686.29937744141,5798.8413085938,17.330955505371),
                            label = 'Frigo', -- same as stash
                            public = false, -- stash mode or public inventory
                            slots = 2000,
                            event = 'inventory:unicorn',
                        },
                    },
                    -- ['weapon_armory'] = { -- DISABLE weapon armory?
                    --     grade = 0, -- minimum job grade can access this feature
                    --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
                    --     label = 'Weapon Armory',
                    --     event = 'renzu_jobs:openweapons',
                    -- },
                    ['wardrobe'] = {
                        grade = 0,
                        coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
                        label = 'Dressing',
                        event = 'renzu_jobs:openwardrobe',
                    },
                   ['shop'] = {
                        [1] = {
                            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                            public = true, -- if shop is public or for this job only. (income money will go to this job money)
                            grade = 0, -- minimum job grade can access this feature
                            ['items'] = {
                                [1] = {name = 'gym_membership', label = 'Carte de Membre', value = 3000},
                            },
                            label = 'LA FITNESS',
                            coord = vector3(258.99462890625,-270.11535644531,53.963531494141),
                            event = 'renzu_jobs:openshop',
                        },
                    --     [2] = {
                    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
                    --         grade = 0, -- minimum job grade can access this feature
                    --         ['items'] = {
                    --             [1] = {name = 'bread', label = 'Bread', value = 50},
                    --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
                    --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
                    --         },
                    --         label = 'Bennys Shop 2',
                    --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
                    --         event = 'renzu_jobs:openshop',
                    --     },
                   },
                   ['crafting'] = {
                       webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                       grade = 1,
                       coord = vector3(-687.38732910156,5796.6196289063,17.33092880249),
                       label = 'Cuisine du bayview',
                       event = 'renzu_jobs:opencrafting',
                       craftable = {
                           ['diner_hamburger'] = {name = 'diner_hamburger', label = 'Hamburger', type = 'item', seconds = 120, -- index/array name must be the same with item name, so we can fetch it easily later
                               requirements = {
                                   [1] = {name = 'bread', amount = 1},
                                   [2] = {name = 'tomates', amount = 2},
                                   [3] = {name = 'salade', amount = 1},
                                   [4] = {name = 'steak', amount = 1},
                                   [5] = {name = 'cornichons', amount = 1},
                               },
                           },
                           ['diner_frite'] = {name = 'diner_frite', label = 'Frites', type = 'item', seconds = 40,
                               requirements = {
                                   [1] = {name = 'patates', amount = 3},
                                   [2] = {name = 'oil_bouffe', amount = 2},
                               },
                           },
                           ['diner_potatoes'] = {name = 'diner_potatoes', label = 'Potatoes', type = 'item', seconds = 40,
                               requirements = {
                                 [1] = {name = 'patates', amount = 3},
                                 [2] = {name = 'oil_bouffe', amount = 2},
                               },
                           },
                           ['diner_bacon'] = {name = 'diner_bacon', label = 'Bacon', type = 'item', seconds = 50,
                               requirements = {
                                   [1] = {name = 'bacon_cru', amount = 2},
                                   [2] = {name = 'oil_bouffe', amount = 3},
                               },
                           },
                           ['diner_veggiewrap'] = {name = 'diner_veggiewrap', label = 'Veggie Wrap', type = 'item', seconds = 100,
                               requirements = {
                                   [1] = {name = 'bread', amount = 1},
                                   [2] = {name = 'salade', amount = 2},
                                   [3] = {name = 'tomates', amount = 3},
                                   [4] = {name = 'cornichons', amount = 1},
                               },
                           },
                       }
                   },
                    ['vehicleshop'] = {
                        -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                        -- grade = 0, -- minimum job grade can access this feature
                        -- label = 'Vehicle Shop',
                        -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
                        -- event = 'renzu_jobs:openvehicleshop',
                        -- vehicles = {
                        --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
                        --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
                        -- }
                    },
                    ['garage'] = {
                        -- unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
                        -- grade = 0, -- minimum job grade can access this feature
                        -- label = 'Garage',
                        -- coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
                        -- spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
                        -- event = 'renzu_jobs:opengarage',
                    },
                    ['duty'] = {
                        -- grade = 0,
                        -- offdutyname = 'offmechanic',
                        -- coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
                        -- label = 'On/Off Duty',
                        -- event = 'renzu_jobs:duty',
                    },
                    ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
                        [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                            access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                        },
                        [1] = {
                            access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                        },
                        [2] = {
                            access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                        },
                        [3] = {
                            access = {fire = true, withdraw = true, deposit = true, gradechange = true},
                        },
                    }
                },









        ['yellowjack'] = {
            ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
            ['bossmenu'] = {
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 4, -- minimum grade to access
                coord = vector3(1995.0231933594,3042.642578125,50.421981811523),
                label = 'Menu Patron',
                event = 'renzu_jobs:openbossmenu',
            },
            ['inventory'] = {
                ['Boss'] = { -- path inventory['Boss']
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    grade = 4, -- minimum job grade can access this feature
                    coord = vector3(1997.4388427734,3049.1179199219,50.423110961914),
                    label = 'Inventaire Patron',
                    public = false,
                    slots = 100,
                    event = 'inventory:yellowBoss',
                },

                ['Stash'] = { -- path inventory['Stash']
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    grade = 0, -- minimum job grade can access this feature
                    coord = vector3(1983.1750488281,3054.3874511719,47.215106964111),
                    label = 'YELLOW JACK', -- same as stash
                    public = false, -- stash mode or public inventory
                    slots = 2000,
                    event = 'inventory:yellow',
                },
            },
            -- ['weapon_armory'] = { -- DISABLE weapon armory?
            --     grade = 0, -- minimum job grade can access this feature
            --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
            --     label = 'Weapon Armory',
            --     event = 'renzu_jobs:openweapons',
            -- },
            -- ['wardrobe'] = {
            --     grade = 0,
            --     coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
            --     label = 'Dressing',
            --     event = 'renzu_jobs:openwardrobe',
            -- },
           ['shop'] = {
                -- [1] = {
                --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                --     public = true, -- if shop is public or for this job only. (income money will go to this job money)
                --     grade = 0, -- minimum job grade can access this feature
                --     ['items'] = {
                --         [1] = {name = 'gym_membership', label = 'Carte de Membre', value = 3000},
                --     },
                --     label = 'LA FITNESS',
                --     coord = vector3(258.99462890625,-270.11535644531,53.963531494141),
                --     event = 'renzu_jobs:openshop',
                -- },
            --     [2] = {
            --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
            --         grade = 0, -- minimum job grade can access this feature
            --         ['items'] = {
            --             [1] = {name = 'bread', label = 'Bread', value = 50},
            --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
            --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
            --         },
            --         label = 'Bennys Shop 2',
            --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
            --         event = 'renzu_jobs:openshop',
            --     },
           },
           ['crafting'] = {
               webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
               grade = 1,
               coord = vector3(1982.9113769531,3049.9487304688,47.215003967285),
               label = 'Cuisine du Yellow',
               event = 'renzu_jobs:opencrafting',
               craftable = {
                   ['diner_hamburger'] = {name = 'diner_hamburger', label = 'Hamburger', type = 'item', seconds = 120, -- index/array name must be the same with item name, so we can fetch it easily later
                       requirements = {
                           [1] = {name = 'bread', amount = 1},
                           [2] = {name = 'tomates', amount = 2},
                           [3] = {name = 'salade', amount = 1},
                           [4] = {name = 'steak', amount = 1},
                           [5] = {name = 'cornichons', amount = 1},
                       },
                   },
                   ['diner_frite'] = {name = 'diner_frite', label = 'Frites', type = 'item', seconds = 40,
                       requirements = {
                           [1] = {name = 'patates', amount = 3},
                           [2] = {name = 'oil_bouffe', amount = 2},
                       },
                   },
                   ['diner_potatoes'] = {name = 'diner_potatoes', label = 'Potatoes', type = 'item', seconds = 40,
                       requirements = {
                         [1] = {name = 'patates', amount = 3},
                         [2] = {name = 'oil_bouffe', amount = 2},
                       },
                   },
                   ['diner_bacon'] = {name = 'diner_bacon', label = 'Bacon', type = 'item', seconds = 50,
                       requirements = {
                           [1] = {name = 'bacon_cru', amount = 2},
                           [2] = {name = 'oil_bouffe', amount = 3},
                       },
                   },
                   ['diner_veggiewrap'] = {name = 'diner_veggiewrap', label = 'Veggie Wrap', type = 'item', seconds = 100,
                       requirements = {
                           [1] = {name = 'bread', amount = 1},
                           [2] = {name = 'salade', amount = 2},
                           [3] = {name = 'tomates', amount = 3},
                           [4] = {name = 'cornichons', amount = 1},
                       },
                   },
               }
           },
            ['vehicleshop'] = {
                -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                -- grade = 0, -- minimum job grade can access this feature
                -- label = 'Vehicle Shop',
                -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
                -- event = 'renzu_jobs:openvehicleshop',
                -- vehicles = {
                --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
                --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
                -- }
            },
            ['garage'] = {
                -- unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
                -- grade = 0, -- minimum job grade can access this feature
                -- label = 'Garage',
                -- coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
                -- spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
                -- event = 'renzu_jobs:opengarage',
            },
            ['duty'] = {
                -- grade = 0,
                -- offdutyname = 'offmechanic',
                -- coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
                -- label = 'On/Off Duty',
                -- event = 'renzu_jobs:duty',
            },
            ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
                [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [1] = {
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [2] = {
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [3] = {
                    access = {fire = true, withdraw = true, deposit = true, gradechange = true},
                },
                [4] = {
                    access = {fire = true, withdraw = true, deposit = true, gradechange = true},
                },
            }
        },



        ['eglise'] = {
            ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
            ['bossmenu'] = {
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 2, -- minimum grade to access
                coord = vector3(-783.72717285156,5.2011609077454,41.529094696045),
                label = 'Menu Patron',
                event = 'renzu_jobs:openbossmenu',
            },
            ['inventory'] = {
                ['Boss'] = { -- path inventory['Boss']
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    grade = 2, -- minimum job grade can access this feature
                    coord = vector3(-782.72650146484,0.35596618056297,41.561763763428),
                    label = 'EGLISE ',
                    public = false,
                    slots = 100,
                    event = 'inventory:openeglisebossInventory',
                },

                ['Stash'] = { -- path inventory['Stash']
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    grade = 0, -- minimum job grade can access this feature
                    coord = vector3(-780.46240234375,1.6654983758926,41.561763763428),
                    label = 'EGLISE', -- same as stash
                    public = false, -- stash mode or public inventory
                    slots = 2000,
                    event = 'inventory:openeglise',
                },
            },
            -- ['weapon_armory'] = { -- DISABLE weapon armory?
            --     grade = 0, -- minimum job grade can access this feature
            --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
            --     label = 'Weapon Armory',
            --     event = 'renzu_jobs:openweapons',
            -- },
            ['wardrobe'] = {
                grade = 0,
                coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
                label = 'Dressing',
                event = 'renzu_jobs:openwardrobe',
            },
           ['shop'] = {
                [1] = {
                    webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                    public = true, -- if shop is public or for this job only. (income money will go to this job money)
                    grade = 0, -- minimum job grade can access this feature
                    ['items'] = {
                        [1] = {name = '', label = 'Cierge', value = 50},
                    },
                    label = 'EGLISE',
                    coord = vector3(-769.5419921875,-2.5091400146484,41.081123352051),
                    event = 'renzu_jobs:openshop',
                },
            --     [2] = {
            --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
            --         grade = 0, -- minimum job grade can access this feature
            --         ['items'] = {
            --             [1] = {name = 'bread', label = 'Bread', value = 50},
            --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
            --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
            --         },
            --         label = 'Bennys Shop 2',
            --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
            --         event = 'renzu_jobs:openshop',
            --     },
           },
            ['crafting'] = {
            --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            --     grade = 0,
            --     coord = vector3(-196.37414550781,-1318.5646972656,31.089338302612),
            --     label = 'Bennys Crafting Table',
            --     event = 'renzu_jobs:opencrafting',
            --     craftable = {
            --         ['turbo_sports'] = {name = 'turbo_sports', label = 'Turbo Sports', type = 'item', seconds = 150, -- index/array name must be the same with item name, so we can fetch it easily later
            --             requirements = {
            --                 [1] = {name = 'steel', amount = 5},
            --             },
            --         },
            --         ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
            --             requirements = {
            --                 [1] = {name = 'bread', amount = 1},
            --                 [2] = {name = 'water', amount = 1},
            --                 [3] = {name = 'lplparmor', amount = 1},
            --             },
            --         },
            --     }
           },
            ['vehicleshop'] = {
                -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                -- grade = 0, -- minimum job grade can access this feature
                -- label = 'Vehicle Shop',
                -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
                -- event = 'renzu_jobs:openvehicleshop',
                -- vehicles = {
                --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
                --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
                -- }
            },
            ['garage'] = {
                -- unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
                -- grade = 0, -- minimum job grade can access this feature
                -- label = 'Garage',
                -- coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
                -- spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
                -- event = 'renzu_jobs:opengarage',
            },
            ['duty'] = {
                grade = 0,
                offdutyname = 'offmechanic',
                coord = vector3(-207.6012878418,-1337.5262451172,-3004.894355773926),
                label = 'On/Off Duty',
                event = 'renzu_jobs:duty',
            },
            ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
                [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [1] = {
                    access = {fire = false, withdraw = false, deposit = false, gradechange = false},
                },
                [2] = {
                    access = {fire = true, withdraw = true, deposit = true, gradechange = true},
                },
                -- [3] = {
                --     access = {fire = true, withdraw = true, deposit = true, gradechange = true},
                -- },
            }
        },


    ['police'] = {
        ['max_salary'] = 10000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 12, -- minimum grade to access
            coord = vector3(0,0,-334.276958465576),
            label = 'Menu Patron',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 11, -- minimum job grade can access this feature
                coord = vector3(-557.37670898438,-127.303565979,47.51815032959),
                label = 'Coffre du commandant',
                public = false,
                slots = 100,
                event = 'inventory:openBossLSPD',
            },
            ['Personal'] = { -- Armurie
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-542.32373046875,-116.21994018555,37.859680175781),
                label = 'Armurie LSPD', -- same as stash
                public = false, -- stash mode or public inventory
                slots = 2000,
                event = 'inventory:openJobInventory',
            },
            ['Preuve'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 3, -- minimum job grade can access this feature
                coord = vector3(619.18798828125,-10.729665756226,76.628059387207),
                label = 'Preuve',
                public = false,
                slots = 100,
                event = 'inventory:openpreuvelspd',
            },
            ['Suspect'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1076.5274658203,-817.03228759766,15.644227027893),
                label = 'Affaires des GAV',
                public = false,
                slots = 100,
                event = 'inventory:opensuspectlspd',
            },
        },
        -- ['weapon_armory'] = { -- DISABLE weapon armory?
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        -- ['wardrobe'] = {
        --     grade = 0,
        --     coord = vector3(-602.02447509766,-913.94671630859,23.886611938477),
        --     label = 'Dressing',
        --     event = 'renzu_jobs:openwardrobe',
        -- },
       ['shop'] = {
        --     [1] = {
        --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
        --         grade = 0, -- minimum job grade can access this feature
        --         ['items'] = {
        --             [1] = {name = 'bread', label = 'Bread', value = 50},
        --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
        --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
        --         },
        --         label = 'Bennys Shop 1',
        --         coord = vector3(-215.87023925781,-1317.8905029297,30.890377044678),
        --         event = 'renzu_jobs:openshop',
        --     },
        --     [2] = {
        --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --         public = true, -- if shop is public or for this job only. (income money will go to this job money)
        --         grade = 0, -- minimum job grade can access this feature
        --         ['items'] = {
        --             [1] = {name = 'bread', label = 'Bread', value = 50},
        --             [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
        --             [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
        --         },
        --         label = 'Bennys Shop 2',
        --         coord = vector3(-207.91415405273,-1342.0013427734,34.89436340332),
        --         event = 'renzu_jobs:openshop',
        --     },
       },
        ['crafting'] = {
        --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --     grade = 0,
        --     coord = vector3(-196.37414550781,-1318.5646972656,31.089338302612),
        --     label = 'Bennys Crafting Table',
        --     event = 'renzu_jobs:opencrafting',
        --     craftable = {
        --         ['turbo_sports'] = {name = 'turbo_sports', label = 'Turbo Sports', type = 'item', seconds = 150, -- index/array name must be the same with item name, so we can fetch it easily later
        --             requirements = {
        --                 [1] = {name = 'steel', amount = 5},
        --             },
        --         },
        --         ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
        --             requirements = {
        --                 [1] = {name = 'bread', amount = 1},
        --                 [2] = {name = 'water', amount = 1},
        --                 [3] = {name = 'lplparmor', amount = 1},
        --             },
        --         },
        --     }
       },
        ['vehicleshop'] = {
            -- webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            -- grade = 0, -- minimum job grade can access this feature
            -- label = 'Vehicle Shop',
            -- coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
            -- event = 'renzu_jobs:openvehicleshop',
            -- vehicles = {
            --     [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
            --     [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
            -- }
        },
        -- ['garage'] = {
        --     unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
        --     grade = 0, -- minimum job grade can access this feature
        --     label = 'Garage',
        --     coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
        --     spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
        --     event = 'renzu_jobs:opengarage',
        -- },
        -- ['duty'] = {
        --     grade = 0,
        --     offdutyname = 'offmechanic',
        --     coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
        --     label = 'On/Off Duty',
        --     event = 'renzu_jobs:duty',
        -- },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = true, withdraw = false, deposit = true, gradechange = true},
            },
            [4] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true},
            },
        }
    },

















    --
    -- ['lostmc'] = { -- gang sample
    --     ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
    --     ['bossmenu'] = {
    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --         grade = 1, -- minimum grade to access
    --         coord = vector3(983.61138916016,-92.527420043945,74.852157592773),
    --         label = 'Boss Action',
    --         event = 'renzu_jobs:openbossmenu',
    --     },
    --     ['inventory'] = {
    --         ['Boss'] = { -- path inventory['Boss']
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             grade = 1, -- minimum job grade can access this feature
    --             coord = vector3(987.14569091797,-92.860740661621,74.845687866211),
    --             label = 'Boss Inventory',
    --             public = false,
    --             slots = 100,
    --             event = 'renzu_jobs:openinventory',
    --         },
    --         ['Personal'] = { -- path inventory['Personal'][identifier]
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             grade = 0,
    --             coord = vector3(977.21374511719,-104.17129516602,74.845077514648),
    --             label = 'Personal Inventory',
    --             public = false,
    --             slots = 20,
    --             event = 'renzu_jobs:openinventory',
    --         },
    --         ['Stash'] = { -- path inventory['Stash']
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             grade = 0, -- minimum job grade can access this feature
    --             coord = vector3(971.86309814453,-98.383483886719,74.846099853516),
    --             label = 'LostMc Inventory', -- same as stash
    --             public = true, -- stash mode or public inventory
    --             slots = 20,
    --             event = 'renzu_jobs:openinventory',
    --         },
    --     },
    --     ['weapon_armory'] = { -- DISABLE weapon armory?
    --         grade = 0, -- minimum job grade can access this feature
    --         coord = vector3(980.10980224609,-98.445304870605,74.844985961914),
    --         label = 'Weapon Armory',
    --         event = 'renzu_jobs:openweapons',
    --     },
    --     ['wardrobe'] = {
    --         grade = 0,
    --         coord = vector3(973.75256347656,-96.728889465332,74.869956970215),
    --         label = 'Wardrobe',
    --         event = 'renzu_jobs:openwardrobe',
    --     },
    --     ['shop'] = { -- multi shop
    --         [1] = {
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             public = true, -- if shop is public or for this job only. (income money will go to this job money)
    --             grade = 0, -- minimum job grade can access this feature
    --             ['items'] = {
    --                 [1] = {name = 'bread', label = 'Bread', value = 50},
    --                 [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
    --                 [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
    --             },
    --             label = 'LostMc Shop 1',
    --             coord = vector3(988.66870117188,-96.233024597168,74.84521484375),
    --             event = 'renzu_jobs:openshop',
    --         },
    --         [2] = {
    --             webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --             public = true, -- if shop is public or for this job only. (income money will go to this job money)
    --             grade = 0, -- minimum job grade can access this feature
    --             ['items'] = {
    --                 [1] = {name = 'bread', label = 'Bread', value = 50},
    --                 [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
    --                 [3] = {name = 'WEAPON_PISTOL', label = 'PISTOL', value = 15000}, -- use capitalize for weapon to avoid bugs
    --             },
    --             label = 'LostMc Shop 2',
    --             coord = vector3(958.98858642578,-121.24058532715,74.963508605957),
    --             event = 'renzu_jobs:openshop',
    --         },
    --     },
    --     ['garage'] = {
    --         unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
    --         grade = 0, -- minimum job grade can access this feature
    --         label = 'Garage',
    --         coord = vector3(986.25476074219,-106.7004776001,74.353157043457),
    --         spawn = vector4(970.5380859375,-114.37124633789,73.678535461426,219.50030517578),
    --         event = 'renzu_jobs:opengarage',
    --     },
    --     ['crafting'] = {
    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --         grade = 0,
    --         coord = vector3(978.91638183594,-94.26042175293,74.868110656738),
    --         label = 'LostMC Crafting Table',
    --         event = 'renzu_jobs:opencrafting',
    --         craftable = {
    --             ['bread'] = {name = 'bread', label = 'Bread', type = 'item', seconds = 50, -- index/array name must be the same with item name, so we can fetch it easily later
    --                 requirements = {
    --                     [1] = {name = 'bread', amount = 1},
    --                 },
    --             },
    --             ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 10,
    --                 requirements = {
    --                     [1] = {name = 'bread', amount = 1},
    --                     [2] = {name = 'water', amount = 1},
    --                     [3] = {name = 'lplparmor', amount = 1},
    --                 },
    --             },
    --         }
    --     },
    --     ['vehicleshop'] = {
    --         webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
    --         grade = 0, -- minimum job grade can access this feature
    --         label = 'Vehicle Shop',
    --         coord = vector3(965.66290283203,-118.93395996094,74.353141784668),
    --         event = 'renzu_jobs:openvehicleshop',
    --         vehicles = {
    --             [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
    --             [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
    --         }
    --     },
    --     ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
    --         [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
    --             access = {fire = false, withdraw = false, deposit = false, gradechange = false},
    --         },
    --         [1] = {
    --             access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
    --         },
    --     }
    -- },


    ['pearl'] = {
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 5, -- minimum grade to access
            coord = vector3(-213.75379943848,-1334.8754882812,34.894416809082),
            label = 'Bureau du patron',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 5, -- minimum job grade can access this feature
                coord = vector3(-1838.3470458984,-1187.8360595703,14.322137832642),
                label = 'Stockage du patron',
                public = false,
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Personal'] = { -- path inventory['Personal'][identifier]
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0,
                coord = vector3(-1840.9515380859,-1189.6098632812,14.322943687439),
                label = 'Stockage Personel+',
                public = false,
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Stash'] = { -- path inventory['Stash']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1838.0544433594,-1183.9362792969,14.325330734253),
                label = 'Stockage d\'Entreprise', -- same as stash
                public = true, -- stash mode or public inventory
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        -- ['weapon_armory'] = { -- DISABLE weapon armory?
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        ['shop'] = {
            [1] = {
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = true, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                --    [1] = {name = 'bread', label = 'Bread', value = 50},
                    [1] = {name = 'water', label = 'Water', value = false}, -- if false its free

                },
                label = 'Robinet',
                coord = vector3(-1841.5123291016,-1184.1235351562,14.327961921692),
                event = 'renzu_jobs:openshop',
            },
        },
        ['crafting'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 3,
            coord = vector3(-1842.7160644531,-1186.0549316406,14.327610969543),
            label = 'Cuisine du Pearl\'s',
            event = 'renzu_jobs:opencrafting',
            craftable = {
                ['pearl_bouillabaisse'] = {name = 'pearl_bouillabaisse', label = 'Bouillabaisse', type = 'item', seconds = 180, -- index/array name must be the same with item name, so we can fetch it easily later
                    requirements = {
                        [1] = {name = 'fish', label = 'Colin', amount = 3},
                        [2] = {name = 'fish2', label = 'Dorade', amount = 2},
                        [3] = {name = 'fish3', label = 'Saumon', amount = 1},
                        [4] = {name = 'water', amount = 2},
                          [5] = {name = 'tomates', amount = 3},
                            [6] = {name = 'patates', amount = 1},
                              [7] = {name = 'oil_bouffe', amount = 1},
                    },
                },
                ['pearl_poissonpane'] = {name = 'pearl_poissonpane', label = 'Poisson Pané', type = 'item', seconds = 60,
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                        [2] = {name = 'fish', amount = 3},
                          [3] = {name = 'oil_bouffe', amount = 1},
                    },
                },
                ['pearl_filedepoisson'] = {name = 'pearl_filedepoisson', label = 'Filé de poisson', type = 'item', seconds = 50,
                    requirements = {
                        [1] = {name = 'fish2', amount = 3},
                        [2] = {name = 'wine', amount = 1},
                          [3] = {name = 'patates', amount = 1},
                            [4] = {name = 'oignons', amount = 1},
                              [5] = {name = 'salade', amount = 1},
                    },
                },
                ['pearl_saumonfume'] = {name = 'pearl_saumonfume', label = 'Saumon fumé', type = 'item', seconds = 160,
                    requirements = {
                        [1] = {name = 'fish3', amount = 2},
                        [2] = {name = 'water', amount = 3},
                        [3] = {name = 'salade', amount = 1},
                    },
                },
            }
        },
        -- ['vehicleshop'] = {
        --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --     grade = 0, -- minimum job grade can access this feature
        --     label = 'Vehicle Shop',
        --     coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
        --     event = 'renzu_jobs:openvehicleshop',
        --     vehicles = {
        --         [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
        --         [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
        --     }
        -- },
        -- ['garage'] = {
        --     unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
        --     grade = 0, -- minimum job grade can access this feature
        --     label = 'Garage',
        --     coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
        --     spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
        --     event = 'renzu_jobs:opengarage',
        -- },
        -- ['duty'] = {
        --     grade = 0,
        --     offdutyname = 'offmechanic',
        --     coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
        --     label = 'On/Off Duty',
        --     event = 'renzu_jobs:duty',
        -- },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [4] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [5] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true},
            },
        }
    },

    ['diner'] = {
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 5, -- minimum grade to access
            coord = vector3(1596.1517333984,6454.2055664062,26.013980865479),
            label = 'Bureau du patron',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 5, -- minimum job grade can access this feature
                coord = vector3(1585.0378417969,6459.46484375,26.013975143433),
                label = 'Stockage du patron',
                public = false,
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            -- ['Personal'] = { -- path inventory['Personal'][identifier]
            --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            --     grade = 0,
            --     coord = vector3(-1840.9515380859,-1189.6098632812,14.322943687439),
            --     label = 'Stockage Personel+',
            --     public = false,
            --     slots = 20,
            --     event = 'renzu_jobs:openinventory',
            -- },
            ['Stash'] = { -- path inventory['Stash']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(1590.3671875,6457.9306640625,26.013975143433),
                label = 'Stockage d\'Entreprise', -- same as stash
                public = true, -- stash mode or public inventory
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        -- ['weapon_armory'] = { -- DISABLE weapon armory?
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        ['shop'] = {
            [1] = {
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = true, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                --    [1] = {name = 'bread', label = 'Bread', value = 50},
                    [1] = {name = 'water', label = 'Water', value = 3}, -- if false its free
                    [2] = {name = 'cola', label = 'Soda', value = 10},
                    [3] = {name = 'coffee', label = 'Café', value = 15},
                },
                label = 'Magasin',
                coord = vector3(1589.5616455078,6455.0112304688,26.013982772827),
                event = 'renzu_jobs:openshop',
            },
        },
        ['crafting'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 3,
            coord = vector3(1587.7237548828,6458.1420898438,26.013969421387),
            label = 'Cuisine du Pearl\'s',
            event = 'renzu_jobs:opencrafting',
            craftable = {
                ['diner_hamburger'] = {name = 'diner_hamburger', label = 'Hamburger', type = 'item', seconds = 120, -- index/array name must be the same with item name, so we can fetch it easily later
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                        [2] = {name = 'tomates', amount = 2},
                        [3] = {name = 'salade', amount = 1},
                        [4] = {name = 'steak', amount = 1},
                        [5] = {name = 'cornichons', amount = 1},
                    },
                },
                ['diner_frite'] = {name = 'diner_frite', label = 'Frites', type = 'item', seconds = 40,
                    requirements = {
                        [1] = {name = 'patates', amount = 3},
                        [2] = {name = 'oil_bouffe', amount = 2},
                    },
                },
                ['diner_potatoes'] = {name = 'diner_potatoes', label = 'Potatoes', type = 'item', seconds = 40,
                    requirements = {
                      [1] = {name = 'patates', amount = 3},
                      [2] = {name = 'oil_bouffe', amount = 2},
                    },
                },
                ['diner_bacon'] = {name = 'diner_bacon', label = 'Bacon', type = 'item', seconds = 50,
                    requirements = {
                        [1] = {name = 'bacon_cru', amount = 2},
                        [2] = {name = 'oil_bouffe', amount = 3},
                    },
                },
                ['diner_veggiewrap'] = {name = 'diner_veggiewrap', label = 'Veggie Wrap', type = 'item', seconds = 100,
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                        [2] = {name = 'salade', amount = 2},
                        [3] = {name = 'tomates', amount = 3},
                        [4] = {name = 'cornichons', amount = 1},
                    },
                },
            }
        },
        -- ['vehicleshop'] = {
        --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --     grade = 0, -- minimum job grade can access this feature
        --     label = 'Vehicle Shop',
        --     coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
        --     event = 'renzu_jobs:openvehicleshop',
        --     vehicles = {
        --         [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
        --         [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
        --     }
        -- },
        -- ['garage'] = {
        --     unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
        --     grade = 0, -- minimum job grade can access this feature
        --     label = 'Garage',
        --     coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
        --     spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
        --     event = 'renzu_jobs:opengarage',
        -- },
        -- ['duty'] = {
        --     grade = 0,
        --     offdutyname = 'offmechanic',
        --     coord = vector3(-207.6012878418,-1337.5262451172,34.894355773926),
        --     label = 'On/Off Duty',
        --     event = 'renzu_jobs:duty',
        -- },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true},
            },
        }
    },







































}
