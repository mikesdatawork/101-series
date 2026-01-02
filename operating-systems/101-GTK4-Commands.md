# 101 GTK4 Commands

## Overview
GTK4 is the latest major version of the GTK toolkit, a multi-platform widget library for creating modern graphical user interfaces with improved rendering, event handling, and layout systems. This cheat sheet covers core APIs, widgets, layout managers, event controllers, gestures, rendering, and integration patterns for building efficient desktop applications in C and language bindings. Master these functions to create performant, accessible, and animated GUIs optimized for contemporary hardware.

## Target Audience
- GUI developers building modern desktop apps
- C programmers updating from GTK3
- Software engineers using event controllers
- UI designers integrating Blueprint tools
- Anyone creating high-performance interfaces

## Command Categories

### 1. Core Application Functions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_init | Initialize GTK library | Application start | gtk_init() |
| gtk_init_check | Initialize with error check | Safe startup | gtk_init_check() |
| gtk_application_new | Create GtkApplication | Modern app lifecycle | gtk_application_new(app_id, flags) |
| gtk_application_run | Run application | Main entry | gtk_application_run(app, argc, argv) |
| gtk_window_new | Create toplevel window | Basic windows | gtk_window_new() |
| gtk_window_set_application | Associate with app | Integration | gtk_window_set_application(window, app) |
| gtk_window_set_title | Set window title | Window config | gtk_window_set_title(window, Title) |
| gtk_window_set_default_size | Set default size | Initial dimensions | gtk_window_set_default_size(window, 800, 600) |
| gtk_window_present | Show window | Display | gtk_window_present(window) |
| gtk_window_destroy | Destroy window | Cleanup | gtk_window_destroy(window) |

### 2. Widget Basics (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_widget_show | Show widget | Visibility | gtk_widget_show(widget) |
| gtk_widget_hide | Hide widget | Visibility toggle | gtk_widget_hide(widget) |
| gtk_widget_set_visible | Set visibility | Programmatic control | gtk_widget_set_visible(widget, TRUE) |
| gtk_widget_set_sensitive | Set interactivity | Enable/disable | gtk_widget_set_sensitive(widget, FALSE) |
| gtk_widget_set_focusable | Set focus capability | Keyboard nav | gtk_widget_set_focusable(widget, TRUE) |
| gtk_widget_grab_focus | Grab focus | Set focus | gtk_widget_grab_focus(widget) |
| gtk_widget_queue_draw | Request redraw | Update display | gtk_widget_queue_draw(widget) |
| gtk_widget_queue_resize | Request resize | Layout change | gtk_widget_queue_resize(widget) |
| gtk_widget_add_css_class | Add CSS class | Styling | gtk_widget_add_css_class(widget, class) |
| gtk_widget_remove_css_class | Remove CSS class | Styling | gtk_widget_remove_css_class(widget, class) |
| gtk_widget_set_margin_start | Set start margin | Spacing | gtk_widget_set_margin_start(widget, 10) |
| gtk_widget_set_hexpand | Set horizontal expand | Layout | gtk_widget_set_hexpand(widget, TRUE) |

### 3. Layout Managers and Containers (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_box_new | Create box layout | Linear layouts | gtk_box_new(GTK_ORIENTATION_HORIZONTAL) |
| gtk_box_append | Append child to box | Add widgets | gtk_box_append(GTK_BOX(box), child) |
| gtk_box_remove | Remove child from box | Modify layout | gtk_box_remove(GTK_BOX(box), child) |
| gtk_grid_new | Create grid layout | Table layouts | gtk_grid_new() |
| gtk_grid_attach | Attach to grid | Position child | gtk_grid_attach(GTK_GRID(grid), child, col, row, width, height) |
| gtk_window_set_child | Set window child | Toplevel content | gtk_window_set_child(GTK_WINDOW(window), child) |
| gtk_overlay_new | Create overlay | Layered UI | gtk_overlay_new() |
| gtk_overlay_add_overlay | Add overlay child | Layer widgets | gtk_overlay_add_overlay(GTK_OVERLAY(overlay), child) |
| gtk_scrolled_window_new | Create scrolled window | Scrollable areas | gtk_scrolled_window_new() |
| gtk_scrolled_window_set_child | Set scrolled child | Content | gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled), child) |

