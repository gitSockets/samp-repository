#include "a_samp"

// external string color
// Additional string colors
#define COLOR_CYANBLUE 0x00BFFF00 // Deep Sky Blue
#define COLOR_DEEPPURPLE 0x673AB7FF // Deep Purple
#define COLOR_LAVENDERPURPLE 0xE6E6FAFF // Lavender
#define COLOR_LIGHTORANGE 0xFFDAB9FF // Peach Puff
#define COLOR_SANDYBROWN 0xF4A460FF // Sandy Brown
#define COLOR_MIDNIGHTBLACK 0x101820FF // Midnight Black
#define COLOR_SKIN 0xFDDBB0FF // Skin Color
#define COLOR_DARKPEACH 0xD18F4CFF // Dark Peach
#define COLOR_BRIGHTGREEN 0x00FF00FF // Bright Green
#define COLOR_RICHGOLD 0xFFD700FF // Rich Gold
#define COLOR_MYSTICBLUE 0x5B9BD5FF // Mystic Blue
#define COLOR_VERMILION 0xE63946FF // Vermilion
#define COLOR_ROSE 0xFF007F00 // Rose Red
#define COLOR_TURQUOISEBLUE 0x40E0D0FF // Turquoise Blue
#define COLOR_NEONPINK 0xFF10F0FF // Neon Pink
#define COLOR_EMERALD 0x50C878FF // Emerald Green
#define COLOR_LAVENDERBLUSH 0xFFF0F5FF // Lavender Blush
#define COLOR_PERSIMMON 0xEC5800FF // Persimmon
#define COLOR_DUSTYROSE 0xD9A5A0FF // Dusty Rose
#define COLOR_AQUABRIGHT 0x00CED1FF // Bright Aqua
#define COLOR_ACTIVEBORDER 0xB4B4B4FF // Border color when active
#define COLOR_ACTIVECAPTION 0x99B4D1FF // Caption color when active
#define COLOR_ACTIVECAPTIONTEXT 0x000000FF // Text color in active caption
#define COLOR_APPWORKSPACE 0xABABABFF // Workspace color for applications
#define COLOR_CONTROL 0xF0F0F0FF // Default control color
#define COLOR_CONTROLDARK 0xA0A0A0FF // Darker shade of control color
#define COLOR_CONTROLDARKDARK 0x696969FF // Darkest shade of control color
#define COLOR_CONTROLLIGHT 0xE3E3E3FF // Lighter shade of control color
#define COLOR_CONTROLLIGHTLIGHT 0xFFFFFFFF // Lightest shade of control color
#define COLOR_CONTROLTEXT 0x000000FF // Text color for controls
#define COLOR_DESKTOP 0x000000FF // Desktop background color
#define COLOR_GRAYTEXT 0x808080FF // Gray text color
#define COLOR_HIGHLIGHT 0x3399FFFF // Highlight color for selections
#define COLOR_HIGHLIGHTTEXT 0xFFFFFFFF // Text color for highlighted items
#define COLOR_HOTTRACK 0x0066CCFF // Color for hot-tracked items
#define COLOR_INACTIVEBORDER 0xF4F7FCFF // Border color when inactive
#define COLOR_INACTIVECAPTION 0xBFCDDBFF // Caption color when inactive
#define COLOR_INACTIVECAPTIONTEXT 0x434E54FF // Text color in inactive caption
#define COLOR_INFO 0xFFFFE1FF // Info color for tooltips
#define COLOR_INFOTEXT 0x000000FF // Text color for info tooltips
#define COLOR_MENU 0xF0F0F0FF // Menu background color
#define COLOR_MENUTEXT 0x000000FF // Text color in menus
#define COLOR_SCROLLBAR 0xC8C8C8FF // Color for scrollbars
#define COLOR_WINDOW 0xFFFFFFFF // Default window color
#define COLOR_WINDOWFRAME 0x646464FF // Frame color for windows
#define COLOR_WINDOWTEXT 0x000000FF // Text color in windows
#define COLOR_TRANSPARENT 0xFFFFFF00 // Transparent color
#define COLOR_ALICEBLUE 0xF0F8FFFF // Light blue color
#define COLOR_ANTIQUEWHITE 0xFAEBD7FF // Antique white color
#define COLOR_AQUA 0x00FFFFFF // Aqua color
#define COLOR_AQUAMARINE 0x7FFFD4FF // Aquamarine color
#define COLOR_AZURE 0xF0FFFFFF // Azure color
#define COLOR_BEIGE 0xF5F5DCFF // Beige color
#define COLOR_BISQUE 0xFFE4C4FF // Bisque color
#define COLOR_BLACK 0x000000FF // Black color
#define COLOR_BLANCHEDALMOND 0xFFEBCDFF // Blanched almond color
#define COLOR_BLUE 0x0000FFFF // Blue color
#define COLOR_BLUEVIOLET 0x8A2BE2FF // Blue violet color
#define COLOR_BROWN 0xA52A2AFF // Brown color
#define COLOR_BURLYWOOD 0xDEB887FF // Burlywood color
#define COLOR_CADETBLUE 0x5F9EA0FF // Cadet blue color
#define COLOR_CHARTREUSE 0x7FFF00FF // Chartreuse color
#define COLOR_CHOCOLATE 0xD2691EFF // Chocolate color
#define COLOR_CORAL 0xFF7F50FF // Coral color
#define COLOR_CORNFLOWERBLUE 0x6495EDFF // Cornflower blue color
#define COLOR_CORNSILK 0xFFF8DCFF // Cornsilk color
#define COLOR_CRIMSON 0xDC143CFF // Crimson color
#define COLOR_CYAN 0x00FFFFFF // Cyan color
#define COLOR_DARKBLUE 0x00008BFF // Dark blue color
#define COLOR_DARKCYAN 0x008B8BFF // Dark cyan color
#define COLOR_DARKGOLDENROD 0xB8860BFF // Dark goldenrod color
#define COLOR_DARKGRAY 0xA9A9A9FF // Dark gray color
#define COLOR_DARKGREEN 0x006400FF // Dark green color
#define COLOR_DARKKHAKI 0xBDB76BFF // Dark khaki color
#define COLOR_DARKMAGENTA 0x8B008BFF // Dark magenta color
#define COLOR_DARKOLIVEGREEN 0x556B2FFF // Dark olive green color
#define COLOR_DARKORANGE 0xFF8C00FF // Dark orange color
#define COLOR_DARKORCHID 0x9932CCFF // Dark orchid color
#define COLOR_DARKRED 0x8B0000FF // Dark red color
#define COLOR_DARKSALMON 0xE9967AFF // Dark salmon color
#define COLOR_DARKSEAGREEN 0x8FBC8BFF // Dark sea green color
#define COLOR_DARKSLATEBLUE 0x483D8BFF // Dark slate blue color
#define COLOR_DARKSLATEGRAY 0x2F4F4FFF // Dark slate gray color
#define COLOR_DARKTURQUOISE 0x00CED1FF // Dark turquoise color
#define COLOR_DARKVIOLET 0x9400D3FF // Dark violet color
#define COLOR_DEEPPINK 0xFF1493FF // Deep pink color
#define COLOR_DEEPSKYBLUE 0x00BFFFFF // Deep sky blue color
#define COLOR_DIMGRAY 0x696969FF // Dim gray color
#define COLOR_DODGERBLUE 0x1E90FFFF // Dodger blue color
#define COLOR_FIREBRICK 0xB22222FF // Firebrick color
#define COLOR_FLORALWHITE 0xFFFAF0FF // Floral white color
#define COLOR_FORESTGREEN 0x228B22FF // Forest green color
#define COLOR_FUCHSIA 0xFF00FFFF // Fuchsia color
#define COLOR_GAINSBORO 0xDCDCDCFF // Gainsboro color
#define COLOR_GHOSTWHITE 0xF8F8FFFF // Ghost white color
#define COLOR_GOLD 0xFFD700FF // Gold color
#define COLOR_GOLDENROD 0xDAA520FF // Goldenrod color
#define COLOR_GRAY 0x808080FF // Gray color
#define COLOR_GREEN 0x008000FF // Green color
#define COLOR_GREENYELLOW 0xADFF2FFF // Green yellow color
#define COLOR_HONEYDEW 0xF0FFF0FF // Honeydew color
#define COLOR_HOTPINK 0xFF69B4FF // Hot pink color
#define COLOR_INDIANRED 0xCD5C5CFF // Indian red color
#define COLOR_INDIGO 0x4B0082FF // Indigo color
#define COLOR_IVORY 0xFFFFF0FF // Ivory color
#define COLOR_KHAKI 0xF0E68CFF // Khaki color
#define COLOR_LAVENDER 0xE6E6FAFF // Lavender color
#define COLOR_LAVENDERBLUSH 0xFFF0F5FF // Lavender blush color
#define COLOR_LAWNGREEN 0x7CFC00FF // Lawn green color
#define COLOR_LEMONCHIFFON 0xFFFACDFF // Lemon chiffon color
#define COLOR_LIGHTBLUE 0xADD8E6FF // Light blue color
#define COLOR_LIGHTCORAL 0xF08080FF // Light coral color
#define COLOR_LIGHTCYAN 0xE0FFFFFF // Light cyan color
#define COLOR_LIGHTGOLDENRODYELLOW 0xFAFAD2FF // Light goldenrod yellow color
#define COLOR_LIGHTGRAY 0xD3D3D3FF // Light gray color
#define COLOR_LIGHTGREEN 0x90EE90FF // Light green color
#define COLOR_LIGHTPINK 0xFFB6C1FF // Light pink color
#define COLOR_LIGHTSALMON 0xFFA07AFF // Light salmon color
#define COLOR_LIGHTSEAGREEN 0x20B2AAFF // Light sea green color
#define COLOR_LIGHTSKYBLUE 0x87CEFAFF // Light sky blue color
#define COLOR_LIGHTSLATEGRAY 0x778899FF // Light slate gray color
#define COLOR_LIGHTSTEELBLUE 0xB0C4DEFF // Light steel blue color
#define COLOR_LIGHTYELLOW 0xFFFFE0FF // Light yellow color
#define COLOR_LIME 0x00FF00FF // Lime color
#define COLOR_LIMEGREEN 0x32CD32FF // Lime green color
#define COLOR_LINEN 0xFAF0E6FF // Linen color
#define COLOR_MAGENTA 0xFF00FFFF // Magenta color
#define COLOR_MAROON 0x800000FF // Maroon color
#define COLOR_MEDIUMAQUAMARINE 0x66CDAAFF // Medium aquamarine color
#define COLOR_MEDIUMBLUE 0x0000CDFF // Medium blue color
#define COLOR_MEDIUMORCHID 0xBA55D3FF // Medium orchid color
#define COLOR_MEDIUMPURPLE 0x9370DBFF // Medium purple color
#define COLOR_MEDIUMSEAGREEN 0x3CB371FF // Medium sea green color
#define COLOR_MEDIUMSLATEBLUE 0x7B68EEFF // Medium slate blue color
#define COLOR_MEDIUMSPRINGGREEN 0x00FA9AFF // Medium spring green color
#define COLOR_MEDIUMTURQUOISE 0x48D1CCFF // Medium turquoise color
#define COLOR_MEDIUMVIOLETRED 0xC71585FF // Medium violet red color
#define COLOR_MIDNIGHTBLUE 0x191970FF // Midnight blue color
#define COLOR_MINTCREAM 0xF5FFFAFF // Mint cream color
#define COLOR_MISTYROSE 0xFFE4E1FF // Misty rose color
#define COLOR_MOCCASIN 0xFFE4B5FF // Moccasin color
#define COLOR_NAVAJOWHITE 0xFFDEADFF // Navajo white color
#define COLOR_NAVY 0x000080FF // Navy color
#define COLOR_OLDLACE 0xFDF5E6FF // Old lace color
#define COLOR_OLIVE 0x808000FF // Olive color
#define COLOR_OLIVEDRAB 0x6B8E23FF // Olive drab color
#define COLOR_ORANGE 0xFFA500FF // Orange color
#define COLOR_ORANGERED 0xFF4500FF // Orange red color
#define COLOR_ORCHID 0xDA70D6FF // Orchid color
#define COLOR_PALEGOLDENROD 0xEEE8AAFF // Pale goldenrod color
#define COLOR_PALETURQUOISE 0xAFEEEEFF // Pale turquoise color
#define COLOR_PALEVIOLETRED 0xDB7093FF // Pale violet red color
#define COLOR_PAPAYAWHIP 0xFFEFD5FF // Papaya whip color
#define COLOR_PEACHPUFF 0xFFDAB9FF // Peach puff color
#define COLOR_PERU 0xCD853FFF // Peru color
#define COLOR_PINK 0xFFC0CBFF // Pink color
#define COLOR_PLUM 0xDDA0DDFF // Plum color
#define COLOR_POWDERBLUE 0xB0E0E6FF // Powder blue color
#define COLOR_PURPLE 0x800080FF // Purple color
#define COLOR_RED 0xFF0000FF // Red color
#define COLOR_ROSYBROWN 0xBC8F8FFF // Rosy brown color
#define COLOR_SADDLEBROWN 0x8B4513FF // Saddle brown color
#define COLOR_SALMON 0xFA8072FF // Salmon color
#define COLOR_SANDYBROWN 0xF4A460FF // Sandy brown color
#define COLOR_SEAGREEN 0x2E8B57FF // Sea green color
#define COLOR_SEASHELL 0xFFF5EEFF // Seashell color
#define COLOR_SIENNA 0xA0522DFF // Sienna color
#define COLOR_SILVER 0xC0C0C0FF // Silver color
#define COLOR_SKYBLUE 0x87CEEBFF // Sky blue color
#define COLOR_SLATEBLUE 0x6A5ACDFF // Slate blue color
#define COLOR_SLATEGRAY 0x708090FF // Slate gray color
#define COLOR_SNOW 0xFFFAFAFF // Snow color
#define COLOR_SPRINGGREEN 0x00FF7FFF // Spring green color
#define COLOR_STEELBLUE 0x4682B4FF // Steel blue color
#define COLOR_TAN 0xD2B48CFF // Tan color
#define COLOR_TEAL 0x008080FF // Teal color
#define COLOR_THISTLE 0xD8BFD8FF // Thistle color
#define COLOR_TOMATO 0xFF6347FF // Tomato color
#define COLOR_TURQUOISE 0x40E0D0FF // Turquoise color
#define COLOR_VIOLET 0xEE82EEFF // Violet color
#define COLOR_WHEAT 0xF5DEB3FF // Wheat color
#define COLOR_WHITE 0xFFFFFFFF // White color
#define COLOR_WHITESMOKE 0xF5F5F5FF // Whitespace color
#define COLOR_YELLOW 0xFFFF00FF // Yellow color
#define COLOR_YELLOWGREEN 0x9ACD32FF // Yellow green color

