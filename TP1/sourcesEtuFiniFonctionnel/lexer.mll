{   
(*type token = ID of string | AUTO  | IFACE | INET | NOM | LOOPBACK | DHCP | STATIC | ADDRESS | NETMASK | IP | GATEWAY | EOF (* A COMPLETER *)*)
open Parser

exception Error of string
}

(* Définitions de macro pour les expressions régulières *)
let blanc = [' ' '\t' '\n']
let nb255 = (['1'-'9']?['0'-'9'])|('1'['0'-'9']['0'-'9'])|('2'((['0'-'4']['0'-'9'])|('5'['0'-'5'])))
let ip = nb255 '.' nb255 '.' nb255 '.' nb255
let id = (['a'-'z'])+['0'-'9']*
(* Règles lexicales *)
rule interface = parse
|  blanc (* On ignore les blancs *)
    { interface lexbuf }
| "auto"
    { AUTO }
| "iface"
    { IFACE }
| "inet"
    { INET }
| "loopback"
    { LOOPBACK }
| "dhcp"
    { DHCP }
| "static"
    { STATIC }
| "address"
    { ADDRESS }
| "netmask"
    { NETMASK }
| "gateway" 
    { GATEWAY }
| ip
    { IP }
| id as n
    { NOM n}
| eof
    { EOF }
| _
{ raise (Error ("Unexpected char: "^(Lexing.lexeme lexbuf)^" at "^(string_of_int (Lexing.lexeme_start
lexbuf))^"-"^(string_of_int (Lexing.lexeme_end lexbuf)))) }
