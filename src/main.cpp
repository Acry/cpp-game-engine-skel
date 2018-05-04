#include <iostream>
#include "audio.h"
#include "data.h"
#include "input.h"
#include "interface.h"
#include "logic.h"
#include "screens.h"
#include "visuals.h"

using namespace std;

int main(void) 
{
	cout << "Hello from main" << endl;
	audio_hello();
	data_hello();
	input_hello();
	interface_hello();
	logic_hello();
	screens_hello();
	visuals_hello();
	return 0;
}
