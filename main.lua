

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[Runs only once at the beginning of the game]]
function love.load()
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = false,
      vsync = true
  })
end

function love.draw()
  love.graphics.printf(
    'Hello Pong!', --text to render
    0, --starting X (0 since we're going to center align)
    WINDOW_HEIGHT / 2 - 6, --starting Y (halfway down the screen)
    WINDOW_WIDTH, -- number of pixels to center
    'center') -- alignment mode, can be 'center', 'left' or 'right' 
end