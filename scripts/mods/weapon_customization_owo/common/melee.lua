local mod = get_mod("weapon_customization_owo")

-- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

-- #############################
-- Slot Additions
-- #############################
-- HEAD
if mod.syn then
	mod.mt.table_append(mod.wc.head2s, {
		"owo_tacax_spike_helper_empty",
		"owo_tacax_spike_helper_01",
	})
else 
	mod.wc.add_custom_attachments.head2 = "head2s"
	mod.wc.head2s = {
		"owo_tacax_spike_helper_empty",
		"owo_tacax_spike_helper_01",
	}
end
-- POMMEL
mod.wc.add_custom_attachments.pommelac1 = "pommelac1_list"
mod.wc.pommelac1_list = {
	"owo_shovel_handles_ac1_empty",
    "owo_shovel_handles_ac1_01",
    "owo_shovel_handles_ac1_02",
    "owo_shovel_handles_ac1_03",
    "owo_shovel_handles_ac1_04",
    "owo_shovel_handles_ac1_05",
}
mod.wc.add_custom_attachments.pommelac2 = "pommelac2_list"
mod.wc.pommelac2_list = {
	"owo_shovel_handles_ac2_empty",
    "owo_shovel_handles_ac2_01",
    "owo_shovel_handles_ac2_02",
}

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Head: Tacax Spike (Spiked Tactical Axe)
function mod.owo_tacax_spike(variant_id, type)
	mod.inject_attachments_owo(variant_id, "head" or type, {
		{id = "owo_tacax_spike_01", name = "OwO Spiked Tactical Axe 1"},
	})
    mod.inject_attachments_owo(variant_id, "head2" or type, {
        {id = "owo_tacax_spike_helper_empty", name = "OwO Empty Head2"},
		{id = "owo_tacax_spike_helper_01", name = "OwO Tacax'vesa 1"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_tacax_spike_01 = {
			model = _item_melee.."/heads/hatchet_head_01", type = "head", 
			mesh_move = false, parent = "grip",
			automatic_equip = {
				head2 = "owo_tacax_spike_helper_01",
			},
		},
		-- ### Helper Parts ###
		owo_tacax_spike_helper_01 = {
			model = _item_melee.."/heads/axe_head_03", type = "head2", 
			mesh_move = false, parent = "head",
		},
		-- ### Empty ###
		owo_tacax_spike_helper_empty = {
			model = "", type = "head2", 
			mesh_move = false, parent = "head"
		},
	})
end

-- Head: Shovel Handles
--  D-Handle mostly
--  ~~~~~~~~ Serrated Shovel ~~~~~~~~ this is literally already in the game dumb bitch
--  ~~~~~~~~ Sheathed Shovel ~~~~~~~~ the straps are too big and the actual bag is too small. straps are part of the bag mesh
function mod.owo_shovel_handles(variant_id, type)
	mod.inject_attachments_owo(variant_id, "pommel" or type, {
		{id = "owo_shovel_handles_01", name = "OwO E-Tool D-Handle (Malnourished)"},
        {id = "owo_shovel_handles_02", name = "OwO E-Tool D-Handle 1"},
        {id = "owo_shovel_handles_03", name = "OwO E-Tool D-Handle 2"},
        {id = "owo_shovel_handles_04", name = "OwO E-Tool D-Handle 2 (1)"},
        {id = "owo_shovel_handles_05", name = "OwO E-Tool D-Handle 2 (1f)"},
        {id = "owo_shovel_handles_06", name = "OwO E-Tool D-Handle 3"},
        {id = "owo_shovel_handles_07", name = "OwO E-Tool D-Handle 4"},
        {id = "owo_shovel_handles_08", name = "OwO E-Tool D-Handle 5"},
	})
    mod.inject_attachments_owo(variant_id, "pommelac1" or type, {
		{id = "owo_shovel_handles_ac1_empty", name = "OwO Empty Pommelac1"},
        {id = "owo_shovel_handles_ac1_01", name = "OwO E-Tool'vesa'ac1 1"},
        {id = "owo_shovel_handles_ac1_02", name = "OwO E-Tool'vesa'ac1 2"},
        {id = "owo_shovel_handles_ac1_03", name = "OwO E-Tool'vesa'ac1 3"},
        {id = "owo_shovel_handles_ac1_04", name = "OwO E-Tool'vesa'ac1 4"},
        {id = "owo_shovel_handles_ac1_05", name = "OwO E-Tool'vesa'ac1 5"},
	})
    mod.inject_attachments_owo(variant_id, "pommelac2" or type, {
		{id = "owo_shovel_handles_ac2_empty", name = "OwO Empty Pommelac1"},
        {id = "owo_shovel_handles_ac2_01", name = "OwO E-Tool'vesa'ac2 1"},
        {id = "owo_shovel_handles_ac2_02", name = "OwO E-Tool'vesa'ac2 2"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
        --  Fucked up single /\ D-handle
        owo_shovel_handles_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "pommel", 
			mesh_move = false, parent = "grip",
		},
        --  Proper /\ D-handle
        owo_shovel_handles_02 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "pommel", 
			mesh_move = false, parent = "pommel",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_01", 
                pommelac2 = "owo_shovel_handles_ac2_01", 
			},
		},
        --  simple D-handle
        owo_shovel_handles_03 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_02", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        owo_shovel_handles_04 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        owo_shovel_handles_05 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        --  single D-handle, chainsword
        owo_shovel_handles_06 = {
			model = _item_melee.."/grips/chain_sword_grip_01", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_03", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
        owo_shovel_handles_07 = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_04", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
        owo_shovel_handles_08 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_05", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
        -- ### Helper Parts ###
        owo_shovel_handles_ac1_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac1_02 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac1_03 = {
			model = _item_melee.."/grips/chain_sword_grip_01", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac1_04 = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac1_05 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac2_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "pommelac2", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac2_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "pommelac2", 
			mesh_move = false, parent = "pommel",
		},
        -- ### Empty Parts ###
        owo_shovel_handles_ac1_empty = {
			model = "", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac2_empty = {
			model = "", type = "pommelac2", 
			mesh_move = false, parent = "grip",
		},
	})
end