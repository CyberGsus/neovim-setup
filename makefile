FNL_FILES := $(shell find fnl -name '*.fnl')
LUA_FILES := $(patsubst fnl/%.fnl, lua/%.lua, $(FNL_FILES))
INIT_FILES := $(patsubst fnl/%, lua/%/init.lua, $(shell find fnl -type d -and -not -name 'fnl'))



# make the init.lua files for further directories
# automatically, so I don't miss any requires.
lua/%/init.lua: fnl/%
	@wait
	@echo "Making init file for $(dir $@)"
	@rm -f $@
	@find $(dir $@) -maxdepth 1 -not -name 'init.lua' \
		-not -wholename '$(dir $@)' | sed -e \
		's/\.lua$$//;s+^lua/++;s/.*/require "\0"/' >> $@ &


lua/%.lua: fnl/%.fnl
	@echo "Compiling $^"
	@mkdir -p $(dir $@) && \
	fennel --compile $^ > $@ &



.PHONY: all_files
.PHONY: clean



all_files: $(LUA_FILES) $(INIT_FILES)

clean:
	@rm -rf lua

all: all_files
