# 101 GTK3 Commands

## Overview
GTK3 is the third major version of the GTK toolkit, a free and open-source cross-platform widget toolkit for creating graphical user interfaces. This cheat sheet covers essential functions, widgets, containers, event handling, styling, and integration patterns for developing desktop applications primarily in C, with applicability to bindings in other languages. Master these APIs to build efficient, themeable, and accessible GUIs for Linux and other platforms.

## Target Audience
- GUI developers creating desktop applications
- C programmers building Linux interfaces
- Software engineers integrating GTK libraries
- UI designers working with Glade tools
- Anyone developing cross-platform GUIs

## Command Categories

### 1. Core Application Functions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_init | Initialize GTK library and parse options | Start of main function | gtk_init(&argc, &argv) |
| gtk_init_check | Initialize GTK with error checking | Safe initialization | gtk_init_check(&argc, &argv) |
| gtk_main | Enter main event loop | Run application | gtk_main() |
| gtk_main_quit | Exit main event loop | Shutdown application | gtk_main_quit() |
| gtk_main_iteration | Process one iteration of events | Custom loops | gtk_main_iteration() |
| gtk_main_iteration_do | Process iteration with blocking option | Non-blocking processing | gtk_main_iteration_do(FALSE) |
| gtk_events_pending | Check for pending events | Event loop control | while (gtk_events_pending()) |
| gtk_check_version | Verify GTK version | Compatibility checks | gtk_check_version(3,0,0) |
| gtk_get_major_version | Get major version number | Version queries | gtk_get_major_version() |
| gtk_get_minor_version | Get minor version number | Version queries | gtk_get_minor_version() |

### 2. Widget Basics (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_widget_new | Create new widget instance | Generic creation | gtk_widget_new(GTK_TYPE_BUTTON, NULL) |
| gtk_widget_show | Show widget on screen | Display elements | gtk_widget_show(button) |
| gtk_widget_show_all | Show widget and children | Display hierarchies | gtk_widget_show_all(window) |
| gtk_widget_hide | Hide widget from screen | Toggle visibility | gtk_widget_hide(button) |
| gtk_widget_set_sensitive | Set interaction state | Enable/disable | gtk_widget_set_sensitive(button, FALSE) |
| gtk_widget_get_sensitive | Get interaction state | Check enabled | gtk_widget_get_sensitive(button) |
| gtk_widget_set_visible | Set visibility state | Manage display | gtk_widget_set_visible(button, TRUE) |
| gtk_widget_get_visible | Get visibility state | Check display | gtk_widget_get_visible(button) |
| gtk_widget_queue_draw | Request redraw | Update graphics | gtk_widget_queue_draw(area) |
| gtk_widget_queue_resize | Request resize | Layout updates | gtk_widget_queue_resize(container) |
| gtk_widget_add_tick_callback | Add frame callback | Animations | gtk_widget_add_tick_callback(widget, callback, data, NULL) |
| gtk_widget_destroy | Destroy widget | Cleanup | gtk_widget_destroy(window) |

### 3. Containers (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_container_add | Add child to container | Build layouts | gtk_container_add(GTK_CONTAINER(box), button) |
| gtk_container_remove | Remove child from container | Modify layouts | gtk_container_remove(GTK_CONTAINER(box), button) |
| gtk_box_pack_start | Pack child at start | Linear layouts | gtk_box_pack_start(GTK_BOX(box), child, TRUE, TRUE, 0) |
| gtk_box_pack_end | Pack child at end | Linear layouts | gtk_box_pack_end(GTK_BOX(box), child, TRUE, TRUE, 0) |
| gtk_grid_attach | Attach child to grid | Grid positions | gtk_grid_attach(GTK_GRID(grid), child, 0, 0, 1, 1) |
| gtk_paned_pack1 | Pack first child in paned | Split views | gtk_paned_pack1(GTK_PANED(paned), child, TRUE, FALSE) |
| gtk_paned_pack2 | Pack second child in paned | Split views | gtk_paned_pack2(GTK_PANED(paned), child, TRUE, FALSE) |
| gtk_notebook_append_page | Add page to notebook | Tabbed interfaces | gtk_notebook_append_page(GTK_NOTEBOOK(notebook), child, label) |
| gtk_scrolled_window_add_with_viewport | Add child with viewport | Scrollable areas | gtk_scrolled_window_add_with_viewport(GTK_SCROLLED_WINDOW(scrolled), child) |
| gtk_stack_add_titled | Add titled child to stack | Switchable views | gtk_stack_add_titled(GTK_STACK(stack), child, name, title) |

