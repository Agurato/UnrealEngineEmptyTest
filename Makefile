CC=g++
CFLAGS= -std=c++11 -Wall -g
LDFLAGS= -lxerces-c

parserTest : mainParserTest.o utils.o XMLData.o
	$(CC) -o parserTest.out bin/$< bin/utils/utils.o bin/parts/XMLData.o $(CFLAGS) $(LDFLAGS)

utilsTest : mainUtilsTest.o utils.o
	$(CC) -o utilsTest.out bin/$< bin/utils/utils.o $(CFLAGS) $(LDFLAGS)

reproductionTest : mainReproductionTest.o utils.o functions.o XMLData.o Strand.o EarStrand.o EyeStrand.o DNA.o
	$(CC) -o reproductionTest.out bin/$< bin/utils/utils.o bin/simfunctions/functions.o bin/parts/XMLData.o bin/dna_strands/Strand.o bin/dna_strands/EarStrand.o bin/dna_strands/EyeStrand.o bin/DNA.o $(CFLAGS) $(LDFLAGS)

creatureTest : mainCreatureTest.o utils.o XMLData.o Strand.o EarStrand.o EyeStrand.o DNA.o Creature.o
	$(CC) -o creatureTest.out bin/$< bin/utils/utils.o bin/parts/XMLData.o bin/dna_strands/Strand.o bin/dna_strands/EarStrand.o bin/dna_strands/EyeStrand.o bin/DNA.o bin/Creature.o $(CFLAGS) $(LDFLAGS)

%Test.o : %Test.cpp
	$(CC) -o bin/$@ -c $< $(CFLAGS)

utils.o : utils/utils.cpp utils/utils.hpp
	$(CC) -o bin/utils/utils.o -c $< $(CFLAGS)

XMLData.o : parts/XMLData.cpp parts/XMLData.hpp
	$(CC) -o bin/parts/XMLData.o -c $< $(CFLAGS) $(LDFLAGS)

functions.o : simfunctions/functions.cpp simfunctions/functions.hpp
	$(CC) -o bin/simfunctions/functions.o -c $< $(CFLAGS)

DNA.o : DNA.cpp DNA.hpp
	$(CC) -o bin/DNA.o -c $< $(CFLAGS)

Creature.o : Creature.cpp Creature.hpp
	$(CC) -o bin/Creature.o -c $< $(CFLAGS)

%.o: dna_strands/%.cpp dna_strands/%.hpp
	$(CC) -o bin/dna_strands/$@ -c $< $(CFLAGS)

clean :
	rm bin/*.o
	rm bin/*/*.o

clean_all : clean
	rm *.out
