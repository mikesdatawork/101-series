# 101 Bootstrap CSS Commands

## Overview
Bootstrap is the most popular CSS framework for developing responsive, mobile-first web projects. This cheat sheet covers essential Bootstrap 5 utility classes, components, grid system, and best practices for rapid front-end development.

## Target Audience
- Front-end developers building sites
- Web designers creating prototypes
- Full-stack developers styling apps
- UI/UX professionals using framework
- Anyone learning responsive design

### 1. Grid System Basics (12)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| container | Fixed-width container | Page wrapper | <div class="container">...</div> |
| container-fluid | Full-width container | Full bleed | <div class="container-fluid">...</div> |
| row | Horizontal row | Group columns | <div class="row">...</div> |
| col | Auto column | Equal width | <div class="col">...</div> |
| col-* | Fixed columns | Total 12 | <div class="col-6">Half</div> |
| col-sm|md|lg|xl|xxl-* | Breakpoint columns | Responsive | <div class="col-md-4">...</div> |
| offset-* | Margin offset | Spacing | <div class="col-md-4 offset-md-4">Centered</div> |
| order-* | Reorder columns | Layout | <div class="order-1">First</div> |
| gutter classes | g-0 to g-5 | Row/column spacing | <div class="row g-4">...</div> |
| align-items-* | Vertical align | Flex alignment | align-items-center |
| justify-content-* | Horizontal align | Spacing | justify-content-between |
| row-cols-* | Auto columns per row | Simple grid | <div class="row row-cols-3">...</div> |

### 2. Spacing Utilities (10)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| m-* / p-* | Margin / Padding | Sides: t,b,s,e,x,y | mt-3, pb-5 |
| m| p-{size} | Size 0-5 or auto | Spacing scale | mx-auto (centered) |
| ms|me-* | Start/end margin | RTL support | ms-4 |
| ps|pe-* | Start/end padding | RTL | pe-3 |
| gap-* | Flex/grid gap | Spacing children | gap-4 |
| negative margins | m|mx|my|mt|mb|ms|me-n* | Pull elements | mt-n3 |
| responsive spacing | {breakpoint}-{property}-{size} | Mobile first | md:mt-5 |
| spacer utility | <div class="vr"></div> | Vertical rule | Separator |
| w-25|50|75|100 | Width percentages | Fixed width | w-50 |
| h-25|50|75|100 | Height percentages | Fixed height | h-100 |

### 3. Typography & Text Utilities (12)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| display-1 to display-6 | Large headings | Hero text | <h1 class="display-1">Big</h1> |
| lead | Larger paragraph | Intro text | <p class="lead">...</p> |
| text-start|center|end | Alignment | Text align | text-center |
| text-decoration-none | Remove underline | Links | <a class="text-decoration-none">Link</a> |
| text-uppercase|lowercase|capitalize | Case | Transform | text-uppercase |
| fw-bold|normal|light | Font weight | Emphasis | fw-bold |
| fst-italic|normal | Font style | Style | fst-italic |
| text-primary|secondary|success etc. | Text color | Theme colors | text-danger |
| bg-primary|secondary etc. | Background color | Highlights | bg-warning |
| text-wrap|nowrap|truncate | Wrapping | Control overflow | text-truncate |
| lh-1|sm|base|lg | Line height | Spacing | lh-lg |
| font-monospace | Monospace font | Code | <code class="font-monospace">code</code> |

### 4. Color & Background Utilities (10)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| text-* | Text color | Branding | text-primary |
| bg-* | Background color | Sections | bg-light |
| bg-gradient | Gradient background | Visual | bg-primary bg-gradient |
| text-bg-* | Text + bg combo | Badges | <span class="text-bg-danger">Alert</span> |
| opacity-* | Opacity 0-100 | Fade | opacity-75 |
| bg-opacity-* | Background opacity | Overlay | bg-primary bg-opacity-50 |
| text-opacity-* | Text opacity | Subtle | text-primary text-opacity-75 |
| link-* | Link colors | Custom links | <a class="link-success">Link</a> |
| border-* | Border color | Outlines | border-warning |
| border-opacity-* | Border opacity | Soft borders | border-primary border-opacity-25 |