### 4. Buttons and Toggle Controls (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_button_new_with_label | Create button with label | Basic buttons | gtk_button_new_with_label(Click Me) |
| gtk_button_set_label | Set button text | Update labels | gtk_button_set_label(GTK_BUTTON(button), New Text) |
| gtk_toggle_button_new_with_label | Create toggle button | State buttons | gtk_toggle_button_new_with_label(Toggle) |
| gtk_toggle_button_set_active | Set toggle state | Control state | gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(toggle), TRUE) |
| gtk_check_button_new_with_label | Create check button | Checkboxes | gtk_check_button_new_with_label(Option) |
| gtk_radio_button_new_with_label | Create radio button | Radio groups | gtk_radio_button_new_with_label(group, Choice) |
| gtk_switch_new | Create switch widget | Modern toggles | gtk_switch_new() |
| gtk_switch_set_active | Set switch state | Control switch | gtk_switch_set_active(GTK_SWITCH(switch), TRUE) |

### 5. Entry and Text Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_entry_new | Create text entry | Input fields | gtk_entry_new() |
| gtk_entry_set_text | Set entry text | Set values | gtk_entry_set_text(GTK_ENTRY(entry), Hello) |
| gtk_entry_get_text | Get entry text | Read input | gtk_entry_get_text(GTK_ENTRY(entry)) |
| gtk_entry_set_visibility | Set text visibility | Password fields | gtk_entry_set_visibility(GTK_ENTRY(entry), FALSE) |
| gtk_text_view_new | Create text view | Multi-line text | gtk_text_view_new() |
| gtk_text_buffer_new | Create text buffer | Text storage | gtk_text_buffer_new(NULL) |
| gtk_text_buffer_set_text | Set buffer text | Update text | gtk_text_buffer_set_text(buffer, text, -1) |
| gtk_text_buffer_insert | Insert text | Add content | gtk_text_buffer_insert(buffer, &iter, text, -1) |
| gtk_label_new | Create label | Display text | gtk_label_new(Hello) |
| gtk_label_set_markup | Set markup text | Formatted labels | gtk_label_set_markup(GTK_LABEL(label), <b>Bold</b>) |

### 6. Lists and Trees (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_list_store_new | Create list store | List models | gtk_list_store_new(2, G_TYPE_STRING, G_TYPE_INT) |
| gtk_list_store_append | Append row to list | Add data | gtk_list_store_append(store, &iter) |
| gtk_list_store_set | Set row values | Update data | gtk_list_store_set(store, &iter, 0, value, -1) |
| gtk_tree_store_new | Create tree store | Tree models | gtk_tree_store_new(2, G_TYPE_STRING, G_TYPE_INT) |
| gtk_tree_store_append | Append tree node | Add nodes | gtk_tree_store_append(store, &iter, &parent) |
| gtk_tree_view_new | Create tree view | Display trees | gtk_tree_view_new() |
| gtk_tree_view_set_model | Set view model | Bind data | gtk_tree_view_set_model(GTK_TREE_VIEW(view), model) |
| gtk_tree_view_append_column | Add column | Add columns | gtk_tree_view_append_column(GTK_TREE_VIEW(view), column) |
| gtk_tree_selection_set_mode | Set selection mode | Selection types | gtk_tree_selection_set_mode(selection, GTK_SELECTION_MULTIPLE) |
| gtk_tree_selection_select_iter | Select iterator | Select rows | gtk_tree_selection_select_iter(selection, &iter) |

### 7. Menus and Popovers (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_menu_new | Create menu | Popup menus | gtk_menu_new() |
| gtk_menu_bar_new | Create menu bar | Top menus | gtk_menu_bar_new() |
| gtk_menu_item_new_with_label | Create menu item | Menu entries | gtk_menu_item_new_with_label(File) |
| gtk_menu_shell_append | Append to menu shell | Add items | gtk_menu_shell_append(GTK_MENU_SHELL(menu), item) |
| gtk_menu_popup | Popup menu | Context menus | gtk_menu_popup(GTK_MENU(menu), NULL, NULL, NULL, NULL, 0, 0) |
| gtk_popover_new | Create popover | Bubble windows | gtk_popover_new(relative_widget) |
| gtk_popover_set_relative_to | Set anchor widget | Position popover | gtk_popover_set_relative_to(GTK_POPOVER(popover), button) |
| gtk_popover_popup | Show popover | Display popover | gtk_popover_popup(GTK_POPOVER(popover)) |

