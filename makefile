
CC = mingw32-gcc 

#OBJ: main.o a.o
#	gcc main.o a.o -o OBJ
#
#main.o: main.c a.h
#		gcc -c main.c
#		
#a.o: a.c a.h
#	gcc -c a.c

BUILD_DIR = build

C_SOURCES =  \
main.c \
a/a.c 

OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
#	$(CC) main.o a.o -o main


main:$(OBJECTS)
	@ $(CC) $^ -o $@

$(BUILD_DIR)/%.o: %.c  | $(BUILD_DIR)
	@echo -e "build \t $@"
	@ $(CC) -c $< -o $@
	
$(BUILD_DIR):
	@ mkdir $@	
#main.o: a.h	
#a.o: a.h

.PHONY:clean
clean:
	del  *.exe
	rmdir build /S /Q
	
.PHONY:show

show:
	@echo $(OBJECTS)
	@echo $(sort $(dir $(C_SOURCES)))
	
	
	
	
	
	