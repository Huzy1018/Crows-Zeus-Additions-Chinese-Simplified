/*/////////////////////////////////////////////////
Author: Crowdedlight
			   
File: fn_animalFollowZeus.sqf
Parameters: position ASL and unit clicked
Return: none

Creates an animal that follows the player while it is alive

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_unit",objNull,[objNull]]];

if (isNull _unit) exitWith { };

// open dialog
//ZEN
private _onConfirm =
{
	params ["_dialogResult","_in"];
	_dialogResult params
	[
		"_animalType",
		"_amount"
	];
	//Get in params again
	_in params [["_pos",[0,0,0],[[]],3], ["_unit",objNull,[objNull]]];
	if (isNull _unit) exitWith { _return; };

	//spawn script with animal type
	[_animalType, _unit, _amount] call crowsZA_fnc_animalFollow;
};
[
	"Select Animal Type", 
	[
		["COMBO","Animal",[["Dog", "Sheep", "Goat", "Rabbit", "Hen", "Snake"], ["Dog", "Sheep", "Goat", "Rabbit", "Hen", "Snake"],0]],
		["SLIDER","Amount",[0,20,1,0]] //0 to 20, default 1 and showing 0 decimal
	],
	_onConfirm,
	{},
	_this
] call zen_dialog_fnc_create;
