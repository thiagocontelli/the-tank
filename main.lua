import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import 'player'

local pd <const> = playdate
local gfx <const> = pd.graphics

Player(200, 210)

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end