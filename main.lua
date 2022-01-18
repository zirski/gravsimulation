function love.load()
  love.keyboard.setKeyRepeat(true)

  dist = 100     --just some constants for kinematics
  grav = 25
  initBallY = 450
  frictCoef = 0.7 -- friction coefficient (to decay ball height each bounce)
  shouldUpdate = true
  bounceForce = 500

  time = {}
    time.start = 0
    time.init = love.timer.getTime()

  ball = {}
    ball.rad = 20
    ball.coordX = 250
    ball.coordY = 250

  ground = {}
    ground.y = 450

  veloc = {}
    veloc.y = 0
    veloc.x = 0

  distInit = (ball.coordY - ground.y) --simplified form of kinematic #4, solved for distance
  print(distInit)
  prevPos = ball.coordY
  prevVeloc = veloc.y

end

function love.update(dt)

  if shouldUpdate then --adds pause functionality
    veloc.y = veloc.y + grav
    ball.coordY = ball.coordY + (veloc.y * dt)
    --print(veloc.y)

    if ball.coordY > ground.y - ball.rad then
      veloc.y = veloc.y * (-1 * frictCoef)
      ball.coordY = ground.y - ball.rad - 1
    end

    bounceDist = 0

    if ((veloc.y <= veloc.y * -1) ~= (prevVeloc <= prevVeloc * -1)) then
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

  end --end of love.update functionality

  ball.coordX = ball.coordX + (veloc.x * dt)
  prevVeloc = veloc.y
end

function love.draw()
  love.graphics.setLineWidth(2)
  love.graphics.circle("line", ball.coordX, ball.coordY, ball.rad)

  love.graphics.setLineWidth(2)
  love.graphics.line(0, ground.y, 2000, ground.y)

  love.graphics.setLineWidth(1)
  love.graphics.line(0, ball.coordY, 2000, ball.coordY)

end

function love.keypressed(key, isRepeat) --taken from hello-world--from ben :)
  if key == "escape" then
    love.event.quit(0)
  end

  if key == "/" then -- pauses the program
    shouldUpdate = not shouldUpdate
  end

  if key == "space" then
    veloc.y = -500
    shouldUpdate = true
  end

  if key == "d" then
    veloc.x = bounceForce
    print("right")
  end

  if key == "a" then
    veloc.x = -bounceForce
    print("left")
  end
end

function love.keyreleased(key)
  if key == "d" then
    veloc.x = 0
    print("released")
  end

  if key == "a" then
    veloc.x = 0
    print("released")
  end
end
