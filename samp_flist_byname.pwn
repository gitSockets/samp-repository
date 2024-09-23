/**
* Author: Socket
* No edited credit.
* Adjust according to your gamemode's variable data.
*/

new lspd_on_duty[MAX_PLAYERS][24];
new lsmd_on_duty[MAX_PLAYERS][24];
new news_on_duty[MAX_PLAYERS][24];

new count_lspd;
new count_lsmd;
new count_news;

/*
Example */

#define DIALOG_UNDEFINED 9999 // DIALOG_UNUSED

RemovePlayerFromDuty(playerid, array[], count)
{
    for (new i = 0; i < count; i++)
    {
        if (strcmp(array[i], GetPlayerName(playerid), false) == 0)
        {
            for (new j = i; j < count - 1; j++)
            {
                array[j] = array[j + 1];
            }
            array[count - 1][0] = '\0';
            break;
        }
    }
}

COMMAND:flist(playerid)
{
    new string[2048];
    new names[512];

    names[0] = '\0';
    for (new i = 0; i < count_lspd; i++)
    {
        format(names, sizeof(names), "%s\n%s", names, lspd_on_duty[i]);
    }
    new lspd_names[512];
    format(lspd_names, sizeof(lspd_names), "LSPD Players:\n%s", names);

    names[0] = '\0';
    for (new i = 0; i < count_lsmd; i++)
    {
        format(names, sizeof(names), "%s\n%s", names, lsmd_on_duty[i]);
    }
    new lsmd_names[512];
    format(lsmd_names, sizeof(lsmd_names), "LSMD Players:\n%s", names);

    names[0] = '\0';
    for (new i = 0; i < count_news; i++)
    {
        format(names, sizeof(names), "%s\n%s", names, news_on_duty[i]);
    }
    new news_names[512];
    format(news_names, sizeof(news_names), "NEWS Players:\n%s", names);

    format(string, sizeof(string), 
        "LSPD Onduty: %d\n{999999}LSMD Onduty: %d\n{FFFFFF}NEWS Onduty: %d\n\n%s\n\n%s\n\n%s",
        count_lspd, count_lsmd, count_news, lspd_names, lsmd_names, news_names);

    ShowPlayerDialog(playerid, DIALOG_UNDEFINED, DIALOG_STYLE_TABLIST, "Factions Onduty List", string, "Close", "");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_UNDEFINED && response)
    {
        new names[512];

        if (listitem == 0) // LSPD
        {
            names[0] = '\0';
            for (new i = 0; i < count_lspd; i++)
            {
                format(names, sizeof(names), "%s\n%s", names, lspd_on_duty[i]);
            }
            ShowPlayerDialog(playerid, DIALOG_UNDEFINED + 1, DIALOG_STYLE_MSGBOX, "LSPD Players", names, "Close", "");
        }
        else if (listitem == 1) // LSMD
        {
            names[0] = '\0';
            for (new i = 0; i < count_lsmd; i++)
            {
                format(names, sizeof(names), "%s\n%s", names, lsmd_on_duty[i]);
            }
            ShowPlayerDialog(playerid, DIALOG_UNDEFINED + 2, DIALOG_STYLE_MSGBOX, "LSMD Players", names, "Close", "");
        }
        else if (listitem == 2) // NEWS
        {
            names[0] = '\0';
            for (new i = 0; i < count_news; i++)
            {
                format(names, sizeof(names), "%s\n%s", names, news_on_duty[i]);
            }
            ShowPlayerDialog(playerid, DIALOG_UNDEFINED + 3, DIALOG_STYLE_MSGBOX, "NEWS Players", names, "Close", "");
        }
    }
    return 1;
}


// How to increment and decrement the count_?? data?
// Place this in the response dialog for on duty and off duty for each faction
// For example, in the response for on duty:
/*
// lspd:
// on duty
count_lspd++;
GetPlayerName(playerid, lspd_on_duty[count_lspd - 1], sizeof(lspd_on_duty[count_lspd - 1]));
// off duty
count_lspd--;
RemovePlayerFromDuty(playerid, lspd_on_duty, count_lspd);


// lsmd:
// on duty
count_lsmd++;
GetPlayerName(playerid, lsmd_on_duty[count_lsmd - 1], sizeof(lsmd_on_duty[count_lsmd - 1]));
// off duty
count_lsmd--;
RemovePlayerFromDuty(playerid, lsmd_on_duty, count_lsmd);

// news:
// on duty
count_news++;
GetPlayerName(playerid, news_on_duty[count_news - 1], sizeof(news_on_duty[count_news - 1]));
// off duty
count_news--;
RemovePlayerFromDuty(playerid, news_on_duty, count_news);

*/

