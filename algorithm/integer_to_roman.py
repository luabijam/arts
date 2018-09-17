class Solution:
    def intToRoman(self, num):
        """
        :type num: int
        :rtype: str
        """

        if num < 1 or num > 3999:
        	return ''
        
        dic = {
	       3000: 'MMM',
	       2000: 'MM',
	       1000: 'M',
	       900: 'CM',
	       800: 'DCCC',
	       700: 'DCC',
	       600: 'DC',
	       500: 'D',
	       400: 'CD',
	       300: 'CCC',
	       200: 'CC',
	       100: 'C',
	       90: 'XC',
	       80: 'LXXX',
	       70: 'LXX',
	       60: 'LX',
	       50: 'L',
	       40: 'XL',
	       30: 'XXX',
	       20: 'XX',
	       10: 'X',
	       9: 'IX',
	       8: 'VIII',
	       7: 'VII',
	       6: 'VI',
	       5: 'V',
	       4: 'IV',
	       3: 'III',
	       2: 'II',
	       1: 'I',
	       0: '',
        }

        # romanStr = ''
        # for i in range(4, -1, -1):
        # 	p = pow(10, i)
        # 	c = int(num / p)
        # 	num = num - c * p
        # 	print(c,p)
        # 	romanStr += dic[c * p]

        # print(num//1000 * 1000 , num//100 % 10 * 100 , num//10 % 10 * 10 , num%10)
        return dic[num//1000 * 1000] + dic[num//100 % 10 * 100] + dic[num//10 % 10 * 10] + dic[num % 10]

if __name__ == '__main__':
	so = Solution()
	res = so.intToRoman(1994)
	print(res)
