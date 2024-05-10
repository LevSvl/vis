//#include "visdefs.h" пока что не нужен
#include"infocollector.h"
#include"visimpl.h"

#include<fstream>

extern Infocollector* headcollector;

void VisImp::vis_init()
{
  std::cout << "VisImp" << std::endl;
  Infocollector* p = headcollector;

  std::ofstream argsstream; 
  argsstream.open(VISDATAINPUT);
  
  while(p->next){
    argsstream <<  p->node->fpath << ";" << p->node->sz;
    argsstream << std::endl;
    p = p->next; 
  }
  system(RUNCOMMAND);
}