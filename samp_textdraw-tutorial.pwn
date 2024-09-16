/**
* In TextDraw, there are two models. The first is public, used for TextDraws intended for the public (all players).
* The second is player-td, which is intended for individual players. Player-td is suitable for retrieving data to be displayed in a TextDraw, for example, retrieving a player's signal or player ID for the TextDraw.
*/

//
// PublicTD
//

// Variable
new Text: myPublicTD[1]; // public TextDraw in variables is prefixed with the word "text" as an indicator that this is a public TextDraw.
// - param in 'myPublicTD' and "1" is the index for TextDraw array. Example: 1 is td 1 selected from "0" and 2 is td 1 selected from "0-1".

// Callbacks
// PublicTD in callbacks is generally set in OnGameModeInit for recommended callbacks.
public OnGameModeInit() {
    myPublicTD[0] = TextDrawCreate(320.0, 240.0, "Hello World"); // Example of public TextDraw
    TextDrawFont(myPublicTD[0], 3); // Set the font type
    TextDrawLetterSize(myPublicTD[0], 0.5, 1.5); // Set the letter size for the text
    return 1;
}

// Show and Hide
// Use the following functions for showing and hiding the TextDraw.
TextDrawShowForPlayer(playerid, myPublicTD[0]); // Show for a specific player
TextDrawShowForAll(myPublicTD[0]);              // Show for all players
TextDrawHideForPlayer(playerid, myPublicTD[0]); // Hide for a specific player
TextDrawHideForAll(myPublicTD[0]);              // Hide for all players

// Example: Show TextDraw to a specific player when they connect
public OnPlayerConnect(playerid) {
    TextDrawShowForPlayer(playerid, myPublicTD[0]); // Show public TextDraw to the connecting player
    SetTimerEx("HideTextDraw", 5000, false, "d", playerid); // Hide after 5 seconds
    return 1;
}

// Timer function to hide the TextDraw after 5 seconds for a specific player
forward HideTextDraw(playerid);
public HideTextDraw(playerid) {
    TextDrawHideForPlayer(playerid, myPublicTD[0]);
    return 1;
}

// Example command: Show the TextDraw for all players and hide it after 5 seconds
COMMAND:showtdforall(playerid) {
    if (!IsPlayerAdmin(playerid)) return 0; // Only allow admins to use this command
    TextDrawShowForAll(myPublicTD[0]);      // Show the TextDraw for all players
    SetTimer("HideAllTextDraw", 5000, false); // Hide after 5 seconds
    return 1;
}

// Timer function to hide the TextDraw for all players
forward HideAllTextDraw();
public HideAllTextDraw() {
    TextDrawHideForAll(myPublicTD[0]);
    return 1;
}

// If you want the TextDraw to be clickable, use the following function
public OnPlayerClickTextDraw(playerid, Text: clickedid) {
    if (clickedid == myPublicTD[0]) { // Check if the clicked TextDraw is the public one
        // Send a message to the player
        SendClientMessage(playerid, -1, "Hello from the TextDraw!");
    }
    return 1;
}

//
// PlayerTD
//


// variable
new PlayerPlayerText: myPlayerTD[MAX_PLAYERS][1]; // playerTD in variables is prefixed with the word "PlayerPlayerText" as an indicator that this is a Player PlayerTextDraw.
// - param in 'myPlayerTD' and "1" is index for PlayerTextdraw array. Each player has their own individual PlayerTextDraw.

// callbacks
// PlayerTD in callbacks is in OnPlayerConnect for Recommended Callbacks..
public OnPlayerConnect(playerid) {
    myPlayerTD[playerid][0] = PlayerTextDrawCreate(320.0, 240.0, "Welcome Player!"); // example for individual player PlayerTextdraw
    return 1;
}

// Show and Hide
// PlayerTD in show and hide
PlayerTextDrawShowForPlayer(playerid, myPlayerTD[playerid][0]); // if show for player
PlayerTextDrawHideForPlayer(playerid, myPlayerTD[playerid][0]); // if hide for player

// example show for player
public OnPlayerConnect(playerid) {
    PlayerTextDrawShowForPlayer(playerid, myPlayerTD[playerid][0]);
    SetTimerEx("HidePlayerPlayerTextDraw", 5000, false, "d", playerid); // Hide after 5 seconds
    return 1;
}

forward HidePlayerPlayerTextDraw(playerid);
public HidePlayerPlayerTextDraw(playerid) {
    PlayerTextDrawHideForPlayer(playerid, myPlayerTD[playerid][0]);
    return 1;
}

// example show for individual players
COMMAND:showplayertd(playerid) {
    if (!IsPlayerAdmin(playerid)) return 0;
    foreach (new i : Player) {
        PlayerTextDrawShowForPlayer(i, myPlayerTD[i][0]);
    }
    SetTimer("HideAllPlayerPlayerTextDraws", 5000, false); // Hide all after 5 seconds
    return 1;
}

forward HideAllPlayerPlayerTextDraws();
public HideAllPlayerPlayerTextDraws() {
    foreach (new i : Player) {
        PlayerTextDrawHideForPlayer(i, myPlayerTD[i][0]);
    }
    return 1;
}

// clicked - if your player-specific PlayerTextdraw is clickable
public OnPlayerClickPlayerPlayerTextDraw(playerid, PlayerText: playertextid) {
    if (playertextid == myPlayerTD[playerid][0]) {
        // say hello
        SendClientMessage(playerid, -1, "Hello from your personal PlayerTextDraw!");
    }
    return 1;
}
