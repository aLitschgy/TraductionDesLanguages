%{
 type interface = Auto of string | Iface of string
%}


(* %token <string> ID (il était là de base mais en fait il sert à rien) *)
%token AUTO
%token IFACE
%token INET
%token <string> NOM
%token LOOPBACK
%token DHCP
%token STATIC
%token ADDRESS
%token NETMASK
%token IP
%token GATEWAY
%token EOF

(* Exercice 2 *)
(* Déclarations du type de l'attribut associé à un non terminal *)
(* Dans un premier temps on ignore cet attribut -> type unit *)
%type <interface> i
%type <unit> t

(* Indication de l'axiom et du type de l'attribut associé à l'axiom *)
(* Dans un premier temps on ignore cet attribut -> type unit *)
%start <string list * string list> is

%%

(*
IS -> I IS
IS -> $

I -> ...
*)

is :
| n = i lis = is {match n with
    | Auto  na  -> (fst lis), na::(snd lis)
    | Iface ni -> ni::(fst lis), (snd lis)
}        (*{ni::lis}  action sémantique associée à une règle de prodution -> dans un premier temps () *)
| EOF  {[],[]}


i : 
| AUTO n = NOM {Auto n} 
| IFACE n = NOM INET t {Iface n}

t : 
| LOOPBACK {()}
| DHCP {()}
| STATIC ADDRESS IP NETMASK IP GATEWAY IP {()}
%%
