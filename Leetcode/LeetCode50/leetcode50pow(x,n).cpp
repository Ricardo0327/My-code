#include<iostream>
using namespace std;
double myPow(double x, int n) 
{
    double r=1;
    int b=n;
    while(b)
    {
        if(b%2)
         	r*=x;
            x*=x;
            b/=2;
            //if b is a odd number ,  will run r*=x and x*=x
            //if b is a even number, will run x*=x
        }
    if(n>=0)
        return r;
    else if(n<0)
        return 1/r;
    return 0;
}
int main()
{
	double a=2.10000;
	int b=3;
	cout<<myPow(a,b)<<endl;
	return 0;
}