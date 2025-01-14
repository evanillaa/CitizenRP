Config = {}
Config.License = '4bf05c19d37d734fc20f03548a9e960c'
Config.Locale = 'en'
Config.Debug = false
Config.ESX = 'esx:getSharedObject'
Config.ESXCallbacks = {
    ['esx_datastore:getDataStore'] = 'esx_datastore:getDataStore',
    ['esx:playerLoaded'] = 'esx:playerLoaded',
    ['esx:setJob'] = 'esx:setJob',
    ['esx_addonaccount:getSharedAccount'] = 'esx_addonaccount:getSharedAccount',
    ['skinchanger:getSkin'] = 'skinchanger:getSkin',
    ['skinchanger:loadClothes'] = 'skinchanger:loadClothes',
    ['esx_skin:setLastSkin'] = 'esx_skin:setLastSkin',
    ['esx_skin:save'] = 'esx_skin:save',
    ['skinchanger:loadSkin'] = 'skinchanger:loadSkin',
}
Config.WaitBeforeOpenMenu = 200
Config.DatastoreName = 'property'
Config.CheckPlayerPosition = 2000
Config.NearObjectDistance = 50
Config.GlobalBlacklist = {
    ['hats'] = {
        ['helmet_1'] = {
            ['male'] = {2,3,6,7,13,17,9,49,79,84,91,92,115,116,117,119,141,147,148,150,38,47, 48,83, 111, 118, 129, 137, 138, 172 }, --Specific sex blacklist
            ['female'] = {},
        },
    },

    ['tshirt'] = {
        ['arms'] = {
            ['male'] = {}, --Specific sex blacklist
            ['female'] = {},
        },

        ['tshirt_1'] = {
            ['male'] = {37,38,39,90,91,93,44,53,55,57,58,65,66,97,105,87,20,56,124,125,126,127,128,129,131,152,153,154,155,156,159,160,161,162,164,170,171,20,43,68,130,37,38,39,90,91,93
            ,44,53,55,57,58,65,66,97,105,87}, --Specific sex blacklist
            ['female'] = {30,35,105,152,154,155,156,157,158,159,160,161,188,189,190,191,192,200,207,209},
        },

        ['torso_1'] = {
            ['male'] = {2,24,28,31,32,38,44,49,51,55,63,65,73,74,75,77,80,81,92,93,94,97,98,101,102,103,108,110,118,159,160,275}, --Specific sex blacklist
            ['female'] = {14,48,58,64,73,74,83,85,92,93,99,188,264,265,266},
        },
        ['chain_1'] = {
            ['male'] = {1,2,3,5,6,8,10}, --Specific sex blacklist
            ['female'] = {1,2,3,5,6,8,25,95,96,97,98,102,115,116,117},
        },
        ['pants_1'] = {
            ['male'] = {52,23,30,41,98,121,124,125,52}, --Specific sex blacklist
          --  ['female'] = {14,48,58,64,73,74,83,85,92,93,99,188,264,265,266},
        },
    },

    ['bags'] = {--Numbers of blacklisted items for bags for both sex
      ['male'] = {31,32,36,33,35,48,49,60,66,72,73,74}, --Specific sex blacklist
      ['female'] = {31,32,36,33,35,48,49,60,66,72,73,74},
    }
}
-- Config.GlobalBlacklist = {
--     ['helmet'] = {
--         ['hats'] = {
--             ['male'] = {2,3,6,7,13,17,9,49,79,84,91,92,115,116,117,119,141,147,148,150}, --Specific sex blacklist
--             ['female'] = {},
--         }
--     },
--     ['torso'] = {
--         ['tshirt'] = {
--             ['male'] = {2,24,28,31,32,38,44,49,51,55,63,65,73,74,75,77,80,81,87,92,93,94,97,98,101,102,103,108,110,118}, --Specific sex blacklist
--             ['female'] = {},
--         }
--     },
--     ['tshirt'] = {
--         ['tshirt_1'] = {
--             ['male'] = {37,38,39,90,91,93,44,53,55,57,58,65,66,97,105}, --Specific sex blacklist
--             ['female'] = {},
--         }
--     },
--     ['chain'] = {
--         ['chain_1'] = {
--             ['male'] = {1,2,3,5,6,8,10}, --Specific sex blacklist
--             ['female'] = {},
--         }
--     },
--     ['bags'] = { 31,32,36,33,35,48,49,60,66,72,73,74
--       --  ['male'] = {31,32,36,33,35,48,49,60,66,72,73,74}, --Specific sex blacklist
--         --['female'] = {},
--         --Numbers of blacklisted items for bags for both sex  torso_1
--     }
-- }
Config.GlobalWhitelist = { --Same as blacklist you can do with whitelist
  ['tshirt_police'] = {
      ['arms'] = {
          ['male'] = {}, --Specific sex blacklist
          ['female'] = {},
      },

      ['tshirt_1'] = {
          ['male'] = {37,38,39,90,91,93,44,53,55,57,58,65,66,97,105,87}, --Specific sex blacklist
          ['female'] = {30,35,105,152,154,155,156,157,158,159,160,161,188,189,190,191,192,200,207,209},
      },

      ['torso_1'] = {
          ['male'] = {2,24,28,31,32,38,44,49,51,55,63,65,73,74,75,77,80,81,92,93,94,97,98,101,102,103,108,110,118}, --Specific sex blacklist
          ['female'] = {14,48,58,64,73,74,83,85,92,93,99,188,264,265,266},
      },
      ['chain_1'] = {
          ['male'] = {1,2,3,5,6,8,10}, --Specific sex blacklist
          ['female'] = {1,2,3,5,6,8,25,95,96,97,98,102,115,116,117},
      },


      ['helmet_1'] = {
          ['male'] = {2,3,6,7,13,17,9,49,79,84,91,92,115,116,117,119,141,147,148,150}, --Specific sex blacklist
          ['female'] = {},
      },
  },

  ['surplus_haut'] = {
      ['arms'] = {
          ['male'] = {}, --Specific sex blacklist
          ['female'] = {},
      },

      ['tshirt_1'] = {
          ['male'] = {56,124,125,126,127,128,129,131,152,153,154,155,156,159,160,161,162,164,170,171,122}, --Specific sex blacklist
          ['female'] = {},
      },

      ['torso_1'] = {
          ['male'] = {48,53,165,191,214,219,222,221,228,229,230,231,239,244,247,248,251,253,320,324,336,337}, --Specific sex blacklist
          ['female'] = {},
      },

      ['pants_1'] = {
          ['male'] = {23,30,41,98,121,124,125}, --Specific sex blacklist
          ['female'] = {},
      },
      ['chain_1'] = {
          ['male'] = {1,2,3,5,6,8,10}, --Specific sex blacklist
          ['female'] = {},
      },
      ['shoes_1'] = {
          ['male'] = {61,62,63,70,71,72}, --Specific sex blacklist
          ['female'] = {},
      },

      ['helmet_1'] = {
          ['male'] = {58,59,112,123,124,125,126}, --Specific sex blacklist
          ['female'] = {},
      },
  },
  ['surplus_bas'] = {
      ['arms'] = {
          ['male'] = {}, --Specific sex blacklist
          ['female'] = {},
      },

      ['tshirt_1'] = {
          ['male'] = {56,124,125,126,127,128,129,131,152,153,154,155,156,159,160,161,162,164,170,171,122}, --Specific sex blacklist
          ['female'] = {},
      },

      ['torso_1'] = {
          ['male'] = {48,53,165,191,214,219,222,221,228,229,230,231,239,244,247,248,251,253,320,324,336,337}, --Specific sex blacklist
          ['female'] = {},
      },

      ['pants_1'] = {
          ['male'] = {23,30,41,98,121,124,125}, --Specific sex blacklist
          ['female'] = {},
      },
      ['chain_1'] = {
          ['male'] = {1,2,3,5,6,8,10}, --Specific sex blacklist
          ['female'] = {},
      },
      ['shoes_1'] = {
          ['male'] = {61,62,63,70,71,72}, --Specific sex blacklist
          ['female'] = {},
      },

      ['helmet_1'] = {
          ['male'] = {58,59,112,123,124,125,126}, --Specific sex blacklist
          ['female'] = {},
      },
  },
}


