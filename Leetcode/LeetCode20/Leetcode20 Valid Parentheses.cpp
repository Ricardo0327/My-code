#include<iostream>
#include<stack>
using namespace std;
bool isValid(string s) {
    stack<char>s1;
    for(int i=0;i<s.length();i++)
        {
	    //put the left parentheses into the stack
            if(s[i]=='(' || s[i]== '[' || s[i]=='{')
            {
                s1.push(s[i]);
            }
            else
            {
		//if the string only contains right parentheses,return false
                if(s1.size()==0)
                {
                    return false;
                }
		//use right parentheses to match left parentheses which is corresponding
                if(s[i]==')')
                {
                    if(s1.top()=='(')
                    {
                        s1.pop();
                    }
                    else
                    {
                       return false; 
                    }
                }
                if(s[i]==']')
                {
                    if(s1.top()=='[')
                    {
                        s1.pop();
                    }
                    else
                    {
                        return false;
                    }
                }
                if(s[i]=='}')
                {
                    if(s1.top()=='{')
                    {
                        s1.pop();
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    // when stack is empty,the string is completly match
    if(s1.empty())
    {
        return true;
    }   
    else
    {
        return false;
    }
}
int main()
{
	string a="()[]{}";
	if(isValid(a))
		cout<<"yes"<<endl;
	else
		cout<<"no"<<endl;
	return 0;
}
