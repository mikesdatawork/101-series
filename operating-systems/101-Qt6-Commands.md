# 101 Qt6 Commands

## Overview
Qt6 is a cross-platform C++ framework for developing graphical user interfaces and applications with native performance. This cheat sheet covers essential classes, functions, widgets, layouts, signals/slots, and patterns in the Qt Widgets module for building desktop applications. Master these APIs to create responsive, styled, and maintainable GUIs across Windows, macOS, and Linux.

## Target Audience
- C++ developers building desktop applications
- GUI programmers migrating from other frameworks
- Software engineers creating cross-platform interfaces
- UI designers using Qt Designer tools
- Anyone developing native-performance GUIs

## Command Categories

### 1. Core Application Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QApplication app(argc, argv) | Create widget application | Main entry | int main(int argc, char *argv[]) { QApplication app(argc, argv); } |
| app.exec() | Start event loop | Run app | return app.exec() |
| QWidget window | Create base window | Basic window | QWidget window; window.show() |
| window.setWindowTitle(title) | Set title | Window config | window.setWindowTitle("My App") |
| window.resize(width, height) | Set size | Initial size | window.resize(800, 600) |
| window.show() | Display window | Show UI | window.show() |
| QMainWindow mainWindow | Create main window | App frame | QMainWindow mainWindow |
| mainWindow.setCentralWidget(widget) | Set center | Content | mainWindow.setCentralWidget(central) |
| QApplication::setStyle(style) | Set app style | Appearance | QApplication::setStyle("Fusion") |
| qApp->quit() | Quit application | Exit | qApp->quit() |

### 2. QWidget Basics (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| widget.setParent(parent) | Set parent | Hierarchy | widget = new QPushButton(&window) |
| widget.show() | Show widget | Visibility | widget.show() |
| widget.hide() | Hide widget | Visibility | widget.hide() |
| widget.setVisible(visible) | Set visibility | Control | widget.setVisible(true) |
| widget.setEnabled(enabled) | Enable/disable | Interaction | widget.setEnabled(false) |
| widget.setToolTip(text) | Set tooltip | Help | widget.setToolTip("Click here") |
| widget.setStyleSheet(css) | Apply CSS | Styling | widget.setStyleSheet("background: yellow") |
| widget.setFixedSize(width, height) | Fixed size | Constraints | widget.setFixedSize(200, 50) |
| widget.setMinimumSize(width, height) | Min size | Constraints | widget.setMinimumSize(100, 30) |
| widget.setMaximumSize(width, height) | Max size | Constraints | widget.setMaximumSize(400, 100) |
| widget.update() | Request repaint | Refresh | widget.update() |
| widget.close() | Close widget | Shutdown | widget.close() |

### 3. Layout Managers (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QVBoxLayout layout | Vertical layout | Stacking | QVBoxLayout *layout = new QVBoxLayout |
| layout.addWidget(widget) | Add child | Build UI | layout.addWidget(button) |
| QHBoxLayout layout | Horizontal layout | Row | QHBoxLayout *layout = new QHBoxLayout |
| QGridLayout layout(row, col) | Grid layout | Tables | QGridLayout *layout = new QGridLayout |
| layout.addWidget(widget, row, col) | Position | Grid place | layout.addWidget(label, 0, 0) |
| layout.addLayout(subLayout) | Nest layouts | Complex | layout.addLayout(sub) |
| layout.setSpacing(pixels) | Set spacing | Gaps | layout.setSpacing(10) |
| layout.setContentsMargins(l,t,r,b) | Set margins | Padding | layout.setContentsMargins(10,10,10,10) |
| widget.setLayout(layout) | Apply layout | Container | central.setLayout(layout) |
| QSpacerItem(width, height) | Add space | Alignment | layout.addSpacerItem(new QSpacerItem(20, 40)) |

