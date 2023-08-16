#  TODO List

## Part 1
[Specs](https://www.hackingwithswift.com/100/swiftui/57)
`5 sections`

- [x] Core Data: Introduction
- [x] Why does \.self work for ForEach?
- [x] Creating NSManagedObject subclasses
- [x] Conditional saving of NSManagedObjectContext
- [x] Ensuring Core Data objects are unique using constraints

## Part 2
[Specs](https://www.hackingwithswift.com/100/swiftui/58)

`3 sections`

- [x] Filtering @FetchRequest using NSPredicate
- [x] Dynamically filtering @FetchRequest with SwiftUI
- [x] One-to-many relationships with Core Data, SwiftUI, and @FetchRequest
    - NOTE: Commit 2f894e7e710b1b48109c3511af177c8a6baef111 doesn't throw error from CoreData

## Part 3
- [x] Make it accept a string parameter that controls which predicate is applied. You can use Swift’s string interpolation to place this in the predicate.
    - Finished already at commit:
        - 9ec40b659c0592165baa363b9be19ee43f1d8440
- [x] Modify the predicate string parameter to be an enum such as .beginsWith, then make that enum get resolved to a string inside the initializer.
- [ ] Make FilteredList accept an array of SortDescriptor objects to get used in its fetch request.
    - OUTLINE:
        - Create a list for NS's SortDescriptor that contains the following items from the entity "Singer"
            - Example of toggleable items:
                - `SortDescriptor(\.firstName)`
                - `SortDescriptor(\.lastName)`
