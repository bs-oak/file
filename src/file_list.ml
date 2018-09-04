type t

external length : t -> int = "length" [@@bs.get]
external item: t -> int -> File.t Js.Nullable.t = "item" [@@bs.send]