stock GetPlayerNameEx(targetID)
{
  new _name[MAX_PLAYER_NAME+1];
  GetPlayerName(targetID, _name, sizeof(_name));
  return 1;
}

/**
* example

COMMAND: myname(playerid)
{
  new string[22];
  format(string, sizeof(string), "Your name: %s", GetPlayerNameEx(playerid));
  SendClientMessage(playerid, -1, string);
}
*/
