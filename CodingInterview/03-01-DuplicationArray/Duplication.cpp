#include<iostream>
#include<vector>
#include<string.h>
using namespace std;
vector<int>Dup(int nums[],int length)
{
	vector<int>v;
	for(int i=0;i<length;i++)
	{
		while(nums[i]!=i)
		{
			if(nums[i]==nums[nums[i]])
			{
				v.push_back(nums[i]);
				break;
			}
			else
			{
				int	temp=nums[i];
				nums[i]=nums[temp];
				nums[temp]=temp;
			}
		}
	}
	return v;
}
int main()
{
	int numbers[]={2,3,1,0,2,5,3};
	//题目中要求在长度为n的数组，数组中的数字都在0～n-1范围内，以2,3,1,0,2,5,3为例，故数组长度直接设置为
	int length=sizeof(numbers)/sizeof(int);
	vector<int>res;
	res=Dup(numbers,length);
	for(int i=0;i<res.size();i++)
	{
		cout<<res[i]<<" ";
	}
	return 0;
}