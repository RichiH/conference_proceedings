#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
import lxml.etree
import lxml.html
import urllib2
import sys



NAMESPACES = {
  'atom': 'http://www.w3.org/2005/Atom'
}

BASEURL = "http://media.libreplanet.org"
INDEX_XPATH = "//div[contains(concat(' ', @class, ' '), ' thumb_entry ')]//a[@class='thumb_entry_title']/@href"
PAGE_XPATH = "//h3[text()='Download']/following-sibling::*//a/@href"

with open(sys.argv[1]) as feed:
    tree = lxml.html.parse(feed)

#print(repr(tree.xpath(INDEX_XPATH)))

for page in tree.xpath(INDEX_XPATH):
    if page[0] == '/':
        page = BASEURL + page
    body = urllib2.urlopen(page)

    if(body.getcode() != 200):
        raise Error("Page {page} returned a {code} fetching {url}".format(
                    page=page, code=body.getcode(), url=body.geturl()))

    pagetree = lxml.html.parse(body)
    for url in pagetree.xpath(PAGE_XPATH):
        if url[0] == '/':
            print(BASEURL + url)
        else:
            print(url)
