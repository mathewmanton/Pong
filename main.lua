
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--Runs only once at the beginning of the game
function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = false,
      vsync = true
  })
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
  
  love.graphics.printf(
    'Hello Pong!', --text to render
    0, --starting X (0 since we're going to center align)
    VIRTUAL_HEIGHT / 2 - 6, --starting Y (halfway down the screen)
    VIRTUAL_WIDTH, -- number of pixels to center
    'center') -- alignment mode, can be 'center', 'left' or 'right' 
  
  --end rendering at virtual resolution
  push:apply('end')
end