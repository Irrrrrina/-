#include <iostream>

extern "C" float funcASM(unsigned int n, float a[]); //������ ���� ����

int main() {
	unsigned int n;
	std::cout << "input n>1: "; //����� ����� � ����
	std::cin >> n; //���� ���� �� ����
	float* arr = (float*)malloc(n * sizeof(float));
	//����� ������ ���� ��� ���� ����� � ��� ��� ��� � � ������

	funcASM(n, arr);
	std::cout << "result: ";
	for (int i = 0; i < n; i++)
		std::cout << arr[i] << " ";
	std::cout << '\n';
	return 0;
}