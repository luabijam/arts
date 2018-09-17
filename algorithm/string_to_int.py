import re

class Solution:
    def myAtoi(self, str):
        """
        :type str: str
        :rtype: int
        """
        # str = str.strip()
        # if (len(str) == 0 or str[0] not in "-+0123456789"):
        #     return 0
        
        # ss = ''
        # v1 = {'+':0, '-':0}

        # for s in str:
        #     if len(ss) == 0 and s in '-+':
        #         v1[s] += 1
        #         if v1['+'] + v1['-'] > 1:
        #             break
        #     elif s in "0123456789":
        #         ss += s
        #     else:
        #         break

        # isNum = False
        # for x in "0123456789":
        #     if x in ss:
        #         isNum = True
        #         break

        # if not isNum or v1['+'] + v1['-'] > 1:
        #     return 0
        
        # val = int(ss)
        # val = val if v1['-'] % 2 == 0 else -val

        # if val > 2**31 - 1:
        #     val = 2**31 - 1
        # elif val < -2**31 + 1:
        #     val = -2**31 + 1
        # return val

        # s = ''
        # ts = ''
        # for c in str:
        #     if c == ' ' and len(s) == 0 and len(ts) == 0:
        #         continue
        #     elif c in '+-' and len(s) == 0 and len(ts) == 0:
        #         s += c
        #     elif c in '0123456789':
        #         ts += c
        #     else:
        #         break

        # val = int(ts) if len(ts) > 0 else 0
        # val = -val if s == '-' else val

        # if val > 2**31 - 1:
        #     val = 2**31 - 1
        # elif val < -2**31:
        #     val = -2**31
        # return val

        match = re.search('[ ]*([+-]?)(\d+)[^\d]*.*', str)
        if match:
            s = match.group(1)
            val = match.group(2)
            val = int(val)
            val = -val if s == '-' else val

            if val > 2**31 - 1:
                val = 2**31 - 1
            elif val < -2**31:
                val = -2**31
            return val
        else:
            return 0
        
if __name__ == '__main__':
    so = Solution()
    res = so.myAtoi("words and 987")
    print(res)
    # ff = [3,1,0,2,5]
    # print(ff[0:-1])
    # ff = 'asdfadsfadfs';
    # print(ff[1:5])

