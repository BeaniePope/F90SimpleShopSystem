/*
    Author: Queen

    Description:
        Sell item from player inventory 

    Parameter(s):
        _item -  Item being sold. [ARRAY]
        _shop - shop buying the item [OBJECT]

    Returns:
        Nothing.
*/
params["_item", "_shop"];

private _seller = player;

if (isNil {_item}) exitWith {[Shop_Debug, "sellItem", "(ERROR) Function was not executed. Provided item does not exist", true, true] call F90_fnc_debug};

if (isNil {_shop}) exitWith {[Shop_Debug, "sellItem", "(ERROR) Function was not executed. Provided shop does not exist", true, true] call F90_fnc_debug};

private _balance = [_seller] call F90_fnc_getMoney;
// Get item's value 
private _itemValue = _item select 3;
//Get Item Name
private _itemName = _item select 1;

private _itemClass = _item select 0;

private _sold = [_itemClass, _seller] call F90_fnc_removeItemFromUnit;

if (_itemValue < 0) exitWith {[Shop_Debug, "sellItem", "(ERROR) Function was not executed. How did you manage this? Item value was negative.", true, true] call F90_fnc_debug};

if (_sold) then 
{
    // Add money to player 
    [_seller, _itemValue] call F90_fnc_addMoney;

    //Adds Item to shop
    [_itemClass, _shop] call F90_fnc_addItemToUnit;
    
    // Notify player 
    private _itemName = _item select 1;
    [format ["You have sold %1 for %2 %3", _itemName, _itemValue, Economy_CurrencyName]] call F90_fnc_textNotification;

    
} else 
{
    [format ["You do not have any %1", _itemName], "ERROR"] call F90_fnc_textNotification;
    
};
