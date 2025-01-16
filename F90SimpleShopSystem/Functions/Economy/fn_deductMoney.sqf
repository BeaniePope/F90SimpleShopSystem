/*
    Author: PrinceF90

    Description:
        This function deducts a specified amount of money from the current money balance of a unit.

    Parameter(s):
        _unit - The unit from which the money amount is deducted. [OBJECT]
        _amount - The amount to be deducted from the current money balance. [SCALAR]

    Returns:
        _money - The updated money amount after deducting the specified amount.
*/
params ["_unit", "_amount"];

if (isNil {_unit}) exitWith {[Shop_Debug, "deductMoney", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNull _unit) exitWith {[Shop_Debug, "deductMoney", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNil {_amount}) then {_amount = 0};

private _money = [_unit] call F90_fnc_getMoney;

if (_amount > _money) then 
{
    _amount = _money;
    diag_log "name of the idiot who lost all his money:" + " " + str _unit;
};


for "_i" from 1 to _amount do 
{
    player removeMagazine Economy_CurrencyClass
};

_money