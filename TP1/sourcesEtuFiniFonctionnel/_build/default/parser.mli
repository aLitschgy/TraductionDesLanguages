
(* The type of tokens. *)

type token = 
  | STATIC
  | NOM of (string)
  | NETMASK
  | LOOPBACK
  | IP
  | INET
  | IFACE
  | GATEWAY
  | EOF
  | DHCP
  | AUTO
  | ADDRESS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val is: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (string list * string list)
