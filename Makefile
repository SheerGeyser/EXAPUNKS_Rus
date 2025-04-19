.PHONY: all split combine

all: split

split:
	mkdir -p pages/metric_en_2
	pdftoppm -png -r 300 metric_en_2.pdf pages/metric_en_2/page

	mkdir -p pages/metric_en_1
	pdftoppm -png -r 300 metric_en_1.pdf pages/metric_en_1/page

	mkdir -p pages/letter_en_2
	pdftoppm -png -r 300 letter_en_2.pdf pages/letter_en_2/page

	mkdir -p pages/letter_en_1
	pdftoppm -png -r 300 letter_en_1.pdf pages/letter_en_1/page

	mkdir -p pages/epilogue_en
	pdftoppm -png -r 300 epilogue_en.pdf pages/epilogue_en/page

	mkdir -p pages/digital_en_2
	pdftoppm -png -r 300 digital_en_2.pdf pages/digital_en_2/page

	mkdir -p pages/digital_en_1
	pdftoppm -png -r 300 digital_en_1.pdf pages/digital_en_1/page


imagick:
	sudo apt install imagemagick

combine:
	@for dir in pages/*; do \
		name=$$(basename $$dir); \
		echo "-> Собираем $$name в $${name}_ru.pdf"; \
		convert $$dir/page-*.png $${name}_ru.pdf; \
	done
