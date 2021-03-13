#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Repo latest file generator
This utility should be copied on the repository location where the Clue releases are published
"""

import os
import sys
import json
import datetime
import argparse

class Generator:
	"""
	Generates a new latest file showing the latest release for each device.
	"""

	def __init__(self):
		self._load()
		if not self._generate_latest_file():
			sys.exit(0)
		# notify user of successfully updating files
		print ("Finished updating latest releases file!")


	def _load(self):
		parser = argparse.ArgumentParser()
		parser.add_argument("-d", "--device", help="Specifies the device name", required=True)
		parser.add_argument("-dn", "--distroname", help="Describes de distribution name", required=True)
		parser.add_argument("-dc", "--distrocode", help="Describes de distribution code", required=True)
		parser.add_argument("-ds", "--distrostatus", help="Describes de distribution status", required=True)
		parser.add_argument("-dv", "--distroversion", help="Describes de distribution version", required=True)
		parser.add_argument("-dp", "--distroprovider", help="Describes de distribution provider")
		parser.add_argument("-dd", "--distrodescription", help="Describes de distribution description")
		parser.add_argument("-p", "--path", help="Specifies the path (server location) where the release JSON message is saved", required=True)
		parser.add_argument("-i", "--image", help="Identified the image name of the published release", required=True)
		self.args = vars(parser.parse_args(sys.argv[1:]))


	def _generate_latest_file(self):
		basepath = os.path.dirname(os.path.realpath(__file__))
		latest = os.path.join(basepath, "latest")
		data = {}
		if os.path.isfile(latest):
			with open(latest, "r") as handler:
				data = json.load(handler)
		if ("devices" not in data.keys()) or \
			("status" in data.keys() and data["status"] != self.args["distrostatus"]) or \
			("version" in data.keys() and data["version"] != self.args["distroversion"]):
			data["devices"] = {}
		device = self.args["device"]
		data["name"] = self.args["distroname"]
		data["status"] = self.args["distrostatus"]
		data["version"] = self.args["distroversion"]
		data["provider"] = self.args["distroprovider"]
		data["description"] = self.args["distrodescription"]
		data["devices"][device] = {}
		#data["devices"][device] = {} if device not in data["devices"].keys() else data["devices"][device]
		data["devices"][device]["code"] = self.args["distrocode"]
		data["devices"][device]["date"] = str(datetime.datetime.now())
		data["devices"][device]["url"] = self.args["path"] + "/" + self.args["device"] + "/" + self.args["image"] + ".img.gz"
		# save file and return result
		print(json.dumps(data))
		#return self._save_file(data=data, file=os.path.join(basepath, "latest"))


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
