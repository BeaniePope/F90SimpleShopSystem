/*
    Author: PrinceF90

    Description:
        Configuration file defining shop inventory items and shop data for a F90 Simple Shop System.

    Parameter(s):
        None

    Returns:
        None
*/
// Configuration file for shop system

// True to log debug messages
Shop_Debug = true;
// List of shop inventory. 
// Format ARRAY["className", "displayName", price, value]

// Format ARRAY["className", "displayName", price, value]
SSS_Shop0Items = 
[
    ["30Rnd_65x39_caseless_mag", "6.5 mm 30Rnd Sand Mag", 10, 3],
    ["30Rnd_65x39_caseless_khaki_mag", "6.5 mm 30Rnd Khaki Mag", 10, 3],
    ["30Rnd_65x39_caseless_black_mag", "6.5 mm 30Rnd Black Mag", 10, 3],
    ["30Rnd_556x45_Stanag", "5.56 mm 30rnd Reload Tracer (Yellow) Mag", 12, 4],
    ["30Rnd_556x45_Stanag_green", "5.56 mm 30rnd Reload Tracer (Green) Mag", 12, 4],
    ["30Rnd_556x45_Stanag_red", "5.56 mm 30rnd Reload Tracer (Red) Mag", 12, 4],
    ["30Rnd_556x45_Stanag_Tracer_Red", "5.56 mm 30rnd Tracer (Red) Mag", 15, 7],
    ["30Rnd_556x45_Stanag_Tracer_Green", "5.56 mm 30rnd Tracer (Green) Mag", 15, 7],
    ["30Rnd_556x45_Stanag_Tracer_Yellow", "5.56 mm 30rnd Tracer (Yellow) Mag", 15, 7]
];

/*
    Shop data. Format ARRAY:[object, "ShopName", [items], "function", "icon"]. 
    - STRING:function is a function to execute when player click purchase. 
      Function must have ``params ["_item"];`` on top of the script.
    - STRING:icon is optional. Default is "fmarker_Shop"
*/

SSS_ItemShop = [shop_0, "Item Shop", SSS_Shop2Items, "F90_fnc_purchaseItem", "fmarker_Shop", "F90_fnc_sellItem"];

// All Shops. Add your shop here
SSS_AllShops = 
[
    SSS_ItemShop
];