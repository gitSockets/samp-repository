/**
* FS Mendung
* Author: Socket
* No edited credit.
* Adjust according to your gamemode's variable data.
*/

new count_lspd,
    count_lsmd,
    count_news;
// Add more if needed

/*
new count_lspd,
    count_lsmd,
    count_news,
    count_name,
    count_name;
*/

/*
Example */

#define DIALOG_UNDEFINED 9999 // DIALOG_UNUSED

COMMAND:flist(playerid)
{
    new string[200];
    format(string, sizeof(string), "LSPD On Duty: %d\n{999999}LSMD On Duty: %d\n{FFFFFF}NEWS On Duty: %d", count_lspd, count_lsmd, count_news);
    ShowPlayerDialog(playerid, DIALOG_UNDEFINED, DIALOG_STYLE_TABLIST, "Factions On Duty List", string, "Close", "");
    return 1;
}

// How to increment and decrement the count_?? data?
// Place this in the response dialog for on duty and off duty for each faction
// For example, in the response for on duty:
/*
-lspd:
-- on duty
count_lspd++;
-- off duty
count_lspd--;

// lsmd:
-- on duty
count_lsmd++;
-- off duty
count_lsmd--;

// news:
-- on duty
count_news++;
-- off duty
count_news--;
*/