### 4. Buttons and Controls (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QPushButton button(text) | Create button | Actions | QPushButton *button = new QPushButton("Click") |
| button.setCheckable(true) | Make toggle | States | button.setCheckable(true) |
| button.setChecked(state) | Set checked | Toggle | button.setChecked(true) |
| QCheckBox checkbox(text) | Create checkbox | Options | QCheckBox *checkbox = new QCheckBox("Enable") |
| QRadioButton radio(text) | Create radio | Exclusive | QRadioButton *radio = new QRadioButton("Choice") |
| buttonGroup.addButton(radio) | Group radios | Mutual | QButtonGroup *group = new QButtonGroup |
| QToolButton tool | Create tool button | Toolbars | QToolButton *tool = new QToolButton |
| tool.setIcon(icon) | Set icon | Visual | tool.setIcon(QIcon("save.png")) |
| QPushButton::clicked() | Signal | Connect | connect(button, &QPushButton::clicked, slot) |
| checkbox.setTristate(true) | Three states | Partial | checkbox.setTristate(true) |

### 5. Input and Text Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QLabel label(text) | Create label | Display | QLabel *label = new QLabel("Hello") |
| label.setText(text) | Set text | Update | label.setText("New") |
| label.setPixmap(pixmap) | Set image | Icons | label.setPixmap(QPixmap("img.png")) |
| QLineEdit edit | Create line edit | Input | QLineEdit *edit = new QLineEdit |
| edit.setPlaceholderText(text) | Placeholder | Hint | edit.setPlaceholderText("Enter text") |
| edit.text() | Get text | Read | QString text = edit.text() |
| edit.setEchoMode(mode) | Password mode | Secure | edit.setEchoMode(QLineEdit::Password) |
| QTextEdit edit | Multi-line edit | Rich text | QTextEdit *edit = new QTextEdit |
| edit.toPlainText() | Get plain | Read | edit.toPlainText() |
| edit.setReadOnly(true) | Read only | Display | edit.setReadOnly(true) |

### 6. Selection and Combo Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QComboBox combo | Create dropdown | Choices | QComboBox *combo = new QComboBox |
| combo.addItem(text) | Add item | Populate | combo.addItem("Option") |
| combo.addItems(list) | Add multiple | Bulk | combo.addItems(QStringList() << "A" << "B") |
| combo.currentText() | Get current | Read | combo.currentText() |
| combo.currentIndex() | Get index | Read | combo.currentIndex() |
| combo.setEditable(true) | Editable combo | Input | combo.setEditable(true) |
| QSpinBox spin | Integer spinner | Numbers | QSpinBox *spin = new QSpinBox |
| spin.setRange(min, max) | Set range | Limits | spin.setRange(0, 100) |
| spin.value() | Get value | Read | spin.value() |
| QSlider slider | Slider control | Ranges | QSlider *slider = new QSlider(Qt::Horizontal) |

### 7. Container Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QGroupBox box(title) | Group widgets | Sections | QGroupBox *box = new QGroupBox("Options") |
| QTabWidget tabs | Tabbed widget | Pages | QTabWidget *tabs = new QTabWidget |
| tabs.addTab(widget, title) | Add tab | Pages | tabs.addTab(page, "Tab1") |
| QStackedWidget stack | Stacked pages | Switch | QStackedWidget *stack = new QStackedWidget |
| stack.addWidget(page) | Add page | Content | stack.addWidget(page) |
| stack.setCurrentIndex(index) | Switch page | Navigate | stack.setCurrentIndex(1) |
| QScrollArea area | Scrollable area | Large content | QScrollArea *area = new QScrollArea |
| area.setWidget(widget) | Set content | Scroll | area.setWidget(content) |
| QFrame frame | Frame container | Borders | QFrame *frame = new QFrame |
| frame.setFrameStyle(style) | Set style | Visual | frame.setFrameStyle(QFrame::Box) |

### 8. Menus and Actions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QMenuBar menuBar | Create menu bar | Top menu | QMenuBar *menuBar = mainWindow.menuBar() |
| QMenu fileMenu | Create menu | Submenu | QMenu *fileMenu = menuBar.addMenu("&File") |
| QAction action(text) | Create action | Items | QAction *action = new QAction("&Open") |
| fileMenu.addAction(action) | Add action | Menu item | fileMenu.addAction(action) |
| action.setShortcut(keys) | Set shortcut | Accelerators | action.setShortcut(QKeySequence::Open) |
| action.setCheckable(true) | Toggle action | States | action.setCheckable(true) |
| QToolBar toolBar | Create toolbar | Buttons | QToolBar *toolBar = mainWindow.addToolBar("Tools") |
| toolBar.addAction(action) | Add to toolbar | Icons | toolBar.addAction(action) |
| action.setIcon(icon) | Set icon | Visual | action.setIcon(QIcon("open.png")) |
| menu.addSeparator() | Separator | Divide | fileMenu.addSeparator() |

