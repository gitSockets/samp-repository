// required included
#include <a_samp> // open.mp
#include <sscanf2> // or sscanf1
#include <discord-connector> // version latest or pre-release, download us: https://github.com/maddinat0r/samp-discord-connector/releases
#include <discord-cmd> // download us: https://github.com/AkshayMohan/pawn-discord-

//
// custom your prefix in discord-cmd.inc
//
/*
#if !defined DCMD_PREFIX
	#define DCMD_PREFIX '!' // 'here' replace this
#endif
*/

main() {
  new DCC_Channel: announce_channel = DCC_FindChannelById("replace this");
	new DCC_Channel: text_channel = DCC_FindChannelById("replace this");
  new DCC_Channel: command_channel = DCC_FindChannelById("replace this");
}
}

public OnFilterScriptInit()
{
  return 1;
}

public OnFilterScriptExit()
{
  return 1;
}

GetPlayerNameEx(playerid)
{
  new name[MAX_PLAYER_NAME+1];
  GetPlayerName(playerid, name, sizeof(name));
  return 1;
}

// chat logs
public OnPlayerText(playerid, text[])
{
	new string[222+1];
  format(string, sizeof(string), "%s[%d] Says: %s", GetPlayerNameEx, playerid, text);
  DCC_SendChannelMessage(text_channel, string);

  //
  return 0;
}

// command logs
public OnPlayerCommandText(playerid, cmdtext[])
{
	new string[222+1];
  format(string, sizeof(string), "%s[%d] Using Command: %s", GetPlayerNameEx, playerid, cmdtext);
  DCC_SendChannelMessage(command_channel, string);

  //
  return 0;
}

//
// commands list
//

// announce
DCMD:announce(channel, params[]) {
  if (channel != announce_channel) return DCC_SendChannelMessage(channel, "Gunakan Channel yang sesuai!");

  new adminName[22], textAnnounce[55];
  if (sscanf(params, "s[22]s[55]", adminName, textAnnounce)) {
    return DCC_SendChannelMessage(channel, "!announce [Your Name] [Text]");

  if (strlen(adminName) < 1 || strlen(adminName) > 22)
    return DCC_SendChannelMessage(channel, "Please input your name 1 - 22!");
  if (strlen(textAnnounce) < 1 || strlen(textAnnounce) > 55)
    return DCC_SendChannelMessage(channel, "Please input your messages 1 - 55!");
  
  for (new i=0; i < MAX_PLAYERS; i++)
  {
    new string[122+1];
    format(string, sizeof(string), "{FF0000}[ADMIN]: {FFF070}%s {FF0000}[ANNOUNCE]: %s", adminName, textAnnounce);
    SendClientMessage(i, -1, string); // -1 = WHITE DEFAULT
  }
  return 1;
}
