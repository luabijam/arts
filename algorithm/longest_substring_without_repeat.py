#coding:utf-8
class Solution:
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        start = 0
        end = 0
        maxCount = 0
        length = len(s)
        substring = "";
        while start < length and end < length:
        	if s[end] not in substring:
        		substring += s[end]
        		end += 1
        		maxCount = max(maxCount, end - start)
        		print(substring)
        		print(end,start,maxCount)
        	else:
        		substring = substring.replace(s[start], '')
        		# print(substring)
        		start += 1
        	# print(substring)

        return maxCount

if __name__ == '__main__':
	so = Solution()
	res = so.lengthOfLongestSubstring("pwwkew")
	print(res)