### 9. Dialogs and Messages (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QMessageBox::information(parent, title, text) | Info dialog | Alerts | QMessageBox::information(this, "Info", "Done") |
| QMessageBox::question(parent, title, text) | Question | Confirm | QMessageBox::question(this, "Quit?", "Sure?") |
| QMessageBox::warning(parent, title, text) | Warning | Errors | QMessageBox::warning(this, "Error", msg) |
| QMessageBox::critical(parent, title, text) | Critical | Fatal | QMessageBox::critical(this, "Crash", err) |
| QDialog dialog | Custom dialog | Forms | QDialog dialog(this); dialog.exec() |
| dialog.exec() | Modal run | Block | int result = dialog.exec() |
| QFileDialog::getOpenFileName(parent) | Open file | Select | QString file = QFileDialog::getOpenFileName(this) |
| QFileDialog::getSaveFileName(parent) | Save file | Select | QString file = QFileDialog::getSaveFileName(this) |
| QInputDialog::getText(parent, title, label) | Text input | Prompt | QString text = QInputDialog::getText(this, "Input", "Name:") |
| QProgressDialog progress | Progress bar | Long tasks | QProgressDialog progress("Loading", "Cancel", 0, 100) |

### 10. Signals and Slots Connections (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| connect(sender, &Class::signal, receiver, &Class::slot) | New syntax | Connect | connect(button, &QPushButton::clicked, this, &MyClass::onClick) |
| connect(sender, SIGNAL(signal()), receiver, SLOT(slot())) | Old syntax | Legacy | connect(button, SIGNAL(clicked()), this, SLOT(onClick())) |
| connect(sender, &Signal, lambda) | Lambda slot | Inline | connect(button, &QPushButton::clicked, [](){ qDebug() << "Clicked"; }) |
| disconnect(sender, signal, receiver, slot) | Disconnect | Cleanup | disconnect(...) |
| QObject::connect(...) | Static | Advanced | QObject::connect(...) |
| button.clicked.connect(slot) | Python-like | Rare in C++ | Not standard in C++ |
| emitter.emit(signal(args)) | Emit custom | Trigger | emit valueChanged(42) |
| Q_OBJECT macro | Required | Meta | class MyClass : public QObject { Q_OBJECT } |
| signals: section | Declare signals | Custom | signals: void mySignal(int) |
| public slots: section | Declare slots | Handlers | public slots: void mySlot(int) |
| QMetaObject::connectSlotsByName(parent) | Auto connect | Designer | QMetaObject::connectSlotsByName(this) |
| blocker = QObject::blockSignals(true) | Block signals | Temp disable | bool old = obj.blockSignals(true); obj.blockSignals(old) |

### 11. List and Table Views (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QListWidget list | Simple list | Items | QListWidget *list = new QListWidget |
| list.addItem(text) | Add item | Populate | list.addItem("Item") |
| list.currentItem()->text() | Get selected | Read | list.currentItem()->text() |
| QTableWidget table(rows, cols) | Table | Grid data | QTableWidget *table = new QTableWidget(10, 5) |
| table.setItem(row, col, item) | Set cell | Data | table.setItem(0, 0, new QTableWidgetItem("Text")) |
| QTreeWidget tree | Tree view | Hierarchy | QTreeWidget *tree = new QTreeWidget |
| tree.addTopLevelItem(item) | Add root | Nodes | tree.addTopLevelItem(new QTreeWidgetItem(QStringList() << "Root")) |
| QListView view | Model list | MVC | QListView *view = new QListView |
| view.setModel(model) | Set model | Data | view.setModel(new QStringListModel(strings)) |
| QStandardItemModel model | Standard model | Data | QStandardItemModel *model = new QStandardItemModel |

