srcdir = /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0
builddir = /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0
top_srcdir = /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0
top_builddir = /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0
EGREP = /usr/bin/grep -E
SED = /usr/bin/sed
CONFIGURE_COMMAND = './configure' '--with-php-config=/home/work/php8-master/php-8.3.15/.tmp/install/php/bin/php-config'
CONFIGURE_OPTIONS = '--with-php-config=/home/work/php8-master/php-8.3.15/.tmp/install/php/bin/php-config'
SHLIB_SUFFIX_NAME = so
SHLIB_DL_SUFFIX_NAME = so
AWK = gawk
IMAGICK_SHARED_LIBADD = -lMagickWand-6.Q16 -lMagickCore-6.Q16
shared_objects_imagick = imagick_file.lo imagick_class.lo imagickdraw_class.lo imagickpixel_class.lo imagickpixeliterator_class.lo imagick_helpers.lo imagick.lo imagickkernel_class.lo shim_im6_to_im7.lo
PHP_PECL_EXTENSION = imagick
PHP_MODULES = $(phplibdir)/imagick.la
PHP_ZEND_EX =
all_targets = $(PHP_MODULES) $(PHP_ZEND_EX)
install_targets = install-modules install-headers
prefix = /home/work/php8-master/php-8.3.15/.tmp/install/php
exec_prefix = $(prefix)
libdir = ${exec_prefix}/lib
prefix = /home/work/php8-master/php-8.3.15/.tmp/install/php
phplibdir = /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/modules
phpincludedir = /home/work/php8-master/php-8.3.15/.tmp/install/php/include/php
CC = /usr/bin/gcc
CFLAGS = -g -O2 -fPIC
CFLAGS_CLEAN = $(CFLAGS) -D_GNU_SOURCE
CPP = /usr/bin/gcc -E
CPPFLAGS = -DHAVE_CONFIG_H
CXX = /usr/bin/gcc
CXXFLAGS =
CXXFLAGS_CLEAN = $(CXXFLAGS)
EXTENSION_DIR = /home/work/php8-master/php-8.3.15/.tmp/install/php/ext
PHP_EXECUTABLE = /home/work/php8-master/php-8.3.15/.tmp/install/php/bin/php
EXTRA_LDFLAGS =
EXTRA_LIBS =
INCLUDES = -I/home/work/php8-master/php-8.3.15/.tmp/install/php/include/php -I/home/work/php8-master/php-8.3.15/.tmp/install/php/include/php/main -I/home/work/php8-master/php-8.3.15/.tmp/install/php/include/php/TSRM -I/home/work/php8-master/php-8.3.15/.tmp/install/php/include/php/Zend -I/home/work/php8-master/php-8.3.15/.tmp/install/php/include/php/ext -I/home/work/php8-master/php-8.3.15/.tmp/install/php/include/php/ext/date/lib -I/usr/include/ImageMagick-6
LFLAGS =
LDFLAGS =
SHARED_LIBTOOL =
LIBTOOL = $(SHELL) $(top_builddir)/libtool
SHELL = /bin/sh
INSTALL_HEADERS = ext/imagick/php_imagick_shared.h
BUILD_CC = /usr/bin/gcc
mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
INSTALL = $(top_srcdir)/build/shtool install -c
INSTALL_DATA = $(INSTALL) -m 644

DEFS = -I$(top_builddir)/include -I$(top_builddir)/main -I$(top_srcdir)
COMMON_FLAGS = $(DEFS) $(INCLUDES) $(EXTRA_INCLUDES) $(CPPFLAGS) $(PHP_FRAMEWORKPATH)

all: $(all_targets)
	@echo
	@echo "Build complete."
	@echo "Don't forget to run 'make test'."
	@echo

build-modules: $(PHP_MODULES) $(PHP_ZEND_EX)

build-binaries: $(PHP_BINARIES)

libphp.la: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(LIBTOOL) --tag=CC --mode=link $(CC) $(LIBPHP_CFLAGS) $(CFLAGS) $(EXTRA_CFLAGS) -rpath $(phptempdir) $(EXTRA_LDFLAGS) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@
	-@$(LIBTOOL) --silent --tag=CC --mode=install cp $@ $(phptempdir)/$@ >/dev/null 2>&1

libs/libphp.bundle: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(CC) $(MH_BUNDLE_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_SAPI_OBJS:.lo=.o) $(PHP_FRAMEWORKS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@ && cp $@ libs/libphp.so

install: $(all_targets) $(install_targets)

install-sapi: $(OVERALL_TARGET)
	@echo "Installing PHP SAPI module:       $(PHP_SAPI)"
	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	-@if test ! -r $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME); then \
		for i in 0.0.0 0.0 0; do \
			if test -r $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME).$$i; then \
				$(LN_S) $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME).$$i $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME); \
				break; \
			fi; \
		done; \
	fi
	@$(INSTALL_IT)

install-binaries: build-binaries $(install_binary_targets)