//
// Internal string colors
//
#define TWOSIX      "{FF5533}"   // A shade of red-orange
#define AQUA        "{7fffd4}"   // A light aqua color
#define FAMILY_E    "{F77AFF}"   // A shade of purple
#define PURPLE_E2   "{7348EB}"   // A deep purple
#define RED_E       "{FF0000}"   // Red
#define BLUE_E      "{004BFF}"   // Bright blue
#define SBLUE_E     "{56A4E4}"   // Sky blue
#define PINK_E      "{FFB6C1}"   // Light pink
#define YELLOW_E    "{FFFF00}"   // Yellow
#define LG_E        "{00FF00}"   // Green
#define LB_E        "{15D4ED}"   // Light blue
#define LB2_E       "{87CEFA}"   // Light sky blue
#define GREY_E      "{BABABA}"   // Grey
#define GREY2_E     "{778899}"   // Dark grey
#define GREY3_E     "{C8C8C8}"   // Light grey
#define DARK_E      "{7A7A7A}"   // Dark grey
#define WHITE_E     "{FFFFFF}"   // White
#define WHITE       "{FFFFFF}"   // White (duplicate definition)
#define WHITEP_E    "{FFE4C4}"   // Papaya whip (light cream)
#define IVORY_E     "{FFFF82}"   // Ivory
#define ORANGE_E    "{DB881A}"   // Orange
#define ORANGE_E2   "{FF5000}"   // Bright orange
#define GREEN_E     "{3BBD44}"   // A shade of green
#define PURPLE_E    "{5A00FF}"   // Purple
#define ANS_E       "{FF9945}"   // A light orange
#define LIME_E      "{D2D2AB}"   // Light lime
#define LRED_E      "{E65555}"   // Light red
#define SILVER_E    "{999999}"   // Silver
#define DOOM_       "{F4A460}"   // Sandy brown
#define MATHS       "{3571FC}"   // A shade of blue
#define REACTIONS   "{FD4141}"   // A vivid red
#define LBLUE       "{00FFFF}"   // Cyan
#define RIKO        "{ADD8E6}"   // Light blue
#define ERROR_E     "{AFAFAF}"   // A shade of grey for errors
