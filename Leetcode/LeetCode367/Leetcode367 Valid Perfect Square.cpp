#include<iostream>
using namespace std;
bool isPerfectSquare(int num) 
{
	int sum=1;
	while(num>0)
	{
		num-=sum;
		sum+=2;
	}
	return (num==0)?true:false;
}
int main()
{
	int a=16,b=14;
	if(isPerfectSquare(a))
		cout<<a<<" is a perfect square"<<endl;
	else
		cout<<a<<" is not a perfect square"<<endl;
	if(isPerfectSquare(b))
		cout<<b<<" is a perfect square"<<endl;
	else
		cout<<b<<" is not a perfect square"<<endl;
	return 0;
}