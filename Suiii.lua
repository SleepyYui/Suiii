--[[
Name: ["Suiii"]
Version: [0.1.0]
Author: ["SleepyYui"]
--]]


-- Close Game

function closegame()
    os.exit()
end

-- Ragdoll Self

function ragdollSelf()
    player = self.get_ped()
	rage.ped.set_ped_to_ragdoll(player, 5000, 3000, 0, true, true, true)
	-- rage.entity.apply_force_to_entity(player, 1, 1, 1, 1, 0, 0, 0, 0, false, true, true, false, true)
end

-- Ragdoll Player


-- Ragdoll All




-- No Collision

function disableCollision()
    if menu.is_option_toggled("disableCollision") and player.is_in_vehicle() then
        -- system.log_info("Nanomachines, son.")
        vCurrentVehicle = player.get_vehicle()
        ventNearbyEntities = scripting.entity.get_nearby_entities()
        vpedNearbyPeds = scripting.ped.get_nearby_peds()
        vVehNearbyVehicles = scripting.vehicle.get_nearby_vehicles()
        for i, entity in pairs(ventNearbyEntities) do
            rage.entity.set_entity_no_collision_entity(vCurrentVehicle, entity, true)
            rage.entity.set_entity_no_collision_entity(entity, vCurrentVehicle, true)
        end
        for i, ped in pairs(vpedNearbyPeds) do
            rage.entity.set_entity_no_collision_entity(vCurrentVehicle, ped, true)
            rage.entity.set_entity_no_collision_entity(ped, vCurrentVehicle, true)
        end
        for i, vehicle in pairs(vVehNearbyVehicles) do
            rage.entity.set_entity_no_collision_entity(vCurrentVehicle, vehicle, true)
            rage.entity.set_entity_no_collision_entity(vehicle, vCurrentVehicle, true)
        end
    end
end

-- Deletion Drive

function deletionDrive()
    if menu.is_option_toggled("deletionDrive") and player.is_in_vehicle() then
        -- system.log_info("Nanomachines, son.")
        NearbyEntities = scripting.entity.get_nearby_entities()
        NearbyPeds = scripting.ped.get_nearby_peds()
        NearbyVehicles = scripting.vehicle.get_nearby_vehicles()
        for i, entity in pairs(NearbyEntities) do
            -- system.log_info(entity)
            rage.entity.delete_entity(entity)
        end
        for i, ped in pairs(NearbyPeds) do
            rage.entity.delete_entity(ped)
        end
        for i, vehicle in pairs(NearbyVehicles) do
            rage.entity.delete_entity(vehicle)
        end
    end
end



-- INITALIZING INTO DIS2RBED

suiii_tab = menu.add_parent("Suiii")
menu.add_delimiter("Made with distress", suiii_tab)


---------------------------------------------------------------------------
self_tab = menu.add_child("Self", suiii_tab)
vehicle_tab = menu.add_child("Vehicles", suiii_tab)
player_tab = menu.add_child("Players", suiii_tab)
enemyai_tab = menu.add_child("Enemy AI", suiii_tab)
misc_tab = menu.add_child("Misc", suiii_tab)
stupid_tab = menu.add_child("Stupid", suiii_tab)
close_tab = menu.add_child("Close", suiii_tab)
---------------------------------------------------------------------------


-- Adding Self Options



-- Adding Vehicle Options

system.add_task("Disable Collision Loop", "disableCollisionLoop", -1, disableCollision)
menu.add_option_toggle("Disable Vehicle Collision", "disableCollision", vehicle_tab, disableCollision)

system.add_task("Deletion Drive Loop", "deletionDriveLoop", -1, deletionDrive)
menu.add_option_toggle("Deletion Drive", "deletionDrive", vehicle_tab, deletionDrive)

-- Adding Player Options



-- Adding AI Options



-- Adding Misc Options



-- Adding Stupid Options

menu.add_option("Ragdoll Self", "ragdollSelf", stupid_tab, ragdollSelf)



-- Close Tab

menu.add_option("Close GTA V", "closeGTA", close_tab, closegame)


-- Update Root Parent

menu.update_root_parent(true)

notify.lua("Suiiiiiiiiiiiiiiii")