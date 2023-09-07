import Cocoa

var greeting = "Hello, playground"

//: # NSCell

//: **NSCell** 是 macOS 开发中的一个重要类，它用于管理和渲染用户界面元素的内容和状态。虽然 `NSCell` 在现代 macOS 开发中已经不太常见，因为大多数开发者使用更高级别的视图组件（如 `NSButton`、`NSTextField` 等），但了解如何使用 `NSCell` 仍然是有用的，特别是在自定义绘制和行为方面。以下是一些常见的用法：

//:  **自定义绘制**：`NSCell` 允许您自定义视图元素的绘制。您可以子类化 `NSCell` 并实现 `draw(withFrame:in:controlView:)` 方法，以在视图中绘制您自己的内容。

   class CustomCell: NSCell {
       override func draw(withFrame cellFrame: NSRect, in controlView: NSView) {
           // 自定义绘制逻辑
       }
   }

//:  **文本和图像的显示**：`NSCell` 可以用于显示文本和图像。通过设置 `stringValue` 属性来设置文本内容，通过 `image` 属性来设置图像。
func testeg1()  {
    let cell = NSCell()
    cell.stringValue = "Hello, World!"
    cell.image = NSImage(named: "myImage")
}
   

//:  **状态管理**：`NSCell` 可以表示不同的状态，例如选中、禁用、高亮等。您可以使用 `isEnabled`、`isHighlighted` 和 `state` 属性来管理和控制这些状态。

   
func testeg2()  {
    let cell = NSCell()
    cell.isEnabled = true
    cell.isHighlighted = false
    cell.state = .on
}

//:  **自定义行为**：您可以通过子类化 `NSCell` 来实现自定义的用户交互行为。例如，您可以捕获鼠标事件，并在 `mouseDown(with:)` 方法中执行特定操作。

//   class CustomCell1: NSCell {
//       override func mouseDown(with event: NSEvent) {
//           super.mouseDown(with: event)
//           // 处理鼠标点击事件
//       }
//   }

//: **集成到 `NSControl`**：虽然 `NSCell` 可以单独使用，但通常它们嵌入在 `NSControl` 子类中。例如，`NSButton` 包含一个 `NSButtonCell` 来管理按钮的外观和行为。

//: 了解如何使用 `NSCell` 可以帮助您实现更高度自定义的用户界面元素，尤其是在需要控制绘制和行为的情况下。然而，对于大多数标准用户界面元素，使用 `NSButton`、`NSTextField`、`NSImageView` 等高级别的组件通常更加方便。

