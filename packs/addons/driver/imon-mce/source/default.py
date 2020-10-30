import os

import xbmcaddon

__scriptname__ = "IMON MCE Remote driver"
__author__ = "Team Clue"
__url__ = "https://libreelec.tv"
__settings__ = xbmcaddon.Addon(id='driver.remote.imon-mce')
__cwd__ = __settings__.getAddonInfo('path')
__path__ = xbmc.translatePath(os.path.join(__cwd__, 'bin', "imon-mce.service"))

os.system(__path__)
