class Solution:
    def romanToInt(self, s):
        """
        :type num: int
        :rtype: str
        """

        dic = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
        total = prev = dic[s[0]]
        for roman in s[1:]:
            num = dic[roman]
            total += num
            print(total, num, prev)
            if num > prev: total -= 2 * prev
            prev = num
        return total    

if __name__ == '__main__':
	so = Solution()
	res = so.romanToInt("MCMXCIV")
	print(res)
