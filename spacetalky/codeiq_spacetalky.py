#!/usr/bin/python

import sys
import time

#
# define func.
################################################################################
def ascii2mnum(str):
	return ord(str) - ord('a') + 1

def make_fake_word(src_str_list):
	fake_word_list = []
	for w in src_str_list:
		fw = w[0] * w[1]
		fake_word_list.append(fw)

	return "".join(fake_word_list)

def encode(url, src_str):
	import urllib2

	req = urllib2.Request(url+src_str)
	response = urllib2.urlopen(req)
	ret = response.read()

	return ret

def seq_same_char(char_list):
	pre_char = None
	for c in char_list:
		if c == pre_char:
			return True
		pre_char = c
	return False

#
# main.
################################################################################
for line in iter(sys.stdin.readline, ""):
	line = line.rstrip("\r\n")

	str_list = list(line)
	str_num = len(str_list)

	fake_word = ""
	x = []

	if str_num % 2 != 0:
		print "%s:%s" % ("X", line)
	else:

		for i in range(str_num/2):
			x.append( (str_list[i*2], ascii2mnum(str_list[(i*2)+1])) )

		if seq_same_char([c[0] for c in x]):
			print "%s:%s" % ("X", line)

		else:
			fake_word = make_fake_word(x)
			print "%s:%s" % (fake_word, line)
			### for debug.
			#encoded_word = encode("http://spacetalky.textfile.org/api.cgi?input=", fake_word)
			#if encoded_word == line:
				#print "%s:%s" % (fake_word, line)
			#else:
				#print "*** NG : %s:%s" % (fake_word, line)
			#time.sleep(1)

