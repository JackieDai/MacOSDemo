#  NSScrollView

> NSScrollView 中 documentView 和 contentView  以及 clipView 的关系

> 在 `NSScrollView` 中，`documentView`、`contentView` 和 `clipView` 是关键的组件，它们一起协同工作来实现滚动视图的功能。

1. `documentView`（文档视图）：`documentView` 是 `NSScrollView` 的直接子视图，它通常是内容的容器。这个子视图包含了您想要在滚动视图中显示的实际内容，例如文本、图像或自定义视图。`documentView` 可以是任何 `NSView` 的子类，它决定了滚动视图中可滚动内容的大小和外观。

2. `contentView`（内容视图）：`contentView` 是 `NSScrollView` 中的一个子视图，通常是 `documentView` 的直接父视图。它充当了 `documentView` 的容器，负责显示 `documentView` 中可见部分的内容，并将其裁剪为滚动视图的可见区域。`contentView` 可以是 `NSClipView` 类的实例。

3. `clipView`（剪切视图）：`clipView` 是 `contentView` 的子视图，用于限制和裁剪 `documentView` 的内容，以使其适应 `NSScrollView` 的可见区域。`clipView` 是 `NSScrollView` 内部机制的一部分，通常不需要直接操作它。

`NSScrollView` 在滚动时通过 `clipView` 将 `documentView` 中的内容进行裁剪，并在视图上显示可见的部分。这样，即使 `documentView` 的内容大于可见区域，用户仍然可以通过滚动视图来浏览全部内容。同时，`contentView` 是为了更好地管理 `documentView` 的布局和显示。

总之，`documentView` 包含实际内容，`contentView` 是 `documentView` 的容器，而 `clipView` 则负责裁剪和显示 `contentView` 中的内容。这种层次结构使 `NSScrollView` 能够处理大量内容并支持滚动功能。
