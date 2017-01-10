type Element = ref object
  val: string
  next: Element

type LinkedList = ref object
  head: Element

proc newElement(val: string): Element =
  Element(val: val, next: nil)

proc newLinkedList(head: var Element): LinkedList =
  LinkedList(head: head)

proc append(self: var LinkedList, val: Element) =
  var current = self.head

  # while current != nil: current = current.next

  # current is a pointer to actual element. So above creates
  # a bug when `current = nil && current = val`

  while current.next != nil:
    current = current.next
  
  current.next = val

iterator items(list: LinkedList): string =
  var e = list.head
  while e != nil:
    yield e.val
    e = e.next

var hello = newElement("hello")
var ll = newLinkedList(hello)
var world = newElement("world")
ll.append(world)

for item in ll:
  echo item