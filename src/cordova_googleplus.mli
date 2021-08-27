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

  type scopes

  val scopes :
    profile:string ->
    email:string ->
    ?others:(Ojs.t -> string) list ->
    unit ->
    scopes
    [@@js.builder] [@@verbatim_names]

  val user : ?id_token:string -> ?server_auth_code:string -> unit -> user
    [@@js.builder] [@@js.verbatim_names]

  val parameters :
    ?web_client_id:string ->
    ?offline:bool ->
    ?user:user ->
    ?scopes:scopes ->
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

val id_token : loginResponse -> string [@@js.get "id_token"]

val logout : ?onInit:(Ojs.t -> unit) -> ?onError:(Ojs.t -> unit) -> unit -> unit
  [@@js.global "window.plugins.googleplus.logout"]
