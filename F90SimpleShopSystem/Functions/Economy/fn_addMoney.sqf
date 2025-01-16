/*
    Author: PrinceF90

    Editor: Queen

    Description:
        This function adds a specified amount of money to the current money balance of a unit.
        Modified to work with physical money.

    Parameter(s):
        _unit - The unit for which the money amount is updated. [OBJECT]
        _amount - The amount to be added to the current money balance. [SCALAR]

    Returns:
        nothing
*/
params ["_unit", "_amount"];

if (isNil {_unit}) exitWith {[Shop_Debug, "addMoney", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNull _unit) exitWith {[Shop_Debug, "addMoney", "(ERROR) Function not executed. Provided unit is not exist", true, true] call F90_fnc_debug};
if (isNil {_amount}) then {_amount = 0};


for "_i" from 1 to _amount do 
{
    player addItem Economy_CurrencyClass;
};