### 12. Painting and Graphics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| widget.paintEvent(event) | Override paint | Custom draw | void paintEvent(QPaintEvent *event) override |
| QPainter painter(this) | Start painting | Draw | QPainter painter(this) |
| painter.drawLine(x1,y1,x2,y2) | Draw line | Shapes | painter.drawLine(0,0,100,100) |
| painter.drawRect(rect) | Draw rect | Boxes | painter.drawRect(10,10,50,50) |
| painter.fillRect(rect, brush) | Fill rect | Color | painter.fillRect(rect, Qt::red) |
| painter.drawText(point, text) | Draw text | Labels | painter.drawText(QPoint(10,20), "Hello") |
| painter.setPen(pen) | Set pen | Style | painter.setPen(QPen(Qt::blue, 3)) |
| painter.setBrush(brush) | Set brush | Fill | painter.setBrush(Qt::yellow) |
| painter.drawPixmap(rect, pixmap) | Draw image | Icons | painter.drawPixmap(rect, pixmap) |
| widget.update() | Trigger paint | Refresh | widget.update() |

### 13. Event Handling (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| widget.mousePressEvent(event) | Override mouse | Clicks | void mousePressEvent(QMouseEvent *event) override |
| event->pos() | Mouse position | Coord | QPoint pos = event->pos() |
| widget.keyPressEvent(event) | Keyboard | Keys | void keyPressEvent(QKeyEvent *event) override |
| event->key() | Key code | Identify | if (event->key() == Qt::Key_Escape) |
| widget.resizeEvent(event) | Resize | Adjust | void resizeEvent(QResizeEvent *event) override |
| widget.closeEvent(event) | Close | Confirm | void closeEvent(QCloseEvent *event) override { event->accept() } |
| event->ignore() | Ignore event | Propagate | event->ignore() |
| event->accept() | Accept event | Stop | event->accept() |
| widget.installEventFilter(filter) | Filter events | Monitor | widget.installEventFilter(this) |
| object.eventFilter(obj, event) | Filter method | Process | bool eventFilter(QObject *obj, QEvent *event) override |

### 14. Styling and Themes (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| widget.setStyleSheet("selector { property: value }") | CSS style | Custom look | button.setStyleSheet("QPushButton { background: green }") |
| QApplication::setPalette(palette) | App palette | Colors | QApplication::setPalette(darkPalette) |
| QStyleFactory::keys() | Available styles | List | QStringList styles = QStyleFactory::keys() |
| QApplication::setStyle("Windows") | Platform style | Native | QApplication::setStyle("Windows") |
| widget.setProperty("class", value) | Dynamic prop | Styles | widget.setProperty("mandatory", true) |
| style()->drawPrimitive(element, option, painter) | Custom style | Advanced | In QStyle subclass |
| QApplication::setFont(font) | App font | Text | QApplication::setFont(QFont("Arial", 12)) |
| widget.setAttribute(Qt::WA_StyledBackground) | Enable style | Backgrounds | widget.setAttribute(Qt::WA_StyledBackground, true) |

### 15. Timers and Animation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QTimer timer | Create timer | Periodic | QTimer *timer = new QTimer(this) |
| timer.start(msec) | Start timer | Run | timer.start(1000) |
| timer.setSingleShot(true) | One shot | Once | timer.setSingleShot(true) |
| connect(timer, &QTimer::timeout, slot) | Timeout slot | Action | connect(timer, &QTimer::timeout, this, &MyClass::update) |
| QTimer::singleShot(msec, slot) | Delayed call | Deferred | QTimer::singleShot(500, this, &MyClass::doIt) |
| QPropertyAnimation anim | Property anim | Smooth | QPropertyAnimation *anim = new QPropertyAnimation(widget, "geometry") |
| anim.setDuration(msec) | Set duration | Time | anim.setDuration(1000) |
| anim.start() | Start animation | Play | anim.start() |