### 8. Dialogs and File Choosers (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_dialog_new | Create dialog | Base dialogs | gtk_dialog_new() |
| gtk_dialog_add_button | Add button to dialog | Action buttons | gtk_dialog_add_button(GTK_DIALOG(dialog), OK, GTK_RESPONSE_OK) |
| gtk_dialog_run | Run modal dialog | Show and wait | gtk_dialog_run(GTK_DIALOG(dialog)) |
| gtk_message_dialog_new | Create message dialog | Alerts | gtk_message_dialog_new(parent, flags, type, buttons, message) |
| gtk_file_chooser_dialog_new | Create file dialog | File selection | gtk_file_chooser_dialog_new(title, parent, action, NULL) |
| gtk_file_chooser_set_action | Set chooser action | Open/save | gtk_file_chooser_set_action(GTK_FILE_CHOOSER(chooser), GTK_FILE_CHOOSER_ACTION_OPEN) |
| gtk_file_chooser_get_filename | Get selected file | Read path | gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(chooser)) |
| gtk_about_dialog_new | Create about dialog | App info | gtk_about_dialog_new() |

### 9. Events and Input Handling (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| g_signal_connect | Connect signal handler | Event callbacks | g_signal_connect(button, clicked, G_CALLBACK(on_clicked), data) |
| gtk_widget_add_events | Add event masks | Enable events | gtk_widget_add_events(widget, GDK_BUTTON_PRESS_MASK) |
| gtk_propagate_event | Propagate event | Manual dispatch | gtk_propagate_event(widget, event) |
| gtk_get_current_event | Get current event | Event queries | gtk_get_current_event() |
| gtk_get_current_event_time | Get event timestamp | Time queries | gtk_get_current_event_time() |
| gtk_accelerator_parse | Parse accelerator | Key shortcuts | gtk_accelerator_parse(<Ctrl>S, &key, &mods) |
| gtk_widget_add_accelerator | Add accelerator | Bind keys | gtk_widget_add_accelerator(widget, activate, group, key, mods, flags) |
| gtk_drag_dest_set | Set drag destination | DnD targets | gtk_drag_dest_set(widget, flags, targets, n_targets, actions) |
| gtk_drag_source_set | Set drag source | DnD sources | gtk_drag_source_set(widget, buttons, targets, n_targets, actions) |
| gtk_clipboard_set_text | Set clipboard text | Copy text | gtk_clipboard_set_text(clipboard, text, -1) |

### 10. Drag-and-Drop (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_drag_begin_with_coordinates | Start drag | Initiate DnD | gtk_drag_begin_with_coordinates(widget, targets, actions, button, event, x, y) |
| gtk_drag_set_icon_pixbuf | Set drag icon pixbuf | Custom icons | gtk_drag_set_icon_pixbuf(context, pixbuf, hot_x, hot_y) |
| gtk_drag_set_icon_name | Set drag icon name | Themed icons | gtk_drag_set_icon_name(context, icon_name, hot_x, hot_y) |
| gtk_drag_finish | Finish drag operation | Complete DnD | gtk_drag_finish(context, success, del, time) |
| gtk_drag_cancel | Cancel drag | Abort DnD | gtk_drag_cancel(context) |
| gtk_drag_get_source_widget | Get source widget | Query source | gtk_drag_get_source_widget(context) |
| gtk_drag_dest_add_text_targets | Add text targets | Text DnD | gtk_drag_dest_add_text_targets(widget) |
| gtk_drag_source_add_text_targets | Add text sources | Text DnD | gtk_drag_source_add_text_targets(widget) |

