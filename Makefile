OBJECTS=main.o greet.o
CC=gcc

greeter: depend $(OBJECTS)
	$(CC) $(CFLAGS) -o greeter $(OBJECTS)

# NOTE: Needs GCC
.PHONY: depend
depend:
	@$(CC) $(CFLAGS) -MM $(OBJECTS:o=c) > .headerdeps

-include .headerdeps

.PHONY: clean
clean:
	rm *.o
	rm greeter
	rm .headerdeps
