class Solution:
    def fourSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        def nSum(nums, target, N, result, results):
            if len(nums) < N or nums[0] * N > target or nums[-1] * N < target or N < 2:
                return
            if N == 2:
                l = 0
                r = len(nums) - 1
                while l < r:
                    s = nums[l] + nums[r]
                    if s == target:
                        results.append(result + [nums[l], nums[r]])
                        l += 1
                        while l < r and nums[l - 1] == nums[l]:
                            l += 1
                    elif s < target:
                        l += 1
                    else:
                        r -= 1
            else:
                for i in range(len(nums) - N + 1):
                    if i == 0 or (i > 0 and nums[i - 1] != nums[i]):
                        nSum(nums[i + 1:], target - nums[i], N - 1, result + [nums[i]], results)
        
        nums.sort()
        results = []

        nSum(nums, target, 4, [], results)
        return results

if __name__ == '__main__':
    so = Solution()
    res = so.fourSum([-3,-2,-1,0,0,1,2,3],0)
    print(res)