#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Repo addons.xml and addons.xml.sha256 generator
This utility should be copied on the repository location where the addon will be published
"""

import hashlib
import os
import sys
from xml.dom.minidom import parseString


class Generator:
	"""
	Generates a new addons.xml file from each addons addon.xml file
	and a new addons.xml.sha256 hash file. Must be run from the root of
	the checked-out repo. Only handles single depth folder structure.
	"""

	def __init__(self):
		# generate addons.xml file
		if (not self._generate_addons_xml_file()):
			sys.exit(0)
		# generate addons.xml.sha256 file
		if (not self._generate_addons_xml_sha256_file()):
			sys.exit(0)
		# notify user of successfully updating files
		print ("Finished updating addons.xml and addons.xml.sha256 files!")


	def _generate_addons_xml_file(self):
		# addons.xml heading block
		addons_xml = u"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<addons>\n"
		# list of only folders, skip special .svn folder
		basepath = os.path.dirname(os.path.realpath(__file__))
		folders = [f for f in os.listdir(basepath) if os.path.isdir(os.path.join(basepath, f))]
		# loop folders and add each addons addon.xml to the final addons.xml file
		for folder in folders:
			try:
				# new addon.xml text holder
				addon_xml = u""
				# create full path to an addon.xml file
				_path = os.path.join(basepath, folder, "addon.xml")
				# split lines for stripping
				with open(_path, "r") as addon_file:
					# loop thru cleaning each line
					for line in addon_file:
						# skip heading block as we already have one
						if (line.find("<?xml") >= 0): continue
						# add line
						addon_xml += unicode(line.rstrip() + "\n", "UTF-8")
				# check for a properly formatted xml file
				parseString(addon_xml.encode("UTF-8"))
			except Exception as e:
				# missing or malformed addon.xml
				print ("* Excluding {path} for {error}".format(path=_path, error=e))
			else:
				# we succeeded so add to our final addons.xml text
				addons_xml += addon_xml.rstrip() + "\n\n"
		# clean and add closing tag
		addons_xml = addons_xml.strip() + u"\n</addons>\n"
		# save file and return result
		return self._save_file(data=addons_xml.encode("UTF-8"), file=os.path.join(basepath, "addons.xml"))


	def _generate_addons_xml_sha256_file(self):
		basepath = os.path.dirname(os.path.realpath(__file__))
		try:
			# create a new sha256 hash
			sha256 = hashlib.sha256(open(os.path.join(basepath, "addons.xml")).read()).hexdigest()
		except IOError as e:
			print ("An error occurred creating sha256 hash from addons.xml file!\n{error}".format(error=e))
			return False
		else:
			# save file
			return self._save_file(data=sha256, file=os.path.join(basepath, "addons.xml.sha256"))


	def _save_file(self, data, file):
		"""
		Write data to the file
		:param data: file content (text format, UTF-8)
		:param file: file path
		:return: True if the file is saved correctly, False in case any error occurred
		"""
		try:
			open(file, "w").write(data)
		except IOError as e:
			print ("An error occurred saving {file} file!\n{error}".format(file=file, error=e))
			return False
		else:
			return True


# program execution
if __name__ == "__main__":
	Generator()
