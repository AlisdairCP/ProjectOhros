-- Lua script of map corridor_map.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()


function chase_start:on_activated()
  game:start_dialog("lila.scared")
  sol.audio.play_music("chase")
  hero:set_walking_speed(198)
  chase_start:remove()
end

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  -- You can initialize the movement and sprites of various
  -- map entities here.
  hero:set_tunic_sprite_id("hero/lila") 
  hero:set_walking_speed(132)
  local movement = sol.movement.create("target")
  movement:start(kislev_oval)
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
