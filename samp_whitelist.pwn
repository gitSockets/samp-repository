//
// this script not created only by Socket's.
//

// Install Dini2 from https://github.com/xpq0w0/SAMP-dini2.inc/blob/master/pawno/include/dini2.inc

// included
#include <a_samp> // open.mp
#include <sscanf> // or sscanf 2
#include <dini2>
#include <zcmd> // or using Pawn.CMD

//
// Create Directory "Server_Whitelist" in your "scriptfiles" folder.
//

main() {}

bool:IsValidRoleplayName(const name[])
{
    new len = strlen(name);
    
    if (len < 5 || len > 24)
    {
        return false;
    }

    new underscore_pos = -1;
    for (new i = 0; i < len; i++)
    {
        if (name[i] == '_')
        {
            underscore_pos = i;
            break;
        }
    }

    if (underscore_pos == -1 || underscore_pos == 0 || underscore_pos == len - 1)
    {
        return false;
    }

    for (new i = 0; i < underscore_pos; i++)
    {
        if (!isalpha(name[i]))
        {
            return false;
        }
    }

    for (new i = underscore_pos + 1; i < len; i++)
    {
        if (!isalpha(name[i]))
        {
            return false;
        }
    }

    if (underscore_pos < 2 || len - underscore_pos - 1 < 2)
    {
        return false;
    }
    return true;
}

public OnFilterScriptInit() {
  return 1;
}
public OnFilterScriptExit() {
  return 1;
}

// function
#define function%0(%1) \
	forward %0(%1); public %0(%1) \
	{
#define endfunction \
	}

// dialog
#define d_WHITELIST (1945)

// enum
enum Whitelist_DATA
{
	wWhitelist
};
new getData_Whitelist[MAX_PLAYERS][Whitelist_DATA];

function GetPlayerNameEx(playerid) {
	new name[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, name, sizeof(name));
	return 1;
}
endfunction

// function
function LoadWhitelistData(playerid)
{
    new File[122];
    format(File, sizeof(File), "Server_Whitelist/%s.ini", GetPlayerNameEx(playerid));

    // create print
    printf("File path: %s", File);

    // file for exists
    if(dini_Exists(File))
    {
        getData_Whitelist[playerid][wWhitelist] = dini_Int(File, "status");

        printf("Whitelist status for %s: %d", GetPlayerNameEx(playerid), getData_Whitelist[playerid][wWhitelist]);

        // if player not in whitelist
        if(getData_Whitelist[playerid][wWhitelist] == 0)
        {
            // edit the string dialog for your server.
            new string[552];
            format(string, sizeof(string), "{FF0000}ERROR: {999999}Nama yang Anda gunakan, {FFF070}%s {FFFFFF}Tidak terdaftar dalam Whitelist Kami, Silahkan Daftar terlebih dahulu!", GetPlayerNameEx(playerid));
            ShowPlayerDialog(playerid, d_WHITELIST, DIALOG_STYLE_MSGBOX, "{FFF070}Welcome :)", string, "Close", "");
            SetTimerEx("whitelist_kick_delay", 5000, 0, "d", playerid);
        }
    }
    else
    {
        printf("File not found: %s", File);
    }

    return 1;
}
endfunction

function whitelist_kick_delay(playerid) {
	Kick(playerid);
	return 1;
}
endfunction

// Callbacks
public OnPlayerConnect(playerid) {
  if (!IsValidRoleplayName(GetPlayerNameEx)) return Kick(playerid);

  LoadWhitelistData(playerid);
  return 1;
}

// command
// Command to whitelist a player
COMMAND:setwhitelist(playerid, params[])
{
    new File[128]; // Increased size for better flexibility
    if (IsPlayerAdmin(playerid)) // Only allow admins to use this command
    {
        new name[24];
        if(sscanf(params, "s[24]", name))
            return SendClientMessage(playerid, -1, "{FF6347}Usage: /setwhitelist [Name_Name]");

        format(File, sizeof(File), "Server_Whitelist/%s.ini", name);
        if (dini_Exists(File)) 
        {
            dini_IntSet(File, "status", 1); // Update whitelist status
        } 
        else 
        {
            dini_Create(File); // Create new file if it doesn't exist
            dini_IntSet(File, "status", 1); // Set whitelist status to 1
        }

        new string[128];
        format(string, sizeof(string), "{32CD32}Success: {FFFFFF}Player {FFF070}%s{FFFFFF} has been added to the whitelist!", name);
        SendClientMessage(playerid, -1, string);
    } 
    else 
    {
        SendClientMessage(playerid, -1, "{FF6347}Error: You do not have permission to use this command."); // In case player isn't an admin
    }
    return 1;
}

// Command to remove a player from the whitelist
COMMAND:unwhitelist(playerid, params[])
{
    new File[128]; // Increased size for better flexibility
    if (IsPlayerAdmin(playerid)) // Only allow admins to use this command
    {
        new name[24];
        if(sscanf(params, "s[24]", name))
            return SendClientMessage(playerid, -1, "{FF6347}Usage: /unwhitelist [Name_Name]");

        format(File, sizeof(File), "Server_Whitelist/%s.ini", name);
        if (dini_Exists(File)) 
        {
            dini_IntSet(File, "status", 0); // Update whitelist status to 0 (remove from whitelist)
        } 
        else 
        {
            dini_Create(File); // If file doesn't exist, create and still remove (for safety)
            dini_IntSet(File, "status", 1); // Set status (though this case might not happen often)
        }

        new string[128];
        format(string, sizeof(string), "{32CD32}Success: {FFFFFF}Player {FFF070}%s{FFFFFF} has been removed from the whitelist!", name);
        SendClientMessage(playerid, -1, string);
    } 
    else 
    {
        SendClientMessage(playerid, -1, "{FF6347}Error: You do not have permission to use this command."); // In case player isn't an admin
    }
    return 1;
}

