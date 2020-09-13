PROJECT = Oravi
VERSION = 0.1.0

CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Werror -Wextra

TMPL = version.hpp.in
GEN = $(TMPL:.hpp.in=.hpp)

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.cpp.o)
EXE = oravi

DBG_DIR = target/debug
DBG_EXE = $(DBG_DIR)/$(EXE)
DBG_OBJS = $(addprefix $(DBG_DIR)/, $(OBJS))
-include $(DBG_OBJS:.o=.d)
DBG_CXXFLAGS = -g -O0

REL_DIR = target/release
REL_EXE = $(REL_DIR)/$(EXE)
REL_OBJS = $(addprefix $(REL_DIR)/, $(OBJS))
-include $(REL_OBJS:.o=.d)
REL_CXXFLAGS = -O3 -DNDEBUG

CXXOPTS_INCLUDE=-I./deps/cxxopts/include/
FMT_INCLUDE=-I./deps/fmt/include/
INCLUDES=-I. $(CXXOPTS_INCLUDE) $(FMT_INCLUDE)

RELEASE?=''
ARGS?=''

ifndef VERBOSE
  .SILENT:
endif

.PHONY: all run clean
all: release

clean: clean-debug clean-release

run: run-debug


.PHONY: run-debug run-release
run-debug: debug
	printf "\033[1;36mExecuting %s\033[0m\n" "$(DBG_EXE)"
	./$(DBG_EXE) $(ARGS)

run-release: release 
	printf "\033[1;36mExecuting %s\033[0m\n" "$(REL_EXE)"
	$(REL_EXE) $(ARGS)


.PHONY: prep-debug prep-release
prep-debug:
	printf "\033[1;35mScanning dependencies of target oravi\033[0m\n"
	@mkdir -p $(DBG_DIR)

prep-release:
	printf "\033[1;35mScanning dependencies of target oravi\033[0m\n"
	@mkdir -p $(REL_DIR)

.PHONY: clean-debug clean-release
clean-debug:
	if [ -d "$(DBG_DIR)" ]; then printf "\033[1;33mRemoving build files of target oravi\033[0m\n"; fi
	@rm -rf $(DBG_DIR) $(GEN)

clean-release:
	if [ -d "$(REL_DIR)" ]; then printf "\033[1;33mRemoving build files of target oravi\033[0m\n"; fi
	@rm -rf $(REL_DIR) $(GEN)

.PHONY: debug release _debug _release
debug:
	if command -v bear &>/dev/null; then bear $(MAKE) --no-print-directory _debug RELEASE=alpha; else $(MAKE) --no-print-directory _debug RELEASE=alpha; fi

release:
	if command -v bear &>/dev/null; then bear $(MAKE) --no-print-directory _release RELEASE=''; else $(MAKE) --no-print-directory _release RELEASE=''; fi

_debug: prep-debug $(GEN) $(DBG_EXE)

_release: prep-release $(GEN) $(REL_EXE)


$(DBG_EXE): $(DBG_OBJS)
	printf "\033[1;32mLinking CXX executable oravi\033[0m\n"
	$(CXX) $(CXXFLAGS) $(DBG_CXXFLAGS) $(INCLUDES) -o $(DBG_EXE) $^
	printf "Built target oravi\n"

$(REL_EXE): $(REL_OBJS)
	printf "\033[1;32mLinking CXX executable oravi\033[0m\n"
	$(CXX) $(CXXFLAGS) $(REL_CXXFLAGS) $(INCLUDES) -o $(REL_EXE) $^
	printf "Built target oravi\n"


$(DBG_DIR)/%.cpp.o: %.cpp
	printf "\033[32mBuilding CXX object %s\033[0m\n" "$@"
	$(CXX) -c $(CXXFLAGS) $(DBG_CXXFLAGS) $(INCLUDES) -o $@ $<

$(REL_DIR)/%.cpp.o: %.cpp
	printf "\033[32mBuilding CXX object %s\033[0m\n" "$@"
	$(CXX) -c $(CXXFLAGS) $(REL_CXXFLAGS) $(INCLUDES) -o $@ $<

%.hpp: %.hpp.in
	printf "\033[34mConfiguring CXX header %s\033[0m\n" "$@"
	sed -e 's/{{VERSION_CORE}}/$(VERSION)/g' -e 's/{{VERSION_RELEASE}}/$(RELEASE)/g' -e "s/{{VERSION_BUILD}}/$$(git log -1 --pretty=format:"%h")/g" $< > $@
