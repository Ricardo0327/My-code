#include<iostream>
using namespace std;
string addBinary(string a, string b) {
        int carry=0;//进位标志
        string result="";
        for(int i=a.size()-1,j=b.size()-1;i>=0 || j>=0;)
        {
            int temp;
            if(i>=0 && j>=0)
            {
                temp = a[i]-'0'+b[j]-'0'+carry;
                i--;
                j--;
            }
            else if(i>=0)
            {
                temp = a[i]-'0'+carry;
                i--;
            }
            else
            {
                temp = b[j]-'0'+carry;
                j--;
            }
            carry = temp/2;//一次运算后是否有进位
            result+=to_string(temp%2);//保存一次运算后的结果
        }
        if(carry)
        {
            result+=to_string(carry);
        }
        reverse(result.begin(),result.end());
        return result;
}
int main()
{
	string a="1010",b="1011";
	cout<<addBinary(a,b)<<endl;
	return 0;
}