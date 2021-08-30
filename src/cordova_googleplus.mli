[@@@js.stop]

val available : unit -> bool

[@@@js.start]

[@@@js.implem
let available () =
  Js_of_ocaml.Js.Optdef.test Js_of_ocaml.Js.Unsafe.global##.plugins##.googleplus]

module Login : sig
  type parameters

  type user

  type error = Ojs.t

  val parameters :
    ?web_client_id:string ->
    ?offline:bool ->
    ?scopes:string list ->
    unit ->
    parameters
    [@@js.builder] [@@js.verbatim_names]

  val login :
    ?param:parameters ->
    ?onInit:(user -> unit) ->
    ?onError:(error -> unit) ->
    unit ->
    unit
    [@@js.global "window.plugins.googleplus.login"]
end

type loginResponse

val loginResponse : Login.user -> loginResponse [@@js.call]

val id_token : loginResponse -> string [@@js.get]

val logout : ?onInit:(Ojs.t -> unit) -> ?onError:(Ojs.t -> unit) -> unit -> unit
  [@@js.global "window.plugins.googleplus.logout"]