### 4. Buttons and Controls (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_button_new_with_label | Create labeled button | Basic buttons | gtk_button_new_with_label(Click) |
| gtk_button_set_label | Set button label | Update text | gtk_button_set_label(GTK_BUTTON(button), New) |
| gtk_button_new_from_icon_name | Create icon button | Icon buttons | gtk_button_new_from_icon_name(icon-name) |
| gtk_check_button_new_with_label | Create check button | Checkboxes | gtk_check_button_new_with_label(Option) |
| gtk_switch_new | Create switch | Toggle controls | gtk_switch_new() |
| gtk_switch_set_active | Set switch state | Control | gtk_switch_set_active(GTK_SWITCH(switch), TRUE) |
| gtk_scale_new | Create scale slider | Ranges | gtk_scale_new(GTK_ORIENTATION_HORIZONTAL, adjustment) |
| gtk_scale_set_value | Set scale value | Update | gtk_scale_set_value(GTK_SCALE(scale), value) |
| gtk_spin_button_new | Create spin button | Numeric input | gtk_spin_button_new(adjustment, climb_rate, digits) |
| gtk_entry_new | Create text entry | Input fields | gtk_entry_new() |

### 5. Text and Display Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_label_new | Create label | Text display | gtk_label_new(Text) |
| gtk_label_set_markup | Set markup text | Formatted text | gtk_label_set_markup(GTK_LABEL(label), <b>Bold</b>) |
| gtk_entry_set_text | Set entry text | Input | gtk_entry_set_text(GTK_ENTRY(entry), Text) |
| gtk_entry_get_text | Get entry text | Read | gtk_entry_get_text(GTK_ENTRY(entry)) |
| gtk_text_view_new | Create text view | Multi-line | gtk_text_view_new() |
| gtk_text_view_get_buffer | Get text buffer | Access buffer | gtk_text_view_get_buffer(GTK_TEXT_VIEW(view)) |
| gtk_picture_new_for_filename | Create picture | Images | gtk_picture_new_for_filename(filename) |
| gtk_image_new_from_icon_name | Create icon image | Icons | gtk_image_new_from_icon_name(icon-name) |
| gtk_drawing_area_new | Create drawing area | Custom draw | gtk_drawing_area_new() |
| gtk_drawing_area_set_draw_func | Set draw callback | Rendering | gtk_drawing_area_set_draw_func(area, func, data, NULL) |

### 6. List and View Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_list_view_new | Create list view | Flat lists | gtk_list_view_new(selection, factory) |
| gtk_grid_view_new | Create grid view | Icon grids | gtk_grid_view_new(selection, factory) |
| gtk_column_view_new | Create column view | Tables | gtk_column_view_new(selection) |
| gtk_column_view_append_column | Add column | Table columns | gtk_column_view_append_column(view, column) |
| gtk_string_list_new | Create string list model | Simple data | gtk_string_list_new(strings) |
| gtk_single_selection_new | Create single selection | Selection mode | gtk_single_selection_new(model) |
| gtk_list_item_factory_new | Create item factory | Item setup | gtk_list_item_factory_new() |
| gtk_signal_list_item_factory_new | Create signal factory | Bind signals | gtk_signal_list_item_factory_new() |
| gtk_list_view_set_model | Set view model | Bind data | gtk_list_view_set_model(view, selection) |
| gtk_list_view_set_factory | Set item factory | Rendering | gtk_list_view_set_factory(view, factory) |

### 7. Popovers and Menus (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_popover_new | Create popover | Contextual menus | gtk_popover_new() |
| gtk_popover_set_child | Set popover child | Content | gtk_popover_set_child(GTK_POPOVER(popover), child) |
| gtk_popover_popup | Show popover | Display | gtk_popover_popup(GTK_POPOVER(popover)) |
| gtk_popover_popdown | Hide popover | Hide | gtk_popover_popdown(GTK_POPOVER(popover)) |
| gtk_popover_menu_new_from_model | Create menu popover | Model-based menus | gtk_popover_menu_new_from_model(model) |
| gtk_menu_button_new | Create menu button | Dropdowns | gtk_menu_button_new() |
| gtk_menu_button_set_popover | Set button popover | Attach menu | gtk_menu_button_set_popover(button, popover) |
| gtk_popover_set_autohide | Set autohide | Behavior | gtk_popover_set_autohide(popover, TRUE) |

