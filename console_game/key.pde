//assigning command
void keyTyped() {  //referance: CharactersStrings in Processing Example Library
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    if (caseState == 0) {
      if(key == 32)caseState = 1;
      charName = charName + key; 
    }
    if (caseState == 1) {
      command = command + key;
    }
  }
}


void keyReleased(){
  if(key == ENTER){
 reset();
  }
}