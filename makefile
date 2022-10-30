cc_local=g++
SOURCES0=main.cpp log.cpp common.cpp lib/fec.cpp lib/rs.cpp packet.cpp delay_manager.cpp fd_manager.cpp connection.cpp fec_manager.cpp misc.cpp tunnel_client.cpp tunnel_server.cpp
SOURCES=${SOURCES0} my_ev.cpp -isystem libev 
ifeq ($(NAME),)
NAME=speederv2
endif


FLAGS= -std=c++11 -Wall -Wextra -Wno-unused-variable -Wno-unused-parameter -Wno-missing-field-initializers ${OPT}

# targets for nativei (non-cross) compile 
all:git_version
	rm -f ${NAME}
	${cc_local}   -o ${NAME}          -I. ${SOURCES} ${FLAGS} -lrt -lgcc_eh -static -O3

git_version:
	    echo "const char *gitversion = \"$(shell git rev-parse HEAD)\";" > git_version.h
