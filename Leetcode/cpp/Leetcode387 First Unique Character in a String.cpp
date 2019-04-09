#include<iostream>
#include<string.h>
using namespace std;
int firstUniqChar(string s) 
{
	const int maxsize = 27;
	unsigned int hash[27];
	memset(hash,0,sizeof(hash));//将数组元素初始化为0
	for(int i=0;i<s.length();i++)
	{
		hash[s[i]-'a']++;//建立映射关系
	}
	for(int i=0;i<s.length();i++)
	{
		if(hash[s[i]-'a']==1)
		{
			return i;
		}
	}
	return -1;
}
int main()
{
	string str="loveleetcode";
	cout<<firstUniqChar(str)<<endl;
	return 0;
}