### 8. Dialogs and Choosers (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_message_dialog_new | Create message dialog | Alerts | gtk_message_dialog_new(parent, flags, type, buttons, message) |
| gtk_dialog_new | Create dialog | Custom dialogs | gtk_dialog_new() |
| gtk_dialog_add_button | Add response button | Actions | gtk_dialog_add_button(dialog, label, response) |
| gtk_dialog_run | Run modal dialog | Synchronous | gtk_dialog_run(dialog) |
| gtk_file_dialog_new | Create file dialog | Async file chooser | gtk_file_dialog_new() |
| gtk_file_dialog_open | Open file async | File selection | gtk_file_dialog_open(dialog, parent, cancellable, callback, data) |
| gtk_file_dialog_select_folder | Select folder async | Folder chooser | gtk_file_dialog_select_folder(dialog, parent, cancellable, callback, data) |
| gtk_color_dialog_new | Create color dialog | Color picker | gtk_color_dialog_new() |
| gtk_color_dialog_choose_rgba | Choose color async | Async color | gtk_color_dialog_choose_rgba(dialog, parent, initial, cancellable, callback, data) |
| gtk_about_dialog_new | Create about dialog | App info | gtk_about_dialog_new() |

### 9. Event Controllers (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_event_controller_key_new | Create key controller | Keyboard input | gtk_event_controller_key_new() |
| gtk_event_controller_motion_new | Create motion controller | Mouse movement | gtk_event_controller_motion_new() |
| gtk_event_controller_scroll_new | Create scroll controller | Scrolling | gtk_event_controller_scroll_new(flags) |
| gtk_widget_add_controller | Add controller to widget | Attach | gtk_widget_add_controller(widget, controller) |
| gtk_widget_remove_controller | Remove controller | Detach | gtk_widget_remove_controller(widget, controller) |
| gtk_gesture_click_new | Create click gesture | Button clicks | gtk_gesture_click_new() |
| gtk_gesture_long_press_new | Create long press | Long press | gtk_gesture_long_press_new() |
| gtk_gesture_drag_new | Create drag gesture | Dragging | gtk_gesture_drag_new() |
| gtk_gesture_swipe_new | Create swipe gesture | Swipes | gtk_gesture_swipe_new() |
| gtk_gesture_zoom_new | Create zoom gesture | Pinch zoom | gtk_gesture_zoom_new() |
| gtk_gesture_rotate_new | Create rotate gesture | Rotation | gtk_gesture_rotate_new() |
| gtk_event_controller_set_propagation_phase | Set phase | Control propagation | gtk_event_controller_set_propagation_phase(controller, phase) |

### 10. Gestures and Input (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_gesture_get_bounding_box | Get gesture box | Position | gtk_gesture_get_bounding_box(gesture, &rect) |
| gtk_gesture_drag_get_offset | Get drag offset | Drag data | gtk_gesture_drag_get_offset(gesture, &x, &y) |
| gtk_gesture_drag_get_start_point | Get start point | Drag start | gtk_gesture_drag_get_start_point(gesture, &x, &y) |
| gtk_gesture_is_recognized | Check recognition | State | gtk_gesture_is_recognized(gesture) |
| gtk_gesture_set_state | Set gesture state | Control | gtk_gesture_set_state(gesture, state) |
| gtk_event_controller_key_forward | Forward keys | Delegation | gtk_event_controller_key_forward(controller, widget) |
| gtk_event_controller_key_set_im_context | Set input context | IME | gtk_event_controller_key_set_im_context(controller, im) |
| gtk_shortcut_controller_new | Create shortcut controller | Accelerators | gtk_shortcut_controller_new() |
| gtk_widget_add_shortcut | Add shortcut | Key bindings | gtk_widget_add_shortcut(widget, shortcut) |
| gtk_shortcut_new | Create shortcut | Define | gtk_shortcut_new(trigger, action) |