### 16. File and Resource Handling (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QFile file(path) | File object | IO | QFile file("data.txt") |
| file.open(QIODevice::ReadOnly) | Open file | Access | file.open(QIODevice::ReadOnly) |
| QTextStream stream(&file) | Text stream | Read/write | QTextStream in(&file); QString text = in.readAll() |
| QDir dir | Directory | Paths | QDir dir; QStringList files = dir.entryList() |
| QResource::registerResource(rcc) | Embed resources | Assets | QResource::registerResource("resources.rcc") |
| QIcon icon(":/images/save.png") | Resource icon | Embedded | button.setIcon(QIcon(":/images/save.png")) |
| QFileDialog::getExistingDirectory() | Dir select | Browse | QString dir = QFileDialog::getExistingDirectory(this) |
| QStandardPaths::writableLocation(type) | App paths | Storage | QString path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) |

### 17. Threading and Concurrency (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| QThread thread | Create thread | Background | QThread *thread = new QThread |
| worker.moveToThread(thread) | Move object | Worker | worker.moveToThread(thread) |
| thread.start() | Start thread | Run | thread.start() |
| connect(thread, &QThread::finished, worker, &QObject::deleteLater) | Cleanup | Safe | Standard pattern |
| QMetaObject::invokeMethod(obj, slot, Qt::QueuedConnection) | Cross thread | Safe call | QMetaObject::invokeMethod(this, "updateUI") |
| QMutex mutex | Mutex lock | Sync | QMutex mutex; mutex.lock() |
| QWaitCondition wait | Condition | Wait | wait.wait(&mutex) |
| QRunnable runnable | Runnable task | Pool | class Task : public QRunnable { void run() override {} } |

## Tips and Best Practices
* Always include Q_OBJECT macro in classes using signals/slots or properties.
* Use new signal/slot syntax for type safety and compile-time checks.
* Prefer layout managers over manual positioning for responsive UIs.
* Use Qt Designer (.ui files) for complex forms and load with QUiLoader.
* Parent widgets properly to enable automatic memory management.
* Use style sheets for theming but avoid over-specifying for platform consistency.
* Handle events carefully; call base class implementation when overriding.
* Use QTimer for periodic tasks instead of loops.
* Move long-running tasks to worker threads with moveToThread.
* Validate user input early in slots.
* Use resource system (: prefix) for embedded images/icons.
* Test on multiple platforms for native look variations.
* Enable high DPI scaling with QApplication::setAttribute(Qt::AA_EnableHighDpiScaling).
* Use QDebug() << value for debugging output.
* Clean up connections in destructors if needed.
* Prefer QAction for shared menu/toolbar items.
* Use QStandardItemModel for simple table data.
* Internationalize with tr() and linguist tools.
* Profile with Qt Creator tools for performance.
* Follow Qt naming conventions for consistency.

