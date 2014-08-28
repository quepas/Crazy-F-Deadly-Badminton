require('player')

function love.load()
	love.window.setMode(800, 600, {vsync=true, centered=true})
	love.graphics.setBackgroundColor(120,162,189)
	pitch = love.graphics.newImage('img/Pitch.png')
	racquet = love.graphics.newImage('img/Racquet.png')
	the_man = newPlayer(135, 390)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	if love.keyboard.isDown('left') then
		the_man:moveBy(-5, 0)
	end
	if love.keyboard.isDown('right') then
		the_man:moveBy(5, 0)
	end
end

function love.draw()
	love.graphics.draw(pitch, 0, 0)
	the_man:draw()
end

