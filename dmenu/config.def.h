/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"UbuntuMono Nerd Font:size=14:antialias=true:autohint=true"
};
static const char *prompt      = "Run:";      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */

  // Catppuccin-mocha
  [SchemeNorm] = { "#cdd6f4", "#1e1e2e" },
	// [SchemeSel] = { "#1e1e2e", "#a6e3a1" },
	[SchemeSel] = { "#1e1e2e", "#94E2D5" },
	[SchemeOut] = { "#000000", "#89dceb" },

};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 10;

/* -h option: minimun height of menu line */
static unsigned int lineheight = 30;
static unsigned int min_lineheight = 20;


/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 3;
