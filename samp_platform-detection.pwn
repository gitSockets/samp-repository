// Original Script SA-MP Android/PC Detection https://github.com/Fairuz-Afdhal/IsPlayerUsingAndroid
// Original Script VPN Checker https://gist.github.com/GnikLlort/751b22c67228016ce9ca5c2c758d073e

#include "a_samp"
#include "a_http"

main() {}

#define function%0(%1) \
	forward %0(%1); public %0(%1) \
	{
#define endfunction \
	}
 
native SendClientCheck(playerid, type, arg, offset, size);

#define getPlatform(%0)  GetPVarInt(%0, "NotAndroid") == 0
#define getPlatform_Android(%0)  GetPVarInt(%0, "NotAndroid") == 0
#define getPlatform_PC(%0)  GetPVarInt(%0, "NotAndroid") == 1

public OnPlayerConnect(playerid)
{
  SendClientCheck(playerid, 0x48, 0, 0, 2);
  
  new ip[16], string[59];
	GetPlayerIp(playerid, ip, sizeof ip);
	format(string, sizeof string, "www.shroomery.org/ythan/proxycheck.php?ip=%s", ip);
	HTTP(playerid, HTTP_GET, string, "", "MyHttpResponse");
  return 1;
}

forward OnClientCheckResponse(playerid, type, arg, response);
public OnClientCheckResponse(playerid, type, arg, response)
{
    switch(type)
    {       
        case 0x48:
        {
          SetPVarInt(playerid, "NotAndroid", 1);
        }
        default:
        {
          SetPVarInt(playerid, "NotAndroid", 0);
        }
    }
    return 1;
}

forward MyHttpResponse(playerid, response_code, data[]);
public MyHttpResponse(playerid, response_code, data[])
{
	new name[MAX_PLAYERS],string[256];
 
	new ip[16];
	GetPlayerName(playerid, name, sizeof(name));
	GetPlayerIp(playerid, ip, sizeof ip);
 
	if(strcmp(ip, "127.0.0.1", true) == 0)
	{
		format(string, 256, "[LOCALHOST] %s(%d) has joined the server.", name, playerid);
	  SendClientMessageToAll( 0x09F7DFC8, string);
	}
	if(response_code == 200)
	{	
		if(data[0] == 'Y')
		{
			format(string, 256, "[PROXY DETECTED] %s(%d) has been kicked from the server.", name, playerid);
	    SendClientMessageToAll( 0xFF0000FF, string);
	    SendClientMessage(playerid, 0xFF0000FF, "Please disable your proxy/VPN and rejoin!");
	    SetTimerEx("DelayedKick", 100, false, "i", playerid);
		}
		if(data[0] == 'N')
		{
			format(string, 256, "[PROXY NOT DETECTED] %s(%d) thank you for joining!", name, playerid);
	    SendClientMessageToAll( 0x09F7DFC8, string );
		}
		if(data[0] == 'X')
		{
			printf("WRONG IP FORMAT");
		}
		else
		{
			printf("The request failed! The response code was: %d", response_code);
		}
	}
	return 1;
}

function DelayKick(p)
{
    Kick(p);
    return 1;
}
endfunction

public OnPlayerSpawn(playerid)
{
  if (getPlatform(playerid)) {
    SendClientMessage(playerid, -1, "Your has Using Android Platform!");
  } else {
    SendClientMessage(playerid, -1, "Your has Using PC Platform!");
  }
  
  new version[24];
  GetPlayerVersion(playerid, version, sizeof(version));

  if (strcmp(version, "0.3.DL-R1" true) == 0)
  {
    SendClientMessage(playerid, -1, "Your Client in Version 0.3.DL-R1", version);
  }
  else if (strcmp(version, "0.3.7-R1" true) == 0)
  {
    SendClientMessage(playerid, -1, "Your Client in Version 0.3.7-R1", version);
  }
  else if (strcmp(version, "0.3.7-R2", true) == 0)
  {
    SendClientMessage(playerid, -1, "Your Client in Version 0.3.7-R2", version);
  }
  else if (strcmp(version, "0.3.7-R3", true) == 0)
  {
    SendClientMessage(playerid, -1, "Your Client in Version 0.3.7-R3", version);
  }
  else if (strcmp(version, "0.3.7-R4", true) == 0)
  {
    SendClientMessage(playerid, -1, "Your Client in Version 0.3.7-R4", version);
  }
  else if (strcmp(version, "0.3.7-R5", true) == 0)
  {
    SendClientMessage(playerid, -1, "Your Client in Version 0.3.7-R5", version);
  }
  return 1;
}
