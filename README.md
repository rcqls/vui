## vui project

`vui` is nothing else than an autogenerated project from ui that depends on `vgg`(depending on `vsokol` which is `sokol` without any modification for `v`). The module `sokol` inside the `vlib` folder of `v` is a slightly modified version of the sokol project that required to be maintained. The `vsokol` module also provides the `imgui` feature already integrated in the `sokol` project (which is not the case for the `sokol` module).

### Autogeneration of `ui` in folder `thirdparty/ui`

This project would contain on a simple script:

1. `git clone [ui repo]`
1. run over all the files to replace `import gg` by `import vgg as gg`
1. run over all the files to replace `sokol.` with `vsokol.`
1. Specific task: integration of `vsokol.imgui`



