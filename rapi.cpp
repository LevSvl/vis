#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
#include"rapi.h"
extern Infocollector* headcollector;

DataFrame visargs() {
  StringVector a;
  NumericVector b;
  
  Infocollector* p = headcollector;
  while(p->next){
    a.push_back(p->node->fpath);
    b.push_back(p->node->sz);
  }
  DataFrame args = DataFrame::create(a,b);  
  return args;
}

/*** R
#args()

*/