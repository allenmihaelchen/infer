(*
* Copyright (c) 2009 -2013 Monoidics ltd.
* Copyright (c) 2013 - Facebook.
* All rights reserved.
*)

(** Implementation of Abstraction Functions *)

(** Create abstraction rules from the definition of a type *)
val create_absrules_from_tdecl : Sil.tenv -> Sil.typename -> unit

(** Check whether the prop contains junk.
If it does, and [Config.allowleak] is true, remove the junk, otherwise raise a Leak exception. *)
val abstract_junk : ?original_prop:Prop.normal Prop.t -> Procname.t -> Sil.tenv -> Prop.normal Prop.t -> Prop.normal Prop.t

(** Remove redundant elements in an array, and check for junk afterwards *)
val remove_redundant_array_elements :
Procname.t -> Sil.tenv -> Prop.normal Prop.t -> Prop.normal Prop.t

(** Abstract a proposition. *)
val abstract : Procname.t -> Sil.tenv -> Prop.normal Prop.t -> Prop.normal Prop.t

(** Abstract a proposition but don't pay a SymOp *)
val abstract_no_symop : Procname.t -> Sil.tenv -> Prop.normal Prop.t -> Prop.normal Prop.t

(** Abstract each proposition in [propset] *)
val lifted_abstract : Procname.t -> Sil.tenv -> Propset.t -> Propset.t

val abs_rules_reset : unit -> unit

val get_cycle : Sil.hpred -> Prop.normal Prop.t -> ((Sil.strexp * Sil.typ) * Ident.fieldname * Sil.strexp) list
