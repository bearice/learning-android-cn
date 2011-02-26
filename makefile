TXT2TAGS  = txt2tags
FORMAT    = html
CHAPTERS := . ch1 ch2 ch3 ch4 ch5 ch6 ch7 ch8 ch9 ch10 ch11 ch12 ch13 ch14 ch15
T2TFILES := $(foreach dir,$(CHAPTERS),$(wildcard $(dir)/*.t2t))
OUTFILES := $(patsubst %.t2t,%.$(FORMAT),$(T2TFILES))

%.$(FORMAT): %.t2t config.t2t
	$(TXT2TAGS) -t $(FORMAT) -i $< -o $@
  
book.html: $(T2TFILES)
	$(TXT2TAGS) -t $(FORMAT) -i index.t2t -o $@
  
all: book.html

clean:
	rm -rf $(OUTFILES)
	rm -rf book.html

.PHONY: all clean
