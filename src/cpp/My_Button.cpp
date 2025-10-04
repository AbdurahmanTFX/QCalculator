#include "My_Button.h"

bool My_Button::bVisible(){return visible;}

void My_Button::bSetVisible(bool newVisible){
    visible = newVisible;
    emit visible_Changed(visible);
}

void My_Button::visibility(){
    bSetVisible(!bVisible());
}
