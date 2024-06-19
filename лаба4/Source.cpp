#include <iostream>

extern "C" float funcASM(unsigned int n, float a[]); //объ€вл внеш функ

int main() {
	unsigned int n;
	std::cout << "input n>1: "; //вывод сообщ в конс
	std::cin >> n; //счит знач из конс
	float* arr = (float*)malloc(n * sizeof(float));
	//после вызова функ цел числ помещ в рег еах едх и в пам€ть

	funcASM(n, arr);
	std::cout << "result: ";
	for (int i = 0; i < n; i++)
		std::cout << arr[i] << " ";
	std::cout << '\n';
	return 0;
}