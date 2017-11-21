
SRCS = $(wildcard *.c)

OBJS = $(patsubst %c, %o, $(SRCS))
    
$(output_lib):$(OBJS)
	$(cc) $(OBJS) $(LDFLAGS) -o $(output_lib)

libmlog.a:$(OBJS)
	ar cr libmlog.a mlog.o

%.o:%.c
	$(cc) $(CCFLAGS) -c $<
   
.PHONY: clean
clean:
	@rm -rf *.o $(output_debug) $(output_release) $(output_lib)   
