#include "functions.hpp"

using namespace std;

DNA* createRandomDNA() {
	DNA *dna = new DNA();
	int limbNb;

	LimbStrand limbStrand;
	limbNb = limbStrand.getNumber();

	EarStrand earStrand(limbNb);
	EyeStrand eyeStrand(limbNb);
	MouthStrand mouthStrand(limbNb);
	NostrilStrand nostrilStrand(limbNb);

	dna->addStrand(&limbStrand);
	dna->addStrand(&earStrand);
	dna->addStrand(&eyeStrand);
	dna->addStrand(&mouthStrand);
	dna->addStrand(&nostrilStrand);

	LimbStrand* limb = (LimbStrand*) dna->getDNAStrand()[0];
	cout << limb->getNumber() << endl;

	return dna;
}

DNA mating(DNA dnaStrand1, DNA dnaStrand2) {

	int choice;
	DNA newDNA;

	vector<Strand*> vectorDNAStrand1 = dnaStrand1.getDNAStrand();
	vector<Strand*> vectorDNAStrand2 = dnaStrand2.getDNAStrand();

	if(vectorDNAStrand1.size() != vectorDNAStrand2.size()) {
		cerr << "Can't mate, creatures have mismatched DNA" << endl;
		return newDNA;
	}

	for(unsigned i = 0; i < vectorDNAStrand1.size(); i++) {
		choice = rand()%2;
		if(choice == 0) {
			newDNA.addStrand(vectorDNAStrand1[i]);
			cout << "DNA taken from first Strand" << endl;
		}
		else {
			newDNA.addStrand(vectorDNAStrand2[i]);
			cout << "DNA taken from second Strand" << endl;
		}
	}

	return newDNA;

}