### 11. Rendering and Snapshot (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_snapshot_new | Create snapshot | Rendering start | gtk_snapshot_new() |
| gtk_snapshot_free_to_node | Get render node | Output | gtk_snapshot_free_to_node(snapshot) |
| gtk_snapshot_append_cairo | Append Cairo | Legacy draw | gtk_snapshot_append_cairo(snapshot, &bounds) |
| gtk_snapshot_append_texture | Append texture | Images | gtk_snapshot_append_texture(snapshot, texture, &rect) |
| gtk_snapshot_push_opacity | Push opacity | Effects | gtk_snapshot_push_opacity(snapshot, opacity) |
| gtk_snapshot_pop | Pop transform | Restore | gtk_snapshot_pop(snapshot) |
| gtk_snapshot_translate | Translate coords | Positioning | gtk_snapshot_translate(snapshot, &point) |
| gtk_snapshot_scale | Scale | Scaling | gtk_snapshot_scale(snapshot, sx, sy) |
| gtk_snapshot_transform | Apply transform | Advanced | gtk_snapshot_transform(snapshot, transform) |
| gtk_widget_snapshot_child | Snapshot child | Custom render | gtk_widget_snapshot_child(parent, child, snapshot) |

### 12. Drag and Drop (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_drag_source_new | Create drag source | Source setup | gtk_drag_source_new() |
| gtk_drag_source_set_actions | Set actions | DnD actions | gtk_drag_source_set_actions(source, actions) |
| gtk_drop_target_new | Create drop target | Target setup | gtk_drop_target_new(type, actions) |
| gtk_drop_target_set_actions | Set target actions | Accept actions | gtk_drop_target_set_actions(target, actions) |
| gtk_drag_source_set_icon | Set drag icon | Visual | gtk_drag_source_set_icon(source, paintable, hot_x, hot_y) |
| gtk_drop_target_async_new | Async drop target | Modern DnD | gtk_drop_target_async_new(types, n_types, actions) |
| gtk_drop_controller_motion_new | Motion controller | Hover | gtk_drop_controller_motion_new() |
| gtk_drag_check_threshold | Check threshold | Start drag | gtk_drag_check_threshold(widget, start_x, start_y, current_x, current_y) |

### 13. Styling and CSS (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_css_provider_new | Create CSS provider | Styling | gtk_css_provider_new() |
| gtk_css_provider_load_from_data | Load CSS data | Inline | gtk_css_provider_load_from_data(provider, data, -1) |
| gtk_css_provider_load_from_path | Load from file | Themes | gtk_css_provider_load_from_path(provider, path) |
| gtk_style_context_add_provider_for_display | Add display provider | Global | gtk_style_context_add_provider_for_display(display, provider, priority) |
| gtk_widget_add_css_class | Add class | Per-widget | gtk_widget_add_css_class(widget, name) |
| gtk_widget_set_css_name | Set CSS name | Type styling | gtk_widget_set_css_name(widget, name) |
| gtk_widget_get_css_classes | Get classes | Query | gtk_widget_get_css_classes(widget) |
| gtk_style_provider_get_priority | Get priority | Order | GTK_STYLE_PROVIDER_PRIORITY_APPLICATION |
| gtk_widget_has_css_class | Check class | State | gtk_widget_has_css_class(widget, name) |
| gtk_css_section_new | Create section | Debugging | gtk_css_section_new(start, end) |

### 14. Shortcuts and Actions (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_shortcut_action_new | Create action | Custom | gtk_shortcut_action_new() |
| gtk_shortcut_trigger_parse_string | Parse trigger | Keys | gtk_shortcut_trigger_parse_string(<Control>a) |
| gtk_shortcut_new | Create shortcut | Binding | gtk_shortcut_new(trigger, action) |
| gtk_shortcut_controller_add_shortcut | Add shortcut | Attach | gtk_shortcut_controller_add_shortcut(controller, shortcut) |
| gtk_named_action_new | Create named action | GAction | gtk_named_action_new(name) |
| gtk_actionable_set_action_name | Set actionable | Activate | gtk_actionable_set_action_name(widget, name) |
| gtk_shortcut_label_new | Create label | Display | gtk_shortcut_label_new() |
| gtk_shortcut_label_set_accelerator | Set accelerator | Show key | gtk_shortcut_label_set_accelerator(label, accel) |

### 15. Accessibility (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_accessible_get_accessible_role | Get role | Query | gtk_accessible_get_accessible_role(accessible) |
| gtk_accessible_set_accessible_property | Set property | Name/desc | gtk_accessible_set_accessible_property(accessible, property, value) |
| gtk_accessible_announce | Announce message | Screen readers | gtk_accessible_announce(accessible, message, priority) |
| gtk_widget_set_accessible_role | Set role | Semantics | gtk_widget_set_accessible_role(widget, role) |
| gtk_accessible_update_property | Update property | Dynamic | gtk_accessible_update_property(accessible, prop1, val1, -1) |
| gtk_accessible_reset_property | Reset property | Default | gtk_accessible_reset_property(accessible, property) |
| gtk_widget_get_accessible | Get accessible | Interface | gtk_widget_get_accessible(widget) |
| gtk_at_context_new | Create AT context | Advanced | gtk_at_context_new(device, role, accessible) |

