require('player')

PX_IN_M = 50
PLAYER_FORCE = 2222
function love.load()
	love.window.setMode(800, 600, {vsync=true, centered=true})
	love.graphics.setBackgroundColor(120,162,189)
	pitch = love.graphics.newImage('img/Pitch.png')
	racquet = love.graphics.newImage('img/Racquet.png')
	love.physics.setMeter(PX_IN_M)
	world = love.physics.newWorld(0, 9.81*PX_IN_M, true)
	the_man = newPlayer(135, 390, world)
	objects = {}

	objects.ground = {}
	objects.ground.body = love.physics.newBody(world, 400, 500)
	objects.ground.shape = love.physics.newRectangleShape(800, 10)
	objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)

	objects.boundry_left = {}
	objects.boundry_left.body = love.physics.newBody(world, -1, 300)
	objects.boundry_left.shape = love.physics.newRectangleShape(2, 600)
	objects.boundry_left.fixture = love.physics.newFixture(objects.boundry_left.body, objects.boundry_left.shape)

	objects.boundry_right = {}
	objects.boundry_right.body = love.physics.newBody(world, 801, 300)
	objects.boundry_right.shape = love.physics.newRectangleShape(2, 600)
	objects.boundry_right.fixture = love.physics.newFixture(objects.boundry_right.body, objects.boundry_right.shape)

	objects.boundry_top = {}
	objects.boundry_top.body = love.physics.newBody(world, 400, -1)
	objects.boundry_top.shape = love.physics.newRectangleShape(800, 2)
	objects.boundry_top.fixture = love.physics.newFixture(objects.boundry_top.body, objects.boundry_top.shape)

	objects.ball = {}
	objects.ball.body = love.physics.newBody(world, 400, 400, 'dynamic')
	objects.ball.shape = love.physics.newCircleShape(8)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)
	objects.ball.fixture:setRestitution(0.9)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	world:update(dt)

	if love.keyboard.isDown('left') then
		the_man:move('left',PLAYER_FORCE)
	end
	if love.keyboard.isDown('right') then
		the_man:move('right',PLAYER_FORCE)
	end
	if love.keyboard.isDown('d') then
		objects.ball.body:applyForce(40, 0)
	elseif love.keyboard.isDown('a') then
		objects.ball.body:applyForce(-40, 0)
	end
	the_man:update(dt)
end

function love.draw()
	love.graphics.draw(pitch, 0, 0)
	the_man:draw()

	love.graphics.setColor(193, 255, 14)
	love.graphics.circle('fill', objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
	love.graphics.setColor(255, 255, 255)
end