### 11. Rendering and Styling (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_style_context_new | Create style context | Styling | gtk_style_context_new() |
| gtk_style_context_add_provider | Add CSS provider | Apply styles | gtk_style_context_add_provider(context, provider, priority) |
| gtk_css_provider_new | Create CSS provider | CSS loading | gtk_css_provider_new() |
| gtk_css_provider_load_from_data | Load CSS data | Inline CSS | gtk_css_provider_load_from_data(provider, css, -1, NULL) |
| gtk_render_background | Render background | Custom drawing | gtk_render_background(context, cr, x, y, width, height) |
| gtk_render_frame | Render frame | Borders | gtk_render_frame(context, cr, x, y, width, height) |
| gtk_render_arrow | Render arrow | Indicators | gtk_render_arrow(context, cr, angle, x, y, size) |
| gtk_render_check | Render checkmark | Checkboxes | gtk_render_check(context, cr, x, y, size) |
| gtk_render_icon | Render icon | Icons | gtk_render_icon(context, cr, pixbuf, x, y) |
| gtk_widget_get_style_context | Get widget context | Access styles | gtk_widget_get_style_context(widget) |
| gtk_style_context_add_class | Add CSS class | Class styling | gtk_style_context_add_class(context, class_name) |
| gtk_style_context_remove_class | Remove CSS class | Class styling | gtk_style_context_remove_class(context, class_name) |

### 12. Callbacks and Utility Types (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| g_signal_connect_data | Connect with data | Handlers | g_signal_connect_data(instance, signal, handler, data, NULL, 0) |
| g_signal_handler_disconnect | Disconnect handler | Cleanup | g_signal_handler_disconnect(instance, handler_id) |
| gtk_builder_new | Create builder | UI loading | gtk_builder_new() |
| gtk_builder_add_from_file | Load UI file | Glade files | gtk_builder_add_from_file(builder, filename, NULL) |
| gtk_builder_get_object | Get object by ID | Access widgets | gtk_builder_get_object(builder, id) |
| gtk_adjustment_new | Create adjustment | Ranges | gtk_adjustment_new(value, lower, upper, step, page, page_size) |
| gtk_adjustment_set_value | Set adjustment value | Update ranges | gtk_adjustment_set_value(adjustment, value) |
| gtk_settings_get_default | Get default settings | Global settings | gtk_settings_get_default() |
| gtk_settings_set_property | Set setting property | Configure | gtk_settings_set_property(settings, name, value, NULL) |
| gtk_widget_translate_coordinates | Translate coords | Position mapping | gtk_widget_translate_coordinates(src, dest, src_x, src_y, &dest_x, &dest_y) |

### 13. Miscellaneous Utility Functions (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_show_uri_on_window | Show URI | Open links | gtk_show_uri_on_window(window, uri, timestamp, NULL) |
| gtk_rgb_to_hsv | Convert RGB to HSV | Colors | gtk_rgb_to_hsv(r, g, b, &h, &s, &v) |
| gtk_hsv_to_rgb | Convert HSV to RGB | Colors | gtk_hsv_to_rgb(h, s, v, &r, &g, &b) |
| gtk_selection_owner_set | Set selection owner | Selections | gtk_selection_owner_set(widget, atom, time) |
| gtk_target_list_new | Create target list | DnD targets | gtk_target_list_new(targets, ntargets) |
| gtk_target_table_new_from_list | Create table from list | DnD tables | gtk_target_table_new_from_list(list, &ntargets) |
| gtk_target_table_free | Free target table | Cleanup | gtk_target_table_free(table, ntargets) |
| gtk_print_run_page_setup_dialog | Run page setup | Printing | gtk_print_run_page_setup_dialog(parent, setup, settings) |

### 14. Style and Theming (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_style_context_get_property | Get style property | Read styles | gtk_style_context_get_property(context, property, state, &value) |
| gtk_style_context_set_state | Set context state | State changes | gtk_style_context_set_state(context, state) |
| gtk_style_context_save | Save context state | State stacking | gtk_style_context_save(context) |
| gtk_style_context_restore | Restore context state | State stacking | gtk_style_context_restore(context) |
| gtk_css_provider_load_from_path | Load CSS from file | Theme files | gtk_css_provider_load_from_path(provider, path, NULL) |
| gtk_style_context_add_provider_for_screen | Add screen provider | Global themes | gtk_style_context_add_provider_for_screen(screen, provider, priority) |
| gtk_settings_get_for_screen | Get screen settings | Screen config | gtk_settings_get_for_screen(screen) |
| gtk_widget_path | Get widget path | CSS paths | gtk_widget_path(widget) |

