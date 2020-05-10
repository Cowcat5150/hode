CXX = g++ --specs=warpup -O2 -mcpu=603e
CC = gcc --specs=warpup -O2 -mcpu=603e

SDL_CFLAGS = `sdl-config-wos --cflags`
SDL_LIBS = `sdl-config-wos --libs`

CPPFLAGS += -Wall -Wpedantic -noixemul -ffast-math $(SDL_CFLAGS) $(DEFINES) -MMD

SRCS = andy.cpp benchmark.cpp fileio.cpp fs_posix.cpp game.cpp \
	level1_rock.cpp level2_fort.cpp level3_pwr1.cpp level4_isld.cpp \
	level5_lava.cpp level6_pwr2.cpp level7_lar1.cpp level8_lar2.cpp level9_dark.cpp \
	lzw.cpp main.cpp mdec.cpp menu.cpp mixer.cpp monsters.cpp paf.cpp random.cpp \
	resource.cpp screenshot.cpp sound.cpp staticres.cpp system_sdl2.cpp \
	util.cpp video.cpp

SCALERS := scaler_nearest.cpp scaler_xbr.cpp

OBJS = $(SRCS:.cpp=.o) $(SCALERS:.cpp=.o) 3p/inih/ini.o 3p/libxbr-standalone/xbr.o
DEPS = $(SRCS:.cpp=.d) $(SCALERS:.cpp=.d) 3p/inih/ini.d 3p/libxbr-standalone/xbr.d

all: hode_wos

hode_wos: $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(SDL_LIBS)

clean:
	rm -f $(OBJS) $(DEPS)

-include $(DEPS)
