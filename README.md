# ocaml-cordova-plugin-googleplus

Binding to [cordova-plugin-googleplus](https://github.com/EddyVerbruggen/cordova-plugin-googleplus)

## What does ocaml-cordova-plugin-googleplus do ?

This plugin allows you to use functions linked to `Googleplus` into your
ocaml projects.

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add cordova-plugin-googleplus https://github.com/Thibaut-Gudin/ocaml-cordova-plugin-googleplus
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the cordova plugin "cordova-pugin-googleplus" with:
```Shell
cordova plugin add cordova-plugin-googleplus
```


## How to use it?

You can have more details in the [official documentation](https://github.com/EddyVerbruggen/cordova-plugin-googleplus#7-usage)

### `Cordova_googleplus.Login.login`

The `Login` module contains all the types needed for using the `login`
function (that is the main interest of the module).
This function has several optional arguments that can be regrouped into
a `parameters` object.


The callback `onInit` takes an argument of type `Login.user`, you can use
other functions of this library in order to operate that value in
your ocaml application when your define the callback. For example, you
can use the `Cordova_googleplus.loginResponse` function to extract the
*loginResponse* value of the user: a value that contains serval
properties that may interest you like the user `id_token`.
