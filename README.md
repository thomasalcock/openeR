# openeR

## Description
The `openeR` package was created for developers to comfortably document their R code.
Whether you're doing exploratory analyses, writing data prep sctipts or just plain experimenting around, 
your code might not be as functional as if you were writing a package. 
If it were, you'd just use the excellent `roxygen2` package.

However, you still want to standardize your documentation across scripts, right? 
Inserting the same opening documentation for your script can be a hassle (all of that copying and pasting, ugh!).

Enter **openeR**: This package allows you to easily set up standardized doc strings in your script, which (for now)
contain the following:

1. The project ID or name
2. A brief description / classification of the script
3. The contributors to the script
4. The date at which the documentation was set up
5. A more detailed summary of the scripts contents

How does it work? `openeR` is built on top of `shiny`and `miniUI`, which allows for small user interfaces to be displayed within the RStudio UI. Basically whenever the main function, `openeR_gadget()` of the package is called, a Shiny app is spun up and the output is then rendered in your script through functions found in the `rstudioapi ` package.

## Installation

```R
# install.packages("devtools")
devtools::install_github("thomasalcock/openeR")
```

## Recommended Use

The package's main function `openeR_gadget()` is best used with a short cut. The default short cut is set to Cmd+Shift+9 on a Mac. To change the cut to your Rstudio Environment go to 'Tools' > 'Modify Keyboard Short Cuts' and then search for 'Insert user defined doc skeleton'. Click on the field in the middle and choose a keyboad shortcut.

Happy documenting!

