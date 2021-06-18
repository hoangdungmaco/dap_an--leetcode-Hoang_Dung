/*
Bạn được cung cấp hai danh sách liên kết không trống đại diện cho hai số nguyên không âm.
Các chữ số được lưu trữ theo thứ tự ngược lại và mỗi nút của chúng chứa một chữ số duy nhất.
Thêm hai số và trả lại nó dưới dạng một danh sách được liên kết.
Bạn có thể giả sử hai số không chứa bất kỳ số 0 nào đứng đầu, ngoại trừ chính số 0.
Thí dụ:
Đầu vào: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Đầu ra: 7 -> 0 -> 8
Giải thích: 342 + 465 = 807.

 * Cách tiếp cận: Thêm hai danh sách liên kết số nguyên theo thứ tự ngược lại
 * Giống như cách bạn tính tổng hai số trên một tờ giấy,
 * chúng ta bắt đầu bằng cách tính tổng các chữ số có nghĩa nhỏ nhất, là đầu của l1 và l2.
 * Vì mỗi chữ số nằm trong khoảng 0… 9, tổng hai chữ số có thể "tràn".
 * Ví dụ 5 + 7 = 12.
 * Trong trường hợp này, chúng tôi đặt chữ số hiện tại thành 2 và chuyển carry = 1 cho lần lặp tiếp theo.
 * carry phải là 0 hoặc 1 vì tổng lớn nhất có thể có của hai chữ số (bao gồm cả carry) là 9 + 1 = 19.
 *
 * Mã giả như sau:
 * 1. Khởi tạo nút hiện tại thành đầu giả của danh sách trả về.
 * 2. Khởi tạo carry về 0.
 * 3. Khởi tạo p1 và p2 lần lượt về đầu l1 và l2.
 * 4. Lặp qua danh sách l1 và l2 cho đến khi bạn đến cả hai đầu.
 * 5. Đặt x thành giá trị của nút p1. Nếu p1 đến cuối l1, đặt thành 0.
 * 6. Đặt y thành giá trị của nút p2. Nếu p2 đến cuối l2, đặt thành 0.
 * 7. Đặt tổng = x + y + carry.
 * 8. Cập nhật carry = sum / 10.
 * 9. Tạo một nút mới với giá trị chữ số là (sum mod 10) và đặt nó thành nút tiếp theo của nút hiện tại, sau đó chuyển nút hiện tại sang nút tiếp theo.
 * 10. Tiến cả p1 và p2.
 * 11. Kiểm tra xem carry = 1, nếu có, hãy thêm một nút mới với chữ số 11 vào danh sách trả về.
 * 12. Trả về nút tiếp theo của đầu giả.
 *
 * Lưu ý rằng chúng tôi sử dụng một đầu giả để đơn giản hóa mã.
 * Nếu không có đầu giả, bạn sẽ phải viết thêm các câu lệnh điều kiện để khởi tạo giá trị của đầu.
 * Hãy hết sức thận trọng đối với những trường hợp sau:
 * Giải thích trường hợp thử nghiệm
 * l1 = [0,1]
 * l2 = [0,1,2] Khi một danh sách dài hơn danh sách kia.
 * l1 = []
 * l2 = [0,1] Khi một danh sách rỗng, nghĩa là một danh sách trống.
 * l1 = [9,9]
 * l2 = [1] Tổng có thể có thêm một ở cuối, điều này rất dễ bị quên.
 *
 * Phân tích độ phức tạp
 * Độ phức tạp thời gian: O (max (m, n)).
 * Giả sử rằng m và n tương ứng là độ dài của l1 và l2,
 * thuật toán trên lặp lại tối đa (m, n) lần.
 * Độ phức tạp không gian: O (1).
 *
 * Theo sát
 * Điều gì sẽ xảy ra nếu các chữ số trong danh sách liên kết được lưu trữ theo thứ tự không đảo ngược? Ví dụ:
 * (3 → 4 → 2) + (4 → 6 → 5) = 8 → 0 → 7
 *

 * Tài liệu tham khảo:
 * https://leetcode.com/problems/add-two-numbers/solution/
 


 * Định nghĩa cho danh sách liên kết đơn.
 * public class ListNode {
 * int val;
 * Danh sách tiếp theo;
 * ListNode (int x) {val = x; }
 *}



 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var left = l1
         var right = l2 
        var  remainder = 0
        var node: ListNode?
        var firstNode: ListNode?
        while left != nil || right != nil {
            let value = (left?.val ?? 0 ) + (right?.val ?? 0) + remainder 
            let digit = value % 10 
            remainder  = value / 10 
            
            left = left?.next
            right = right?.next 
            
            let newNode = ListNode(digit)
            node?.next = newNode
            node = newNode
            
            if firstNode == nil {
                firstNode = newNode 
            }
        }
        if remainder > 0{
            let newNode = ListNode(remainder)
            node?.next = newNode
            node = newNode
        }
        return firstNode
    }
}




