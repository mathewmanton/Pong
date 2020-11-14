
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

--Runs only once at the beginning of the game
function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  
  smallFont = love.graphics.newFont('font.ttf', 8)
  scoreFont = love.graphics.newFont('font.ttf', 32)
  
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = false,
      vsync = true
  })

  player1Score = 0
  player2Score = 0
  
  player1Y = 30
  player2Y = VIRTUAL_HEIGHT - 50
end

--Runs every frame. delta in seconds since last frame
function love.update(dt)
    --player 1 movement
    if love.keyboard.isDown('w') then
      --add negative paddle speed to current Y scaled by deltatime
      player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
      --add positive paddle speed to current Y scaled by delta time
      player1Y = player1Y + PADDLE_SPEED * dt
    end
    
    --player 2 movement
    if love.keyboard.isDown('up') then
      --add negative paddle speed to current Y scaled by deltatime
      player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
      --add positive paddle speed to current Y scaled by delta time
      player2Y = player2Y + PADDLE_SPEED * dt
    end
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end



--Called after update
function love.draw()
  --begin rendering at virtual resolutino
  push:apply('start')
  love.graphics.clear(40/255, 45/255, 52/255, 255/255)
  
  --Title
  love.graphics.setFont(smallFont)
  love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

  --Scores
  love.graphics.setFont(scoreFont)
  love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50,
    VIRTUAL_HEIGHT / 3)
  love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30,
    VIRTUAL_HEIGHT / 3)

  --left side paddle
  love.graphics.rectangle('fill', 10, player1Y, 5, 20)
  
  --right side paddle
  love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)
  
  --ball
  love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
  
  --end rendering at virtual resolution
  push:apply('end')
end