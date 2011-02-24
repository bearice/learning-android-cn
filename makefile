TXT2TAGS  = txt2tags
FORMAT    = html
CHAPTERS := demo ch1 ch2 ch3
T2TFILES := index.t2t
T2TFILES += $(foreach dir,$(CHAPTERS),$(wildcard $(dir)/*.t2t))
OUTFILES := $(patsubst %.t2t,%.$(FORMAT),$(T2TFILES))

%.$(FORMAT): %.t2t config.t2t
	$(TXT2TAGS) -t $(FORMAT) -i $< -o $@
  
book.html: $(T2TFILES)
  $(TXT2TAGS) -t $(FORMAT) -i index.t2t -o $@
  
all: book.html

clean: 
	rm -rf $(OUTFILES)
  rm -rf book.html