### 15. Event Controllers (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_event_controller_key_new | Create key controller | Key events | gtk_event_controller_key_new(widget) |
| gtk_event_controller_motion_new | Create motion controller | Mouse motion | gtk_event_controller_motion_new(widget) |
| gtk_event_controller_scroll_new | Create scroll controller | Scrolling | gtk_event_controller_scroll_new(widget, flags) |
| gtk_widget_add_controller | Add controller to widget | Attach handlers | gtk_widget_add_controller(widget, controller) |
| gtk_widget_remove_controller | Remove controller | Detach handlers | gtk_widget_remove_controller(widget, controller) |
| gtk_gesture_drag_new | Create drag gesture | Drag recognition | gtk_gesture_drag_new(widget) |
| gtk_gesture_swipe_new | Create swipe gesture | Swipe recognition | gtk_gesture_swipe_new(widget) |
| gtk_gesture_zoom_new | Create zoom gesture | Zoom recognition | gtk_gesture_zoom_new(widget) |

### 16. Accessibility Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_widget_set_accessible_role | Set accessible role | ATK roles | gtk_widget_set_accessible_role(widget, role) |
| gtk_accessible_set_name | Set accessible name | Labels | gtk_accessible_set_name(accessible, name) |
| gtk_accessible_set_description | Set description | Tooltips | gtk_accessible_set_description(accessible, desc) |
| gtk_accessible_connect_property_change_handler | Connect prop change | Updates | gtk_accessible_connect_property_change_handler(accessible, handler) |
| gtk_container_forall | Iterate all children | Accessibility traversal | gtk_container_forall(container, callback, data) |
| gtk_widget_set_can_focus | Set focusable | Keyboard nav | gtk_widget_set_can_focus(widget, TRUE) |
| gtk_widget_grab_focus | Grab focus | Set focus | gtk_widget_grab_focus(widget) |
| gtk_im_context_filter_keypress | Filter keypress | Input methods | gtk_im_context_filter_keypress(context, event) |

### 17. Printing and Export (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gtk_print_operation_new | Create print operation | Printing | gtk_print_operation_new() |
| gtk_print_operation_run | Run print operation | Start print | gtk_print_operation_run(op, action, parent, NULL) |
| gtk_print_operation_set_n_pages | Set page count | Multi-page | gtk_print_operation_set_n_pages(op, n_pages) |
| gtk_print_settings_new | Create print settings | Config | gtk_print_settings_new() |
| gtk_page_setup_new | Create page setup | Page config | gtk_page_setup_new() |
| gtk_print_context_get_cairo_context | Get cairo context | Drawing | gtk_print_context_get_cairo_context(context) |
| gtk_print_operation_set_export_filename | Set export file | PDF export | gtk_print_operation_set_export_filename(op, filename) |
| gtk_print_run_page_setup_dialog_async | Async page setup | Non-blocking | gtk_print_run_page_setup_dialog_async(parent, setup, settings, done_cb, data) |

## Tips and Best Practices
* Always call gtk_init before using any GTK functions to ensure proper initialization.
* Use GtkBuilder and Glade for separating UI design from code logic.
* Connect signals early in widget creation to handle events properly.
* Prefer CSS theming over manual styling for maintainable appearances.
* Implement accessibility features from the start for inclusive applications.
* Use adjustments shared across widgets for synchronized scrolling.
* Avoid blocking the main loop; use idle or timeout functions for heavy tasks.
* Test on multiple themes to ensure consistent rendering.
* Use GtkApplication for modern app structure with unique IDs.
* Handle window destroy signals to clean up resources.
* Optimize drawing by minimizing queue_draw calls.
* Use gesture controllers for touch-friendly interfaces.
* Validate user input in entries to prevent errors.
* Group radio buttons properly for exclusive selection.
* Add tooltips to widgets for better user guidance.
* Monitor memory usage with complex widget hierarchies.
* Use stock icons where possible for consistency.
* Implement undo/redo in text buffers for better UX.
* Handle internationalization with gettext for multi-language support.
* Profile event handling to avoid performance bottlenecks.

