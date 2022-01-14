function love.load()

  dist = 100     --just some constants for kinematics
  grav = 15

  time = {}
    time.start = 0
    time.init = love.timer.getTime()

  initBallY = 450

  ball = {}
    ball.rad = 20
    ball.coordX = 250
    --ball.coordYStart = initBallY - ball.rad
    --ball.coordYCurrent = 0
    ball.coordY = 250

  veloc = {}
    veloc.init = 50
    --veloc.final = 0
    veloc.current = 0

  ground = {}
    ground.y = 450

end

function love.update(dt)
  veloc.current = veloc.current + grav
  ball.coordY = ball.coordY + (veloc.current * dt)

  if ball.coordY > (ground.y - 1) - ball.rad then
    veloc.current = veloc.current * -1
  end
end


function love.draw()
--[[
  if ball.coordYCurrent > 0 then
    veloc.current = veloc.init + (grav * time.start) --calculating velocity at a certain time
  else
    veloc.current = (veloc.current * -1) -- veloc.current * 0.03
    --print("collision")
  end
]]--
  --time.start = love.timer.getTime() - time.init
  --ball.coordYCurrent = (veloc.init * time.start) + 0.5 * grav * (time.start)^2 -- calculating current position using velocity inital
  --print(ball.coordYCurrent)
  --ball.coordYCurrent = (veloc.current + veloc.init)/2 * time.start
  print(veloc.current)

  love.graphics.setLineWidth(2)
  love.graphics.circle("line", ball.coordX, ball.coordY, ball.rad) --change this to relate it to mass
  love.graphics.setLineWidth(2)
  love.graphics.line(0, ground.y, 500, ground.y)

end

function love.keypressed(key) --taken from hello-world--from ben :)
  if key == "escape" then
    love.event.quit(0)
  end
end
