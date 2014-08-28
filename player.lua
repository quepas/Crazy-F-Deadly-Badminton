local player = {}
player.__index = player

function newPlayer(x, y, world)
  local new = {}
  new.x = x
  new.y = y
  new.img = love.graphics.newImage("img/The man.png")
  new.img_x = new.img:getWidth()
  new.img_y = new.img:getHeight()
  new.body = love.physics.newBody(world, x + new.img_x/2, y + new.img_y/2, 'dynamic')
  new.shape = love.physics.newRectangleShape(new.img_x, new.img_y)
  new.fixture = love.physics.newFixture(new.body, new.shape, 1)

  return setmetatable(new, player)
end

function player:move(direction, force)
  if direction == 'left' then
    self.body:applyForce(-force, 0)
  end
  if direction == 'right' then
    self.body:applyForce(force, 0)
  end
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
  self:moveTo(self.body:getX()-self.img_x/2, self.body:getY()-self.img_y/2)
end

function player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

