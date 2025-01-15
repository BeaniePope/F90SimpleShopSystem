/*
    Author: Queen

    Description:
        Sell item from player inventory 

    Parameter(s):
        _money - Money being added to player. [INTEGER]
        _item -  Item being sold. [STRING]
        _unit - unit selling item [OBJECT]
        _shop - shop buying the item [OBJECT]

    Returns:
        Nothing.
*/
params["_item", "_seller", "_shop"]


if (isNil {_seller}) exitWith {[Shop_Debug, "sellItem", "(ERROR) Function was not executed. Provided unit does not exist", true, true] call F90_fnc_debug};
if (isNil {_item}) exitWith {[Shop_Debug, "sellItem", "(ERROR) Function was not executed. Provided item does not exist", true, true] call F90_fnc_debug};



private _balance = [_seller] call F90_fnc_getMoney;
// Get item's value 
private _itemValue = _item select 4;
//Get Item Name
private _itemName = _item selet 1;

private _itemClass = _item select 0;

private _sold = [_itemClass, _seller] call F90_fnc_removeItemFromUnit;

if (_itemValue < 0) exitWith {[Shop_Debug, "sellItem", "(ERROR) Function was not executed. How did you manage this? Item value was negative.", true, true] call F90_fnc_debug};

if (_sold) then 
{
    // Add money to player 
    [_seller, _itemValue] call F90_fnc_addMoney;

    //Adds Item to shop
    [_shop, _itemClass]
    
    // Notify player 
    private _itemName = _item select 1;
    [format ["You have sold %1 for %2 %3", _itemName, _itemValue, Economy_CurrencyName]] call F90_fnc_textNotification;
} else 
{
    ["You do not have %1", _itemName] call F90_fnc_textNotification;
    // Close dialog
    if (dialog) then {closeDialog 2};
};
