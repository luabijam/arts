class Solution:
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        res = []
        freq = {}
        for i in nums:
            freq[i] = freq.get(i,0) + 1
        if 0 in freq and freq[0] > 2:
            res.append([0,0,0])
        neg = sorted(filter(lambda x: x<0 , freq))
        pos = sorted(filter(lambda x: x>0 , freq))
        for n in neg:
            for p in pos:
                balance = -n - p
                if balance in freq:
                    if balance in (n,p) and freq[balance]>1:
                        res.append([n,balance,p])
                    elif n<balance<p:
                        res.append([n,balance,p])
        return res

if __name__ == '__main__':
	so = Solution()
	res = so.threeSum([-1,0,1,2,-1,-4])
	print(res)
