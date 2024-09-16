#include <a_samp> // open.mp

public public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
  if (IsPlayerAdmin(playerid))
  {
    SetPlayerPos(playerid, fX, fY, fZ);
  }
  return 1;
}
