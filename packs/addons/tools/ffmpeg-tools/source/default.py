import xbmcaddon
import xbmcgui

dialog = xbmcgui.Dialog()
strings = xbmcaddon.Addon().getLocalizedString

dialog.ok(strings(30000), strings(30001))
