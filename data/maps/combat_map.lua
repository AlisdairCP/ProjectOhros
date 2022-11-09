-- Lua script of map combat_map.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
local npc
local enemy1
local enemy2
local enemy3
local enemy4
local enemy5
local npc_created = false
local count = 0
local exit

function enter_kislev:on_activated()
  if npc_created == false then
    npc = map:create_npc({name = "kislev", layer = 0, x = 232, y = 120, direction = 3, subtype = 0, sprite="animals/kislev"})
    game:start_dialog("lila.meet_kislev")
    sol.audio.play_music("battle")
    enemy1 = map:create_enemy({name = "enemy1", layer = 0, x = 24, y = 80, direction = 0, breed = "robot", treasure_name = "spell"})
    enemy2 = map:create_enemy({name = "enemy2", layer = 0, x = 168, y = 56, direction = 3, breed = "robot", treasure_name = "spell"})
    enemy3 = map:create_enemy({name = "enemy3", layer = 0, x = 296, y = 80, direction = 2, breed = "robot", treasure_name = "spell"})
    enemy4 = map:create_enemy({name = "enemy4", layer = 0, x = 88, y = 168, direction = 3, breed = "agent", treasure_name = "heart"})
    enemy5 = map:create_enemy({name = "enemy5", layer = 0, x = 238, y = 168, direction = 3, breed = "agent", treasure_name = "heart"})
    npc_created = true
  end
  local movement = sol.movement.create("path_finding")
  movement:set_target(spot)
  movement:start(npc)
  function npc:on_movement_changed(movement)
    local direction4 = movement:get_direction4()
    if direction4 then
      for _, s in npc:get_sprites() do
        s:set_direction(direction4)
      end
    end
  end

  function enemy1:on_dead()
    count = count + 1
  end

  function enemy2:on_dead()
    count = count + 1
  end

  function enemy3:on_dead()
    count = count + 1
  end

  function enemy4:on_dead()
    count = count + 1
  end

  function enemy5:on_dead()
    count = count + 1
  end

  function npc:on_interaction()
    sol.audio.play_sound("cat")
    if count > 4 then
      exit = map:create_teletransporter({name = "exit", layer = 0, x = 160, y = 8, width = 320, height = 16, destination_map = "ending"})
      sol.audio.play_music("ending")
      game:start_dialog("lila.way_out")
      local endtrack = sol.movement.create("target")
      endtrack:set_target(exit)
      endtrack:start(npc)
      function exit:on_activated()
        game:start_dialog("lila.ending_text")
      end
    end
  end
end

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  -- You can initialize the movement and sprites of various
  -- map entities here.
  hero:set_tunic_sprite_id("hero/lila") 
  hero:set_walking_speed(132)
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
