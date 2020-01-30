import UIKit




/*
 Linked_List
 
 - Any is not type safe.
 - a linked list os a way of storing information. consists of a series of notes. Each node contains data, as well as a pointer to the next node (valur of the node(int,struct,string etc)) in the series.
 -note: draw out a diagram. dont juts jump into code.
 -if there is onlyone node the pointer is pointing to nil.
 */

// IMPLEMENTING NODE STRUCTURE - Abstract Data Structure

// by convetion we use T or Element.
class Node<T: Equatable>: Equatable {
    
    // require function for Equatable
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.value == rhs.value && lhs.next == rhs.next
    }
    
    
    var value: T
    var next: Node? //Singly Linked List
    var previous: Node? // Doubly linked List
    
    
    init(_ value: T ) {
        self.value = value
    }
    
}

// instantiating node instnaces
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)
let car53 = Node<Int>(53)

// link our nodes
car12.next = car99
//car99.previous = car12
car99.next = car53

// print the current state of our linked node
//print(12)

// when we print this it prints ( __lldb_expr_32.Node<Swift.Int> ) and that is not something we can understand so we have to implement CustomStringConvertable

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil" // 12 <-> nil
        }
        
        //        guard let previous = previous else {
        //            return "nil <- \(value) <-> \(next)"
        //        }
        
        // if we have connected Nodes
        return "\(value) <-> \(next)"
    }
}
// in CustomStringConvertable we implemented the description string and wrote the print logic
print(car12)

/*
 the first value is the head the last value is the tail.
 
 
 */

class LinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    //first computed property
    public var first: Node<T>? {
        return head
    }
    
    //last computed property
        public var last: Node<T>? {
            return tail
        }
    
    // isEmpty computed property
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    //append method - ADDs a Node to the end of the list
    public func append(_ value: T) {
        //created a node
        
        let newNode = Node(value)
        
        //scenario 1 - appending to an empty list
        
        guard let lastNode = tail else {
            // if its here the list was empt
            head = newNode
            tail = head
            return
        }
        
        // scenrio 2 - appending exisiting nodes
        
        lastNode.next = newNode
        tail = newNode
    }
    
    
    // removeLast method - REMOVEs a Node from the end of the list
    public func removeLast() -> Node<T>? {
        
        // scenario 1 -  if the list os empty we return nil
        
        if isEmpty {
    
            return nil
        }
        
        
        // scenario 2 - one node exsists
        var removedNode: Node<T>?
        
        if head == tail {
           removedNode = head
            head = nil
            tail = nil
        
        
        return removedNode
    }
        
        // scenerio 3 - iterate, traverse, or walk the linked list starting from the head
        
        var currentNode = head
         
        while currentNode?.next != tail { // this stops us at the node before the tail
            // keep traversing
            
            currentNode = currentNode?.next
        }
        
        removedNode = tail
        
        tail = currentNode
        
        currentNode?.next = nil
    
        return removedNode
    
}
    
    
    
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "is empty"
        }
return "\(head)"
        
            
        }
    }

let fellows = LinkedList<String>()
fellows.append("Tiffany")
fellows.append("Susie")
fellows.append("Chels")
fellows.removeLast()
fellows.append("Tom")
fellows.append("Eric")
fellows.append("Dexter")
fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
print(fellows)
