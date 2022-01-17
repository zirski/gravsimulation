function love.load()
  dist = 100     --just some constants for kinematics
  grav = 25
  initBallY = 450
  frictCoef = 0.7 -- friction coefficient (to decay ball height each bounce)
  shouldUpdate = true

  time = {}
    time.start = 0
    time.init = love.timer.getTime()

  ball = {}
    ball.rad = 20
    ball.coordX = 250
    ball.coordY = 250

  ground = {}
    ground.y = 450

  veloc = 0
  distInit = (ball.coordY - ground.y) --simplified form of kinematic #4, solved for distance
  print(distInit)
  prevPos = ball.coordY
  prevVeloc = veloc

end

function love.update(dt)

  if shouldUpdate then --adds pause functionality
    veloc = veloc + grav
    ball.coordY = ball.coordY + (veloc * dt)
    print(veloc)

    if ball.coordY > ground.y - ball.rad then
      veloc = veloc * (-1 * frictCoef)
      ball.coordY = ground.y - ball.rad - 1
    end

    bounceDist = 0

    if ((veloc <= veloc * -1) ~= (prevVeloc <= prevVeloc * -1)) then
      bounceDist = prevPos - ball.coordY
      prevPos = ball.coordY
      --print(currentPos)

      --print("switch")
      --print(bounceDist)
    end

    if (bounceDist > 0.1) and (math.abs(bounceDist) < 0.5) then -- stops ball if it starts oscillating
      shouldUpdate = not shouldUpdate
    end

    --print(shouldUpdate)

    prevVeloc = veloc
  end --end of love.update functionality
end

function love.draw()
  love.graphics.setLineWidth(2)
  love.graphics.circle("line", ball.coordX, ball.coordY, ball.rad)

  love.graphics.setLineWidth(2)
  love.graphics.line(0, ground.y, 500, ground.y)

  love.graphics.setLineWidth(1)
  love.graphics.line(0, ball.coordY, 500, ball.coordY)

end

function love.keypressed(key) --taken from hello-world--from ben :)
  if key == "escape" then
    love.event.quit(0)
  end

  if key == "space" then
    shouldUpdate = not shouldUpdate
  end
end