install-modules: build-modules
	@test -d modules && \
	$(mkinstalldirs) $(INSTALL_ROOT)$(EXTENSION_DIR)
	@echo "Installing shared extensions:     $(INSTALL_ROOT)$(EXTENSION_DIR)/"
	@rm -f modules/*.la >/dev/null 2>&1
	@$(INSTALL) modules/* $(INSTALL_ROOT)$(EXTENSION_DIR)

install-headers:
	-@if test "$(INSTALL_HEADERS)"; then \
		for i in `echo $(INSTALL_HEADERS)`; do \
			i=`$(top_srcdir)/build/shtool path -d $$i`; \
			paths="$$paths $(INSTALL_ROOT)$(phpincludedir)/$$i"; \
		done; \
		$(mkinstalldirs) $$paths && \
		echo "Installing header files:          $(INSTALL_ROOT)$(phpincludedir)/" && \
		for i in `echo $(INSTALL_HEADERS)`; do \
			if test "$(PHP_PECL_EXTENSION)"; then \
				src=`echo $$i | $(SED) -e "s#ext/$(PHP_PECL_EXTENSION)/##g"`; \
			else \
				src=$$i; \
			fi; \
			if test -f "$(top_srcdir)/$$src"; then \
				$(INSTALL_DATA) $(top_srcdir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			elif test -f "$(top_builddir)/$$src"; then \
				$(INSTALL_DATA) $(top_builddir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			else \
				(cd $(top_srcdir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i; \
				cd $(top_builddir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i) 2>/dev/null || true; \
			fi \
		done; \
	fi

PHP_TEST_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1'
PHP_TEST_SHARED_EXTENSIONS =  ` \
	if test "x$(PHP_MODULES)" != "x"; then \
		for i in $(PHP_MODULES)""; do \
			. $$i; \
			if test "x$$dlname" != "xdl_test.so"; then \
				$(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
			fi; \
		done; \
	fi; \
	if test "x$(PHP_ZEND_EX)" != "x"; then \
		for i in $(PHP_ZEND_EX)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d zend_extension=$(top_builddir)/modules/$$dlname"; \
		done; \
	fi`
PHP_DEPRECATED_DIRECTIVES_REGEX = '^(magic_quotes_(gpc|runtime|sybase)?|(zend_)?extension(_debug)?(_ts)?)[\t\ ]*='

test: all
	@if test ! -z "$(PHP_EXECUTABLE)" && test -x "$(PHP_EXECUTABLE)"; then \
		INI_FILE=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r 'echo php_ini_loaded_file();' 2> /dev/null`; \
		if test "$$INI_FILE"; then \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_FILE" > $(top_builddir)/tmp-php.ini; \
		else \
			echo > $(top_builddir)/tmp-php.ini; \
		fi; \
		INI_SCANNED_PATH=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r '$$a = explode(",\n", trim(php_ini_scanned_files())); echo $$a[0];' 2> /dev/null`; \
		if test "$$INI_SCANNED_PATH"; then \
			INI_SCANNED_PATH=`$(top_srcdir)/build/shtool path -d $$INI_SCANNED_PATH`; \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_SCANNED_PATH"/*.ini >> $(top_builddir)/tmp-php.ini; \
		fi; \
		TEST_PHP_EXECUTABLE=$(PHP_EXECUTABLE) \
		TEST_PHP_SRCDIR=$(top_srcdir) \
		CC="$(CC)" \
			$(PHP_EXECUTABLE) -n -c $(top_builddir)/tmp-php.ini $(PHP_TEST_SETTINGS) $(top_srcdir)/run-tests.php -n -c $(top_builddir)/tmp-php.ini -d extension_dir=$(top_builddir)/modules/ $(PHP_TEST_SHARED_EXTENSIONS) $(TESTS); \
		TEST_RESULT_EXIT_CODE=$$?; \
		rm $(top_builddir)/tmp-php.ini; \
		exit $$TEST_RESULT_EXIT_CODE; \
	else \
		echo "ERROR: Cannot run tests without CLI sapi."; \
	fi

clean:
	find . -name \*.gcno -o -name \*.gcda | xargs rm -f
	find . -name \*.lo -o -name \*.o -o -name \*.dep | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f
	find . -name \*.so | xargs rm -f
	find . -name .libs -a -type d|xargs rm -rf
	rm -f libphp.la $(SAPI_CLI_PATH) $(SAPI_CGI_PATH) $(SAPI_LITESPEED_PATH) $(SAPI_FPM_PATH) $(OVERALL_TARGET) modules/* libs/*
	rm -f ext/opcache/jit/zend_jit_x86.c
	rm -f ext/opcache/jit/zend_jit_arm64.c
	rm -f ext/opcache/minilua

distclean: clean
	rm -f Makefile config.cache config.log config.status Makefile.objects Makefile.fragments libtool main/php_config.h main/internal_functions_cli.c main/internal_functions.c Zend/zend_dtrace_gen.h Zend/zend_dtrace_gen.h.bak Zend/zend_config.h
	rm -f main/build-defs.h scripts/phpize
	rm -f ext/date/lib/timelib_config.h ext/mbstring/libmbfl/config.h ext/oci8/oci8_dtrace_gen.h ext/oci8/oci8_dtrace_gen.h.bak
	rm -f scripts/man1/phpize.1 scripts/php-config scripts/man1/php-config.1 sapi/cli/php.1 sapi/cgi/php-cgi.1 sapi/phpdbg/phpdbg.1 ext/phar/phar.1 ext/phar/phar.phar.1
	rm -f sapi/fpm/php-fpm.conf sapi/fpm/init.d.php-fpm sapi/fpm/php-fpm.service sapi/fpm/php-fpm.8 sapi/fpm/status.html
	rm -f ext/phar/phar.phar ext/phar/phar.php
	if test "$(srcdir)" != "$(builddir)"; then \
	  rm -f ext/phar/phar/phar.inc; \
	fi
	$(EGREP) define'.*include/php' $(top_srcdir)/configure | $(SED) 's/.*>//'|xargs rm -f

prof-gen:
	CCACHE_DISABLE=1 $(MAKE) PROF_FLAGS=-fprofile-generate all
	find . -name \*.gcda | xargs rm -f

prof-clean:
	find . -name \*.lo -o -name \*.o | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f
	find . -name \*.so | xargs rm -f
	rm -f libphp.la $(SAPI_CLI_PATH) $(SAPI_CGI_PATH) $(SAPI_LITESPEED_PATH) $(SAPI_FPM_PATH) $(OVERALL_TARGET) modules/* libs/*

prof-use:
	CCACHE_DISABLE=1 $(MAKE) PROF_FLAGS=-fprofile-use all

%_arginfo.h: %.stub.php
	@if test -e "$(top_srcdir)/build/gen_stub.php"; then \
		if test ! -z "$(PHP)"; then \
			echo Parse $< to generate $@;\
			$(PHP) $(top_srcdir)/build/gen_stub.php $<; \
		elif test ! -z "$(PHP_EXECUTABLE)" && test -x "$(PHP_EXECUTABLE)"; then \
			echo Parse $< to generate $@;\
			$(PHP_EXECUTABLE) $(top_srcdir)/build/gen_stub.php $<; \
		fi; \
	fi;

.PHONY: all clean install distclean test prof-gen prof-clean prof-use
.NOEXPORT:
-include imagick_file.dep
imagick_file.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick_file.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick_file.c -o imagick_file.lo  -MMD -MF imagick_file.dep -MT imagick_file.lo
-include imagick_class.dep
imagick_class.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick_class.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick_class.c -o imagick_class.lo  -MMD -MF imagick_class.dep -MT imagick_class.lo
-include imagickdraw_class.dep
imagickdraw_class.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickdraw_class.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickdraw_class.c -o imagickdraw_class.lo  -MMD -MF imagickdraw_class.dep -MT imagickdraw_class.lo
-include imagickpixel_class.dep
imagickpixel_class.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickpixel_class.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickpixel_class.c -o imagickpixel_class.lo  -MMD -MF imagickpixel_class.dep -MT imagickpixel_class.lo
-include imagickpixeliterator_class.dep
imagickpixeliterator_class.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickpixeliterator_class.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickpixeliterator_class.c -o imagickpixeliterator_class.lo  -MMD -MF imagickpixeliterator_class.dep -MT imagickpixeliterator_class.lo
-include imagick_helpers.dep
imagick_helpers.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick_helpers.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick_helpers.c -o imagick_helpers.lo  -MMD -MF imagick_helpers.dep -MT imagick_helpers.lo
-include imagick.dep
imagick.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagick.c -o imagick.lo  -MMD -MF imagick.dep -MT imagick.lo
-include imagickkernel_class.dep
imagickkernel_class.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickkernel_class.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/imagickkernel_class.c -o imagickkernel_class.lo  -MMD -MF imagickkernel_class.dep -MT imagickkernel_class.lo
-include shim_im6_to_im7.dep
shim_im6_to_im7.lo: /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/shim_im6_to_im7.c
	$(LIBTOOL) --tag=CC --mode=compile $(CC) -I. -I/home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0 $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/ImageMagick-6   -DZEND_COMPILE_DL_EXT=1 -c /home/work/php8-master/php-8.3.15/ext/.tmp/imagick-3.7.0/shim_im6_to_im7.c -o shim_im6_to_im7.lo  -MMD -MF shim_im6_to_im7.dep -MT shim_im6_to_im7.lo
$(phplibdir)/imagick.la: ./imagick.la
	$(LIBTOOL) --tag=CC --mode=install cp ./imagick.la $(phplibdir)

./imagick.la: $(shared_objects_imagick) $(IMAGICK_SHARED_DEPENDENCIES)
	$(LIBTOOL) --tag=CC --mode=link $(CC) -shared $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS)  -o $@ -export-dynamic -avoid-version -prefer-pic -module -rpath $(phplibdir) $(EXTRA_LDFLAGS) $(shared_objects_imagick) $(IMAGICK_SHARED_LIBADD)