### 5. Border & Shadow Utilities (10)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| border | Add border | All sides | border |
| border-0 | Remove border | Clean | border-0 |
| border-top|bottom|start|end | Side border | Specific | border-bottom |
| border-* | Border color | Theme | border-success |
| rounded | Rounded corners | Soft | rounded |
| rounded-* | Size 0-5, pill, circle | Shape | rounded-3, rounded-pill |
| shadow | Box shadow | Depth | shadow |
| shadow-sm|lg|none | Shadow size | Subtle/large | shadow-lg |
| border-dashed|dotted | Style | Visual | border-dashed |
| border-opacity-* | Transparency | Fade | border-opacity-50 |

### 6. Flexbox Utilities (10)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| d-flex | Display flex | Container | <div class="d-flex">...</div> |
| flex-row|column | Direction | Layout | flex-column |
| flex-wrap|nowrap|reverse | Wrapping | Multi-line | flex-wrap |
| justify-content-* | Main axis align | Spacing | justify-content-center |
| align-items-* | Cross axis align | Vertical | align-items-end |
| align-content-* | Multi-line align | Wrap | align-content-between |
| align-self-* | Individual align | Override | align-self-start |
| flex-fill | Equal width | Fill space | flex-fill |
| flex-grow|shrink-0|1 | Grow/shrink | Proportion | flex-grow-1 |
| order-* | Reorder 0-5, first, last | Layout | order-3 |

### 7. Display & Visibility (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| d-none | Hide element | Conditional | d-none |
| d-block|inline|flex|grid | Display type | Override | d-block |
| d-{breakpoint}-* | Responsive display | Mobile first | d-md-flex |
| visible | Visible | Accessibility | visible |
| invisible | Hidden but space | Overlay | invisible |
| visually-hidden | Screen reader only | Accessibility | <h1 class="visually-hidden">Title</h1> |
| position-static|relative|absolute|fixed|sticky | Positioning | Layout | position-fixed |
| top|bottom|start|end-0|50|100 | Position offset | Pin | top-0 start-0 |

### 8. Buttons & Button Groups (10)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| btn | Base button | Style | <button class="btn">Click</button> |
| btn-primary|secondary|success etc. | Theme color | Variants | btn-danger |
| btn-outline-* | Outline style | Subtle | btn-outline-info |
| btn-lg|sm | Size | Large/small | btn-lg |
| btn-block | Full width | Mobile | d-block w-100 |
| btn-group | Group buttons | Toolbar | <div class="btn-group">...</div> |
| btn-toolbar | Multiple groups | Complex | btn-toolbar |
| active | Active state | Toggle | class="btn active" |
| disabled | Disabled state | Inactive | disabled |
| btn-link | Link style button | Text-like | btn-link |

### 9. Forms & Input Groups (10)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| form-control | Styled input | Fields | <input class="form-control"> |
| form-select | Styled select | Dropdown | <select class="form-select"> |
| form-check | Checkbox/radio | Options | form-check-input |
| form-label | Label | Accessibility | <label class="form-label"> |
| input-group | Addon | Prepend/append | <div class="input-group"> |
| input-group-text | Addon text | Icon/label | <span class="input-group-text">@</span> |
| form-floating | Floating label | Modern | form-floating |
| is-valid|invalid | Validation state | Feedback | is-valid |
| valid|invalid-feedback | Message | Error/success | <div class="valid-feedback">OK</div> |
| disabled|readonly | State | Lock | readonly |

### 10. Navbar & Navigation (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| navbar | Navigation bar | Header | <nav class="navbar"> |
| navbar-expand-* | Responsive collapse | Breakpoint | navbar-expand-lg |
| navbar-brand | Logo/text | Branding | <a class="navbar-brand">Site</a> |
| nav-link | Nav item | Links | <a class="nav-link">Home</a> |
| navbar-toggler | Mobile toggle | Hamburger | <button class="navbar-toggler"> |
| collapse navbar-collapse | Collapsible content | Menu | <div class="collapse navbar-collapse"> |
| navbar-nav | Nav items container | List | <ul class="navbar-nav"> |
| dropdown | Dropdown menu | Submenu | class="dropdown" |

