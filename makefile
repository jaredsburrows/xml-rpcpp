CXX			= g++
SRC			= ./src
TEST 		= ./test
DOC 		= ./doc
CPPFLAGS	= -I$(SRC)
GCCWARN		= -lstdc++ -std=c++11 -g -Wall -O2
CXXFLAGS	= $(GCCWARN) $(INCLUDES)
LIB			= ./libXmlRpc.a
LDLIBS		= $(LIB)
OBJ			= $(SRC)/XmlRpcClient.o $(SRC)/XmlRpcDispatch.o \
			$(SRC)/XmlRpcServer.o $(SRC)/XmlRpcServerConnection.o \
			$(SRC)/XmlRpcServerMethod.o $(SRC)/XmlRpcSocket.o $(SRC)/XmlRpcSource.o \
			$(SRC)/XmlRpcUtil.o $(SRC)/XmlRpcValue.o

all:		$(LIB) tests

$(LIB):		$(OBJ)
			$(AR) $(ARFLAGS) $(LIB) $(OBJ)

tests:		$(LIB)
			cd $(TEST) && $(MAKE) CXX=$(CXX) CXXFLAGS="$(CXXFLAGS)"

doc doxygen:
			cd $(SRC) && doxygen Doxyfile

clean:
			rm -f $(SRC)/*.o
			rm -f $(SRC)/*~
			rm -f $(LIB)
			rm -rf $(DOC)
			rm -rf $(TEST)/*.dSYM
			cd $(TEST) && $(MAKE) clean
