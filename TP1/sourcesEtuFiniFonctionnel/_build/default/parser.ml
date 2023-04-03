
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STATIC
    | NOM of (
# 10 "parser.mly"
       (string)
# 12 "parser.ml"
  )
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
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState18
  | MenhirState0

# 1 "parser.mly"
  
 type interface = Auto of string | Iface of string

# 47 "parser.ml"

let rec _menhir_goto_t : _menhir_env -> 'ttv_tail -> (
# 24 "parser.mly"
      (unit)
# 52 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv73 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 59 "parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_v : (
# 24 "parser.mly"
      (unit)
# 64 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv71 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 70 "parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_ : (
# 24 "parser.mly"
      (unit)
# 75 "parser.ml"
    )) = _v in
    ((let ((_menhir_stack, _menhir_s), (n : (
# 10 "parser.mly"
       (string)
# 80 "parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 23 "parser.mly"
      (interface)
# 85 "parser.ml"
    ) = 
# 49 "parser.mly"
                       (Iface n)
# 89 "parser.ml"
     in
    _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)) : 'freshtv74)

and _menhir_goto_is : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 28 "parser.mly"
       (string list * string list)
# 96 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 28 "parser.mly"
       (string list * string list)
# 107 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 28 "parser.mly"
       (string list * string list)
# 115 "parser.ml"
        )) : (
# 28 "parser.mly"
       (string list * string list)
# 119 "parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv64)) : 'freshtv66)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * (
# 23 "parser.mly"
      (interface)
# 127 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 28 "parser.mly"
       (string list * string list)
# 133 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * (
# 23 "parser.mly"
      (interface)
# 139 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((lis : (
# 28 "parser.mly"
       (string list * string list)
# 145 "parser.ml"
        )) : (
# 28 "parser.mly"
       (string list * string list)
# 149 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (n : (
# 23 "parser.mly"
      (interface)
# 154 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 28 "parser.mly"
       (string list * string list)
# 159 "parser.ml"
        ) = 
# 40 "parser.mly"
                 (match n with
    | Auto  na  -> (fst lis), na::(snd lis)
    | Iface ni -> ni::(fst lis), (snd lis)
)
# 166 "parser.ml"
         in
        _menhir_goto_is _menhir_env _menhir_stack _menhir_s _v) : 'freshtv68)) : 'freshtv70)

and _menhir_goto_i : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
      (interface)
# 173 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61 * _menhir_state * (
# 23 "parser.mly"
      (interface)
# 181 "parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AUTO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | EOF ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | IFACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv62)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state * (
# 23 "parser.mly"
      (interface)
# 205 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NOM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 10 "parser.mly"
       (string)
# 226 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv49 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 237 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DHCP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
                ((let _v : (
# 24 "parser.mly"
      (unit)
# 251 "parser.ml"
                ) = 
# 53 "parser.mly"
       (())
# 255 "parser.ml"
                 in
                _menhir_goto_t _menhir_env _menhir_stack _v) : 'freshtv12)) : 'freshtv14)
            | LOOPBACK ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
                ((let _v : (
# 24 "parser.mly"
      (unit)
# 267 "parser.ml"
                ) = 
# 52 "parser.mly"
           (())
# 271 "parser.ml"
                 in
                _menhir_goto_t _menhir_env _menhir_stack _v) : 'freshtv16)) : 'freshtv18)
            | STATIC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ADDRESS ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | IP ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv37)) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | NETMASK ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (('freshtv33))) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | IP ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((('freshtv29)))) = Obj.magic _menhir_stack in
                                ((let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | GATEWAY ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((('freshtv25))))) = Obj.magic _menhir_stack in
                                    ((let _menhir_env = _menhir_discard _menhir_env in
                                    let _tok = _menhir_env._menhir_token in
                                    match _tok with
                                    | IP ->
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((('freshtv21)))))) = Obj.magic _menhir_stack in
                                        ((let _menhir_env = _menhir_discard _menhir_env in
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((('freshtv19)))))) = Obj.magic _menhir_stack in
                                        ((let _v : (
# 24 "parser.mly"
      (unit)
# 319 "parser.ml"
                                        ) = 
# 54 "parser.mly"
                                          (())
# 323 "parser.ml"
                                         in
                                        _menhir_goto_t _menhir_env _menhir_stack _v) : 'freshtv20)) : 'freshtv22)
                                    | _ ->
                                        assert (not _menhir_env._menhir_error);
                                        _menhir_env._menhir_error <- true;
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((('freshtv23)))))) = Obj.magic _menhir_stack in
                                        (raise _eRR : 'freshtv24)) : 'freshtv26)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((('freshtv27))))) = Obj.magic _menhir_stack in
                                    (raise _eRR : 'freshtv28)) : 'freshtv30)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((('freshtv31)))) = Obj.magic _menhir_stack in
                                (raise _eRR : 'freshtv32)) : 'freshtv34)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (('freshtv35))) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv36)) : 'freshtv38)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv39)) = Obj.magic _menhir_stack in
                        (raise _eRR : 'freshtv40)) : 'freshtv42)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv44)) : 'freshtv46)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv47 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 369 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)) : 'freshtv50)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv51 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 380 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)) : 'freshtv54)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : (
# 28 "parser.mly"
       (string list * string list)
# 400 "parser.ml"
    ) = 
# 44 "parser.mly"
       ([],[])
# 404 "parser.ml"
     in
    _menhir_goto_is _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NOM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 10 "parser.mly"
       (string)
# 420 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3 * _menhir_state) = Obj.magic _menhir_stack in
        let ((n : (
# 10 "parser.mly"
       (string)
# 428 "parser.ml"
        )) : (
# 10 "parser.mly"
       (string)
# 432 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : (
# 23 "parser.mly"
      (interface)
# 438 "parser.ml"
        ) = 
# 48 "parser.mly"
               (Auto n)
# 442 "parser.ml"
         in
        _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)) : 'freshtv6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and is : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 28 "parser.mly"
       (string list * string list)
# 468 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AUTO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IFACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 55 "parser.mly"
  

# 496 "parser.ml"

# 269 "<standard.mly>"
  

# 501 "parser.ml"
