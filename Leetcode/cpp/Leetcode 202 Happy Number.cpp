#include<iostream>
#include<cmath>
using namespace std;
bool isHappy(int n) {
    for(int i=0;i<8;i++)
   	{
        int ans=0;
        while(n)
        {
           	ans+=pow(n%10,2);
            n/=10;
        }
  	    if(ans==1)
           return true;
        else
		   n=ans;
    }
        return false;
}
int main()
{
	int num = 19;
	if(isHappy(num))
		cout<<num<<" is a happy number!"<<endl;
	else
		cout<<num<<" is not a happy number"<<endl;
	return 0;
}