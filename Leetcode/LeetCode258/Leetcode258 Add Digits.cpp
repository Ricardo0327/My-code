#include<iostream>
using namespace std;
int addDigits(int num) {
        while(num>=10)
        {
            int ans=0;
            while(num)
            {   
                ans+=num%10;
                num/=10;
            }
            num=ans;
        }
        return num;
}
int main()
{
	int a=38;
	cout<<addDigits(a)<<endl;
	return 0;
}