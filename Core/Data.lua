--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2011 ~ 2026 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]
local _G = getfenv(0)

local _, private = ...
local LibStub = _G.LibStub
local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas")
---@type AtlasAddon
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")
---@type AtlasDataModule
local addon = Atlas:GetModule(private.module_name)

local db = {}
addon.db = db

local constants = Atlas.constants
local labelcolors = constants.colors.labels
local BLUE = labelcolors.BLUE
local GREN = labelcolors.GREN
local GREY = labelcolors.GREY
local LBLU = labelcolors.LBLU
local _RED = labelcolors._RED
local ORNG = labelcolors.ORNG
local PINK = labelcolors.PINK
local PURP = labelcolors.PURP
local WHIT = labelcolors.WHIT
local YLOW = labelcolors.YLOW
local INDENT = labelcolors.INDENT

-- local helper functions
local function getBossName(bossname, encounterID, creatureIndex)
	return Atlas:GetBossName(bossname, encounterID, creatureIndex, private.module_name)
end

local function getCreatureName(creatureName, creatureID)
	return Atlas:GetCreatureName(creatureName, creatureID)
end

local function getQuestTitlebyID(title, id)
	return Atlas:GetQuestTitlebyID(title, id)
end

local function getItemTitlebyID(title, id)
	return Atlas:GetItemTitlebyID(title, id)
end

-- local constants for easier access
local SLASH = ALC["Slash"]
local COLON = ALC["Colon"]
local COMMA = ALC["Comma"]
local L_PAREN = ALC["L-Parenthesis"]
local R_PAREN = ALC["R-Parenthesis"]
local ENTRANCE = ALC["Entrance"]
local WANDERS = ALC["Wanders"]
local UPPER = ALC["Upper"]
local CONNECTION = ALC["Connection"]
local RARE = ALC["Rare"]
local RANDOM = ALC["Random"]

-- ==============================================================================
db.AtlasMaps = {
	Auchindoun = {
		ZoneName = { BZ["Auchindoun"] },
		Location = { BZ["Talador"] },
		DungeonID = 820,
		DungeonHeroicID = 845,
		DungeonMythicID = 1008,
		Acronym = ALC["Auch"], -- taken from BC
		WorldMapID = 539,
		JournalInstanceID = 547,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ WHIT.." 1) "..getBossName("Vigilant Kaathar", 1185), 1185 },
		{ WHIT.." 2) "..getBossName("Soulbinder Nyami", 1186), 1186 },
		{ WHIT.." 3) "..getBossName("Azzakel", 1216), 1216 },
		{ WHIT..INDENT..getBossName("Blazing Trickster", 1216, 4), 1216 },
		{ WHIT..INDENT..getBossName("Cackling Pyromaniac", 1216, 2), 1216 },
		{ WHIT..INDENT..getBossName("Felguard", 1216, 3), 1216 },
		{ WHIT.." 4) "..getBossName("Teron'gor", 1225), 1225 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "...They All Fall Down", "ac=9023" },
		{ "Demon's Souls", "ac=9551" },
		{ "No Tag-backs!", "ac=9552" },
		{ "Auchindoun", "ac=9039" },
		{ "Heroic: Auchindoun", "ac=9049" },
		{ "Heroic: Auchindoun Guild Run", "ac=9371" },
		{ "Mythic: Auchindoun", "ac=10080" },
		{ "Auchindoun Challenger", "ac=8879" },
		{ "Auchindoun: Bronze", "ac=8880" },
		{ "Auchindoun: Silver", "ac=8881" },
		{ "Auchindoun: Gold", "ac=8882" },
	},
