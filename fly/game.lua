-- Project: SaturnInvader
-- Description: A simple shooting game for beginner in learning Corona game engine
--
-- Version: 1.0
-- Used by the course : "Learning English by Making Mobile Game - Advanced"
--
-- Created by Dr. Twobears (Chi-Hsiung Liang.)
-- SaturnInvader  game.lua
-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local composer=require ("composer")

local scene=composer.newScene()

-- physics.setDrawMode( "hybrid" ) -- 顯示碰撞範圍
-- -------------------------------------------------------------------------------
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local tPrevious = system.getTimer()
local backgroundGroup = display.newGroup()
local score = 0

local background = display.newImageRect( "background.jpg", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local scoreText = display.newText( score, display.contentCenterX, 20, native.systemFont, 40 )

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-50

local balloon = display.newImageRect( "balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 1

local physics = require( "physics" )
physics.start()
physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=56, bounce=0.3 } )

local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    score = score + math.random (5)
    scoreText.text = score
end
 

local layerGroup = display.newGroup()
local ship
local fireTimer
local bulletGroup=display.newGroup()
local enemies = display.newGroup()
--爆炸群組
local explosionGroup = display.newGroup()
local checkMemoryTimer

local numEnemy = 0
local enemyArray = {}
-- "scene:create()"

balloon:addEventListener( "tap", pushBalloon )
-- -------------------------------------------------------------------------------

return scene