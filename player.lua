local player = {}
player.__index = player

local START_ANGLE = -45
local END_ANGLE = 30
local DIFF_ANGLE = 4.2

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
  new.racquet_x = new.x + 100
  new.racquet_y = new.y + 45
  new.racquet_img = love.graphics.newImage("img/Racquet.png")
  new.racquet_img_x = new.racquet_img:getWidth()
  new.racquet_img_y = new.racquet_img:getHeight()
  new.racquet_body = love.physics.newBody(world, new.racquet_x, new.racquet_y, 'dynamic')
  new.racquet_shape = love.physics.newCircleShape(30)
  new.racquet_fixture = love.physics.newFixture(new.racquet_body, new.racquet_shape, 1)
  new.has_racquet = false
  new.has_swiping = false
  new.actual_angle = START_ANGLE

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

function player:getX()
  return self.x
end

function player:getY()
  return self.y
end

function player:setRacquet(img)
  self.racquet = love.graphics.newImage(img)
  self.has_racquet = true
end

function player:swipe()
  if not self.has_swiping then
    self.has_swiping = true
  end
end

function player:update(dt)
  self:moveTo(self.body:getX()-self.img_x/2, self.body:getY()-self.img_y/2)
  if self.has_swiping then
    self.actual_angle = self.actual_angle + DIFF_ANGLE
    if self.actual_angle > END_ANGLE then
      self.has_swiping = false
      self.actual_angle = START_ANGLE
    end
  end
end

function player:draw()
  love.graphics.draw(self.img, self.x, self.y)
  if self.has_racquet then
    love.graphics.draw(self.racquet, self.x + 100, self.y + 45, math.rad(self.actual_angle), 1, 1, self.racquet:getWidth()/2,  self.racquet:getHeight())
  end
end