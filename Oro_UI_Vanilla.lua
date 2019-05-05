--Oro_UI by jeremymeile. Based on BFA UI for Vanilla 


local Oro_UI = CreateFrame('Button', 'Oro_UI');
local ADDON_NAME = "Oro_UI_Vanilla";

local oro_ui = CreateFrame("Frame")
oro_ui:RegisterEvent("PLAYER_ENTERING_WORLD")
oro_ui:RegisterEvent("ADDON_LOADED")
oro_ui:RegisterEvent("UPDATE_FACTION")

oro_ui:SetScript("OnEvent", function() 
	if event == "ADDON_LOADED" then 
		hook()
		hide()
	elseif event == "PLAYER_ENTERING_WORLD" or "UPDATE_FACTION" then
		main()
	end
end)

function hook()
	--hook to allow moving Blizzard frames
	OLD_UIParent_ManageFramePositions = UIParent_ManageFramePositions
	function UIParent_ManageFramePositions()
		-- overwrite			
	end
end

-- function will be passed frames to hide
function hideFrame(frame)
	-- move frame off screen
	frame:ClearAllPoints()
	frame:SetPoint('BOTTOM', UIParent, 'TOP', 0, -200)
	local hideFrame = CreateFrame("Frame", "hideFrame", UIParent)
	-- set parent to the hideFrame and hide the frame
	frame:SetParent(hideFrame)
	frame:Hide()
	hideFrame:Hide()
end

-- function to hide fraames
function hide()
	hideFrame(UIErrorsFrame)
	hideFrame(MainMenuBarPageNumber)
	hideFrame(ActionBarUpButton)
	hideFrame(ActionBarDownButton)
	hideFrame(MainMenuXPBarTexture2)
	hideFrame(MainMenuXPBarTexture3)
	hideFrame(MainMenuBarTexture2)
	hideFrame(MainMenuBarTexture3)
	hideFrame(MainMenuMaxLevelBar2)
	hideFrame(MainMenuMaxLevelBar3)
	-- Rep
	hideFrame(ReputationWatchBarTexture2)
	hideFrame(ReputationWatchBarTexture3)

	-- Micro Buttons
	hideFrame(CharacterMicroButton)
	hideFrame(SpellbookMicroButton)
	hideFrame(TalentMicroButton)
	hideFrame(QuestLogMicroButton)
	hideFrame(MainMenuMicroButton)
	hideFrame(SocialsMicroButton)
	hideFrame(WorldMapMicroButton)
	hideFrame(MainMenuBarPerformanceBarFrame)
	-- Bags
	hideFrame(CharacterBag3Slot)
	hideFrame(CharacterBag2Slot)
	hideFrame(CharacterBag1Slot)
	hideFrame(CharacterBag0Slot)
	hideFrame(MainMenuBarBackpackButton)
	hideFrame(KeyRingButton)
	-- Shapeshift
	hideFrame(ShapeshiftBarLeft)
	hideFrame(ShapeshiftBarMiddle)
	hideFrame(ShapeshiftBarRight)
	hideFrame(HelpMicroButton)
end

