//
// Original Script: https://pastebin.com/X8dC3EXW
//
#define _GNU_SOURCE
#include <a_samp>
#include <sscanf>
#include <zcmd>

main() {}

public OnFilterScriptInit()
{
    return 1;
}

public OnFilterScriptExit()
{
    return 1;
}

#define INDEX_SKATE (0)
enum SKATE_ENUM {
    bool: sActive,
    bool: sMode,
    bool: sType,
    sSkate,
};
new getData_Skate[MAX_PLAYERS][SKATE_ENUM];

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys) {
    static bool:act;
    if (getData_Skate[playerid][sActive] == true && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
        SetPlayerArmedWeapon(playerid, 0);

        if (newkeys & KEY_HANDBRAKE) {
            if (getData_Skate[playerid][sMode] == true) {
                // medium speed
                ApplyAnimation(playerid, "SKATE", "skate_run", 4.1, 1, 1, 1, 1, 1, 1);
            } else {
                // fast speed
                ApplyAnimation(playerid, "SKATE", "skate_sprint", 4.1, 1, 1, 1, 1, 1, 1);
            }

            if (!act) {
                act = true;
                RemovePlayerAttachedObject(playerid, INDEX_SKATE);
                DestroyObject(getData_Skate[playerid][sSkate]);
                getData_Skate[playerid][sSkate] = CreateObject(19878, 0, 0, 0, 0, 0, 0);
                AttachObjectToPlayer(getData_Skate[playerid][sSkate], playerid, -0.2, 0, -0.9, 0, 0, 90);
            }
        }

        if (oldkeys & KEY_HANDBRAKE) {
            ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);

            if (act) {
                act = false;
                DestroyObject(getData_Skate[playerid][sSkate]);
                RemovePlayerAttachedObject(playerid, INDEX_SKATE);

                if (getData_Skate[playerid][sType] == false) {
                    SetPlayerAttachedObject(playerid, INDEX_SKATE, 19878, 6, -0.055999, 0.013000, 0.000000, -84.099983, 0.000000, -106.099998, 1.000000, 1.000000, 1.000000);
                } else {
                    SetPlayerAttachedObject(playerid, INDEX_SKATE, 19878, 1, 0.055999, -0.173999, -0.007000, -95.999893, -1.600010, 24.099992, 1.000000, 1.000000, 1.000000);
                }
            }
        }
    }

    return 1;
}

COMMAND:skate(playerid, params[]) {
    new skate_option[22];

    if (IsPlayerInAnyVehicle(playerid))
        return SendClientMessage(playerid, 0xFF0000FF, "You can't use this command in a vehicle!");

    if (sscanf(params, "s[22]", skate_option)) {
        SendClientMessage(playerid, -1, "/skate [Option]");
        SendClientMessage(playerid, -1, "Option - /skate 'START', 'STOP', 'TYPE', 'MODE'");
        return 1;
    }

    if (!strcmp(skate_option, "START", false)) {
        if (getData_Skate[playerid][sActive] == true) {
            return SendClientMessage(playerid, -1, "Skate already active!");
        }

        ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
        SetPlayerArmedWeapon(playerid, 0);
        getData_Skate[playerid][sActive] = true;

        SetPlayerAttachedObject(playerid, INDEX_SKATE, 19878, 6, -0.055999, 0.013000, 0.000000, -84.099983, 0.000000, -106.099998, 1.000000, 1.000000, 1.000000);
        PlayerPlaySound(playerid, 1131);
    } else if (!strcmp(skate_option, "STOP", false)) {
        if (getData_Skate[playerid][sActive] == false) {
            return SendClientMessage(playerid, 0xFF0000FF, "Skate already inactive!");
        }

        getData_Skate[playerid][sActive] = false;
        DestroyObject(getData_Skate[playerid][sSkate]);
        RemovePlayerAttachedObject(playerid, INDEX_SKATE);
        PlayerPlaySound(playerid, 21000, 0, 0, 0);
        SendClientMessage(playerid, -1, "{FFFFFF}Skate: {B00000}Skate has stopped!");
    } else if (!strcmp(skate_option, "TYPE", false)) {
        if (getData_Skate[playerid][sActive] == false) {
            return SendClientMessage(playerid, 0xFF0000FF, "You can only change skate type while active!");
        }

        if (getData_Skate[playerid][sType] == false) {
            DestroyObject(getData_Skate[playerid][sSkate]);
            RemovePlayerAttachedObject(playerid, INDEX_SKATE);

            SetPlayerAttachedObject(playerid, INDEX_SKATE, 19878, 1, 0.055999, -0.173999, -0.007000, -95.999893, -1.600010, 24.099992, 1.000000, 1.000000, 1.000000);
            SendClientMessage(playerid, 0x9ACD32FF, "Skate has changed to Type Two!");
        } else {
            DestroyObject(getData_Skate[playerid][sSkate]);
            RemovePlayerAttachedObject(playerid, INDEX_SKATE);

            SetPlayerAttachedObject(playerid, INDEX_SKATE, 19878, 6, -0.055999, 0.013000, 0.000000, -84.099983, 0.000000, -106.099998, 1.000000, 1.000000, 1.000000);
            SendClientMessage(playerid, 0x9ACD32FF, "Skate has changed to Type One!");
        }
    } else if (!strcmp(skate_option, "MODE", false)) {
        if (getData_Skate[playerid][sActive] == false) {
            return SendClientMessage(playerid, 0xFF0000FF, "Skate is inactive!");
        }

        if (getData_Skate[playerid][sMode] == false) {
            getData_Skate[playerid][sMode] = true;
            SendClientMessage(playerid, 0x9ACD32FF, "Skate has changed to Mode Two!");
        } else {
            getData_Skate[playerid][sMode] = false;
            SendClientMessage(playerid, 0x9ACD32FF, "Skate has changed to Mode One!");
        }
    } else {
        return SendClientMessage(playerid, -1, "Option - /skate 'START', 'STOP', 'TYPE', 'MODE'");
    }

    return 1;
}
