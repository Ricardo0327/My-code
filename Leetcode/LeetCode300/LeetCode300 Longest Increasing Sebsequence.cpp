//时间复杂度O(nlgn)的解法 
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        if(nums.size()==0)
        {
            return 0;
        }
        int len=0;
        int dp[nums.size()];
        dp[0]=nums[0];
        for(int i=1;i<nums.size();i++)
        {
            if(nums[i]>dp[len])
            {
                dp[++len]=nums[i];
            }
            else
            {
                int j=lower_bound(dp,dp+len,nums[i])-dp;
                dp[j]=nums[i];
            }
        }
        return len+1;
    }
};
