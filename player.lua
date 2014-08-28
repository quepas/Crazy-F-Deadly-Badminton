local player = {}
player.__index = player

function newPlayer(x, y)
  local new = {}
  new.x = x
  new.y = y
  new.img = love.graphics.newImage("img/The man.png")

  return setmetatable(new, player)
end

function player:moveBy(x, y)
  self.x = self.x + x
  self.y = self.y + y
end

function player:moveTo(x, y)
  self.x = x
  self.y = y
end

function player:update(dt)
end

function player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

