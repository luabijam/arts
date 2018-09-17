#coding:utf-8
class Solution:
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: int
        """
        c = {}
        pos = []
        maxCount = 0
        ff = ''
        for i,ss in enumerate(s):
            if ss not in c.keys():
                c[ss] = [i]
            else:
                c[ss].append(i)

                for ixx in c[ss][:-1]:
                    ff = s[ixx : i + 1]
                    print(ixx,c[ss],c[ss][:-1], ff)
                    if (ff == ff[::-1]) and (i - ixx + 1) > maxCount:
                        pos = [ixx, i + 1]
                        maxCount = i - ixx + 1
                        print('pos', pos)
                    elif (i - ixx + 1) <= maxCount:
                        break

        if len(pos):
            return s[pos[0]:pos[1]]
        elif len(s):
            return s[0]
        else:
            return ""

if __name__ == '__main__':
    # so = Solution()
    # res = so.longestPalindrome("babadada")
    # print(res)
    # ff = [3,1,0,2,5]
    # print(ff[0:-1])
    # ff = 'asdfadsfadfs';
    # print(ff[1:5])

    


