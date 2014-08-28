
function love.load()
	love.window.setMode(800, 600, {vsync=true, centered=true})
	love.graphics.setBackgroundColor(120,162,189)
	pitch = love.graphics.newImage('img/Pitch.png')
	racquet = love.graphics.newImage('img/Racquet.png')
	the_man = love.graphics.newImage('img/The man.png')
	x = 135
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	if love.keyboard.isDown('left') then
		x = x - 5
	end
	if love.keyboard.isDown('right') then
		x = x + 5
	end
end

function love.draw()
	love.graphics.draw(pitch, 0, 0)
	love.graphics.draw(the_man, x, 390)


end

