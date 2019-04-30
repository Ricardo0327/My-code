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
	//先不设置数组的长度，再用sizeof(numbers)/sizeof(int)来数组中已经初始化的元素的长度
	int length=sizeof(numbers)/sizeof(int);
	vector<int>res;
	res=Dup(numbers,length);
	for(int i=0;i<res.size();i++)
	{
		cout<<res[i]<<" ";
	}
	return 0;
}
