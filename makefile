SOURCES = finite_fields.scrbl

all: $(SOURCES)
	scribble $(SOURCES)

watch: $(SOURCES)
	ls $(SOURCES) | entr scribble $(SOURCES)
