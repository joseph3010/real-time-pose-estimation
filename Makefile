# the compiler: g++ for C++ program
CC = g++

#----------

MESH= Mesh.cpp Mesh.h CsvReader.h 
#Utils.h PnPProblem.h ModelRegistration.h

MODEL= Model.cpp Model.h CsvWriter.h 
#Utils.h PnPProblem.h ModelRegistration.h Mesh.h

MODELREGISTRATION= ModelRegistration.cpp ModelRegistration.h

ROBUSTERMATCH= RobustMatcher.cpp RobustMatcher.h

PNPPROBLEM= PnPProblem.cpp PnPProblem.h Mesh.h 
#ModelRegistratio.h

UTILS= Utils.cpp ModelRegistration.h PnPProblem.h Utils.h 

CSVREADER= CsvReader.cpp CsvReader.h 
#Utils.h PnPProblem.h ModelRegistration.h Mesh.h

CSVWRITER= CsvWriter.cpp CsvWriter.h 
#Utils.h PnPProblem.h ModelRegistration.h Mesh.h

MAIN_REGISTRATION=main_registration.cpp Mesh.h Model.h PnPProblem.h RobustMatcher.h ModelRegistration.h Utils.h

MAIN_DETECTION=main_detection.cpp Mesh.h Model.h PnPProblem.h RobustMatcher.h ModelRegistration.h Utils.h

# compiler flags:
INCLUDE = `pkg-config --cflags --libs opencv`

all: detection registration


registration: main_registration.o Mesh.o Model.o PnPProblem.o RobustMatcher.o ModelRegistration.o Utils.o CsvReader.o CsvWriter.o 
	$(CC) -o registration main_registration.o Mesh.o Model.o PnPProblem.o RobustMatcher.o ModelRegistration.o Utils.o CsvReader.o CsvWriter.o $(INCLUDE)



detection: main_detection.o Mesh.o Model.o PnPProblem.o RobustMatcher.o ModelRegistration.o Utils.o CsvReader.o CsvWriter.o 
	$(CC) -o detection main_detection.o Mesh.o Model.o PnPProblem.o RobustMatcher.o ModelRegistration.o Utils.o CsvReader.o CsvWriter.o $(INCLUDE)




CsvReader.o: $(CSVREADER)
	$(CC) -c $(CSVREADER) $(INCLUDE)

CsvWriter.o: $(CSVWRITER)
	$(CC) -c $(CSVWRITER) $(INCLUDE)

ModelRegistration.o: $(MODELREGISTRATION)
	$(CC) -c $(MODELREGISTRATION) $(INCLUDE)

Mesh.o: $(MESH)
	$(CC) -c $(MESH) $(INCLUDE)

Model.o: $(MODEL) 	
	$(CC) -c $(MODEL) $(INCLUDE)

PnPProblem.o: $(PNPPROBLEM)
	$(CC) -c $(PNPPROBLEM) $(INCLUDE)

Utils.o: $(UTILS)
	$(CC) -c $(UTILS) $(INCLUDE)

RobustMatcher.o: $(ROBUSTERMATCH) 
	$(CC) -c $(ROBUSTERMATCH) $(INCLUDE)

main_registration.o: $(MAIN_REGISTRATION)  
	$(CC) -c $(MAIN_REGISTRATION) $(INCLUDE)

main_detection.o: $(MAIN_DETECTION) 
	$(CC) -c $(MAIN_DETECTION) $(INCLUDE)


clean_reg:
	$(RM) registration *.o *~ *.h.gch

clean_det: 
	$(RM) detection *.o *~ *.h.gch
