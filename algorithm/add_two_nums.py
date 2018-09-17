#coding:utf-8
# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        # l3 = []
        # for x in range(0,len(l1)):
        # 	val = l1[x] + l2[x]
        # 	l3.append(val)

        # for x in range(0,len(l3)):
        # 	if l3[x] > 9:
        # 		if x + 1 >= len(l3):
        # 			val = l3[x]
        # 			l3[x] = val - 10
        # 			l3.append(1)
        # 		else:
        # 			val = l3[x]
        # 			l3[x] = val - 10
        # 			l3[x+1] = int(l3[x+1]) + int(val % 10)

        # return l3
        l3 = None
        firstNode = None
        val0 = 0
        while(l1 or l2):
            val1 = l1.val if l1 else 0
            val2 = l2.val if l2 else 0
            val = val1 + val2 + val0
            val0 = val // 10

            node = ListNode(val%10)
            if (l3):
                l3.next = node
            else:
                firstNode = node

            l3 = node

            l1 = l1.next if l1 and l1.next else None
            l2 = l2.next if l2 and l2.next else None

        if (val0):
            node = ListNode(val0)
            l3.next = node
            l3 = node

        return firstNode

if __name__ == '__main__':
    list1 = [1,8]
    list2 = [0]
    l1 = None
    l2 = None
    for i in list1[::-1]:
        node = ListNode(i)
        node.next = l1
        l1 = node

    for i in list2[::-1]:
        node = ListNode(i)
        node.next = l2
        l2 = node

    so = Solution()
    res = so.addTwoNumbers(l1, l2)
    
    while(res):
        print(res.val)
        res = res.next

    print(321+895)
