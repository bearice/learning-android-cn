TXT2TAGS = txt2tags
FORMAT   = html
CHAPTERS := ch1 ch2 ch3
OUTFILES := $(patsubst %.t2t,%.$(FORMAT),$(foreach dir,$(CHAPTERS),$(wildcard $(dir)/*.t2t)))

%.$(FORMAT): %.t2t
	$(TXT2TAGS) -t $(FORMAT) -i $< -o $@

all: $(OUTFILES) index.$(FORMAT)


