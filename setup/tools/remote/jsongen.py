#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Repo releases file generator
This utility should be copied on the repository location where the Clue releases are published
"""

import os
import sys
import json
import datetime
import argparse

class Generator:
	"""
	Generates a new releases file showing the latest versions for each device.
	"""

	def __init__(self):
		self._load()
		if not self._generate_releases_file():
			sys.exit(0)
		# notify user of successfully updating files
		print ("Finished updating latest releases file!")


	def _load(self):
		parser = argparse.ArgumentParser()
		parser.add_argument("-d", "--device", help="Specifies the device name", required=True)
		parser.add_argument("-f", "--properties", help="Specifies the device name")
		parser.add_argument("-dn", "--distroname", help="Describes de distribution name")
		parser.add_argument("-dc", "--distrocode", help="Describes de distribution code")
		parser.add_argument("-ds", "--distrostatus", help="Describes de distribution status")
		parser.add_argument("-dv", "--distroversion", help="Describes de distribution version")
		parser.add_argument("-dp", "--distroprovider", help="Describes de distribution provider")
		parser.add_argument("-dd", "--distrodescription", help="Describes de distribution description")
		parser.add_argument("-p", "--localtargets", help="Specifies the path (server location) where the release JSON message is saved")
		parser.add_argument("-i", "--imagename", help="Identified the image name of the published release")
		self.args = vars(parser.parse_args(sys.argv[1:]))
		if self.args["properties"] is not None and os.path.isfile(self.args["properties"]):
			with open(self.args["properties"]) as f:
				for line in f:
					if "=" in line:
						name, value = line.split("=", 1)
						self.args[name.strip()] = value.strip()


	def _generate_releases_file(self):
		filename = "latest.json"
		basepath = os.path.dirname(os.path.realpath(__file__))
		releases = os.path.join(basepath, filename)
		data = {}
		if os.path.isfile(releases):
			with open(releases, "r") as handler:
				data = json.load(handler)
		if ("devices" not in data.keys()) or \
			("status" in data.keys() and data["status"] != self.args["distrostatus"]) or \
			("version" in data.keys() and data["version"] != self.args["distroversion"]):
			data["devices"] = {}
		device = self.args["device"]
		data["name"] = self.args["distroname"]
		data["status"] = self.args["distrostatus"]
		data["release"] = self.args["distrorelease"]
		data["provider"] = self.args["distroprovider"]
		data["description"] = self.args["distrodescription"]
		data["devices"][device] = {} if device not in data["devices"].keys() else data["devices"][device]
		data["devices"][device]["code"] = self.args["distrocode"]
		data["devices"][device]["date"] = str(datetime.datetime.now())
		data["devices"][device]["url"] = self.args["reporeleases"] + "/" + self.args["device"] + "/" + self.args["imagename"] + ".img.gz"
		data["devices"][device]["version"] = self.args["distroversion"]
		# save file and return result
		return self._save_file(data=data, file=os.path.join(basepath, filename))


	def _save_file(self, data, file):
		"""
		Write data to the file
		:param data: dictionary file content (json, UTF-8)
		:param file: file path
		:return: True if the file is saved correctly, False in case any error occurred
		"""
		try:
			with open(file, "w") as handler:
				json.dump(data, handler)
		except IOError as e:
			print ("An error occurred saving {file} file!\n{error}".format(file=file, error=e))
			return False
		else:
			return True


# program execution
if __name__ == "__main__":
	Generator()
