default: all

all: makedirs dirs

makedirs: index.html
	for i in `grep 'href=".[^"]*/"' $< | cut -f 6 -d '"'`; do \
	  [ -e $$i ] || mkdir $$i; \
	  [ -h $$i/Makefile ] || ln -s ../Makefile.subdir $$i/Makefile; \
	done

PHONY = 

define DIR_template
$(1):
	make -C $(1)

PHONY += $(1)
endef

DIRS = $(patsubst %/Makefile,%,$(wildcard */Makefile))
$(info $(DIRS))

$(foreach dir,$(DIRS),$(eval $(call DIR_template, $(dir))))

dirs: $(DIRS)

index.html:
	wget -O $@.new https://video.fosdem.org/2015/
	mv $@.new $@

.PHONY: default all index.html dirs $(PHONY)