## Additional Resources
* [Official GTK3 Documentation](https://docs.gtk.org/gtk3/)
* [GTK3 Tutorial](https://developer.gnome.org/gtk3/stable/gtk-getting-started.html)
* [GNOME Developer Center - GTK](https://developer.gnome.org/)
* [GTK3 API Reference](https://docs.gtk.org/gtk3/classes.html)
* [Glade UI Designer](https://glade.gnome.org/)
* [GTK3 CSS Theming Guide](https://docs.gtk.org/gtk3/css-overview.html)
* [GTK3 Examples on GitHub](https://github.com/GNOME/gtk/tree/master/examples)
* [Stack Overflow GTK3 Tag](https://stackoverflow.com/questions/tagged/gtk3)
* [GTK Forum Archives](https://discourse.gnome.org/c/platform/gtk)

## Mini-Glossary
This section provides definitions for key GTK3 terms and concepts organized into subsections for quick reference.

### 1. Core Terms
| Term/Concept | Description |
| --- | --- |
| Widget | Fundamental building block of GTK GUIs, representing UI elements |
| Container | Widget that holds other widgets, managing layout |
| Signal | Event notification mechanism for user interactions |
| Property | Configurable attribute of GObject-based classes |
| Adjustment | Object managing a bounded range of values |
| Builder | Tool for loading UI definitions from XML files |
| Application | High-level class for managing app lifecycle |
| Main Loop | Event processing cycle handling inputs and updates |
| GDK | Low-level drawing and event library under GTK |
| Cairo | 2D graphics library used for rendering |

### 2. Widget Types
| Term/Concept | Description |
| --- | --- |
| Button | Clickable widget for actions |
| Label | Text display widget supporting markup |
| Entry | Single-line text input field |
| TextView | Multi-line text display and editing widget |
| ListBox | Simple list of rows |
| TreeView | Hierarchical data display widget |
| Notebook | Tabbed container for multiple pages |
| Dialog | Modal window for user interaction |
| Popover | Contextual bubble window |
| Switch | Modern on/off toggle control |

### 3. Container Types
| Term/Concept | Description |
| --- | --- |
| Box | Linear horizontal or vertical container |
| Grid | Two-dimensional grid layout |
| Paned | Resizable split container |
| Stack | Switchable single-child container |
| ScrolledWindow | Container with scrollbars |
| FlowBox | Wrapping flow layout |
| Fixed | Absolute positioning container |
| Overlay | Container with overlay children |
| Expander | Collapsible container |
| Frame | Container with border and label |

### 4. Event Types
| Term/Concept | Description |
| --- | --- |
| Button Press | Mouse button down event |
| Button Release | Mouse button up event |
| Motion Notify | Mouse movement event |
| Key Press | Keyboard key down event |
| Key Release | Keyboard key up event |
| Configure | Window resize or move event |
| Expose | Redraw request event |
| Delete | Window close request |
| Destroy | Widget destruction event |
| Focus In/Out | Focus change events |

### 5. Styling Concepts
| Term/Concept | Description |
| --- | --- |
| Style Context | Manages widget styling state |
| CSS Provider | Loads and applies CSS rules |
| Theme | Collection of CSS and assets |
| Class | CSS selector for widget groups |
| State | Widget conditions like hover, focus |
| Region | Deprecated area-based styling |
| Icon Theme | System for loading icons |
| Font Chooser | Interface for selecting fonts |
| Color Chooser | Interface for selecting colors |
| Style Property | Registered stylable attributes |

### 6. Model-View Concepts
| Term/Concept | Description |
| --- | --- |
| TreeModel | Interface for tree/list data |
| ListStore | Simple flat list model |
| TreeStore | Hierarchical tree model |
| Cell Renderer | Draws cell content in views |
| TreeSelection | Manages selected items |
| Sort Model | Wrapper for sorting data |
| Filter Model | Wrapper for filtering data |
| Path | Reference to model row |
| Iter | Iterator for model navigation |
| Column | View column configuration |

### 7. Accessibility Features
| Term/Concept | Description |
| --- | --- |
| Accessible | Base class for accessibility info |
| ATK | Accessibility Toolkit integration |
| Role | Semantic type of widget |
| Relation | Connections between accessibles |
| State Set | Current states of accessible |
| Action | Performable operations |
| Text Interface | Text content access |
| Value Interface | Numeric value access |
| Selection Interface | Multi-item selection |
| Hypertext | Links in text |

### 8. Deprecated Features
| Term/Concept | Description |
| --- | --- |
| GtkAction | Old action system, use GAction |
| Stock Items | Predefined icons, use named icons |
| UIManager | Old menu builder, use GMenu |
| Style | Old styling, use StyleContext |
| Rc Files | Old config, use CSS |
| HBox/VBox | Use Box with orientation |
| HPaned/VPaned | Use Paned with orientation |
| HScale/VScale | Use Scale with orientation |
| Key Snooper | Use event controllers |
| RecentChooser | Use native file choosers |