### 11. Cards (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| card | Card container | Content block | <div class="card"> |
| card-body | Padding content | Text | <div class="card-body"> |
| card-title | Title | Heading | <h5 class="card-title"> |
| card-text | Paragraph | Body | <p class="card-text"> |
| card-img-top|bottom | Image | Visual | <img class="card-img-top"> |
| card-header|footer | Header/footer | Meta | <div class="card-header"> |
| card-link | Card link | Action | <a class="card-link"> |
| list-group | List in card | Items | <ul class="list-group list-group-flush"> |

### 12. Alerts & Badges (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| alert | Alert box | Message | <div class="alert alert-info"> |
| alert-* | Color variant | Type | alert-success |
| alert-dismissible | Closable | User dismiss | alert-dismissible |
| alert-heading | Heading | Title | <h4 class="alert-heading"> |
| badge | Small count/status | Label | <span class="badge bg-primary">New</span> |
| badge-pill | Rounded badge | Style | rounded-pill |
| badge rounded-* | Shape | Pill/circle | rounded-pill |
| position-absolute | Position badge | Corner | top-0 start-100 translate-middle |

### 13. Modals & Offcanvas (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| modal | Modal dialog | Popup | <div class="modal"> |
| modal-dialog | Dialog wrapper | Size | modal-dialog-centered |
| modal-content | Content | Body | modal-content |
| modal-header|body|footer | Sections | Structure | modal-header |
| btn-close | Close button | Dismiss | btn-close |
| offcanvas | Side drawer | Sidebar | <div class="offcanvas"> |
| offcanvas-header|body | Parts | Content | offcanvas-body |
| show | Open state | JS trigger | class="modal show" |

### 14. Carousel & Accordion (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| carousel | Slideshow | Image slider | <div id="carousel" class="carousel slide"> |
| carousel-item | Slide | Content | <div class="carousel-item active"> |
| carousel-control-prev|next | Controls | Navigation | carousel-control-next |
| carousel-indicators | Dots | Indicators | <ol class="carousel-indicators"> |
| accordion | Collapsible | FAQ | <div class="accordion"> |
| accordion-item | Item | Section | accordion-item |
| accordion-header | Trigger | Button | <h2 class="accordion-header"> |
| accordion-body | Content | Text | accordion-body |

### 15. Tables & Lists (8)
| Class | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| table | Styled table | Data | <table class="table"> |
| table-striped|hover|bordered | Variants | Style | table-striped |
| table-responsive | Scroll | Mobile | table-responsive |
| table-sm | Compact | Dense | table-sm |
| list-group | List | Items | <ul class="list-group"> |
| list-group-item | Item | Row | list-group-item |
| list-group-item-action | Clickable | Interactive | list-group-item-action |
| active|disabled | State | Highlight | list-group-item active |

### 16. Utilities API & Customization (8)
| Concept | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Utility classes | Single purpose | Rapid | text-center bg-primary |
| Responsive utilities | Breakpoint prefixes | Mobile first | d-none d-md-block |
| State utilities | Hover, focus, active | Interactive | btn:hover |
| Sass variables | Customize theme | Branding | $primary: #007bff |
| Sass maps | Theme colors | Extend | $theme-colors |
| Enable utilities | Config | Include | $enable-shadows: true |
| Custom classes | Extend | Project | .my-custom-class |
| CSS variables | Runtime theme | Dark mode | --bs-body-bg |

### 17. Common Components Summary (10)
| Component | Key Classes | Common Usage | Examples |
| --- | --- | --- | --- |
| Navbar | navbar, navbar-expand-*, nav-link | Site navigation | Responsive header |
| Card | card, card-body, card-img-top | Content block | Product/feature |
| Button | btn, btn-primary | Actions | Primary CTA |
| Alert | alert, alert-success | Messages | Success/error |
| Badge | badge, bg-warning | Labels | Notifications |
| Progress | progress, progress-bar | Loading | Upload status |
| Spinner | spinner-border | Loading | AJAX |
| Toast | toast | Notifications | Message |
| Tooltip | data-bs-toggle="tooltip" | Hover info | Help text |
| Popover | data-bs-toggle="popover" | Rich hover | Details |

## Tips and Best Practices
* Use mobile-first responsive classes
* Prefer utility classes over custom CSS
* Use container for proper padding
* Leverage flex and grid utilities
* Use Sass for theme customization
* Keep HTML semantic with ARIA
* Use btn classes on <button> or <a>
* Use form-control for inputs
* Add alt text to images
* Use data-bs-* attributes for JS
* Test on multiple devices
* Use CDN for quick prototyping
* Minify CSS in production
* Use Bootstrap icons
* Avoid deep nesting
* Use spacer classes instead of margins
* Enable dark mode with data-bs-theme
* Validate accessibility
* Use Popper for positioning
* Document custom overrides

