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

let print_lines lines =
  List.fold_left (fun acc s -> acc ^ s ^ "\n") "" lines

let parseArgs args = match args with
    [| |] -> "empty" |
    [| _; truth |] -> "Adding truth: " ^ truth |
    [| _; "-s"; _ |] -> print_lines(read_lines ".memb") |
    _ -> help

let () =
  printf "%s\n" (parseArgs Sys.argv)
