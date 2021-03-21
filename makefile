FNL_FILES := $(shell find fnl -name '*.fnl')
LUA_FILES := $(patsubst fnl/%.fnl, lua/%.lua, $(FNL_FILES))

lua/%.lua: fnl/%.fnl
	mkdir -p $(dir $@) && \
	fennel --compile $^ > $@



.PHONY: all_files

all_files: $(LUA_FILES)


all: all_files