## Additional Resources
* [Official Bootstrap Documentation](https://getbootstrap.com/docs/5.3/)
* [Bootstrap Icons](https://icons.getbootstrap.com/)
* [Bootstrap Examples](https://getbootstrap.com/docs/5.3/examples/)
* [Bootstrap Themes](https://themes.getbootstrap.com/)
* [Bootswatch Free Themes](https://bootswatch.com/)
* [Bootstrap Expo](https://expo.getbootstrap.com/)
* [W3Schools Bootstrap Tutorial](https://www.w3schools.com/bootstrap5/)
* [MD Bootstrap](https://mdbootstrap.com/)

## Mini-Glossary

### 1. Common Terms
| Term | Description |
|------|-------------|
| Grid | 12-column responsive system |
| Container | Wrapper with padding |
| Utility | Single-purpose class |
| Breakpoint | Screen size threshold |
| Component | Pre-built UI element |
| Flexbox | Layout model |
| Sass | CSS preprocessor |
| CDN | Content Delivery Network |

### 2. Breakpoints
| Prefix | Screen Width |
|--------|--------------|
| (none) | ≥0px |
| sm | ≥576px |
| md | ≥768px |
| lg | ≥992px |
| xl | ≥1200px |
| xxl | ≥1400px |

### 3. Key Concepts
| Concept | Description |
|---------|-------------|
| Mobile-first | Design small screens first |
| Responsive | Adapts to screen size |
| Utility-first | Build with utilities |
| Component-based | Reusable UI blocks |
| Themeable | Customize colors/spacing |
| Accessibility | ARIA support |
| RTL | Right-to-left support |
| Dark mode | data-bs-theme="dark" |

### 4. Color System
| Color | Usage |
|-------|-------|
| primary | Main brand |
| secondary | Secondary |
| success | Positive |
| danger | Error |
| warning | Caution |
| info | Information |
| light | Background |
| dark | Text |

### 5. Best Practices
| Practice | Description |
|----------|-------------|
| Semantic HTML | Use proper tags |
| Mobile first | Small screens priority |
| Minimal custom CSS | Use utilities |
| Consistent spacing | Use spacing scale |
| Accessible colors | Contrast ratio |
| Performance | Load only needed |
| Cross-browser | Test major |
| Version control | Track changes |

### 6. Layout Options
| Option | Description |
|--------|-------------|
| Container | Fixed width |
| Container-fluid | Full width |
| Grid | 12 columns |
| Flex | Flexbox utilities |
| Float | Legacy layout |

### 7. JavaScript Components
| Component | Trigger |
|-----------|---------|
| Modal | data-bs-toggle="modal" |
| Dropdown | data-bs-toggle="dropdown" |
| Tooltip | data-bs-toggle="tooltip" |
| Popover | data-bs-toggle="popover" |
| Toast | data-bs-toggle="toast" |
| Carousel | data-bs-ride="carousel" |

### 8. Tool Ecosystem
| Tool | Purpose |
|------|---------|
| Bootstrap Studio | Visual editor |
| Pinegrow | Editor |
| Bootswatch | Free themes |
| Bootstrap Icons | Icon font |
| Sass | Customization |
| CDN | Quick include |
| npm | Package manager |
| Vite/React | Integration |

### 9. Common Patterns
| Pattern | Description |
|---------|-------------|
| Hero section | Full-width intro |
| Feature cards | Grid of cards |
| Pricing table | Comparison |
| Footer | Bottom nav |
| Navbar | Top navigation |
| Sidebar | Side menu |
| Modal login | Popup form |
| Carousel slider | Image rotation |

### 10. Troubleshooting
| Issue | Common Fix |
|-------|------------|
| Not responsive | Check viewport meta |
| Classes not working | Correct Bootstrap version |
| Overriding styles | Use !important or specificity |
| JS not working | Include Bootstrap bundle |
| Spacing wrong | Check gutter classes |
| Colors off | Check Sass variables |
| RTL issues | Enable RTL config |
| Dark mode | Use data-bs-theme |

