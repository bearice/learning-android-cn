TXT2TAGS  = txt2tags
FORMAT    = html
CHAPTERS := demo ch1 ch2 ch3
T2TFILES := index.t2t
T2TFILES += $(foreach dir,$(CHAPTERS),$(wildcard $(dir)/*.t2t))
OUTFILES := $(patsubst %.t2t,%.$(FORMAT),$(T2TFILES))

%.$(FORMAT): %.t2t
	$(TXT2TAGS) -t $(FORMAT) -i $< -o $@

all: $(OUTFILES) 

clean: 
	rm -rf $(OUTFILES)
