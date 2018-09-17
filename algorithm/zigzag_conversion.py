#coding:utf-8
#coding:utf-8
#coding:utf-8
class Solution:
    def convert(self, s, numRows):
        """
        :type s: str
        :type numRows: int
        :rtype: str
        """
        if numRows == 1:
        	return s

        rows = {}
        curRow = 0
        goingDown = False

        # for i in range(0, min(numRows, len(s))):
        # 	rows[i] = []

        rows = ["" for x in range(numRows)]
        for c in s:
        	# print(rows[curRow],c)
        	rows[curRow] += c
        	goingDown = not goingDown if (curRow == 0 or curRow == (numRows - 1)) else goingDown
        	curRow += 1 if goingDown else -1

        return ''.join(rows)

if __name__ == '__main__':
    so = Solution()
    res = so.convert("PAYPALISHIRING", 3)
    # res = so.convert("PAYPALISHIRING", 4)
    print(res)
