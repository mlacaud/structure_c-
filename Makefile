###############################################################################
## C++ variable + build folder +  build options
###############################################################################
CC = g++
CFLAGS = -Wall -std=c++11
DIR_EXEC = bin
EXEC_NAME = testcpp
EXEC = $(DIR_EXEC)/$(EXEC_NAME)
INCLUDES =
LIBS =
#LIBS = -lsfml-graphics -lsfml-window -lsfml-system

###############################################################################
## Source files and folders
###############################################################################
SOURCEDIR = src
OBJDIR = build
SRC = $(shell find $(SOURCEDIR) -name '*.cpp')
OBJ_FILES = $(SRC:%.cpp=$(OBJDIR)/%.o)

INSTALL_DIR = /usr/local/bin/

###############################################################################
## Docker variables
###############################################################################
DOCKER_IMAGE = testcpp
DOCKER_REPO = mlacaud
DOCKER_TAG = latest
DOCKER_ALL = $(DOCKER_REPO)/$(DOCKER_IMAGE):$(DOCKER_TAG)

DOCKER_IMAGE_PROD = $(DOCKER_IMAGE)
DOCKER_REPO_PROD = $(DOCKER_REPO)
DOCKER_TAG_PROD = prod
DOCKER_ALL_PROD = $(DOCKER_REPO_PROD)/$(DOCKER_IMAGE_PROD):$(DOCKER_TAG_PROD)

DOCKER_IMAGE_BUILD = dockertestcppbuild

###############################################################################
## Other
###############################################################################
MKDIR = mkdir -p

###############################################################################
## Raw C++ build + folder creation
###############################################################################
all : directory $(EXEC)

$(EXEC) : $(OBJ_FILES)
	$(CC) -o $@ $^ $(LIBS)

$(OBJDIR)/%.o: %.cpp
	$(MKDIR) $(shell dirname $@)
	$(CC) -c -o $@ $^ $(CFLAGS)

directory:
	$(MKDIR) $(DIR_EXEC)
	$(MKDIR) $(OBJDIR)

###############################################################################
## C++ build in a docker with the dependencies
###############################################################################
docker: directory clean
	@docker build -f Dockerfile-build -t $(DOCKER_IMAGE_BUILD) .
	@docker run --rm -v $(shell pwd)/$(DIR_EXEC)/:/code/$(DIR_EXEC)/ --name=$(DOCKER_IMAGE_BUILD) $(DOCKER_IMAGE_BUILD)

###############################################################################
## Install and run binary
###############################################################################
install :
	@cp $(EXEC) $(INSTALL_DIR)

run :
	$(EXEC)

try: all run

full_install: all install

###############################################################################
## Docker image build and push
###############################################################################
docker_image: docker docker_build

docker_build:
	@docker build -t $(DOCKER_ALL) .

docker_push: docker_image
	@docker push $(DOCKER_ALL)

docker_push_prod: docker_image
	@docker tags $(DOCKER_ALL) $(DOCKER_ALL_PROD)
	@docker push $(DOCKER_ALL_PROD)

###############################################################################
## Docker image run
###############################################################################
docker_run:
	@docker run --rm -it $(DOCKER_ALL)

###############################################################################
## Clean
###############################################################################
clean_install:
	@rm $(INSTALL_DIR)/$(EXEC_NAME)

clean:
	@rm -rf $(OBJDIR)

mrproper: clean
	@rm -rf $(DIR_EXEC)
