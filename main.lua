require("player")
require("ball")
require("ai")
require("background")

function love.load()
    Player:load()
    Ball:load()
    AI:load()
    Background:load()

    Score = {player = 0, ai = 0}
    font = love.graphics.newFont(30)
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    Background:update(dt)
end

function love.draw()
    Background:draw()
    if Score.player == 5 or Score.ai == 5 then
        endGame()
    else
        Player:draw()
        Ball:draw()
        AI:draw()
        drawScore()
    end
end

function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("AI: "..Score.ai, 1000, 50)
end

function endGame()
    local x = love.graphics.getWidth() / 2 - 50
    local y = love.graphics.getHeight() / 2
    if Score.player > Score.ai then
        love.graphics.print("Player wins!", x, y)
    elseif Score.player < Score.ai then
        love.graphics.print("AI wins!", x, y)
    elseif Score.player == Score.ai then
        love.graphics.print("Tie!", x, y)
    end
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end