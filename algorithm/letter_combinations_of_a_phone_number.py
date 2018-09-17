class Solution:
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """

        cNumbers = {
        	'1':"",
        	'2':"abc",
        	'3':"def",
        	'4':"ghi",
        	'5':"jkl",
        	'6':"mno",
        	'7':"pqrs",
        	'8':"tuv",
        	'9':"wxyz",
        }

        if not digits:
            return []
        ret = ['']
        for digit in digits:
            ret = [s + c for s in ret for c in cNumbers[digit]]
        return ret

if __name__ == '__main__':
	so = Solution()
	res = so.letterCombinations("234")
	print(res)

