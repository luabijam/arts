# -*- coding: utf-8 -*-
class Solution:
    def twoSum(self, nums, target):
        seen = {}
        for index, value in enumerate(nums):
            complement = target - value
            if complement in seen:
                return [seen[complement], index]
            else:
                seen[value] = index
        return []

if __name__ == '__main__':
	nums = [2, 7, 11, 15]
	target = 9
	solution = Solution()
	ff = solution.twoSum(nums, target)
	print(ff)


