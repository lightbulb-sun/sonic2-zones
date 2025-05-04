.DELETE_ON_ERROR:

AS = wla-z80
ASFLAGS = -v
LD = wlalink
LDFLAGS = -v -r

ASM = hack.asm
OBJ = hack.o
OUTPUT = hack.gg
TEMP = temp

$(OUTPUT): $(OBJ) $(TEMP)
	$(LD) $(LDFLAGS) $(TEMP) $@

$(TEMP): $(OBJ)
	printf "[objects]\n%s\n" $< > $@

$(OBJ): $(ASM)
	$(AS) $(ASFLAGS) -o $@ $<

.PHONY: all clean test
clean:
	rm -rf $(OUTPUT) $(OBJ) $(TEMP)
