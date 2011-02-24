TXT2TAGS  = txt2tags
FORMAT    = html
T2T_FILE := index.t2t
HTM_FILE := book.htm

html: 
	$(TXT2TAGS) -t $(FORMAT) -i $(T2T_FILE) -o $(HTM_FILE)

clean: 
	rm -rf $(HTM_FILE)