### 16. Builder and UI Files (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_builder_new | Create builder | UI loading | gtk_builder_new() |
| gtk_builder_add_from_file | Load from file | Glade/Blueprint | gtk_builder_add_from_file(builder, filename, &error) |
| gtk_builder_add_from_string | Load from string | Inline UI | gtk_builder_add_from_string(builder, string, -1, &error) |
| gtk_builder_get_object | Get object | Access widgets | gtk_builder_get_object(builder, id) |
| gtk_builder_expose_object | Expose object | Custom | gtk_builder_expose_object(builder, name, object) |
| gtk_builder_set_current_object | Set current | Callbacks | gtk_builder_set_current_object(builder, object) |
| gtk_builder_connect_signals | Connect signals | Legacy | Not needed in GTK4 |
| gtk_builder_scope_new | Create scope | Bindings | gtk_builder_scope_new() |

### 17. Miscellaneous Utilities (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_show_uri | Show URI | Links | gtk_show_uri(parent, uri, timestamp) |
| gtk_adjustment_new | Create adjustment | Ranges | gtk_adjustment_new(value, lower, upper, step, page, 0) |
| gtk_adjustment_set_value | Set value | Update | gtk_adjustment_set_value(adj, value) |
| gtk_constraint_layout_new | Create constraint layout | Declarative | gtk_constraint_layout_new() |
| gtk_constraint_new_constant | Create constant constraint | Layout | gtk_constraint_new_constant(target, attr, relation, source_attr, strength, constant) |
| gtk_expression_bind | Bind expression | Properties | gtk_expression_bind(expr, target, property, source) |
| gtk_bitset_new_empty | Create bitset | Selections | gtk_bitset_new_empty() |
| gtk_selection_model_select_all | Select all | Lists | gtk_selection_model_select_all(model) |
| gtk_print_operation_new | Create print op | Printing | gtk_print_operation_new() |
| gtk_print_operation_run | Run print | Dialog | gtk_print_operation_run(op, action, parent, &error) |

## Tips and Best Practices
* Use GtkApplication for proper lifecycle and unique instance handling.
* Prefer event controllers and gestures over direct signals for input.
* Use layout managers instead of manual positioning.
* Leverage CSS extensively for theming and styling.
* Implement async dialogs for non-blocking UI.
* Use list views with factories and models for dynamic data.
* Add accessibility properties early for inclusive design.
* Avoid blocking operations in the main thread.
* Test on multiple display scales for HiDPI support.
* Use snapshots for custom rendering with Cairo or nodes.
* Group related actions with GActionMap.
* Enable animations and transitions where appropriate.
* Validate input in entries and buffers.
* Use popovers for contextual actions.
* Profile rendering with GTK Inspector.
* Handle focus and keyboard navigation properly.
* Use constraints for complex layouts.
* Monitor reference counts to prevent leaks.
* Internationalize strings with gettext.
* Use Blueprint or Cambalache for UI design.

