type t

external last_modified : t -> int = "lastModified" [@@bs.get]
external name : t -> string = "name" [@@bs.get]
external size : t -> int = "size" [@@bs.get]
external type' : t -> string = "type" [@@bs.get]