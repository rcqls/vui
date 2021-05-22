import os
args := os.args.clone()
println("args: $args")
if !exists("thirdparty") {mkdir("thirdparty") ?}

chdir("thirdparty")
// println(os.execute("pwd").output)

orig := "ui_orig"

if !exists(orig) {
	execute("git clone -b devel12 https://github.com/rcqls/ui $orig")
}

if ("-clean" in args) && exists("ui") {
	rmdir_all("ui") ?
}

// cp_all("ui", "vui", true) ?
walk(orig, fn (f string) {
	orig := "ui_orig"
	if !f.starts_with("$orig/.git") {
		println("file:$f dir: ${dir(f)} base: ${base(f)} ")
		txt := read_file(f) or {panic(err.msg)}
		new_txt := txt.replace_each([
			"import gg", "import vgg as gg"
			"import sokol.", "import vsokol."
			"ui_mode: true", "ui_mode: true\n\t\timgui: true"
		])
		new_f := f.replace("$orig", "ui")
		println(new_f)
		mkdir_all(dir(new_f)) or {panic(err.msg)}
		write_file(new_f, new_txt) or {
			panic(err.msg)
		}
	}
	
})

