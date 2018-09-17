class Solution:
    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        length = len(nums)
        nums.sort()
        cur_closest = nums[0]+nums[1]+nums[2]
        for i in range(length-2):
            left = i+1
            right = length-1
            cur_min = nums[i]+nums[left]+nums[left+1]
            cur_max = nums[i]+nums[right]+nums[right-1]
            if cur_min>target:
                if abs(cur_min-target)<abs(cur_closest-target):
                    cur_closest = cur_min
                break
            if cur_max<target:
                if abs(cur_max-target)<abs(cur_closest-target):
                    cur_closest = cur_max
                continue
                
            cur_value = nums[i]+nums[left]+nums[right]
            while left<right:
                if cur_value<target:
                    left += 1
                elif cur_value>target:
                    right -= 1
                else:
                    return target
                cur_value = nums[i]+nums[left]+nums[right]
                if abs(cur_value-target)<abs(cur_closest-target):
                    cur_closest = cur_value
        return cur_closest

if __name__ == '__main__':
	so = Solution()
	res = so.threeSumClosest([-1,2,1,-4], 1)
	print(res)