function main()
	ReputationWatchBarTexture2:SetTexture("")
	ReputationWatchBarTexture3:SetTexture("")
	ReputationXPBarTexture2:SetTexture("")
	ReputationXPBarTexture3:SetTexture("")

	-- Setwidth
	local width = 512
	MainMenuBar:SetWidth(width)
	MainMenuExpBar:SetWidth(width)
	MainMenuBarMaxLevelBar:SetWidth(width)
	ReputationWatchBar:SetWidth(width)
	ReputationWatchStatusBar:SetWidth(width)

	-- Setpoint
	local yOffset = 5

	-- HelpMicroButton
	--HelpMicroButton:ClearAllPoints()
	--HelpMicroButton:SetPoint("BOTTOM", "MainMenuBarRightEndCap", 0 , yOffset)

	-- XPBar
	MainMenuXPBarTexture0:SetPoint("LEFT", MainMenuExpBar, "LEFT")
	MainMenuXPBarTexture1:SetPoint("RIGHT", MainMenuExpBar, "RIGHT")


	-- RepBar
	ReputationWatchBar:SetPoint("BOTTOM", MainMenuExpBar, "TOP", 0, 0)
	ReputationWatchBarTexture0:SetPoint("LEFT", ReputationWatchBar, "LEFT")
	ReputationWatchBarTexture1:SetPoint("RIGHT", ReputationWatchBar, "RIGHT")

	-- XPBarArt
	--MainMenuMaxLevelBar0:SetPoint('BOTTOM', MainMenuBarMaxLevelBar, 'TOP', -128, 0)
	MainMenuMaxLevelBar0:SetPoint("LEFT", MainMenuBarArtFrame, "LEFT")
	MainMenuBarTexture0:SetPoint("LEFT", MainMenuBarArtFrame, "LEFT")
	MainMenuBarTexture1:SetPoint("RIGHT", MainMenuBarArtFrame, "RIGHT")

	-- Endcaps
	MainMenuBarLeftEndCap:SetPoint("RIGHT", MainMenuBarArtFrame, "LEFT", 30, 0)
	MainMenuBarRightEndCap:SetPoint("LEFT", MainMenuBarArtFrame, "RIGHT", -30, 0)

	-- MultiBarBottomLeft
	MultiBarBottomLeft:ClearAllPoints()
	-- Check if we are watching a reputation
	local name = GetWatchedFactionInfo()
	if name then
		MultiBarBottomLeft:SetPoint("BOTTOM", ReputationWatchBar, "TOP", 0, yOffset)
	else
	MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuExpBar, "TOP", 0, yOffset)
	end

	-- MultiBarBottomRight
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint("BOTTOM", MultiBarBottomLeft, "TOP", 0, yOffset)

	-- ShapeshiftBarFrame
	ShapeshiftBarFrame:ClearAllPoints()
	ShapeshiftBarFrame:SetScale(1.0)

	ShapeshiftButton1:SetNormalTexture("")
	ShapeshiftButton2:SetNormalTexture("")
	ShapeshiftButton3:SetNormalTexture("")

	local Shapeshift_xOffset = 0
	local Shapeshift_yOffset = 0
	if MultiBarBottomRight:IsVisible() then
		ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", MultiBarBottomRight, "TOPLEFT", Shapeshift_xOffset, Shapeshift_yOffset)
	elseif MultiBarBottomLeft:IsVisible() then
		ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", MultiBarBottomLeft, "TOPLEFT", Shapeshift_xOffset, Shapeshift_yOffset)
	else
		if ReputationWatchBar:IsVisible() then
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT", 0, 15)
		elseif MainMenuExpBar:IsVisible() then
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT", 0, 15)
		else
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT", Shapeshift_xOffset, Shapeshift_yOffset)
		end
	end
	
	-- PetAction
	SlidingActionBarTexture0:SetTexture("")
	SlidingActionBarTexture1:SetTexture("")
	
	-- PetActionBarFrame
	PetActionBarFrame:ClearAllPoints()
	PetActionBarFrame:SetMovable(true)
	PetActionBarFrame:SetUserPlaced(true)
	local PetAction_yOffset = 3
	if MultiBarBottomRight:IsVisible() then
		PetActionBarFrame:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", 0, PetAction_yOffset)
	elseif MultiBarBottomLeft:IsVisible() then
	  PetActionBarFrame:SetPoint("BOTTOM", MultiBarBottomLeft, "TOP", 0, PetAction_yOffset)
	else
	  PetActionBarFrame:SetPoint("BOTTOM", MainMenuBarArtFrame, "TOP", 0, PetAction_yOffset)
	end

	MultiBarBottomLeft:ClearAllPoints()
	local MultiBarBottomLeft_yOffset = -3

	if MainMenuExpBar:IsVisible() then
		MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, 3)
	else 
		MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, MultiBarBottomLeft_yOffset)
	end

	if ReputationWatchBar:IsVisible() then
		MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, 3)
	else 
		MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, MultiBarBottomLeft_yOffset)
	end

		-- CastingBarFrame
	CastingBarFrame.ignoreFramePositionManager = true
	CastingBarFrame:ClearAllPoints()
	CastingBarFrame:SetMovable(true)
	CastingBarFrame:SetUserPlaced(true)
	local castBar_yOffset = 10
	if MultiBarBottomRight:IsVisible() then
		if PetActionBarFrame:IsVisible() then
			CastingBarFrame:SetPoint("BOTTOM", MainMenuBarArtFrame, "TOP", 0, 120)
		else
			CastingBarFrame:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", 0, castBar_yOffset)
		end
	elseif MultiBarBottomLeft:IsVisible() then
		if PetActionBarFrame:IsVisible() then
			CastingBarFrame:SetPoint("BOTTOM", MainMenuBarArtFrame, "TOP", 0, 80)
		else
			CastingBarFrame:SetPoint("BOTTOM", MultiBarBottomLeft, "TOP", 0, castBar_yOffset)
		end
	else
		CastingBarFrame:SetPoint("BOTTOM", MainMenuBarArtFrame, "TOP", 0, castBar_yOffset)
	end

end
