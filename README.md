# Ceramic Teaching Materials

This repository contains materials that I have created for ceramic courses that
I teach. All materials are open source and free to use and modify.

## Usage (Tex)

I primarily use LaTeX for typesetting my documents (the .tex files). I then use
rubber and texlive to compile those files to pdf documents. There is a nix flake
file included in this repository that sets up the required programs. Check
[this](https://determinate.systems/blog/nix-direnv/) out if you want to setup
the dependencies to build your own materials. After that you will need to:

```sh
rubber -d <tex-file: ie. rubric-template.tex>
rubber --clean <tex-file: ie. rubric-template.tex>
```

This will create a pdf file for the tex-file you specify.

# To Do

* Create some dev scripts to build and clean all tex files in this repo
* Create a package that is the generated pdf files to be referenced all at once
* Create a package that is a zip of the generated pdf files
