import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
  // create datatype, the data which will be saved
  // add public to access the datatype in JS part
  public type Note = {
    title: Text;
    content: Text;
  };

  // variable: List. = type de données (List) qui doit contenir une liste de Note objects
  // avec valeur initiale à nil
  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text){

    let newNote: Note = {
      title= titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    // Debug.print(debug_show(notes));
  };

  public query func readNotes(): async [Note] {
    // List in Motoko = (opt record {"D"; opt record {"C"; opt record {"B"; opt record {"A"; null}}}})
    // --> convert it to an array to deal with it
    return List.toArray(notes);
  };

  public func removeNote(id: Nat) {
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id + 1);
    notes := List.append(listFront, listBack);
    // Debug.print(debug_show(notes));
  };
};
