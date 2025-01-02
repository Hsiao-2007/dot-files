#!/usr/bin/python3
import os

qualities = ["60", "65", "70", "75", "80", "85", "90", "95"]

os.system("rm -rf *-s*.jpg")
os.system("rm -rf *-q*.jpg")

filenames = []
for name in os.listdir("."):
    if name.endswith(".jpg"):
        filename = name.replace(".jpg", "")
        filenames.append(filename)

for filename in sorted(filenames):
        for quality in qualities:
            os.system("convert -strip -format jpg -quality %(quality)s %(filename)s.jpg %(filename)s-q%(quality)s.jpg" % {'quality':quality, 'filename':filename})
        os.system("convert -strip -define jpeg:extent=1000kb %(filename)s.jpg %(filename)s-s1000k.jpg" % {'filename':filename})
        os.system("convert -strip -define jpeg:extent=1500kb %(filename)s.jpg %(filename)s-s1500k.jpg" % {'filename':filename})
        os.system("convert -strip -define jpeg:extent=2000kb %(filename)s.jpg %(filename)s-s2000k.jpg" % {'filename':filename})
