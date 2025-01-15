/*
    Author: PrinceF90 

    Editor: Queen

    Description:
        Same as engine's removeItem, but will return false if item can't be removed from unit due to some reasons like full inventory.
        Literally Prince's addItem but barely changed.

    Parameter(s):
        _item - The item to be added to the unit's loadout. [ANY]
        _unit - The unit to which the item will be added. [OBJECT]

    Returns:
        _itemRemoved - A boolean indicating whether the item was successfully added (true) or not (false).
*/
params ["_item", "_unit"];

private _oldLoadout = getUnitLoadout _unit;

_unit removeItem _item;
sleep 0.1;
private _newUnitLoadout = getUnitLoadout _unit;

private _itemRemoved = false;
if !(_oldLoadout isEqualTo _newUnitLoadout) then 
{
    _itemRemoved = true;
};

_itemRemoved