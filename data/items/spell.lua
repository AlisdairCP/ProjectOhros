-- Lua script of item spell.
-- This script is executed only once for the whole game.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local item = ...
local game = item:get_game()

function item:on_created()
  
  self:set_savegame_variable("possession_spell")
  self:set_amount_savegame_variable("spell_charge")
  self:set_amount(0)
  self:set_assignable(true)
end

function item:on_obtaining()

  game:set_item_assigned(1, self)
  self:set_amount(self:get_amount() + 3) 
  
end


function item:on_using()

    if self:get_amount() > 0 then
      local map = game:get_map()
      local hero = game:get_hero()
      self:remove_amount(1)
      hero:start_bow()
    end
  item:set_finished()
end