## Additional Resources
* [Official GTK4 Documentation](https://docs.gtk.org/gtk4/)
* [GTK4 Getting Started](https://docs.gtk.org/gtk4/getting_started.html)
* [GTK4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)
* [GTK4 API Reference](https://docs.gtk.org/gtk4/classes.html)
* [Blueprint UI Designer](https://jwestman.pages.gitlab.gnome.org/blueprint/)
* [GTK4 CSS Overview](https://docs.gtk.org/gtk4/css-overview.html)
* [GTK4 Examples](https://gitlab.gnome.org/GNOME/gtk/-/tree/main/examples)
* [GTK Discourse](https://discourse.gnome.org/c/platform/gtk)
* [Libadwaita for GNOME Apps](https://gnome.pages.gitlab.gnome.org/libadwaita/doc/main/)

## Mini-Glossary
This section defines key GTK4 terms and concepts.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Widget | Base UI element with properties and hierarchy |
| Window | Toplevel container for applications |
| Application | Manages lifecycle and actions |
| Layout Manager | Handles child sizing and positioning |
| Constraint | Declarative layout rule |
| Snapshot | Rendering context for draw operations |
| Render Node | GPU-accelerated drawing tree |
| Paintable | Interface for textures and images |
| Expression | Property binding mechanism |
| Bitset | Efficient selection storage |

### 2. Widget Types
| Term/Concept | Description |
| --- | --- |
| Button | Clickable action trigger |
| Label | Static or markup text display |
| Entry | Single-line editable text |
| TextView | Multi-line editable text |
| Picture | Scalable image display |
| DrawingArea | Custom Cairo rendering area |
| ListView | Vertical list of items |
| GridView | Grid of items |
| ColumnView | Sortable table view |
| Popover | Contextual overlay window |

### 3. Layout Managers
| Term/Concept | Description |
| --- | --- |
| BoxLayout | Linear arrangement |
| GridLayout | 2D grid positioning |
| ConstraintLayout | Relation-based layout |
| BinLayout | Single child container |
| OverlayLayout | Layered children |
| CenterLayout | Centered content |
| FlowLayout | Wrapping flow |
| FixedLayout | Absolute positioning |
| Paned | Resizable split |
| Clamp | Clamped size child |

### 4. Event Controllers
| Term/Concept | Description |
| --- | --- |
| EventController | Base input handler |
| Gesture | Multi-touch recognition |
| ClickGesture | Button press/release |
| DragGesture | Drag operations |
| LongPressGesture | Long button hold |
| SwipeGesture | Swipe motion |
| ZoomGesture | Pinch scaling |
| RotateGesture | Rotation |
| KeyController | Keyboard events |
| MotionController | Pointer movement |

### 5. Input Handling
| Term/Concept | Description |
| --- | --- |
| Propagation Phase | Capture/bubble/target |
| Gesture State | Possible/denied/recognized |
| Modifier | Key modifiers like Control |
| Shortcut | Accelerator binding |
| Action | Activatable operation |
| NamedAction | GAction integration |
| Focusable | Can receive keyboard focus |
| Key Capture | Forward keys to widget |
| IM Context | Input method support |
| Seat | Input device group |

### 6. Rendering Concepts
| Term/Concept | Description |
| --- | --- |
| Snapshot | Draw recording context |
| Cairo | Legacy 2D drawing |
| RenderNode | Immutable draw command |
| Texture | GPU image data |
| Transform | Matrix transformation |
| Opacity | Alpha blending |
| Clip | Bounding restriction |
| Shadow | Drop shadow effect |
| Blend | Compositing mode |
| CrossFade | Transition node |

### 7. Drag and Drop
| Term/Concept | Description |
| --- | --- |
| DragSource | DnD initiator |
| DropTarget | DnD receiver |
| ContentProvider | Data format provider |
| DragIcon | Visual feedback |
| DropControllerMotion | Hover detection |
| Async Drop | Non-blocking transfer |
| Value | Clipboard content |
| Clipboard | System clipboard |
| Primary | Selection clipboard |
| Format | Data type like text/uri-list |

### 8. Accessibility
| Term/Concept | Description |
| --- | --- |
| Accessible | ATK interface |
| Role | Semantic widget type |
| Property | Name, description, value |
| State | Checked, focused, selected |
| Relation | Labelled-by, controller-for |
| Text Interface | Text content access |
| Value Interface | Range value |
| Action Interface | Performable actions |
| Announce | Polite/live message |
| Platform | Backend integration |

### 9. Model-View Concepts
| Term/Concept | Description |
| --- | --- |
| ListModel | Dynamic item interface |
| SelectionModel | Selected items |
| SingleSelection | One item selection |
| MultiSelection | Multiple items |
| StringList | Simple string model |
| Factory | Item widget creation |
| SignalFactory | Signal connections |
| Sorter | Item ordering |
| Filter | Item visibility |
| Expression | Property evaluation |

### 10. Modern Features
| Term/Concept | Description |
| --- | --- |
| Async Dialog | Non-modal file/color dialogs |
| Builder Scope | Callback resolution |
| CSS Provider | Theme loading |
| Priority | Application/User/Theme |
| Inspector | Runtime debugging |
| Emoji Chooser | Emoji picker |
| Video | Media playback |
| MediaControls | Playback UI |
| Inscription | Wrapped text label |
| PasswordEntry | Secure input |

