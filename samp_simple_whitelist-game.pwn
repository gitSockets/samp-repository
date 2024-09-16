// Install Dini from https://github.com/AndreT/samp-vortex-rp/blob/master/pawno/include/Dini.inc
// included
#include <a_samp> // open.mp
#include <sscanf2> // or sscanf 1
#include <Dini>
#include <zcmd> // or using Pawn.CMD

//
// Create Directory "Server_Whitelist" in your "scriptfiles" folder.
//

main() {}

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
#define DIALOG_UNDEFINED (1945)

// enum
enum Whitelist_DATA
{
	wWhitelist
};
new getData_Whitelist[MAX_PLAYERS][Whitelist_DATA];

stock __GetPlayerName(playerid) {
	new name[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, name, sizeof(name));
	return 1;
}

// function
function LoadWhitelistData(playerid)
{
    new File[122];
    format(File, sizeof(File), "Server_Whitelist/%s.ini", __GetPlayerName(playerid));

    // create print
    printf("File path: %s", File);

    // file for exists
    if(dini_Exists(File))
    {
        getData_Whitelist[playerid][wWhitelist] = dini_Int(File, "status");

        printf("Whitelist status for %s: %d", __GetPlayerName(playerid), getData_Whitelist[playerid][wWhitelist]);

        // if player not in whitelist
        if(getData_Whitelist[playerid][wWhitelist] == 0)
        {
            // edit the string dialog for your server.
            new string[552];
            format(string, sizeof(string), "{FF0000}ERROR: {999999}Nama yang Anda gunakan, {FFF070}%s {FFFFFF}Tidak terdaftar dalam Whitelist Kami, Silahkan Daftar terlebih dahulu!", __GetPlayerName(playerid));
            ShowPlayerDialog(playerid, DIALOG_UNDEFINED, DIALOG_STYLE_MSGBOX, "{FFF070}Welcome :)", string, "Close", "");
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
  LoadWhitelistData(playerid);
  return 1;
}

// command

COMMAND:setwhitelist(playerid, params[])
{
	new File[122];
	if (IsPlayerAdmin(playerid)) // cmd using if playar is admin
	{
		new name[24];
		if(sscanf(params, "s[24]", name))
		    return SendClientMessage(playerid, -1, "{FFF070}/setwhitelist [Name_Name]");

		format( File, sizeof( File ), "Server_Whitelist/%s.ini", name);
		if( dini_Exists( File ) )
		{
			dini_IntSet(File, "status", 1);
		}
		else
		{
			dini_Create( File );
			dini_IntSet(File, "status", 1);
		}
		new string[122+1];
		format(string, sizeof(string), "Nama Pemain {FFF070}%s {FFFFFF}Berhasil Terdaftar!", name);
		SendClientMessage(playerid, -1, string);
	}
	return 1;
}


COMMAND:unwhitelist(playerid, params[])
{
	new File[122];
	if (IsPlayerAdmin(playerid)) // cmd using if playar is admin
	{
		new name[24];
		if(sscanf(params, "s[24]", name))
		    return SendClientMessage(playerid, -1, "{FFF070}/unwhitelist [Name_Name]");

		format( File, sizeof( File ), "Server_Whitelist/%s.ini", name);
		if( dini_Exists( File ) )
		{
			dini_IntSet(File, "status", 0);
		}
		else
		{
			dini_Create( File );
			dini_IntSet(File, "status", 1);
		}
		new string[122+1];
		format(string, sizeof(string), "Nama Pemain {FFF070}%s {FFFFFF}Berhasil Terhapus!", name);
		SendClientMessage(playerid, -1, string);
	}
	return 1;
}
