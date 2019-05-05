--Oro_UI by jeremymeile. Based on BFA UI for Vanilla 


local Oro_UI = CreateFrame('Button', 'Oro_UI');
local ADDON_NAME = "Oro_UI_Vanilla";


	MainMenuBarTexture2:Hide()
	--MainMenuBarTexture2:SetPoint('LEFT', MainMenuBarTexture3, 0, 0)

	MainMenuBarTexture3:Hide()

	MainMenuBar:ClearAllPoints()
	MainMenuBar:SetPoint("BOTTOM",CENTER,0)
	MainMenuBar:SetWidth(512)
	MainMenuExpBar:SetWidth(512)
	ReputationWatchBar:SetWidth(512)
	MainMenuBarMaxLevelBar:SetWidth(512)

	MainMenuMaxLevelBar2:Hide();
	MainMenuMaxLevelBar3:Hide();
	MainMenuMaxLevelBar0:SetPoint('BOTTOM', MainMenuBarMaxLevelBar, 'TOP', -128, 0)

	MainMenuXPBarTexture0:SetAlpha(0)
	MainMenuXPBarTexture3:SetAlpha(0)
	--MainMenuMaxLevelBar2:SetPoint('BOTTOM', MainMenuBarMaxLevelBar, 'TOP', -200, 0)
	--MainMenuMaxLevelBar2::SetSize(128, 128)
	--MainMenuMaxLevelBar3:SetPoint('BOTTOM', MainMenuBarMaxLevelBar, 'TOP', -110, 0)

	MainMenuBarPerformanceBar:Hide()

	ReputationWatchStatusBar:SetWidth(512)

	MainMenuBar:SetScale(1)
	MainMenuBarPageNumber:SetPoint('TOPRIGHT', ActionBarDownButton, 6, -1, nil)
	--MainMenuBarBackpackButton:SetPoint('BOTTOMRIGHT', UIParent, -1, -300, nil)
	MainMenuBarBackpackButton:SetPoint('BOTTOMRIGHT', MainMenuBar, 500, 4)
		
	CharacterMicroButton:SetPoint('BOTTOMLEFT', UIParent, 5000, 2, nil)

	CharacterMicroButton:Hide()
	SpellbookMicroButton:Hide()
	TalentMicroButton:Hide()
	QuestLogMicroButton:Hide()
	MainMenuMicroButton:Hide()
	MainMenuBarPerformanceBarFrame:Hide()

	MainMenuBarTexture0:SetPoint("LEFT", MainMenuBar, "LEFT", 0, 0)
	MainMenuBarTexture1:SetPoint("RIGHT", MainMenuBar, "RIGHT", 0, 0)
	MainMenuBarLeftEndCap:SetPoint("RIGHT", MainMenuBar, "LEFT", 34, 0)
	MainMenuBarRightEndCap:SetPoint("LEFT", MainMenuBar, "RIGHT", -34, 0)
	--MainMenuBarRightEndCap:SetPoint("LEFT", MainMenuBar, "RIGHT", 0, 0)

	ReputationXPBarTexture0:SetAlpha(0)
	ReputationXPBarTexture1:SetAlpha(0)
	ReputationXPBarTexture2:SetAlpha(0)
	ReputationXPBarTexture3:SetAlpha(0)

	ShapeshiftBarLeft:SetAlpha(0)
	ShapeshiftBarMiddle:SetAlpha(0)
	ShapeshiftBarRight:SetAlpha(0)
	
	MainMenuBarPageNumber:Hide()
	ActionBarUpButton:Hide()
	ActionBarDownButton:Hide()
	
	FramerateLabel:ClearAllPoints()
	FramerateLabel:SetPoint("CENTER", -200, 20)

	FramerateText:ClearAllPoints()
	FramerateText:SetPoint("CENTER", -200, 20)

	--CastingBarFrame:SetParent(UIParent)
	--CastingBarFrame:ClearAllPoints()
	CastingBarFrame:SetScale(1.3)
	CastingBarFrame:SetPoint("CENTER",0,-60)
	--CastingBarFrame.SetPoint = function() end

	--PlayerFrame:SetParent(UIParent)
	--PlayerFrame:SetScale(1)
	--PlayerFrame:SetPoint("TOPLEFT",400,-450)

	--TargetFrame:SetParent(UIParent)
	--TargetFrame:SetScale(1)
	--TargetFrame:SetPoint("TOPRIGHT",-400,-450)

	
	MultiBarBottomLeft:SetParent(MainMenuBar)
	--MultiBarBottomLeft:ClearAllPoints();
	MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, 0)

	MultiBarBottomRight:SetParent(MultiBarBottomLeft)
	MultiBarBottomRight:ClearAllPoints();
	MultiBarBottomRight:SetPoint("BOTTOM", MultiBarBottomLeft, "TOP", 0, 2)

	SlidingActionBarTexture0:SetTexture("")
	SlidingActionBarTexture1:SetTexture("")

	PetActionBarFrame:SetParent(MultiBarBottomRight)
	PetActionBarFrame:ClearAllPoints()
	PetActionBarFrame:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", 0, 2)

	if MultiBarBottomRight:IsVisible() then
PetActionBarFrame:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", 0, PetAction_yOffset)
elseif MultiBarBottomLeft:IsVisible() then
    PetActionBarFrame:SetPoint("BOTTOM", MultiBarBottomLeft, "TOP", 0, PetAction_yOffset)
else
    PetActionBarFrame:SetPoint("BOTTOM", MainMenuBarArtFrame, "TOP", 0, PetAction_yOffset)
end

	--ShapeshiftBarFrame:Hide();

	-- ShapeshiftBarFrame
ShapeshiftBarFrame:ClearAllPoints()
ShapeshiftBarFrame:SetScale(1.5)
local Shapeshift_xOffset = -123
local Shapeshift_yOffset = 25
if MultiBarBottomRight:IsVisible() then
    ShapeshiftBarFrame:SetPoint("BOTTOM", MultiBarBottomRight, "CENTER", Shapeshift_xOffset, Shapeshift_yOffset)
elseif MultiBarBottomLeft:IsVisible() then
    ShapeshiftBarFrame:SetPoint("BOTTOM", MultiBarBottomLeft, "CENTER", Shapeshift_xOffset, Shapeshift_yOffset)
else 
    ShapeshiftBarFrame:SetPoint("BOTTOM", ActionButton1, "CENTER", Shapeshift_xOffset, Shapeshift_yOffset)
end

function Oro_UI_Vanilla_OnLoad()
	_G = getfenv(0)

	for i=1,12 do _G["ActionButton"..i.."HotKey"]:SetAlpha(0)end
end

function Oro_UI_TargetFrameDebuff()
	_G = getfenv(0)

		for i=1, 16 do
			_G["TargetFrameDebuff"..i]:SetScale(1.6)
		end
end

function Oro_UI_OnLoad() 
	Oro_UI:SetScript("OnEvent", Oro_UI_OnEvent)
	Oro_UI:RegisterEvent('ADDON_LOADED');
	Oro_UI:RegisterEvent('PLAYER_ENTERING_WORLD');
end

function Oro_UI_OnEvent()
	if (event == "ADDON_LOADED") then
		if (arg1 == ADDON_NAME) then 
				Oro_UI_Vanilla_OnLoad();
				Oro_UI_TargetFrameDebuff();
		end
    end 
end

