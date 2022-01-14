function love.load()

  dist = 100     --just some constants for kinematics
  grav = -19.81
  mass = 20
  forceGrav = mass * grav

  time = {}
    time.start = 0
    time.init = love.timer.getTime()

  initBallY = 450

  ball = {}
    ball.w = 20
    ball.h = 20
    ball.coordX = 250
    ball.coordYStart = initBallY - ball.h
    ball.coordYCurrent = 0

  veloc = {}
    veloc.init = 50
    --veloc.final = 0
    veloc.current = 0

  ground = {}
    ground.y = 450

end

function love.update(dt)
  --print(time.start)

end


function love.draw()
  if ball.coordYCurrent > 0 then
    veloc.current = veloc.init + (grav * time.start) --calculating velocity at a certain time
  else
    veloc.current = (veloc.current * -1) -- veloc.current * 0.03
    --print("collision")
  end

  time.start = love.timer.getTime() - time.init
  --ball.coordYCurrent = (veloc.init * time.start) + 0.5 * grav * (time.start)^2 -- calculating current position using velocity inital
  --print(ball.coordYCurrent)
  ball.coordYCurrent = (veloc.current + veloc.init)/2 * time.start
  print(veloc.current)

  love.graphics.setLineWidth(2)
  love.graphics.ellipse("line", ball.coordX, ball.coordYStart - ball.coordYCurrent, ball.w, ball.h) --change this to relate it to mass
  love.graphics.setLineWidth(2)
  love.graphics.line(0, ground.y, 500, ground.y)

end

function love.keypressed(key) --taken from hello-world--from ben :)
  if key == "escape" then
    love.event.quit(0)
  end
end
