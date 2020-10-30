import os.path
import subprocess

import xbmcaddon
import xbmcgui

SNAPCLIENT = os.path.join(
	xbmcaddon.Addon().getAddonInfo('path'), 'bin', 'snapclient')

card = ''
cards = []
lines = subprocess.check_output([SNAPCLIENT, '--list']).splitlines()

for line in lines:
	if line != '':
		card = card + ' ' + line
	else:
		cards.append(card)
		card = ''

dialog = xbmcgui.Dialog()
dialog.select(xbmcaddon.Addon().getLocalizedString(30015), cards)
del dialog