--    [988] = { mapFile = "FoundryRaid", [1] = 596, [2] = 597, [3] = 598, [4] = 599, [5] = 600},
	BlackrockFoundryA = {
		ZoneName = { BZ["Blackrock Foundry"]..ALC["MapA"] },
		Location = { BZ["Gorgrond"] },
		DungeonID = 898,
		DungeonHeroicID = 899,
		DungeonMythicID = 900,
		Acronym = L["BRF"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 597,
		JournalInstanceID = 457,
		Module = "Atlas_WarlordsofDraenor",
		NextMap = "BlackrockFoundryB",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ BLUE.." B-C) "..CONNECTION, 10002 },
		{ WHIT.." 1) "..getBossName("Gruul", 1161)..L_PAREN..UPPER..R_PAREN, 1161 },
		{ WHIT.." 2) "..getBossName("Oregorger the Devourer", 1202, 1)..L_PAREN..UPPER..R_PAREN, 1202 },
		{ WHIT.." 3) "..getBossName("Beastlord Darmac", 1122), 1122 },
		{ WHIT..INDENT..getBossName("Cruelfang", 1122, 2), 1122 },
		{ WHIT..INDENT..getBossName("Dreadwing", 1122, 3), 1122 },
		{ WHIT..INDENT..getBossName("Faultline", 1122, 5), 1122 },
		{ WHIT..INDENT..getBossName("Ironcrusher", 1122, 4), 1122 },
		{ WHIT.." 6) "..getBossName("Operator Thogar", 1147), 1147 },
		{ WHIT.." 7) "..getBossName("The Blast Furnace", 1154)..L_PAREN..ALC["Lower"]..R_PAREN, 1154 },
		{ WHIT..INDENT..getBossName("Bellows Operator", 1154, 4), 1154 },
		{ WHIT..INDENT..getBossName("Firecaller", 1154, 6), 1154 },
		{ WHIT..INDENT..getBossName("Foreman Feldspar", 1154, 1), 1154 },
		{ WHIT..INDENT..getBossName("Furnace Engineer", 1154, 3), 1154 },
		{ WHIT..INDENT..getBossName("Heart of the Mountain", 1154, 8), 1154 },
		{ WHIT..INDENT..getBossName("Primal Elementalist", 1154, 5), 1154 },
		{ WHIT..INDENT..getBossName("Security Guard", 1154, 2), 1154 },
		{ WHIT..INDENT..getBossName("Slag Elemental", 1154, 7), 1154 },
		{ WHIT.." 10) "..getBossName("Blackhand", 959)..L_PAREN..UPPER..R_PAREN, 959 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Slagworks", "ac=8989" },
		{ "Iron Assembly", "ac=8991" },
		{ "Blackhand's Crucible", "ac=8992" },
		{ "The Iron Price", "ac=8978" },
		{ "There's Always a Bigger Train", "ac=8982" },
		{ "Ya, We've Got Time...", "ac=8930" },
		{ "Ashes, Ashes...", "ac=8952" },
		{ "Ahead of the Curve: Blackhand's Crucible", "ac=9444" },
		{ "Mythic: Beastlord Darmac", "ac=8956" },
	},
	BlackrockFoundryB = {
		ZoneName = { BZ["Blackrock Foundry"]..ALC["MapB"] },
		Location = { BZ["Gorgrond"] },
		DungeonID = 898,
		DungeonHeroicID = 899,
		DungeonMythicID = 900,
		Acronym = L["BRF"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 596,
		JournalInstanceID = 457,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "BlackrockFoundryA",
		{ BLUE.." C) "..CONNECTION, 10001 },
		{ WHIT.." 4) "..getBossName("Flamebender Ka'graz", 1123), 1123 },
		{ WHIT..INDENT..getBossName("Aknor Steelbringer", 1123, 2), 1123 },
		{ WHIT..INDENT..getBossName("Cinder Wolf", 1123, 3), 1123 },
		{ WHIT.." 5) "..getBossName("Hans'gar and Franzok", 1155), 1155 },
		{ WHIT..INDENT..getBossName("Franzok", 1155, 1), 1155 },
		{ WHIT..INDENT..getBossName("Hans'gar", 1155, 2), 1155 },
		{ WHIT.." 8) "..getBossName("Kromog", 1162), 1162 },
		{ WHIT.." 9) "..getBossName("The Iron Maidens", 1203), 1203 },
		{ WHIT..INDENT..getBossName("Admiral Gar'an", 1203, 1), 1203 },
		{ WHIT..INDENT..getBossName("Enforcer Sorka", 1203, 2), 1203 },
		{ WHIT..INDENT..getBossName("Marak the Blooded", 1203, 3), 1203 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Black Forge", "ac=8990" },
		{ "Iron Assembly", "ac=8991" },
		{ "The Steel Has Been Brought", "ac=8929" },
		{ "There's Always a Bigger Train", "ac=8982" },
		{ "Would You Give Me a Hand?", "ac=8983" },
		{ "Mythic: Hans'gar and Franzok", "ac=8968" },
		{ "Mythic: Kromog", "ac=8971" },
	},
	BloodmaulSlagMines = {
		ZoneName = { BZ["Bloodmaul Slag Mines"] },
		Location = { BZ["Frostfire Ridge"] },
		DungeonID = 787,
		DungeonHeroicID = 859,
		DungeonMythicID = 1005,
		Acronym = L["BSM"],
		WorldMapID = 573,
		JournalInstanceID = 385,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ WHIT.." 1) "..getBossName("Magmolatus", 893), 893 },
		{ WHIT..INDENT..getBossName("Forgemaster Gog'duh", 893, 1), 893 },
		{ WHIT.." 2) "..getBossName("Slave Watcher Crushto", 888), 888 },
		{ WHIT.." 3) "..getBossName("Roltall", 887), 887 },
		{ WHIT.." 4) "..getBossName("Gug'rokk", 889), 889 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "A Gift of Earth and Fire", "ac=8993" },
		{ "Come With Me If You Want to Live", "ac=9005" },
		{ "Is Draenor on Fire?", "ac=9008" },
		{ "Bloodmaul Slag Mines", "ac=9037" },
		{ "Heroic: Bloodmaul Slag Mines", "ac=9046" },
		{ "Heroic: Bloodmaul Slag Mines Guild Run", "ac=9369" },
		{ "Mythic: Bloodmaul Slag Mines", "ac=10076" },
		{ "Bloodmaul Slag Mines Challenger", "ac=8875" },
		{ "Bloodmaul Slag Mines: Bronze", "ac=8876" },
		{ "Bloodmaul Slag Mines: Silver", "ac=8877" },
		{ "Bloodmaul Slag Mines: Gold", "ac=8878" },
	},
	TheEverbloomA = {
		ZoneName = { BZ["The Everbloom"]..ALC["MapA"] },
		Location = { BZ["Gorgrond"] },
		DungeonID = 824,
		DungeonHeroicID = 866,
		DungeonMythicID = 1003,
		Acronym = L["EB"],
		WorldMapID = 620,
		DungeonLevel = 1,
		JournalInstanceID = 556,
		Module = "Atlas_WarlordsofDraenor",
		NextMap = "TheEverbloomB",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ BLUE.." B) "..CONNECTION.. L_PAREN..ALC["Portal"]..R_PAREN, 10002 },
		{ WHIT.." 1) "..getBossName("Witherbark", 1214), 1214 },
		{ WHIT.." 2) "..getBossName("Ancient Protectors", 1207), 1207 },
		{ WHIT..INDENT..getBossName("Dulhu", 1207, 1), 1207 },
		{ WHIT..INDENT..getBossName("Earthshaper Telu", 1207, 2), 1207 },
		{ WHIT..INDENT..getBossName("Life Warden Gola", 1207, 3), 1207 },
		{ WHIT.." 3) "..getBossName("Archmage Sol", 1208), 1208 },
		{ WHIT.." 4) "..getBossName("Xeri'tac", 1209)..L_PAREN..ALC["Lower"]..R_PAREN, 1209 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Water Management", "ac=9017" },
		{ "The Everbloom", "ac=9044" },
		{ "Heroic: The Everbloom", "ac=9053" },
		{ "Heroic: The Everbloom Guild Run", "ac=9374" },
		{ "Mythic: The Everbloom", "ac=10083" },
		{ "The Everbloom Challenger", "ac=9001" },
		{ "The Everbloom: Bronze", "ac=9002" },
		{ "The Everbloom: Silver", "ac=9003" },
		{ "The Everbloom: Gold", "ac=9004" },
	},
	TheEverbloomB = {
		ZoneName = { BZ["The Everbloom"]..ALC["MapB"] },
		Location = { BZ["Gorgrond"] },
		DungeonID = 824,
		DungeonHeroicID = 866,
		DungeonMythicID = 1003,
		Acronym = L["EB"],
		WorldMapID = 621,
		DungeonLevel = 2,
		JournalInstanceID = 556,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "TheEverbloomA",
		{ BLUE.." B) "..CONNECTION.. L_PAREN..ALC["Portal"]..R_PAREN, 10001 },
		{ WHIT.." 5) "..getBossName("Yalnu", 1210), 1210 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "The Everbloom", "ac=9044" },
		{ "Heroic: The Everbloom", "ac=9053" },
		{ "Heroic: The Everbloom Guild Run", "ac=9374" },
		{ "Mythic: The Everbloom", "ac=10083" },
		{ "The Everbloom Challenger", "ac=9001" },
		{ "The Everbloom: Bronze", "ac=9002" },
		{ "The Everbloom: Silver", "ac=9003" },
		{ "The Everbloom: Gold", "ac=9004" },
	},
	GrimrailDepot = {
		ZoneName = { BZ["Grimrail Depot"] },
		Location = { BZ["Gorgrond"] },
		DungeonID = 822,
		DungeonHeroicID = 858,
		DungeonMythicID = 1006,
		Acronym = L["GD"],
		WorldMapID = 606,
		JournalInstanceID = 536,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ BLUE.." B) "..L["Train Ride"]..L_PAREN..ALC["Event"]..R_PAREN, 10002 },
		{ WHIT.." 1) "..getBossName("Rocketspark and Borka", 1138), 1138 },
		{ WHIT..INDENT..getBossName("Borka the Brute", 1138, 2), 1138 },
		{ WHIT..INDENT..getBossName("Railmaster Rocketspark", 1138, 1), 1138 },
		{ WHIT.." 2) "..getBossName("Nitrogg Thundertower", 1163), 1163 },
		{ WHIT..INDENT..getBossName("Assault Cannon", 1163, 2), 1163 },
		{ WHIT.." 3) "..getBossName("Skylord Tovra", 1133), 1133 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "No Ticket", "ac=9007" },
		{ "This Is Why We Can't Have Nice Things", "ac=9024" },
		{ "Grimrail Depot", "ac=9043" },
		{ "Heroic: Grimrail Depot", "ac=9052" },
		{ "Heroic: Grimrail Depot Guild Run", "ac=9373" },
		{ "Mythic: Grimrail Depot", "ac=10082" },
		{ "Grimrail Depot Challenger", "ac=8887" },
		{ "Grimrail Depot: Bronze", "ac=8888" },
		{ "Grimrail Depot: Silver", "ac=8889" },
		{ "Grimrail Depot: Gold", "ac=8890" },
	},
	HellfireA = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapA"] },
		Location = { BZ["Tanaan Jungle"] },
		DungeonID = 987,
		DungeonHeroicID = 988,
		DungeonMythicID = 989,
		Acronym = L["HC"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 661,
		DungeonLevel = 1,
		JournalInstanceID = 669,
		Module = "Atlas_WarlordsofDraenor",
		NextMap = "HellfireB",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ BLUE.." B) "..CONNECTION, 10002 },
		{ WHIT.." 1) "..getBossName("Hellfire Assault", 1426), 1426 },			-- 1
		{ WHIT..INDENT..getBossName("Siegemaster Mar'tak", 1426, 1), 1426 },
		{ WHIT..INDENT..getBossName("Hellfire Cannon", 1426, 2), 1426 },
		{ WHIT.." 2) "..getBossName("Iron Reaver", 1425), 1425 },			-- 2
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Hellbreach", "ac=10023" },
		{ "Nearly Indestructible", "ac=10026" },
		{ "Turning the Tide", "ac=10057" },
	},
	HellfireB = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapB"] },
		Location = { BZ["Tanaan Jungle"] },
		DungeonID = 987,
		DungeonHeroicID = 988,
		DungeonMythicID = 989,
		Acronym = L["HC"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 665,
		DungeonLevel = 5,
		JournalInstanceID = 669,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "HellfireA",
		NextMap = "HellfireC",
		{ BLUE.." B/C) "..CONNECTION, 10001 },
		{ WHIT.." 3) "..getBossName("Gorefiend", 1372), 1372 },				-- 3
		{ WHIT.." 4) "..getBossName("Kilrogg Deadeye", 1396), 1396 },			-- 4
		{ WHIT.." 5) "..getBossName("Hellfire High Council", 1432), 1432 },		-- 5
		{ WHIT..INDENT..getBossName("Dia Darkwhisper", 1432, 3), 1432 },
		{ WHIT..INDENT..getBossName("Gurtogg Bloodboil", 1432, 1), 1432 },
		{ WHIT..INDENT..getBossName("Blademaster Jubei'thos", 1432, 2), 1432 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Halls of Blood", "ac=10024" },
		{ "A Race Against Slime", "ac=9972" },
		{ "Get In My Belly!", "ac=9979" },
	},
	HellfireC = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapC"] },
		Location = { BZ["Tanaan Jungle"] },
		DungeonID = 987,
		DungeonHeroicID = 988,
		DungeonMythicID = 989,
		Acronym = L["HC"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 664,
		DungeonLevel = 4,
		JournalInstanceID = 669,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "HellfireB",
		NextMap = "HellfireD",
		{ BLUE.." C) "..CONNECTION, 10001 },
		{ WHIT.." 6) "..getBossName("Kormrok", 1392), 1392 },				-- 6
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Hellbreach", "ac=10023" },
		{ "Waves Came Crashing Down All Around", "ac=10013" },
	},
	HellfireD = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapD"] },
		Location = { BZ["Tanaan Jungle"] },
		DungeonID = 987,
		DungeonHeroicID = 988,
		DungeonMythicID = 989,
		Acronym = L["HC"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 666,
		DungeonLevel = 6,
		JournalInstanceID = 669,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "HellfireC",
		NextMap = "HellfireE",
		{ BLUE.." B/C) "..CONNECTION, 10001 },
		{ WHIT.." 7) "..getBossName("Shadow-Lord Iskar", 1433), 1433 },			-- 7
		{ WHIT..INDENT..getBossName("Fel Raven", 1433, 2), 1433 },
		{ WHIT..INDENT..getBossName("Shadowfel Warden", 1433, 3), 1433 },
		{ WHIT..INDENT..getBossName("Corrupted PRIEST of Terokk", 1433, 4), 1433 },
		{ WHIT..INDENT..getBossName("Illusionary Outcast", 1433, 5), 1433 },
		{ WHIT.." 8) "..getBossName("Fel Lord Zakuun", 1391), 1391 },			-- 8
		{ WHIT.." 9) "..getBossName("Xhul'horac", 1447), 1447 },				-- 9
		{ WHIT.."10) "..getBossName("Socrethar the Eternal", 1427), 1427 },		-- 10
		{ WHIT.."11) "..getBossName("Tyrant Velhari", 1394), 1394 },			-- 11
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Bastion of Shadows", "ac=10025" },
		{ "Destructor's Rise", "ac=10020" },
		{ "Pro Toss", "ac=9988" },
		{ "I'm a Soul Man", "ac=10086" },
		{ "This Land Was Green and Good Until...", "ac=10012" },
		{ "You Gotta Keep 'em Separated", "ac=10087" },
		{ "Non-Lethal Enforcer", "ac=9989" },
	},
	HellfireE = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapE"] },
		Location = { BZ["Tanaan Jungle"] },
		DungeonID = 987,
		DungeonHeroicID = 988,
		DungeonMythicID = 989,
		Acronym = L["HC"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 669,
		DungeonLevel = 9,
		JournalInstanceID = 669,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "HellfireD",
		NextMap = "HellfireF",
		{ WHIT.."12) "..getBossName("Mannoroth", 1395), 1395 },				-- 12
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Destructor's Rise", "ac=10020" },
		{ "Bad Manner(oth)", "ac=10030" },
	},
	HellfireF = { 
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapF"] },
		Location = { BZ["Tanaan Jungle"] },
		DungeonID = 987,
		DungeonHeroicID = 988,
		DungeonMythicID = 989,
		Acronym = L["HC"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 670,
		DungeonLevel = 10,
		JournalInstanceID = 669,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "HellfireE",
		{ BLUE.." D) "..CONNECTION, 10001 },
		{ WHIT.."13) "..getBossName("Archimonde", 1438), 1438 },			-- 13 
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "The Black Gate", "ac=10019" },
		{ "Echoes of Doomfire", "ac=10073" },
		{ "Time is a Flat Circle", "ac=9680" },
		{ "Ahead of the Curve: The Black Gate", "ac=10044" },
		{ "Cutting Edge: The Black Gate", "ac=10045" },
	},
	HighmaulA = {
		ZoneName = { BZ["Highmaul"]..ALC["MapA"] },
		Location = { BZ["Nagrand"] },
		DungeonID = 895,
		DungeonHeroicID = 896,
		DungeonMythicID = 897,
		Acronym = L["HM"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 610,
		DungeonLevel = 1,
		JournalInstanceID = 477,
		Module = "Atlas_WarlordsofDraenor",
		NextMap = "HighmaulB",
		{ BLUE.." A) "..ENTRANCE..L_PAREN..ALC["Lower"]..R_PAREN, 10001 },
		{ BLUE.." B) "..CONNECTION.. L_PAREN..ALC["Portal"]..R_PAREN, 10002 },
		{ WHIT.." 1) "..getBossName("Kargath Bladefist", 1128), 1128 },
		{ WHIT.." 2) "..getBossName("The Butcher", 971), 971 },
		{ WHIT.." 3) "..getBossName("Tectus", 1195), 1195 },
		{ WHIT.." 4) "..getBossName("Brackenspore", 1196), 1196 },
		{ WHIT..INDENT..getBossName("Fungal Flesh-Eater", 1196, 2), 1196 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Flame On!", "ac=8948" },
		{ "Hurry Up, Maggot!", "ac=8947" },
		{ "More Like Wrecked-us", "ac=8974" },
		{ "A Fungus Among Us", "ac=8975" },
		{ "Mythic: Kargath Bladefist", "ac=8949" },
		{ "Mythic: The Butcher", "ac=8960" },
		{ "Mythic: Tectus", "ac=8961" },
		{ "Mythic: Brackenspore", "ac=8962" },
	},
	HighmaulB = {
		ZoneName = { BZ["Highmaul"]..ALC["MapB"] },
		Location = { BZ["Nagrand"] },
		DungeonID = 895,
		DungeonHeroicID = 896,
		DungeonMythicID = 897,
		Acronym = L["HM"],
		PlayerLimit = { 10, 20, 25, 30 },
		WorldMapID = 613,
		DungeonLevel = 4,
		JournalInstanceID = 477,
		Module = "Atlas_WarlordsofDraenor",
		PrevMap = "HighmaulA",
		{ BLUE.." B-D) "..CONNECTION, 10001 },
		{ WHIT.." 5) "..getBossName("Twin Ogron", 1148), 1148 },
		{ WHIT..INDENT..getBossName("Phemos", 1148, 2), 1148 },
		{ WHIT..INDENT..getBossName("Pol", 1148, 1), 1148 },
		{ WHIT.." 6) "..getBossName("Ko'ragh", 1153), 1153 },
		{ WHIT.." 7) "..getBossName("Imperator Mar'gok", 1197), 1197 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Brothers in Arms", "ac=8958" },
		{ "Pair Annihilation", "ac=8976" },
		{ "Lineage of Power", "ac=8977" },
		{ "Cutting Edge: Imperator's Fall", "ac=9442" },
		{ "Mythic: Twin Ogron", "ac=8963" },
		{ "Mythic: Ko'ragh", "ac=8964" },
		{ "Mythic: Imperator's Fall", "ac=8965" },
	},
	IronDocks = {
		ZoneName = { BZ["Iron Docks"] },
		Location = { BZ["Gorgrond"] },
		DungeonID = 821,
		DungeonHeroicID = 857,
		DungeonMythicID = 1007,
		Acronym = L["ID"],
		WorldMapID = 595,
		JournalInstanceID = 558,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ WHIT.." 1) "..getBossName("Fleshrender Nok'gar", 1235), 1235 },
		{ WHIT..INDENT..getBossName("Dreadfang", 1235, 2), 1235 },
		{ WHIT.." 2) "..getBossName("Grimrail Enforcers", 1236), 1236 },
		{ WHIT..INDENT..getBossName("Ahri'ok Dugru", 1236, 1), 1236 },
		{ WHIT..INDENT..getBossName("Makogg Emberblade", 1236, 2), 1236 },
		{ WHIT..INDENT..getBossName("Nesa \"Hightower\" Nox", 1236, 3), 1236 },
		{ WHIT.." 3) "..getBossName("Oshir", 1237), 1237 },
		{ WHIT.." 4) "..getBossName("Skulloc", 1238), 1238 },
		{ WHIT..INDENT..getBossName("Koramar", 1238, 3), 1238 },
		{ WHIT..INDENT..getBossName("Zoggosh", 1238, 2), 1238 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Militaristic, Expansionist", "ac=9083" },
		{ "Expert Timing", "ac=9081" },
		{ "Take Cover!", "ac=9082" },
		{ "Heroic: Iron Docks", "ac=9047" },
		{ "Heroic: Iron Docks Guild Run", "ac=9370" },
		{ "Mythic: Iron Docks", "ac=10079" },
		{ "Iron Docks Challenger", "ac=8997" },
		{ "Iron Docks: Bronze", "ac=8998" },
		{ "Iron Docks: Silver", "ac=8999" },
		{ "Iron Docks: Gold", "ac=9000" },
	},
	ShadowmoonBurialGrounds = {
		ZoneName = { BZ["Shadowmoon Burial Grounds"] },
		Location = { BZ["Shadowmoon Valley"] },
		DungeonID = 783,
		DungeonHeroicID = 784,
		DungeonMythicID = 1009,
		Acronym = L["SBG"],
		WorldMapID = 574,
		JournalInstanceID = 537,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ BLUE.." B) "..CONNECTION.. L_PAREN..ALC["Portal"]..R_PAREN, 10002 },
		{ WHIT.." 1) "..getBossName("Sadana Bloodfury", 1139), 1139 },
		{ WHIT.." 2) "..getBossName("Nhallish", 1168), 1168 },
		{ WHIT.." 3) "..getBossName("Bonemaw", 1140), 1140 },
		{ WHIT..INDENT..getBossName("Carrion Worm", 1140, 2), 1140 },
		{ WHIT.." 4) "..getBossName("Ner'zhul", 1160), 1160 },
		{ WHIT..INDENT..getBossName("Ritual of Bones", 1160, 2), 1160 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "What's Your Sign?", "ac=9018" },
		{ "Icky Ichors", "ac=9025" },
		{ "Souls of the Lost", "ac=9026" },
		{ "Shadowmoon Burial Grounds", "ac=9041" },
		{ "Heroic: Shadowmoon Burial Grounds", "ac=9054" },
		{ "Heroic: Shadowmoon Burial Grounds Guild Run", "ac=9375" },
		{ "Mythic: Shadowmoon Burial Grounds", "ac=10084" },
		{ "Shadowmoon Burial Grounds Challenger", "ac=8883" },
		{ "Shadowmoon Burial Grounds: Bronze", "ac=8884" },
		{ "Shadowmoon Burial Grounds: Silver", "ac=8885" },
		{ "Shadowmoon Burial Grounds: Gold", "ac=8886" },
	},
	Skyreach = {
		ZoneName = { BZ["Skyreach"] },
		Location = { BZ["Spires of Arak"] },
		DungeonID = 779,
		DungeonHeroicID = 780,
		DungeonMythicID = 1010,
		Acronym = L["SR"],
		WorldMapID = 601,
		JournalInstanceID = 476,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ WHIT.." 1) "..getBossName("Ranjit", 965), 965 },
		{ WHIT.." 2) "..getBossName("Araknath", 966), 966 },
		{ WHIT..INDENT..getBossName("Arakkoa Sun Construct Prototype", 966, 2), 966 },
		{ WHIT.." 3) "..getBossName("Rukhran", 967), 967 },
		{ WHIT..INDENT..getBossName("Solar Flare", 967, 2), 967 },
		{ WHIT.." 4) "..getBossName("High Sage Viryx", 968)..L_PAREN..UPPER..R_PAREN, 968 },
		{ WHIT..INDENT..getBossName("Arakkoa Shield Construct", 968, 3), 968 },
		{ WHIT..INDENT..getBossName("Arakkoa Solar Zealot", 968, 2), 968 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Ready for Raiding IV", "ac=9033" },
		{ "Magnify... Enhance", "ac=9034" },
		{ "I Saw Solis", "ac=9035" },
		{ "Monomania", "ac=9036" },
		{ "Skyreach", "ac=8843" },
		{ "Heroic: Skyreach", "ac=8844" },
		{ "Heroic: Skyreach Guild Run", "ac=9372" },
		{ "Mythic: Skyreach", "ac=10081" },
		{ "Skyreach Challenger", "ac=8871" },
		{ "Skyreach: Bronze", "ac=8872" },
		{ "Skyreach: Silver", "ac=8873" },
		{ "Skyreach: Gold", "ac=8874" },
	},
	BlackrockMountainEnt = {
		ZoneName = { BZ["Blackrock Mountain"]..L_PAREN..ENTRANCE..R_PAREN },
		Location = { BZ["Searing Gorge"]..SLASH..BZ["Burning Steppes"] },
		LevelRange = "49-100+",
		MinLevel = "47",
		PlayerLimit = { 5, 10, 25, 40 },
		Acronym = L["BRM"],
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..BZ["Searing Gorge"], 10001 },
		{ BLUE.." B) "..BZ["Burning Steppes"], 10002 },
		{ BLUE.." C) "..BZ["Blackrock Depths"], 10003 },
		{ BLUE.." D) "..BZ["Lower Blackrock Spire"], 10004 },
		{ BLUE..INDENT..BZ["Upper Blackrock Spire"] },
		{ GREN..INDENT..L["Bodley"]..L_PAREN..L["Ghost"]..R_PAREN },
		{ BLUE.." E) "..BZ["The Molten Core"], 10005 },
		{ GREN..INDENT..L["Lothos Riftwaker"] },
		{ BLUE.." F) "..BZ["Blackwing Lair"], 10006 },
		{ GREN..INDENT..L["Orb of Command"] },
		{ BLUE.." G) "..BZ["Blackrock Caverns"], 10007 },
		{ ORNG.." 1) "..L["Scarshield Quartermaster <Scarshield Legion>"]..L_PAREN..UPPER..R_PAREN, 10008 },
		{ ORNG.." 2) "..L["The Behemoth"]..L_PAREN..RARE..COMMA..WANDERS..R_PAREN, 10009 },
		{ ORNG.." 3) "..Atlas:GetBossName("Overmaster Pyron")..L_PAREN..WANDERS..R_PAREN, 10010 },
		{ GREN.." 1') "..L["Meeting Stone"]..L_PAREN..BZ["Blackrock Depths"]..R_PAREN, 10011 },
		{ GREN.." 2') "..L["Meeting Stone"]..L_PAREN..BZ["Lower Blackrock Spire"]..COMMA..BZ["Upper Blackrock Spire"]..R_PAREN, 10012 },
	},
	UpperBlackrockSpire = {
		ZoneName = { BZ["Blackrock Mountain"]..COLON..BZ["Upper Blackrock Spire"] },
		Location = { BZ["Searing Gorge"]..SLASH..BZ["Burning Steppes"] },
		DungeonID = 828,
		DungeonHeroicID = 860,
		DungeonMythicID = 1004,
		Acronym = L["UBRS"],
		WorldMapID = 616,
		JournalInstanceID = 559,
		Module = "Atlas_WarlordsofDraenor",
		{ BLUE.." A) "..ENTRANCE, 10001 },
		{ BLUE.." B-C) "..CONNECTION, 10002 },
		{ WHIT.." 1) "..getBossName("Orebender Gor'ashan", 1226), 1226 },
		{ WHIT.." 2) "..getBossName("Kyrak", 1227), 1227 },
		{ WHIT..INDENT..getBossName("Drakonid Monstrosity", 1227, 2), 1227 },
		{ WHIT.." 3) "..getBossName("Commander Tharbek", 1228), 1228 },
		{ WHIT..INDENT..getBossName("Black Iron Guard", 1228, 3), 1228 },
		{ WHIT..INDENT..getBossName("Ironbarb Skyreaver", 1228, 2), 1228 },
		{ WHIT.." 4) "..getBossName("Ragewing the Untamed", 1229), 1229 },
		{ WHIT..INDENT..getBossName("Ragewind Whelp", 1229, 2), 1229 },
		{ WHIT.." 5) "..getBossName("Warlord Zaela", 1234), 1234 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..COLON },
		{ "Magnets, How Do They Work?", "ac=9045" },
		{ "Leeeeeeeeeeeeeroy...?", "ac=9058" },
		{ "Bridge Over Troubled Fire", "ac=9056" },
		{ "Dragonmaw? More Like Dragonfall!", "ac=9057" },
		{ "Upper Blackrock Spire", "ac=9042" },
		{ "Heroic: Upper Blackrock Spire", "ac=9055" },
		{ "Heroic: Upper Blackrock Spire Guild Run", "ac=9376" },
		{ "Mythic: Upper Blackrock Spire", "ac=10085" },
		{ "Upper Blackrock Spire Challenger", "ac=8891" },
		{ "Upper Blackrock Spire: Bronze", "ac=8892" },
		{ "Upper Blackrock Spire: Silver", "ac=8893" },
		{ "Upper Blackrock Spire: Gold", "ac=8894" },
	},
}

-- Atlas Map NPC Description Data
db.AtlasMaps_NPC_DB = {
--************************************************
-- Warlords of Draenor Instances
--************************************************
	Auchindoun = {
		{ 1, 1185, 70, 153 }, -- Vigilant Kaathar
		{ 2, 1186, 250, 348 }, -- Soulbinder Nyami
		{ 3, 1216, 428, 152 }, -- Azzakel
		{ 4, 1225, 250, 153 }, -- Teron'gor
		{ "A", 10001, 258, 491},
	},
	BlackrockFoundryA = {
		{ 1, 1161, 349, 158 }, -- Gruul
		{ 2, 1202, 341, 351 }, -- Oregorger
		{ 3, 1122, 241, 269 }, -- Beastlord Darmac
		{ 6, 1147, 153, 128 }, -- Operator Thogar
		{ 7, 1154, 383, 262 }, -- The Blast Furnace
		{ 10, 959, 44, 139 }, -- Blackhand
		{ "A", 10001, 92, 432 },
		{ "B", 10002, 128, 368 },
		{ "B", 10002, 469, 266 },
		{ "C", 10002, 50, 333 },
	},
	BlackrockFoundryB = {
		{ 4, 1123, 32, 370 }, -- Flamebender Ka'graz
		{ 5, 1155, 217, 369 }, -- Hans'gar and Franzok
		{ 8, 1162, 127, 231 }, -- Kromog
		{ 9, 1203, 437, 166 }, -- The Iron Maidens
		{ "C", 10001, 222, 294},
	},
	BloodmaulSlagMines = {
		{ 1, 893, 31, 307 }, -- Magmolatus
		{ 2, 888, 321, 331 }, -- Slave Watcher Crushto
		{ 3, 887, 232, 186 }, -- Roltall
		{ 4, 889, 371, 115 }, -- Gug'rokk
		{ "A", 10001, 269, 488},
	},
	TheEverbloomA = {
		{ 1, 1214, 201, 303 }, -- Witherbark
		{ 2, 1207, 316, 118 }, -- Ancient Protectors
		{ 3, 1208, 232, 187 }, -- Archmage Sol
		{ 4, 1209, 260, 52 }, -- Xeri'tac
		{ "A", 10001, 381, 302},
		{ "B", 10002, 142, 183}, 
	},
	TheEverbloomB = {
        { "B", 10001, 248, 419 }, -- blue
        { "5", 1210, 249, 378 }, -- white
	},
	GrimrailDepot = {
		{ 1, 1138, 413, 207 }, -- Rocketspark and Borka
		{ 2, 1163, 257, 417 }, -- Nitrogg Thundertower
		{ 3, 1133, 159, 417 }, -- Skylord Tovra
		{ "A", 10001, 182, 75},
		{ "B", 10002, 422, 283},
		{ "B", 10002, 463, 419},
	},
	HellfireA = {
		{ 1, 1426, 276, 233}, -- Hellfire Assault
		{ 2, 1425, 150, 249}, -- Iron Reaver
		{ "A", 10001, 369, 227}, 
		{ "B", 10002, 118, 257},
	},
	HellfireB = {
		{ 3, 1372, 142, 184 },	-- Gorefiend
		{ 4, 1396, 239, 334 },	-- Kilrogg Deadeye
		{ 5, 1432, 319, 428 },	-- Hellfire High Council
		{ "B", 10001, 448, 190},
		{ "C", 10001, 325, 7},
	},
	HellfireC = {
		{ 6, 1392, 279, 247 }, -- Kormrok
		{ "C", 10001, 322, 346}, 
	},
	HellfireD = {
		{ 7, 1433, 103, 196 },	-- Shadow-Lord Iskar
		{ 8, 1391, 138, 51 },	-- Fel Lord Zakuun
		{ 9, 1447, 355, 132 },	-- Xhul'horac
		{ 10, 1427, 259, 350 },	-- Socrethar the Eternal
		{ 11, 1394, 124, 345 },	-- Tyrant Velhari
		{ "B", 10001, 184, 156},
		{ "C", 10001, 184, 192},
	},
	HellfireE = {
		{ 12, 1395, 276, 313 },	-- Mannoroth
	},
	HellfireF = { 
		{ 13, 1438, 297, 262 }, -- Archimonde
		{ "D", 10001, 113, 261}, 
	},
	HighmaulA = {
		{ 1, 1128, 347, 430 }, -- Kargath Bladefist
		{ 2, 971, 290, 272 }, -- The Butcher
		{ 3, 1195, 133, 377 }, -- Tectus
		{ 4, 1196, 238, 68 }, -- Brackenspore
		{ "A", 10001, 309, 398},
		{ "B", 10002, 138, 84},
	},
	HighmaulB = {
		{ 5, 1148, 162, 86 }, -- Twin Ogron
		{ 6, 1153, 94, 161 }, -- Ko'ragh
		{ 7, 1197, 390, 375 }, -- Imperator Mar'gok
		{ "B", 10001, 288, 231},
		{ "C", 10001, 60, 126},
		{ "C", 10001, 66, 448},
		{ "D", 10001, 143, 281},
		{ "D", 10001, 410, 179},
	},
	IronDocks = {
		{ 1, 1235, 231, 240 }, -- Fleshrender Nok'gar
		{ 2, 1236, 410, 391 }, -- Grimrail Enforcers
		{ 3, 1237, 410, 182 }, -- Oshir
		{ 4, 1238, 351, 273 }, -- Skulloc
		{ "A", 10001, 148, 275},
	},
	ShadowmoonBurialGrounds = {
		{ 1, 1139, 116, 205 }, -- Sadana Bloodfury
		{ 2, 1168, 187, 246 }, -- Nhallish
		{ 3, 1140, 318, 190 }, -- Bonemaw
		{ 4, 1160, 244, 370 }, -- Ner'zhul
		{ "A", 10001, 12, 240},
		{ "B", 10002, 249, 398},
		{ "B", 10002, 445, 239},
	},
	Skyreach = {
		{ 1, 965, 311, 164 }, -- Ranjit
		{ 2, 966, 233, 276 }, -- Araknath
		{ 3, 967, 177, 358 }, -- Rukhran
		{ 4, 968, 275, 214 }, -- High Sage Viryx
		{ "A", 10001, 303, 107},
	},
	BlackrockMountainEnt = {
		{ "A", 10001, 271, 182 },
		{ "B", 10002, 255, 498},
		{ "C", 10003, 158, 12},
		{ "D", 10004, 362, 308},
		{ "E", 10005, 220, 286},
		{ "F", 10006, 334, 419},
		{ "G", 10007, 432, 357},
		{ "1", 10008, 405, 356},
		{ "2", 10009, 136, 191},
		{ "3", 10010, 130, 33},
		{ "1'", 10011, 281, 350},
		{ "2'", 10012, 341, 391},
	},
	UpperBlackrockSpire = {
		{ 1, 1226, 193, 87 }, -- Orebender Gor'ashan
		{ 2, 1227, 251, 144 }, -- Kyrak
		{ 3, 1228, 361, 233 }, -- Commander Tharbek
		{ 4, 1229, 340, 331 }, -- Ragewing the Untamed
		{ 5, 1234, 110, 342 }, -- Warlord Zaela
		{ "A", 10001, 100, 192},
		{ "B", 10002, 50, 111},
		{ "B", 10002, 200, 37},
		{ "C", 10002, 192, 164},
		{ "C", 10002, 225, 313},
	},
}

--[[
	AssocDefaults{}

	Default map to be auto-selected when no SubZone data is available.

	For example, "Dire Maul" has a subzone called "Warpwood Quarter" located in East Dirl Maul, however, there are also 
	some areas which have not been named with any subzone, and we would like to pick a proper default map in this condition.

	Define this table entries only when the instance has multiple maps.

	Table index is zone name, it need to be localized value, but we will handle the localization with BabbleSubZone library.
	The table value is map's key-name.
]]
db.AssocDefaults = {
	[BZ["Blackrock Mountain"]] =		"BlackrockMountainEnt",
	[BZ["Blackrock Foundry"]] =		"BlackrockFoundryA",	-- WoD
	[BZ["Hellfire Citadel"]] =		"HellfireA",		-- WoD
	[BZ["Highmaul"]] =			"HighmaulA",		-- WoD
	[BZ["The Everbloom"]] =			"TheEverbloomA",	-- WoD
	[BZ["Hall of Blackhand"]] =		"UpperBlackrockSpire",
}

--[[
	SubZoneData{}

	Define SubZone data for default map to be selected for instance which has multiple maps.
	Subzone data should be able to be pulled out from WMOAreaTable for indoor areas, or from AreaTable for outdoor areas.

	Array Syntax: 
	["localized zone name"] = {
		["atlas map name"] = {
			["localized subzone name 1"],
			["localized subzone name 2"],
		},
	},
]]
db.SubZoneData = {
	-- Blackrock Spire
	[BZ["Hall of Blackhand"]] = {
		-- Upper Blackrock Spire
		["UpperBlackrockSpire"] = {
			BZ["Dragonspire Hall"],
			BZ["Hall of Binding"],
			BZ["The Rookery"],
			BZ["Hall of Blackhand"],
			BZ["Blackrock Stadium"],
			BZ["The Furnace"],
			BZ["Spire Throne"],
			BZ["The Molten Span"],
		},
	},
	-- Blackrock Foundry
	[BZ["Blackrock Foundry"]] = {
		-- Blackrock Foundry A
		["BlackrockFoundryA"] = {
			BZ["The Workshop"],
			BZ["Slagworks"],
			BZ["Gruul's Lair"],
			BZ["Blackrock Depository"],
			BZ["Iron Assembly"],
			BZ["The Breaking Grounds"],
			BZ["Foundry Terminus"],
			BZ["The Blast Furnace"],
			BZ["The Crucible"],
			BZ["The Iron Crucible"], --check
		},
		-- Blackrock Foundry B
		["BlackrockFoundryB"] = {
			BZ["The Black Forge"],
			BZ["Burning Font"],
			BZ["Slagmill Press"],
			BZ["The Great Anvil"],
			BZ["Dread Grotto"],
		},
	},
	-- Hellfire Citadel
	[BZ["Hellfire Citadel"]] = {
		-- HellfireA
		["HellfireA"] = {
			BZ["The Iron Bulwark"],
		},
		-- HellfireB
		["HellfireB"] = {
			BZ["Hellfire Antechamber"],
			BZ["Hellfire Passage"],
			BZ["Court of Blood"],
		},
		-- HellfireC
		["HellfireC"] = {
			BZ["Pits of Mannoroth"],
		},
		-- HellfireD
		["HellfireD"] = {
			BZ["Grommash's Torment"],
			BZ["The Felborne Breach"],
			BZ["Halls of the Sargerei"],
		},
		-- HellfireE
		["HellfireE"] = {
			BZ["Destructor's Rise"],
		},
		-- HellfireF
		["HellfireF"] = {
			BZ["The Black Gate"],
		},
	},
	-- Highmaul
	[BZ["Highmaul"]] = {
		-- Highmaul A
		["HighmaulA"] = {
			BZ["Gladiator's Rest"],
			BZ["The Coliseum"],
			BZ["Path of Victors"],
			BZ["The Underbelly"],
			BZ["The Imperator's Favor"],
			BZ["Market District"],
			BZ["Gorian Strand"],

		},
		-- Highmaul B
		["HighmaulB"] = {
			BZ["The Gorthenon"],
			BZ["Chamber of Nullification"],
			BZ["Imperator's Rise"],
			BZ["Throne of the Imperator"],
		},
	},
	-- The Everbloom
	[BZ["The Everbloom"]] = {
		-- The Everbloom A
		["TheEverbloomA"] = {
			BZ["Pools of Life"],
			BZ["Verdant Grove"],
			BZ["Xeri'tac's Burrow"],
			BZ["The Violet Bluff"],
		},
		-- The Everbloom B
		["TheEverbloomB"] = {
			BZ["Stormwind"],
		},
	},
}

--[[
	OutdoorZoneToAtlas{}

	Maps to auto-select to from outdoor zones.

	Table index is sub-zone name, it need to be localized value, but we will handle
	the localization with BabbleSubZone library.
	The table value is map's key-name.

	Duplicates are commented out.
	Not for localization.
]]
db.OutdoorZoneToAtlas = {
	[BZ["Talador"]] =	 		"Auchindoun",			-- WoD
	[BZ["Burning Steppes"]] = 		"BlackrockMountainEnt",
	[BZ["Searing Gorge"]] = 		"BlackrockMountainEnt",
	[BZ["Gorgrond"]] =	 		"BlackrockFoundryA",		-- WoD
	[BZ["Frostfire Ridge"]] =	 	"BloodmaulSlagMines",		-- WoD
	[BZ["Tanaan Jungle"]] = 		"HellfireA",			-- WoD
	[BZ["Nagrand"]] =		 	"HighmaulA",			-- WoD
	[BZ["Spires of Arak"]] =	 	"Skyreach",			-- WoD
}

-- Yes, the following two tables are redundant, but they're both here in case there's ever more than one entrance map for an instance
-- Entrance maps to instance maps
db.EntToInstMatches = {
	["BlackrockMountainEnt"] = 		{"UpperBlackrockSpire"},
}

-- Instance maps to entrance maps
db.InstToEntMatches = {
	["UpperBlackrockSpire"] =		{"BlackrockMountainEnt"},
}

-- Defines the instance which have multiple maps
-- Added only when the Entrance map is not available, for example, Ulduar do have entrance map, so no need to add it here
db.MapSeries = {
	["BlackrockFoundryA"] = 		{"BlackrockFoundryA", "BlackrockFoundryB" },
	["BlackrockFoundryB"] = 		{"BlackrockFoundryA", "BlackrockFoundryB" },
	["HellfireA"] = 			{"HellfireA", "HellfireB", "HellfireC", "HellfireD", "HellfireE", "HellfireF" },
	["HellfireB"] = 			{"HellfireA", "HellfireB", "HellfireC", "HellfireD", "HellfireE", "HellfireF" },
	["HellfireC"] = 			{"HellfireA", "HellfireB", "HellfireC", "HellfireD", "HellfireE", "HellfireF" },
	["HellfireD"] = 			{"HellfireA", "HellfireB", "HellfireC", "HellfireD", "HellfireE", "HellfireF" },
	["HellfireE"] = 			{"HellfireA", "HellfireB", "HellfireC", "HellfireD", "HellfireE", "HellfireF" },
	["HellfireF"] = 			{"HellfireA", "HellfireB", "HellfireC", "HellfireD", "HellfireE", "HellfireF" },
	["HighmaulA"] = 			{"HighmaulA", "HighmaulB" },
	["HighmaulB"] = 			{"HighmaulA", "HighmaulB" },
	["TheEverbloomA"] = 			{"TheEverbloomA", "TheEverbloomB" },
	["TheEverbloomB"] = 			{"TheEverbloomA", "TheEverbloomB" },
}

-- Links maps together that are part of the same instance
db.SubZoneAssoc = {
	["BlackrockFoundryA"] =			BZ["Blackrock Foundry"],
	["BlackrockFoundryB"] =			BZ["Blackrock Foundry"],
	["HellfireA"] = 			BZ["Hellfire Citadel"],
	["HellfireB"] = 			BZ["Hellfire Citadel"],
	["HellfireC"] = 			BZ["Hellfire Citadel"],
	["HellfireD"] = 			BZ["Hellfire Citadel"],
	["HellfireE"] = 			BZ["Hellfire Citadel"],
	["HellfireF"] = 			BZ["Hellfire Citadel"],
	["HighmaulA"] =				BZ["Highmaul"],
	["HighmaulB"] =				BZ["Highmaul"],
	["TheEverbloomA"] =			BZ["The Everbloom"],
	["TheEverbloomB"] =			BZ["The Everbloom"],
}

db.DropDownLayouts_Order = {
	[ATLAS_DDL_CONTINENT] = {
		ATLAS_DDL_CONTINENT_DRAENOR,
	},
	[ATLAS_DDL_LEVEL] = {
		ATLAS_DDL_LEVEL_35TO40,
	},
	[ATLAS_DDL_EXPANSION] = {
		ATLAS_DDL_EXPANSION_WOD,
	},
}

db.DropDownLayouts = {
	[ATLAS_DDL_CONTINENT] = {
		[ATLAS_DDL_CONTINENT_EASTERN] = {
			"BlackrockMountainEnt",		-- Classic WoW, Catalysm, Draenor
			"UpperBlackrockSpire",		-- Draenor
		},
		[ATLAS_DDL_CONTINENT_DRAENOR] = {
			"Auchindoun",
			"BlackrockFoundryA",
			"BlackrockFoundryB",
			"BloodmaulSlagMines",
			"TheEverbloomA",
			"TheEverbloomB",
			"GrimrailDepot",
			"HellfireA",
			"HellfireB",
			"HellfireC",
			"HellfireD",
			"HellfireE",
			"HellfireF",
			"HighmaulA",
			"HighmaulB",
			"IronDocks",
			"ShadowmoonBurialGrounds",
			"Skyreach",
		},
	},
	[ATLAS_DDL_EXPANSION] = {
		[ATLAS_DDL_EXPANSION_WOD] = {
			"Auchindoun",
			"BlackrockFoundryA",
			"BlackrockFoundryB",
			"BloodmaulSlagMines",
			"TheEverbloomA",
			"TheEverbloomB",
			"GrimrailDepot",
			"HellfireA",
			"HellfireB",
			"HellfireC",
			"HellfireD",
			"HellfireE",
			"HellfireF",
			"HighmaulA",
			"HighmaulB",
			"IronDocks",
			"ShadowmoonBurialGrounds",
			"Skyreach",
			"BlackrockMountainEnt",
			"UpperBlackrockSpire",
		},
	},
	[ATLAS_DDL_LEVEL] = {
		[ATLAS_DDL_LEVEL_35TO40] = {
			"Auchindoun",			-- Draenor
			"BloodmaulSlagMines",		-- Draenor
			"IronDocks",			-- Draenor
			"Skyreach",			-- Draenor
			"BlackrockFoundryA",		-- Draenor
			"BlackrockFoundryB",		-- Draenor
			"TheEverbloomA",		-- Draenor
			"TheEverbloomB",		-- Draenor
			"GrimrailDepot",		-- Draenor
			"HellfireA",			-- Draenor
			"HellfireB",			-- Draenor
			"HellfireC",			-- Draenor
			"HellfireD",			-- Draenor
			"HellfireE",			-- Draenor
			"HellfireF",			-- Draenor
			"HighmaulA",			-- Draenor
			"HighmaulB",			-- Draenor
			"ShadowmoonBurialGrounds",	-- Draenor
			"BlackrockMountainEnt",		-- Catalysm
			"UpperBlackrockSpire",		-- Draenor
		},
	},
	[ATLAS_DDL_PARTYSIZE] = {
		[ATLAS_DDL_PARTYSIZE_5] = {
			"Auchindoun",			-- Draenor
			"BloodmaulSlagMines",		-- Draenor
			"BlackrockMountainEnt",		-- Draenor
			"UpperBlackrockSpire",		-- Draenor
			"TheEverbloomA",		-- Draenor
			"TheEverbloomB",		-- Draenor
			"GrimrailDepot",		-- Draenor
			"IronDocks",			-- Draenor
			"ShadowmoonBurialGrounds",	-- Draenor
			"SiegeofNiuzaoTempleA",		-- Draenor
			"SiegeofNiuzaoTempleB",		-- Draenor
			"Skyreach",			-- Draenor
		},
		[ATLAS_DDL_PARTYSIZE_10] = {
			"BlackrockFoundryA",		-- Draenor
			"BlackrockFoundryB",		-- Draenor
			"HellfireA",			-- Draenor
			"HellfireB",			-- Draenor
			"HellfireC",			-- Draenor
			"HellfireD",			-- Draenor
			"HellfireE",			-- Draenor
			"HellfireF",			-- Draenor
			"HighmaulA",			-- Draenor
			"HighmaulB",			-- Draenor
		},
		[ATLAS_DDL_PARTYSIZE_20TO40] = {
			"BlackrockFoundryA",		-- Draenor
			"BlackrockFoundryB",		-- Draenor
			"HellfireA",			-- Draenor
			"HellfireB",			-- Draenor
			"HellfireC",			-- Draenor
			"HellfireD",			-- Draenor
			"HellfireE",			-- Draenor
			"HellfireF",			-- Draenor
			"HighmaulA",			-- Draenor
			"HighmaulB",			-- Draenor
		},
	},
	[ATLAS_DDL_TYPE] = {
		[ATLAS_DDL_TYPE_INSTANCE] = {
			"Auchindoun",			-- Draenor
			"BlackrockFoundryA",		-- Draenor
			"BlackrockFoundryB",		-- Draenor
			"BloodmaulSlagMines",		-- Draenor
			"UpperBlackrockSpire",		-- Draenor
			"TheEverbloomA",		-- Draenor
			"TheEverbloomB",		-- Draenor
			"GrimrailDepot",		-- Draenor
			"HellfireA",			-- Draenor
			"HellfireB",			-- Draenor
			"HellfireC",			-- Draenor
			"HellfireD",			-- Draenor
			"HellfireE",			-- Draenor
			"HellfireF",			-- Draenor
			"HighmaulA",			-- Draenor
			"HighmaulB",			-- Draenor
			"IronDocks",			-- Draenor
			"ShadowmoonBurialGrounds",	-- Draenor
			"Skyreach",			-- Draenor
		},
		[ATLAS_DDL_TYPE_ENTRANCE] = {
			"BlackrockMountainEnt",		-- Draenor
		},
	},
}
