(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Type
open Exceptions
open Ast
open Tds

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme

let getType iast = 
  match iast with 
  | InfoFun (_, Undefined, _) -> failwith "Erreur interne, le type de la fonction affectée n'est pas déclaré"
  | InfoFun (_, t, _) -> t
  | InfoVar (_, Undefined, _, _) -> failwith "Erreur interne, le type de la variable affecté n'est pas déclaré"
  | InfoVar (_, t, _, _) -> t
  | _ -> failwith "Erreur interne, erreur d'identifiant de la passe précédente"


let rec analyse_type_expression exp =
  match exp with 
  | AstTds.Ident iast -> (getType (info_ast_to_info iast), AstType.Ident iast)
  | AstTds.Booleen b -> (Bool, AstType.Booleen b)
  | AstTds.Entier  i -> (Int, AstType.Entier i)
  | AstTds.Unaire  (u, e) -> 
    begin
      let (te, ne) = analyse_type_expression e in
      if (te = Rat) then
        begin
        match u with 
        | Numerateur -> (Int, AstType.Unaire (Numerateur, ne))
        | Denominateur -> (Int, AstType.Unaire (Denominateur, ne))
        (*| _ -> raise (TypeInattendu (te, Rat))*)
        end
      else
        raise (TypeInattendu (te, Rat))
    end
  | AstTds.Binaire (b, e1, e2) ->
    begin
      let (te1, ne1) = analyse_type_expression e1 in
      let (te2, ne2) = analyse_type_expression e2 in
      match b, te1, te2 with
      |Fraction , Int , Int  -> (Rat, AstType.Binaire (Fraction, ne1, ne2))
      |Plus , Int , Int    -> (Int, AstType.Binaire (PlusInt, ne1, ne2))
      |Plus , Rat , Rat    -> (Rat, AstType.Binaire (PlusRat, ne1, ne2))
      |Mult , Int , Int    -> (Int, AstType.Binaire (MultInt, ne1, ne2))
      |Mult , Rat , Rat    -> (Rat, AstType.Binaire (MultRat, ne1, ne2))
      |Equ , Int , Int     -> (Bool, AstType.Binaire (EquInt, ne1, ne2))
      |Equ , Bool , Bool  -> (Bool, AstType.Binaire (EquBool, ne1, ne2))
      |Inf , Int , Int        -> (Bool, AstType.Binaire (Inf, ne1, ne2))
      | _                  -> raise (TypeBinaireInattendu (b, te1, te2))
    end
  | AstTds.AppelFonction (iast, lp) -> 
    begin
    let nlp = List.map analyse_type_expression lp in
    let liste_type_param = List.map fst nlp in
    match info_ast_to_info iast with
    | InfoFun (_, t, tp) -> 
      if (est_compatible_list liste_type_param tp) then
        (t, AstType.AppelFonction (iast, List.map snd nlp))
      else
        raise (TypesParametresInattendus(liste_type_param, tp))
    | _ -> failwith "Erreur interne" 
      end
  

let rec analyse_type_bloc tf li =
  List.map (analyse_type_instruction tf) li
  and analyse_type_instruction tf i = 
    match i with
    | AstTds.Declaration (t, iast, exp) -> 
      begin
        let (te, ne) = analyse_type_expression exp in
        if (t = te) then
          begin
          modifier_type_variable t iast;
          AstType.Declaration (iast, ne)
          end
        else
          raise (TypeInattendu (te, t))
      end
    | AstTds.Affectation (iast, exp) ->
      begin
        let t = getType (info_ast_to_info iast) in
        let (te, ne) = analyse_type_expression exp in
        if (t = te) then
          AstType.Affectation (iast, ne)
        else
          raise (TypeInattendu (te, t))
      end
    | AstTds.Affichage exp -> 
      begin
        let (te, ne) = analyse_type_expression exp in
        match te with 
        | Int  -> AffichageInt ne
        | Rat -> AffichageRat ne
        | Bool -> AffichageBool ne
        | _ -> failwith "Erreur Interne, affichage d'un type non reconnu"
      end
    | AstTds.Conditionnelle (c, bt, be) ->
      begin
        let (tc, nc) = analyse_type_expression c in 
        if (tc = Bool) then
          let nbt = analyse_type_bloc tf bt in
          let nbe = analyse_type_bloc tf be in
          AstType.Conditionnelle (nc, nbt, nbe)
        else
          raise (TypeInattendu (tc, Bool))
      end
    | AstTds.TantQue (c, b) ->
      begin
        let (tc, nc) = analyse_type_expression c in 
        if (tc = Bool) then
          let nb = analyse_type_bloc tf b in
          AstType.TantQue (nc, nb)
        else
          raise (TypeInattendu (tc, Bool))
      end
    | AstTds.Retour (exp, iast) ->
      begin
        let (te, ne) = analyse_type_expression exp in
        match tf with 
        | None -> raise RetourDansMain
        | Some t ->
          if (t = te) then
            AstType.Retour (ne, iast)
          else raise (TypeInattendu (te, t))
      end
    | AstTds.Empty -> AstType.Empty


let analyse_type_fonction (AstTds.Fonction(t, iast, lp, b)) = 
  let nb = analyse_type_bloc (Some t) b in
  let nlp = List.map snd lp in
  let _ = modifier_type_fonction t (List.map fst lp) iast in
  AstType.Fonction (iast, nlp, nb)
  

let analyser (AstTds.Programme (lf, b)) = 
  let nlf = List.map analyse_type_fonction lf in
  let nb = analyse_type_bloc None b in
  AstType.Programme (nlf, nb)


