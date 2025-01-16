/*
    Author: PrinceF90

    Description:
        Initializes a shop menu for a player, displays shop data, allows the player to make purchases, and handles post-menu cleanup.

    Parameter(s):
        _shop - The shop object containing shop data. [OBJECT]
        _buyer - The player object who is buying from the shop. [OBJECT]

    Returns:
        None
*/
params ["_shop", "_buyer"];

// Close any open dialog
if (dialog) then {closeDialog 2};

// Create shop menu
createDialog "shopMenu";

// Extract shop data from shop
private _shopData = _shop getVariable "SSS_ShopData";

// Acquire shop class
_buyer setVariable ["SSS_shopObject", _shop, true];

// Set Shop Name 
private _shopName = _shopData select 1;
ctrlSetText [ShopMenu_NameTextIDC, _shopName];

// Set player's balance
private _balanceText = [_buyer, true] call F90_fnc_getMoney;
ctrlSetText [ShopMenu_BalanceTextIDC, _balanceText];



// Populate Listbox 
private _inventory = _shopData select 2;
private _contents = [];
{
    private _itemName = _x select 1;
    private _itemPrice = _x select 2;
    private _itemValue = _x select 3;
    private _item = format ["[%1%2]     %3", Economy_CurrencySymbol, _itemPrice, _itemName, _itemValue];
    _contents pushBack _item;
} forEach _inventory;
[ShopMenu_ItemsListboxIDC, _contents, 0] call F90_fnc_populateListBox;
private _contents = [];
{
    private _itemValue = _x select 3;
    private _item = format ["Value:%2%1", _itemValue, Economy_CurrencySymbol];
    _contents pushBack _item;
} forEach _inventory;
[ShopMenu_ItemsValueListboxIDC, _contents, 0] call F90_fnc_populateListBox;

// Store shop inventory array and purchased item into buyer
_buyer setVariable ["SSS_ShopInventory", _inventory, true];

// Button function
(findDisplay ShopMenu_MenuIDD) displayCtrl ShopMenu_PurchaseButton ctrlAddEventHandler ["ButtonDown", 
{
    // Extract inventory array from player (assume the buyer is player)
    private _shopInventory = player getVariable "SSS_ShopInventory";

    // Get the data of the selected item
    private _selectedItem = _shopInventory select (lbCurSel ShopMenu_ItemsListboxIDC);

    // Execute purchase function
    [_selectedItem] remoteExec ["F90_fnc_purchaseItem", player];
    
    private _balanceText = [player, true] call F90_fnc_getMoney;
    ctrlSetText [ShopMenu_BalanceTextIDC, _balanceText];
}];

(findDisplay ShopMenu_MenuIDD) displayCtrl ShopMenu_SellButton ctrlAddEventHandler ["ButtonDown", 
{
    // Extract inventory array from player (assume the seller is player)
    private _shopInventory = player getVariable "SSS_ShopInventory";
    private _shopObject = player getVariable "SSS_shopObject";
    // Get the data of the selected item
    private _selectedItem = _shopInventory select (lbCurSel ShopMenu_ItemsListboxIDC);

    // Execute purchase function
    [_selectedItem, _shopObject] remoteExec ["F90_fnc_sellItem", player];

    private _balanceText = [player, true] call F90_fnc_getMoney;
    ctrlSetText [ShopMenu_BalanceTextIDC, _balanceText];

}];

(findDisplay ShopMenu_MenuIDD) displayCtrl ShopMenu_SellButton ctrlAddEventHandler ["MouseMoving", 
{
    private _balanceText = [player, true] call F90_fnc_getMoney;
    ctrlSetText [ShopMenu_BalanceTextIDC, _balanceText];
}];

(findDisplay ShopMenu_MenuIDD) displayCtrl ShopMenu_PurchaseButton ctrlAddEventHandler ["MouseMoving", 
{
    private _balanceText = [player, true] call F90_fnc_getMoney;
    ctrlSetText [ShopMenu_BalanceTextIDC, _balanceText];
}];


// Code to execute after menu closed
(findDisplay ShopMenu_MenuIDD) displayAddEventHandler ["Unload",
{
    // Reset unused variables to prevent any possible data leak
    _buyer setVariable ["SSS_ShopInventory", nil, true];
    _buyer setVariable ["SSS_PurchaseFunction", nil, true];
    _buyer setVariable ["SSS_SellFunction", nil, true];
}];
