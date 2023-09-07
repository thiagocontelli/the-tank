local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new('images/tank')
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()

    self.speed = 1
    self.angle = 0
end

function Player:update()
    self:handleMovementChange()
    self:handleAngleChange()
end

function Player:handleMovementChange()
    if pd.buttonIsPressed(pd.kButtonUp) then
        self:moveBy(0, -self.speed)
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        self:moveBy(0, self.speed)
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-self.speed, 0)
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(self.speed, 0)
    end
end

function Player:handleAngleChange()
    local change = pd.getCrankChange()

    if change ~= 0 then
        self.angle += change
        self.angle = normalizeAngle(self.angle)
    end

    self:setRotation(self.angle)
end

function normalizeAngle(angle)
    if angle >= 360 then angle = angle - 360 end
    if angle < 0 then angle = angle + 360 end
    return angle
end
