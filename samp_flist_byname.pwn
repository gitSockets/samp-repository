new lspd_on_duty[MAX_PLAYERS][24];
new lsmd_on_duty[MAX_PLAYERS][24];
new news_on_duty[MAX_PLAYERS][24];

new count_lspd = 0;
new count_lsmd = 0;
new count_news = 0;

#define DIALOG_FACTIONLIST (1945)

RemovePlayerFromDuty(playerid, array[], &count)
{
    for (new i = 0; i < count; i++)
    {
        if (strcmp(array[i], GetPlayerName(playerid), false) == 0)
        {
            // Shift remaining players left
            for (new j = i; j < count - 1; j++)
            {
                array[j] = array[j + 1];
            }
            array[count - 1][0] = '\0'; // Clear last entry
            count--; // Decrement count
            break;
        }
    }
}

COMMAND:flist(playerid)
{
    new string[2048];
    new names[512];

    // LSPD Players
    names[0] = '\0';
    for (new i = 0; i < count_lspd; i++)
    {
        format(names, sizeof(names), "%s\n%s", names, lspd_on_duty[i]);
    }
    new lspd_names[512];
    format(lspd_names, sizeof(lspd_names), "LSPD Players:\n%s", names);

    // LSMD Players
    names[0] = '\0';
    for (new i = 0; i < count_lsmd; i++)
    {
        format(names, sizeof(names), "%s\n%s", names, lsmd_on_duty[i]);
    }
    new lsmd_names[512];
    format(lsmd_names, sizeof(lsmd_names), "LSMD Players:\n%s", names);

    // NEWS Players
    names[0] = '\0';
    for (new i = 0; i < count_news; i++)
    {
        format(names, sizeof(names), "%s\n%s", names, news_on_duty[i]);
    }
    new news_names[512];
    format(news_names, sizeof(news_names), "NEWS Players:\n%s", names);

    // Show dialog
    format(string, sizeof(string), 
        "LSPD On Duty: %d\nLSMD On Duty: %d\nNEWS On Duty: %d\n\n%s\n\n%s\n\n%s",
        count_lspd, count_lsmd, count_news, lspd_names, lsmd_names, news_names);

    ShowPlayerDialog(playerid, DIALOG_FACTIONLIST, DIALOG_STYLE_TABLIST, "Factions On Duty List", string, "Close", "");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_FACTIONLIST && response)
    {
        new names[512];
        names[0] = '\0';

        // Display players based on the selected faction
        if (listitem == 0 && count_lspd > 0) // LSPD
        {
            for (new i = 0; i < count_lspd; i++)
            {
                format(names, sizeof(names), "%s\n%s", names, lspd_on_duty[i]);
            }
            ShowPlayerDialog(playerid, DIALOG_FACTIONLIST + 1, DIALOG_STYLE_MSGBOX, "LSPD Players", names, "Close", "");
        }
        else if (listitem == 1 && count_lsmd > 0) // LSMD
        {
            for (new i = 0; i < count_lsmd; i++)
            {
                format(names, sizeof(names), "%s\n%s", names, lsmd_on_duty[i]);
            }
            ShowPlayerDialog(playerid, DIALOG_FACTIONLIST + 2, DIALOG_STYLE_MSGBOX, "LSMD Players", names, "Close", "");
        }
        else if (listitem == 2 && count_news > 0) // NEWS
        {
            for (new i = 0; i < count_news; i++)
            {
                format(names, sizeof(names), "%s\n%s", names, news_on_duty[i]);
            }
            ShowPlayerDialog(playerid, DIALOG_FACTIONLIST + 3, DIALOG_STYLE_MSGBOX, "NEWS Players", names, "Close", "");
        }
    }
    return 1;
}

// Functions to handle on-duty and off-duty actions
forward SetDuty(playerid, faction, bool: onDuty);
public SetDuty(playerid, faction, bool: onDuty)
{
    if (faction == 0) // LSPD
    {
        if (onDuty && count_lspd < MAX_PLAYERS)
        {
            count_lspd++;
            GetPlayerName(playerid, lspd_on_duty[count_lspd - 1], sizeof(lspd_on_duty[count_lspd - 1]));
        }
        else if (!onDuty)
        {
            RemovePlayerFromDuty(playerid, lspd_on_duty, count_lspd);
        }
    }
    else if (faction == 1) // LSMD
    {
        if (onDuty && count_lsmd < MAX_PLAYERS)
        {
            count_lsmd++;
            GetPlayerName(playerid, lsmd_on_duty[count_lsmd - 1], sizeof(lsmd_on_duty[count_lsmd - 1]));
        }
        else if (!onDuty)
        {
            RemovePlayerFromDuty(playerid, lsmd_on_duty, count_lsmd);
        }
    }
    else if (faction == 2) // NEWS
    {
        if (onDuty && count_news < MAX_PLAYERS)
        {
            count_news++;
            GetPlayerName(playerid, news_on_duty[count_news - 1], sizeof(news_on_duty[count_news - 1]));
        }
        else if (!onDuty)
        {
            RemovePlayerFromDuty(playerid, news_on_duty, count_news);
        }
    }
}

//
// Example Using
//
COMMAND:duty(playerid, params[])
{
    new faction, action;
    if (sscanf(params, "ii", faction, action)) {
        return SendClientMessage(playerid, -1, "Usage: /duty <faction_id> <1=on-duty/0=off-duty>");
    }

    if (action == 1)
    {
        // Enter on-duty
        SetDuty(playerid, faction, true);
        SendClientMessage(playerid, -1, "You are now on-duty.");
    }
    else if (action == 0)
    {
        // Exit off-duty
        SetDuty(playerid, faction, false);
        SendClientMessage(playerid, -1, "You are now off-duty.");
    }
    return 1;
}
