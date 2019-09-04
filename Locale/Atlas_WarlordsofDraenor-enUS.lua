-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2019 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

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

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_WarlordsofDraenor", "enUS", true, true);
if L then
--@localization(locale="enUS", format="lua_additive_table")@
--@do-not-package@
--************************************************
-- Zone Names, Acronyms, and Common Strings
--************************************************
	--WoD Acronyms
	L["BRF"] = "BRF"; -- Blackrock Foundry
	L["BSM"] = "BSM"; -- Bloodmaul Slag Mines
	L["EB"] = "EB"; -- The Everbloom
	L["GD"] = "GD"; -- Grimrail Depot
	L["HM"] = "HM"; -- Highmaul
	L["ID"] = "ID"; -- Iron Docks
	L["SBG"] = "SBG"; -- Shadowmoon Burial Grounds
	L["SR"] = "SR"; -- Skyreach
	L["UBRS"] = "UBRS"; -- Upper Blackrock Spire

--************************************************
-- Warlords of Draenor Instances
--************************************************

	--Auchindoun

	--Blackrock Foundry

	--Bloodmaul Slag Mines

	--The Everbloom

	--Grimrail Depot
	L["Train Ride"] = "Train Ride";

	--Highmaul

	--Iron Docks

	--Shadowmoon Burial Grounds

	--Skyreach

	--Upper Blackrock Spire

--@end-do-not-package@
end