## Additional Resources
* [Official Qt6 Documentation](https://doc.qt.io/qt-6/)
* [Qt Widgets Module](https://doc.qt.io/qt-6/qtwidgets-module.html)
* [Signals and Slots](https://doc.qt.io/qt-6/signalsandslots.html)
* [Layout Management](https://doc.qt.io/qt-6/layout.html)
* [Qt Designer Manual](https://doc.qt.io/qt-6/qtdesigner-manual.html)
* [Qt Examples and Tutorials](https://doc.qt.io/qt-6/qtwidgets-examples.html)
* [Qt Style Sheets Reference](https://doc.qt.io/qt-6/stylesheet-reference.html)
* [Qt Forum](https://forum.qt.io/)
* [Stack Overflow Qt Tag](https://stackoverflow.com/questions/tagged/qt)

## Mini-Glossary
This section provides definitions for key Qt6 terms and concepts.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| QObject | Base class with signals, slots, properties |
| QWidget | Base UI element with painting and events |
| QApplication | Manages app lifecycle and settings |
| Event Loop | Processes user input and timers |
| Meta-Object | Runtime type info for signals/properties |
| Parent-Child | Hierarchy for memory and layout |
| Signal | Event emitter for loose coupling |
| Slot | Callable receiver for signals |
| Property | Dynamic attribute with binding |
| Resource | Embedded files via :/ prefix |

### 2. Widget Types
| Term/Concept | Description |
| --- | --- |
| QPushButton | Clickable button widget |
| QLabel | Text or image display |
| QLineEdit | Single-line text input |
| QTextEdit | Multi-line rich text editor |
| QCheckBox | On/off toggle with text |
| QRadioButton | Exclusive selection button |
| QComboBox | Dropdown selection list |
| QSpinBox | Numeric up/down control |
| QSlider | Value slider control |
| QProgressBar | Progress indicator |

### 3. Container Types
| Term/Concept | Description |
| --- | --- |
| QMainWindow | App window with menus/docks |
| QDialog | Modal or modeless dialog |
| QGroupBox | Titled frame with children |
| QTabWidget | Tabbed page container |
| QStackedWidget | Single visible page stack |
| QScrollArea | Scrollable viewport |
| QDockWidget | Dockable panel |
| QToolBar | Movable action bar |
| QMenuBar | Top menu container |
| QStatusBar | Bottom status display |

### 4. Layout Managers
| Term/Concept | Description |
| --- | --- |
| QBoxLayout | Horizontal or vertical box |
| QHBoxLayout | Horizontal arrangement |
| QVBoxLayout | Vertical arrangement |
| QGridLayout | Row/column grid |
| QFormLayout | Label-field pairs |
| QStackedLayout | Stack of widgets |
| SpacerItem | Flexible space |
| Size Policy | Widget sizing hints |
| Stretch Factor | Relative expansion |
| Alignment | Position in cell |

### 5. Event Types
| Term/Concept | Description |
| --- | --- |
| PaintEvent | Redraw request |
| MousePressEvent | Button press |
| MouseReleaseEvent | Button release |
| KeyPressEvent | Keyboard input |
| ResizeEvent | Size change |
| CloseEvent | Window close |
| TimerEvent | Timer timeout |
| WheelEvent | Mouse wheel |
| DragEnterEvent | Drag entry |
| DropEvent | Drop action |

### 6. Signals and Slots
| Term/Concept | Description |
| --- | --- |
| Direct Connection | Immediate call |
| Queued Connection | Thread-safe queue |
| Auto Connection | Based on thread |
| Unique Connection | Prevent duplicates |
| Lambda Slot | Inline anonymous |
| Overloaded Signal | Use qOverload or cast |
| Blocked Signals | Temporarily disable |
| Disconnect | Remove connection |
| Sender | Emitting object |
| Receiver | Slot object |

### 7. Model/View Concepts
| Term/Concept | Description |
| --- | --- |
| Model | Data storage interface |
| View | Visual presentation |
| Delegate | Item rendering/editing |
| Item | Data element |
| Index | Model reference |
| SelectionModel | Selected items |
| ProxyModel | Filtered/sorted wrapper |
| StandardItem | Simple data item |
| Role | Data purpose (display, edit) |
| HeaderData | Row/column labels |

### 8. Styling Concepts
| Term/Concept | Description |
| --- | --- |
| Style Sheet | CSS-like rules |
| Palette | Color roles |
| Style | Platform drawing |
| Fusion | Cross-platform style |
| Dynamic Property | Runtime selector |
| Sub-control | Button parts |
| Pseudo-state | Hover, pressed |
| Box Model | Margin, padding |
| Font Metrics | Text sizing |
| Icon Theme | System icons |

### 9. Threading Concepts
| Term/Concept | Description |
| --- | --- |
| QThread | Native thread |
| Worker Object | Moved to thread |
| Queued Connection | Cross-thread safe |
| Event Loop | Per-thread processing |
| Mutex | Critical section lock |
| WaitCondition | Thread wait/signal |
| Runnable | Thread pool task |
| Affinity | Thread-object relation |
| Priority | Scheduling level |
| Sleep | Thread pause |

### 10. Miscellaneous Terms
| Term/Concept | Description |
| --- | --- |
| tr() | Translation string |
| Q_ASSERT | Debug check |
| qDebug() | Debug output |
| High DPI | Scaling support |
| Gesture | Touch/multi-touch |
| Action | Shared menu/toolbar item |
| Shortcut | Keyboard accelerator |
| Buddy | Label-field link |
| Validator | Input validation |
| Completer | Auto-complete |