--- 459.90896606445,-999.18109130859,30.689565658569





--Where player can change his clothes at store or anywhere
Config.ChangePoint = {
    title = 'Changer de vêtements', -- menu title
    label = 'Vestiaire\n~r~[E]~w~', --3D text
    help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu changer de pièce',
    menualign = 'right',
    renderDistance = 5.0,
    size = 0.5,
    points = {
        vector3(429.75, -811.41, 29.49),
        vector3(71.19, -1387.76, 29.38),
        vector3(-819.66, -1067.17, 11.33),
        vector3(3.63, 6505.58, 31.88),
        vector3(1699.01, 4817.92, 42.06),
        vector3(1201.89, 2714.5, 38.22),
        vector3(-1100.45, 2717.04, 19.11),
        vector3(-703.51, -151.62, 37.42),
        vector3(-168.3, -299.38, 39.73),
        vector3(-1447.35, -242.73, 49.82),
        vector3(118.18, -232.61, 54.56),
        vector3(617.72, 2773.41, 42.09),
        vector3(-1182.54, -765.13, 17.33),
        vector3(-3178.37, 1035.77, 20.86),
  --      vector3(-571.05, -198.66, 42.76),
        vector3(365.2, 4819.63, -59),
        vector3(151.01, -768.22, 50.14),
        vector3(458.7282409668,-997.97521972656,29.689577102661), --PD
        vector3(108.77095794678,-1304.4407958984,28.79301071167)
    }
}
Config.Stores = {
    {
        position = vector3(422.86,-808.31,29.49),
        label = 'Binco - Vêtements',
        sprite = 73, -- to disable blip make this -1
        color = 1,
        sections = {
            boots = {
                pos = vector3(419.55,-802.77,29.49),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                        reset = {
                            'shoes_2'
                        },
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 354.66
                },
                size = 1.2, --Default 1
                renderDistance = 10.0,
            },
            hats = {
                pos = vector3(427.51,-798.89,29.49),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 174.66
                }
            },
            pants = {
                pos = vector3(430.58,-800.13,29.5),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Gilet',
                        name = 'bproof_1',
                        from = 1,
                        to = 300,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 86.66
                }
            },
            glasses = {
                pos = vector3(425.69,-808.11,29.49),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 100.66
                }
            },
            tshirt = {
                pos = vector3(425.41,-798.9,29.49),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'tshirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur du TShirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaîne',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur de la chaîne',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 180.66
                }
            }
        }
    },
    {
        position = vector3(77.77,-1391.3,29.38),
        label = 'Binco - Vêtements',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(81.21,-1396.5,29.38),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussure',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur des chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 354.66
                }
            },
            hats = {
                pos = vector3(73.44,-1400.25,29.38),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Hat',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur du chapeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 355.66
                }
            },
            pants = {
                pos = vector3(69.76,-1399.06,29.38),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Couleur du pantalon',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 275.66
                }
            },
            glasses = {
                pos = vector3(75.21,-1391.22,29.38),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur des verres',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 275.06
                }
            },
            tshirt = {
                pos = vector3(75.53,-1399.99,29.38),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur du TShirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaîne',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur de la chaîne',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 3.66
                }
            }
        }
    },
    {
        position = vector3(-715.03,-145.58,37.42),
        label = 'Ponsonbys - Vêtements',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(-715.03,-145.58,37.42),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussure',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur des chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 195.66
                }
            },
            pants = {
                pos = vector3(-712.93,-147.71,37.42),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Couleur du pantalon',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 130.66
                }
            },
            tshirt = {
                pos = vector3(-707.98,-161.21,37.42),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur du TShirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaîne',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur de la chaîne',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 23.66
                }
            }
        }
    },
    {
        position = vector3(-165.69,-311.55,39.73),
        label = 'Ponsonbys - Vêtements',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(-165.69,-311.55,39.73),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussure',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur des chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 331.66
                }
            },
            pants = {
                pos = vector3(-165.75,-308.54,39.73),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Couleur du pantalon',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 252.66
                }
            },
            tshirt = {
                pos = vector3(-158.68,-295.79,39.73),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur du TShirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaîne',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur de la chaîne',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 160.66
                }
            }
        }
    },
    {
        position = vector3(-822.42,-1080.5,11.33),
        label = 'Binco - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(-822.42,-1080.5,11.33),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 26.66
                }
            },
            hats = {
                pos = vector3(-829.79,-1075.68,11.33),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 299.66
                }
            },
            pants = {
                pos = vector3(-830.46,-1072.01,11.34),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 203.66
                }
            },
            glasses = {
                pos = vector3(-821.0,-1072.71,11.33),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 210.25
                }
            },
            tshirt = {
                pos = vector3(-828.63,-1077.37,11.33),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 298.66
                }
            }
        }
    },
    {
        position = vector3(-1444.74,-230.44,49.81),
        label = 'Ponsonbys - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(-1444.74,-230.44,49.81),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 122.66
                }
            },
            pants = {
                pos = vector3(-1446.13,-233.26,49.81),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 51.66
                }
            },
            tshirt = {
                pos = vector3(-1457.65,-242.21,49.81),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 317.66
                }
            }
        }
    },
    {
        position = vector3(3.3,6519.29,31.88),
        label = 'Binco - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(3.3,6519.29,31.88),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 224.66
                }
            },
            hats = {
                pos = vector3(11.62,6516.03,31.88),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 126.66
                }
            },
            pants = {
                pos = vector3(12.76,6512.48,31.89),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 47.66
                }
            },
            glasses = {
                pos = vector3(3.74,6511.35,31.88),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 58.99
                }
            },
            tshirt = {
                pos = vector3(9.95,6517.47,31.88),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 129.66
                }
            }
        }
    },
    {
        position = vector3(119.08,-222.55,54.56),
        label = 'Suburban - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(119.08,-222.55,54.56),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 244.66
                }
            },
            hats = {
                pos = vector3(121.87,-221.85,54.56),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 252.66
                }
            },
            pants = {
                pos = vector3(122.99,-229.27,54.56),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 341.66
                }
            },
            glasses = {
                pos = vector3(126.77,-221.2,54.56),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 37.99
                }
            },
            tshirt = {
                pos = vector3(121.91,-212.01,54.56),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 249.66
                }
            }
        }
    },
    {
        position = vector3(1687.45,4825.47,42.06),
        label = 'Binco - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(1687.45,4825.47,42.06),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 275.66
                }
            },
            hats = {
                pos = vector3(1694.85,4830.45,42.06),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 187.66
                }
            },
            pants = {
                pos = vector3(1698.32,4829.52,42.07),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 95.66
                }
            },
            glasses = {
                pos = vector3(1694.12,4820.95,42.06),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 127.99
                }
            },
            tshirt = {
                pos = vector3(1692.77,4829.9,42.06),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 183.66
                }
            }
        }
    },
    {
        position = vector3(620.66,2764.38,42.09),
        label = 'Suburban - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(620.66,2764.38,42.09),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 84.66
                }
            },
            hats = {
                pos = vector3(618.46,2762.72,42.09),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 105.66
                }
            },
            pants = {
                pos = vector3(614.29,2768.7,42.09),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 184.19
                }
            },
            glasses = {
                pos = vector3(614.52,2759.92,42.09),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 239.5
                }
            },
            tshirt = {
                pos = vector3(622.64,2753.04,42.09),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 95.66
                }
            }
        }
    },
    {
        position = vector3(1193.16,2704.16,38.22),
        label = 'Binco - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(1193.16,2704.16,38.22),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 0.66
                }
            },
            hats = {
                pos = vector3(1189.36,2712.21,38.22),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 271.66
                }
            },
            pants = {
                pos = vector3(1190.59,2715.4,38.23),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 174.66
                }
            },
            glasses = {
                pos = vector3(1198.08,2710.11,38.22),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 188.99
                }
            },
            tshirt = {
                pos = vector3(1189.42,2710.09,38.22),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 267.66
                }
            }
        }
    },
    {
        position = vector3(-1188.25,-772.88,17.33),
        label = 'Suburban - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(-1188.25,-772.88,17.33),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 34.66
                }
            },
            hats = {
                pos = vector3(-1190.88,-771.61,17.33),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 46.66
                }
            },
            pants = {
                pos = vector3(-1188.0,-764.68,17.32),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 127.19
                }
            },
            glasses = {
                pos = vector3(-1195.17,-769.83,17.32),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 191.5
                }
            },
            tshirt = {
                pos = vector3(-1196.72,-780.13,17.33),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 38.66
                }
            }
        }
    },
    {
        position = vector3(-3176.96,1045.31,20.86),
        label = 'Suburban - Clothes',
        sprite = 73,
        color = 59,

        sections = {
            boots = {
                pos = vector3(-3176.96,1045.31,20.86),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 242.66
                }
            },
            hats = {
                pos = vector3(-3174.22,1045.9,20.86),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,

                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 254.66
                }
            },
            pants = {
                pos = vector3(-3173.77,1038.34,20.86),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = Pantalon,
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 337.19
                }
            },
            glasses = {
                pos = vector3(-1369.34,1046.35,20.86),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 41.5
                }
            },
            tshirt = {
                pos = vector3(-3173.57,1056.11,20.86),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 245.66
                }
            }
        }
    },
    {
        position = vector3(-1100.05,2703.59,19.11),
        label = 'Binco - Clothes',
        sprite = 73,
        color = 59,
        sections = {
            boots = {
                pos = vector3(-1100.05,2703.59,19.11),
                label = '👞',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chaussures',
                        name = 'shoes_1',
                        from = 1,
                        to = 88,
                        current = 1,
                        price = 150,
                    },
                    {
                        label = 'Couleur chaussures',
                        name = 'shoes_2',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                    taskHeading = 42.66
                }
            },
            hats = {
                pos = vector3(-1108.31,2707.01,19.11),
                label = '👒 ',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 305.66
                }
            },
            pants = {
                pos = vector3(-1109.48,2710.53,19.12),
                label = '👖',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                    taskHeading = 225.66
                }
            },
            glasses = {
                pos = vector3(-1100.14,2711.7,19.11),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 224.99
                }
            },
            tshirt = {
                pos = vector3(-1106.73,2705.6,19.11),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 309.66
                }
            }
        }
    },
    {
        position = vector3(-1210.92,-1531.72,4.25),
        label = 'Vespuci - Glasses',
        sprite = 73,
        color = 15,
        sections = {
            glasses = {
                pos = vector3(-1210.92,-1531.72,4.25),
                label = '👓',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Lunettes',
                        name = 'glasses_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Lunettes',
                        name = 'glasses_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 100.66
                }
            },
        }
    },
    {
        position = vector3(-1164.99,-1586.59,4.38),
        label = 'Vespuci - Mask',
        sprite = 362,
        color = 60,
        sections = {
            glasses = {
                pos = vector3(-1164.99,-1586.59,4.38),
                label = '🙈',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Masque',
                        name = 'mask_1',
                        from = -1,
                        to = 160,
                        current = -1,
                        reset = {
                            'mask_2'
                        },
                        price = 50,
                        blacklist = {
                            26,27,
                        }
                    },
                    {
                        label = 'Couleur Masque',
                        name = 'mask_2',
                        from = 0,
                        to = 20,
                        current = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                    taskHeading = 100.66
                }
            },
        }
    },
    {
        position = vector3(-1226.68,-1445.17,4.28),
        label = 'Vespuci - Sac',
        sprite = 440,
        color = 60,
        sections = {
            bags = {
                pos = vector3(-1226.68,-1445.17,4.28),
                label = '🎒',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'Sac',
                        name = 'bags_1',
                        from = -1,
                        to = 160,
                        current = -1,
                        reset = {
                            'bags_2'
                        },
                        price = 120,
                    },
                    {
                        label = 'Couleur du Sac',
                        name = 'bags_2',
                        from = 0,
                        to = 20,
                        current = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 211.66
                }
            },


        }
    },
    {
        position = vector3(629.79870605469,-0.80142974853516,76.628074645996),
        label = 'LSPD Shop',
        sprite = 362,
        color = 60,
  --        society = 'society_goverment',
        sections = {
            tshirt_police = {
                job = {"police"},
                pos = vector3(623.01129150391,-6.749623298645,76.628044128418),
                label = '👕',
                help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu de la boutique',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Couleur Tshirt',
                        name = 'tshirt_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Torse 1',
                        name = 'torso_1',
                        from = 1,
                        to = 289,
                        current = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,

                    },
                    {
                        label = 'Torse 2',
                        name = 'torso_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Bras',
                        name = 'arms',
                        from = 1,
                        to = 20,
                        current = 1,
                        price = 0,
                    },
                    {
                        label = 'Chaines',
                        name = 'chain_1',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Couleur Chaines',
                        name = 'chain_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 50,
                    },
                    {
                        label = 'Pantalon',
                        name = 'pants_1',
                        from = 1,
                        to = 160,
                        current = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Pants color',
                        name = 'pants_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                    {
                        label = 'Sac',
                        name = 'bags_1',
                        from = -1,
                        to = 160,
                        current = -1,
                        reset = {
                            'bags_2'
                        },
                        price = 120,
                    },
                    {
                        label = 'Couleur du Sac',
                        name = 'bags_2',
                        from = 0,
                        to = 20,
                        current = 0,
                        price = 10,
                    },
                    {
                        label = 'Chappeau',
                        name = 'helmet_1',
                        from = -1,
                        to = 160,
                        current = 1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Couleur Chappeau',
                        name = 'helmet_2',
                        from = 0,
                        to = 20,
                        current = 1,
                        price = 10,
                    },
                },

                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                    taskHeading = 309.66
                }
            }

          },
      },



      {
          position = vector3(-325.97836303711,6083.3090820313,31.454765319824),
          label = 'Surplus Nord',
          sprite = 73,
          color = 52,
    --        society = 'society_goverment',
          sections = {
              surplus_haut = {
          --        job = {"police"},
                  pos = vector3(-325.97836303711,6083.3090820313,31.454765319824),
                  label = '👕',
                  help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu du surplus',
                  components = {
                      {
                          label = 'TShirt',
                          name = 'tshirt_1',
                          from = 1,
                          to = 160,
                          current = 1,
                          reset = {
                              'tshirt_2'
                          },
                          price = 150,
                      },
                      {
                          label = 'Couleur Tshirt',
                          name = 'tshirt_2',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 50,
                      },
                      {
                          label = 'Torse 1',
                          name = 'torso_1',
                          from = 1,
                          to = 289,
                          current = 1,
                          reset = {
                              'torso_2'
                          },
                          price = 300,

                      },
                      {
                          label = 'Torse 2',
                          name = 'torso_2',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 50,
                      },
                      {
                          label = 'Bras',
                          name = 'arms',
                          from = 1,
                          to = 20,
                          current = 1,
                          price = 0,
                      },
                      {
                          label = 'Chaines',
                          name = 'chain_1',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 50,
                      },
                      {
                          label = 'Couleur Chaines',
                          name = 'chain_2',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 50,
                      },
                      {
                          label = 'Sac',
                          name = 'bags_1',
                          from = -1,
                          to = 160,
                          current = -1,
                          reset = {
                              'bags_2'
                          },
                          price = 120,
                      },
                      {
                          label = 'Couleur du Sac',
                          name = 'bags_2',
                          from = 0,
                          to = 20,
                          current = 0,
                          price = 10,
                      },
                      {
                          label = 'Chappeau',
                          name = 'helmet_1',
                          from = -1,
                          to = 160,
                          current = 1,
                          reset = {
                              'helmet_2'
                          },
                          price = 50,
                      },
                      {
                          label = 'Couleur Chappeau',
                          name = 'helmet_2',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 10,
                      },
                  },

                  cam = {
                      offset = {
                          x = 0.0,
                          y = 1.0,
                          z = 0.5
                      },
                      pointOffset = {
                          x = 0,
                          y = 0,
                          z = 0.4
                      },
                      taskHeading = 145.66
                  }
              },
              surplus_bas = {
          --        job = {"police"},
                  pos = vector3(-324.3740234375,6081.7045898438,31.454765319824),
                  label = '👖',
                  help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu du surplus',
                  components = {

                      {
                          label = 'Chaines',
                          name = 'chain_1',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 50,
                      },
                      {
                          label = 'Couleur Chaines',
                          name = 'chain_2',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 50,
                      },
                      {
                          label = 'Pantalon',
                          name = 'pants_1',
                          from = 1,
                          to = 160,
                          current = 1,
                          reset = {
                              'pants_2'
                          },
                          price = 50,
                      },
                      {
                          label = 'Pants color',
                          name = 'pants_2',
                          from = 0,
                          to = 20,
                          current = 1,
                          price = 10,
                      },
                      {
                          label = 'Chaussures',
                          name = 'shoes_1',
                          from = 1,
                          to = 88,
                          current = 1,
                          price = 150,
                      },
                      {
                          label = 'Couleur chaussures',
                          name = 'shoes_2',
                          from = 1,
                          to = 20,
                          current = 1,
                          price = 50,
                      }
                  },

                  cam = {
                      offset = {
                          x = 0.0,
                          y = 1.0,
                          z = -0.5
                      },
                      pointOffset = {
                          x = 0,
                          y = 0,
                          z = -0.5
                      },
                      taskHeading = 145.66
                  }
              }

            },
        },

        {
            position = vector3(839.65338134766,-1029.0572509766,28.194854736328),
            label = 'Surplus Sud',
            sprite = 73,
            color = 52,
      --        society = 'society_goverment',
            sections = {
                surplus_haut = {
            --        job = {"police"},
                    pos = vector3(839.56097412109,-1029.6513671875,28.194854736328),
                    label = '👕',
                    help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu du surplus',
                    components = {
                        {
                            label = 'TShirt',
                            name = 'tshirt_1',
                            from = 1,
                            to = 160,
                            current = 1,
                            reset = {
                                'tshirt_2'
                            },
                            price = 150,
                        },
                        {
                            label = 'Couleur Tshirt',
                            name = 'tshirt_2',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 50,
                        },
                        {
                            label = 'Torse 1',
                            name = 'torso_1',
                            from = 1,
                            to = 289,
                            current = 1,
                            reset = {
                                'torso_2'
                            },
                            price = 300,

                        },
                        {
                            label = 'Torse 2',
                            name = 'torso_2',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 50,
                        },
                        {
                            label = 'Bras',
                            name = 'arms',
                            from = 1,
                            to = 20,
                            current = 1,
                            price = 0,
                        },
                        {
                            label = 'Chaines',
                            name = 'chain_1',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 50,
                        },
                        {
                            label = 'Couleur Chaines',
                            name = 'chain_2',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 50,
                        },
                        {
                            label = 'Sac',
                            name = 'bags_1',
                            from = -1,
                            to = 160,
                            current = -1,
                            reset = {
                                'bags_2'
                            },
                            price = 120,
                        },
                        {
                            label = 'Couleur du Sac',
                            name = 'bags_2',
                            from = 0,
                            to = 20,
                            current = 0,
                            price = 10,
                        },
                        {
                            label = 'Chappeau',
                            name = 'helmet_1',
                            from = -1,
                            to = 160,
                            current = 1,
                            reset = {
                                'helmet_2'
                            },
                            price = 50,
                        },
                        {
                            label = 'Couleur Chappeau',
                            name = 'helmet_2',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 10,
                        },
                    },

                    cam = {
                        offset = {
                            x = 0.0,
                            y = 1.0,
                            z = 0.5
                        },
                        pointOffset = {
                            x = 0,
                            y = 0,
                            z = 0.4
                        },
                        taskHeading = 280.66
                    }
                },
                surplus_bas = {
            --        job = {"police"},
                    pos = vector3(839.59228515625,-1027.7828369141,28.194854736328),
                    label = '👖',
                    help = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu du surplus',
                    components = {

                        {
                            label = 'Chaines',
                            name = 'chain_1',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 50,
                        },
                        {
                            label = 'Couleur Chaines',
                            name = 'chain_2',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 50,
                        },
                        {
                            label = 'Pantalon',
                            name = 'pants_1',
                            from = 1,
                            to = 160,
                            current = 1,
                            reset = {
                                'pants_2'
                            },
                            price = 50,
                        },
                        {
                            label = 'Pants color',
                            name = 'pants_2',
                            from = 0,
                            to = 20,
                            current = 1,
                            price = 10,
                        },
                        {
                            label = 'Chaussures',
                            name = 'shoes_1',
                            from = 1,
                            to = 88,
                            current = 1,
                            price = 150,
                        },
                        {
                            label = 'Couleur chaussures',
                            name = 'shoes_2',
                            from = 1,
                            to = 20,
                            current = 1,
                            price = 50,
                        }
                    },

                    cam = {
                        offset = {
                            x = 0.0,
                            y = 1.0,
                            z = -0.5
                        },
                        pointOffset = {
                            x = 0,
                            y = 0,
                            z = -0.5
                        },
                        taskHeading = 280.66
                    }
                }

              },
          },


}
