-- Lua script of map combat_map.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function enter_kislev:on_activated()
  local npc = map:create_npc({name = "kislev", layer = 0, x = 232, y = 120, direction = 3, subtype = 0, sprite="animals/kislev"})
  game:start_dialog("lila.meet_kislev")
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
  enter_kislev:remove()
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
