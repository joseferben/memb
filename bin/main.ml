open Printf

let help = "Invalid argument, use -s <keyword> for searching."

let read_lines name : string list =
  let ic = open_in name in
  let try_read () =
    try Some (input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
    | Some s -> loop (s :: acc)
    | None -> close_in ic; List.rev acc in
  loop []

let search_lines lines search =
  List.filter
    (fun a -> BatString.exists a search)
    lines

let printable_lines lines =
  List.fold_left (fun acc s -> acc ^ s ^ "\n") "" lines

let add_line name line =
  let lines = (printable_lines (read_lines name) ^ line) in
  BatFile.write_lines name (BatEnum.ising lines)

let handleArgs args = match args with
    [| |] -> "empty"
  | [| _; truth |] -> add_line ".memb" truth; "Added truth: " ^ truth
  | [| _; "-s"; keyword |] -> printable_lines (search_lines (read_lines ".memb") keyword)
  | _ -> help

let () =
  printf "%s" (handleArgs Sys.argv)
