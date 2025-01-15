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
Shop_Debug = false;
// List of shop inventory. 
// Format ARRAY["className", "displayName", price, value]
SSS_Shop0Items =
[
    ["arifle_MX_F", "MX 6.5mm", 500, 150],
    ["arifle_Mk20_plain_F", "Mk20 5.56 mm", 500, 150],
    ["arifle_Mk20_F", "Mk20 5.56 mm (Camo)", 550, 175]
];
// Format ARRAY["className", "displayName", price, value]
SSS_Shop1Items = 
[
    ["B_MRAP_01_F", "Hunter", 1000, 600],
    ["B_G_Offroad_01_F", "Offroad", 800, 200],
    ["B_Quadbike_01_F", "Quad Bike", 500, 150]
];
// Format ARRAY["className", "displayName", price, value]
SSS_Shop2Items = 
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
SSS_WeaponShop = [shop_0, "Weapon Shop", SSS_Shop0Items, "F90_fnc_purchaseWeapon", "fmarker_Shop"];
SSS_VehicleShop = [shop_1, "Vehicle Shop", SSS_Shop1Items, "F90_fnc_purchaseVehicle", "fmarker_Shop"];
SSS_ItemShop = [shop_2, "Item Shop", SSS_Shop2Items, "F90_fnc_purchaseItem", "fmarker_Shop", "F90_fnc_sellItem"];

// All Shops. Add your shop here
SSS_AllShops = 
[
    SSS_WeaponShop,
    SSS_VehicleShop,
    SSS_ItemShop
];