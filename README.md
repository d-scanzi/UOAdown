
# UOAdown 

This project provides a template for the writing of theses and dissertations in
R markdown, and it automatically renders them formatted according to the 
[University of Auckland Guidelines](https://www.auckland.ac.nz/en/about-us/about-the-university/policy-hub/research-innovation/doctoral-study/undertaking-research/doctoral-thesis-policy-procedures.html). This project was 
inspired by the [thesisdown](https://github.com/ismayc/thesisdown) package.


Currently, the PDF and gitbook versions are fully-functional. The word
and epub versions are developmental, have no templates behind them, and
are essentially calls to the appropriate functions in bookdown. If you really 
need them, open an issue or submit your template to be incorporated.


If you are new to working with `bookdown`/`rmarkdown`, read over
the documentation available in the UOAdown PDF template (automatically knitted
from the provided resources. Please, read below) or the [bookdown](https://bookdown.org/yihui/bookdown/)
and the [Rmarkdown](https://bookdown.org/yihui/rmarkdown/) books. Lots of other
resources are available online. 


Under the hood, the University of Auckland LaTex template is used to ensure that
documents conform precisely to submission standards. At the same time,
composition and formatting can be done using lightweight
[markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax,
and **R** code and its output can be seamlessly included using
[rmarkdown](https://rmarkdown.rstudio.com).

***NOTE: the template was created by the author and it respects the general 
guidelines linked above. These guidelines are not strict and might vary across
departments. Thus, the [APA style 7th](https://apastyle.apa.org/) guidelines 
have been implemented where the University did not provided rules.***


### Using UOAdown for your thesis
The following part largely comes from [huskydown](https://github.com/benmarwick/huskydown)

Using {UOAdown} has some prerequisites which are described below. To compile PDF
versions of your thesis, you need Pandoc and LaTex installed on your machine. 
Other packages might require installation (look at the output on your console when
trying to use UOAdown). 

The easiest way to get LaTex is with the [tinytex](https://yihui.name/tinytex/) R package:

``` r
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
# after restarting RStudio, confirm that you have LaTeX with
tinytex:::is_tinytex()
```

You may need to install a few extra LaTeX packages on your first attempt
to knit as well. Here is one such example of how to do so:

``` r
tinytex::tlmgr_install("babel-portuges")
```

To use {UOAdown} from
[RStudio](https://www.rstudio.com/products/rstudio/download/):

1.  Ensure that you have already installed LaTeX and the fonts described
    above, and are using the latest version of
    [RStudio](https://www.rstudio.com/products/rstudio/download/). You
    can use `UOAdown` without RStudio. For example, you can write the
    Rmd files in your favorite text editor
    (e.g. [Atom](https://atom.io/),
    [Notepad++](https://notepad-plus-plus.org/)). But RStudio is
    probably the easiest tool for writing both R code and text in your
    thesis. It also provides a nice way to build your thesis while
    editing. We’ll proceed assuming that you have decided to use the
    RStudio workflow.

2.  Install the {bookdown} and {UOAdown} packages

    ``` r
    if (!require("remotes")) 
      install.packages("remotes", repos = "https://cran.rstudio.org")
    remotes::install_github("rstudio/bookdown")
    remotes::install_github("d-scanzi/UOAdown")
    ```

          Note that you may need to restart RStudio at this point for
the following dialog to show up.

3.  Get started with the {UOAdown} template. There are two options
    for doing so.

-   3a) **RECOMMENDED** Create a new RStudio project with a {UOAdown}
    template.

    In RStudio, click on **File** > **New Project** > **New Directory**.
    Then select **Thesis Project using thesisdown** from the dropdown
    that will look something like the image below. You’ll see the
    graduation cap as the icon on the left for the appropriate project
    type.

    ![](https://github.com/d-scanzi/UOAdown/blob/master/images/thesis_proj.png?raw=true)

    Next, give your project a name and specify where you’d like the
    files to appear. In the screenshot below, the project name is
    `my_thesis` and it will appear as a new folder on my Desktop.

    ![](https://github.com/d-scanzi/UOAdown/blob/master/images/thesis_proj_name.png?raw=true)

    If for some reason this does not work, you can use the **not recommended** 
    procedure described in the next step (3b). This procedure is not recommmended
    as it might have some limitation. Nonetheless, some testing did not show
    anything relevant.

-   3b) Use the **New R Markdown** dialog to select **Thesis**:

    ![](https://github.com/d-scanzi/UOAdown/blob/master/images/thesis_rmd.png?raw=true)

    Note that this will currently only **Knit** if you name the
    directory `index` as shown above. This guarantees that `index.html`
    is generated correctly for the Gitbook version of the thesis.

4.  After choosing which type of output you’d like in the YAML at the
    top of `index.Rmd`, **Knit** the `index.Rmd` file to get the book in
    PDF or HTML formats.

### Day-to-day writing of your thesis

You need to edit the individual chapter R Markdown files to write your
thesis. It’s recommended that you version control your thesis using
GitHub if possible. RStudio can also easily sync up with GitHub to make
the process easier. While writing, you should `git commit` your work
frequently, after every major activity on your thesis. For example,
every few paragraphs or section of text, and after major step of
analysis development. You should `git push` at the end of each work
session before you leave your computer or change tasks. For a gentle,
novice-friendly guide to getting starting with using Git with R and
RStudio, see <https://happygitwithr.com/>.

## Rendering

To render your thesis into a PDF, open `index.Rmd` in RStudio and then
click the “knit” button. To change the output formats between PDF,
gitbook and Word, look at the `output:` field in `index.Rmd` and
comment-out the formats you don’t want.

The PDF file of your thesis will be deposited in the `output_thesis` directory,
by default. This directory will be created during the first knit process.

## Components

The following components are ones you should edit to customize your
thesis:

### `_bookdown.yml`

This is the main configuration file for your thesis. You can change the
name of your outputted file here for your thesis and other options about
your thesis here.

### `index.Rmd`

This file contains all the meta information that goes at the beginning
of your document. You’ll need to edit the top portion of this file (the
YAML) to put your name on the first page, the title of your thesis, etc.
Note that you need to have at least one chapter start in the `index.Rmd`
file for the build to work. For the template, this is done with
`# Introduction` in the example from the template.

### `01-chap1.Rmd`, `02-chap2.Rmd`, etc.

These are the Rmd files for each chapter in your dissertation. Write
your thesis in these. If you’re writing in RStudio, you may find the
[wordcount addin](https://github.com/benmarwick/wordcountaddin) useful
for getting word counts and readability statistics in R Markdown
documents.

### `bib/`

Store your bibliography (as bibtex files) here. We recommend using the
[citr addin](https://github.com/crsh/citr) and
[Zotero](https://www.zotero.org/) to efficiently manage and insert
citations.

### `csl/`

Specific style files for bibliographies should be stored here. A good
source for citation styles is
<https://github.com/citation-style-language/styles#readme>.

### `figure/` and `data/`

Store your figures and data here and reference them in your R Markdown
files. See the [bookdown book](https://bookdown.org/yihui/bookdown/) for
details on cross-referencing items using R Markdown.

## Running Head
The running head is required by the APA style guidelines. It consists of a 
shorter version of your title that will be presented in the header of each page.
At the moment, the only way to change the running head is to do the following:

1. Open the `UOAthesis.cls` file in R
2. Go to line **117** or look for "provisional: running head. You should see 
the following lines: `\fancyhead[RE, RO]{ \MakeUppercase{Why ducks quack}}`
3. Replace the default running head with what you want. Note, do NOT use quotation marks!
Make sure the running head is short. 
