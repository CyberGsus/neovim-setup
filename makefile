FNL_FILES := $(shell find fnl -name '*.fnl')
LUA_FILES := $(patsubst fnl/%.fnl, lua/%.lua, $(FNL_FILES))
# using fnl/ directory so that if I move a file, the older one doesn't get compiled.
INIT_FILES := $(patsubst fnl/%, lua/%/init.lua, $(shell find fnl -type d -and -not -name 'fnl'))




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
