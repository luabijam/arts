class Solution:
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        if not strs:
            return ''
        minn=min(strs,key=len)
        for i,ni in enumerate(minn):
            for k in strs:
                if k[i]!=ni:
                    return minn[:i]
        return minn

if __name__ == '__main__':
	so = Solution()
	res = so.longestCommonPrefix(["flower","flow","flight"])
	print(res)
