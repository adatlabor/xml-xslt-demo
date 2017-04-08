# This is a Java Saxon-driven Makefile.
# Usage:
#
# make all
#
XSLTPROC_CMD=java -cp lib/saxon9he.jar net.sf.saxon.Transform
DATASOURCE=SHIP.xml

.PHONY: clean all

all: web/list.out.html web/filter.out.xml web/index.out.html web/list2csv.out.csv web/join.out.xml web/join2.out.xml 

web/%.out.html: src/%.xsl $(DATASOURCE)
	$(XSLTPROC_CMD) -xsl:$< -s:$(DATASOURCE) -o:$@

web/%.out.xml: src/%.xsl $(DATASOURCE)
	$(XSLTPROC_CMD) -xsl:$< -s:$(DATASOURCE) -o:$@

web/%.out.csv: src/%.xsl $(DATASOURCE)
	$(XSLTPROC_CMD) -xsl:$< -s:$(DATASOURCE) -o:$@

clean:
	rm -f web/*.out.xml web/*.out.html web/*.out.csv
