/* Created by Language version: 7.7.0 */
/* NOT VECTORIZED */
#define NRN_VECTORIZED 0
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "scoplib_ansi.h"
#undef PI
#define nil 0
#include "md1redef.h"
#include "section.h"
#include "nrniv_mf.h"
#include "md2redef.h"
 
#if METHOD3
extern int _method3;
#endif

#if !NRNGPU
#undef exp
#define exp hoc_Exp
extern double hoc_Exp(double);
#endif
 
#define nrn_init _nrn_init__km_q10_2
#define _nrn_initial _nrn_initial__km_q10_2
#define nrn_cur _nrn_cur__km_q10_2
#define _nrn_current _nrn_current__km_q10_2
#define nrn_jacob _nrn_jacob__km_q10_2
#define nrn_state _nrn_state__km_q10_2
#define _net_receive _net_receive__km_q10_2 
#define rate rate__km_q10_2 
#define state state__km_q10_2 
 
#define _threadargscomma_ /**/
#define _threadargsprotocomma_ /**/
#define _threadargs_ /**/
#define _threadargsproto_ /**/
 	/*SUPPRESS 761*/
	/*SUPPRESS 762*/
	/*SUPPRESS 763*/
	/*SUPPRESS 765*/
	 extern double *getarg();
 static double *_p; static Datum *_ppvar;
 
#define t nrn_threads->_t
#define dt nrn_threads->_dt
#define gbar _p[0]
#define ik _p[1]
#define m _p[2]
#define ek _p[3]
#define Dm _p[4]
#define taua _p[5]
#define taub _p[6]
#define _g _p[7]
#define _ion_ek	*_ppvar[0]._pval
#define _ion_ik	*_ppvar[1]._pval
#define _ion_dikdv	*_ppvar[2]._pval
 
#if MAC
#if !defined(v)
#define v _mlhv
#endif
#if !defined(h)
#define h _mlhh
#endif
#endif
 
#if defined(__cplusplus)
extern "C" {
#endif
 static int hoc_nrnpointerindex =  -1;
 /* external NEURON variables */
 extern double celsius;
 /* declaration of user functions */
 static void _hoc_alpt(void);
 static void _hoc_bett(void);
 static void _hoc_rate(void);
 static int _mechtype;
extern void _nrn_cacheloop_reg(int, int);
extern void hoc_register_prop_size(int, int, int);
extern void hoc_register_limits(int, HocParmLimits*);
extern void hoc_register_units(int, HocParmUnits*);
extern void nrn_promote(Prop*, int, int);
extern Memb_func* memb_func;
 
#define NMODL_TEXT 1
#if NMODL_TEXT
static const char* nmodl_file_text;
static const char* nmodl_filename;
extern void hoc_reg_nmodl_text(int, const char*);
extern void hoc_reg_nmodl_filename(int, const char*);
#endif

 extern void _nrn_setdata_reg(int, void(*)(Prop*));
 static void _setdata(Prop* _prop) {
 _p = _prop->param; _ppvar = _prop->dparam;
 }
 static void _hoc_setdata() {
 Prop *_prop, *hoc_getdata_range(int);
 _prop = hoc_getdata_range(_mechtype);
   _setdata(_prop);
 hoc_retpushx(1.);
}
 /* connect user functions to hoc names */
 static VoidFunc hoc_intfunc[] = {
 "setdata_km_q10_2", _hoc_setdata,
 "alpt_km_q10_2", _hoc_alpt,
 "bett_km_q10_2", _hoc_bett,
 "rate_km_q10_2", _hoc_rate,
 0, 0
};
#define alpt alpt_km_q10_2
#define bett bett_km_q10_2
 extern double alpt( double );
 extern double bett( double );
 /* declare global and static user variables */
#define a0t a0t_km_q10_2
 double a0t = 0.009;
#define b0 b0_km_q10_2
 double b0 = 60;
#define gmt gmt_km_q10_2
 double gmt = 0.4;
#define inf inf_km_q10_2
 double inf = 0;
#define kl kl_km_q10_2
 double kl = -10;
#define q10 q10_km_q10_2
 double q10 = 2;
#define st st_km_q10_2
 double st = 1;
#define tau tau_km_q10_2
 double tau = 0;
#define vhalft vhalft_km_q10_2
 double vhalft = -35;
#define vhalfl vhalfl_km_q10_2
 double vhalfl = -35;
#define zetat zetat_km_q10_2
 double zetat = 7;
 /* some parameters have upper and lower limits */
 static HocParmLimits _hoc_parm_limits[] = {
 0,0,0
};
 static HocParmUnits _hoc_parm_units[] = {
 "vhalfl_km_q10_2", "mV",
 "vhalft_km_q10_2", "mV",
 "a0t_km_q10_2", "/ms",
 "zetat_km_q10_2", "1",
 "gmt_km_q10_2", "1",
 "gbar_km_q10_2", "mho/cm2",
 "ik_km_q10_2", "mA/cm2",
 0,0
};
 static double delta_t = 0.01;
 static double m0 = 0;
 static double v = 0;
 /* connect global user variables to hoc */
 static DoubScal hoc_scdoub[] = {
 "vhalfl_km_q10_2", &vhalfl_km_q10_2,
 "kl_km_q10_2", &kl_km_q10_2,
 "vhalft_km_q10_2", &vhalft_km_q10_2,
 "a0t_km_q10_2", &a0t_km_q10_2,
 "zetat_km_q10_2", &zetat_km_q10_2,
 "gmt_km_q10_2", &gmt_km_q10_2,
 "q10_km_q10_2", &q10_km_q10_2,
 "b0_km_q10_2", &b0_km_q10_2,
 "st_km_q10_2", &st_km_q10_2,
 "inf_km_q10_2", &inf_km_q10_2,
 "tau_km_q10_2", &tau_km_q10_2,
 0,0
};
 static DoubVec hoc_vdoub[] = {
 0,0,0
};
 static double _sav_indep;
 static void nrn_alloc(Prop*);
static void  nrn_init(_NrnThread*, _Memb_list*, int);
static void nrn_state(_NrnThread*, _Memb_list*, int);
 static void nrn_cur(_NrnThread*, _Memb_list*, int);
static void  nrn_jacob(_NrnThread*, _Memb_list*, int);
 
static int _ode_count(int);
static void _ode_map(int, double**, double**, double*, Datum*, double*, int);
static void _ode_spec(_NrnThread*, _Memb_list*, int);
static void _ode_matsol(_NrnThread*, _Memb_list*, int);
 
#define _cvode_ieq _ppvar[3]._i
 static void _ode_matsol_instance1(_threadargsproto_);
 /* connect range variables in _p that hoc is supposed to know about */
 static const char *_mechanism[] = {
 "7.7.0",
"km_q10_2",
 "gbar_km_q10_2",
 0,
 "ik_km_q10_2",
 0,
 "m_km_q10_2",
 0,
 0};
 static Symbol* _k_sym;
 
extern Prop* need_memb(Symbol*);

static void nrn_alloc(Prop* _prop) {
	Prop *prop_ion;
	double *_p; Datum *_ppvar;
 	_p = nrn_prop_data_alloc(_mechtype, 8, _prop);
 	/*initialize range parameters*/
 	gbar = 0.0001;
 	_prop->param = _p;
 	_prop->param_size = 8;
 	_ppvar = nrn_prop_datum_alloc(_mechtype, 4, _prop);
 	_prop->dparam = _ppvar;
 	/*connect ionic variables to this model*/
 prop_ion = need_memb(_k_sym);
 nrn_promote(prop_ion, 0, 1);
 	_ppvar[0]._pval = &prop_ion->param[0]; /* ek */
 	_ppvar[1]._pval = &prop_ion->param[3]; /* ik */
 	_ppvar[2]._pval = &prop_ion->param[4]; /* _ion_dikdv */
 
}
 static void _initlists();
  /* some states have an absolute tolerance */
 static Symbol** _atollist;
 static HocStateTolerance _hoc_state_tol[] = {
 0,0
};
 static void _update_ion_pointer(Datum*);
 extern Symbol* hoc_lookup(const char*);
extern void _nrn_thread_reg(int, int, void(*)(Datum*));
extern void _nrn_thread_table_reg(int, void(*)(double*, Datum*, Datum*, _NrnThread*, int));
extern void hoc_register_tolerance(int, HocStateTolerance*, Symbol***);
extern void _cvode_abstol( Symbol**, double*, int);

 void _km_q10_2_reg() {
	int _vectorized = 0;
  _initlists();
 	ion_reg("k", -10000.);
 	_k_sym = hoc_lookup("k_ion");
 	register_mech(_mechanism, nrn_alloc,nrn_cur, nrn_jacob, nrn_state, nrn_init, hoc_nrnpointerindex, 0);
 _mechtype = nrn_get_mechtype(_mechanism[1]);
     _nrn_setdata_reg(_mechtype, _setdata);
     _nrn_thread_reg(_mechtype, 2, _update_ion_pointer);
 #if NMODL_TEXT
  hoc_reg_nmodl_text(_mechtype, nmodl_file_text);
  hoc_reg_nmodl_filename(_mechtype, nmodl_filename);
#endif
  hoc_register_prop_size(_mechtype, 8, 4);
  hoc_register_dparam_semantics(_mechtype, 0, "k_ion");
  hoc_register_dparam_semantics(_mechtype, 1, "k_ion");
  hoc_register_dparam_semantics(_mechtype, 2, "k_ion");
  hoc_register_dparam_semantics(_mechtype, 3, "cvodeieq");
 	hoc_register_cvode(_mechtype, _ode_count, _ode_map, _ode_spec, _ode_matsol);
 	hoc_register_tolerance(_mechtype, _hoc_state_tol, &_atollist);
 	hoc_register_var(hoc_scdoub, hoc_vdoub, hoc_intfunc);
 	ivoc_help("help ?1 km_q10_2 /home/mohacsi/Desktop/optimizer/optimizer/new_test_files/Luca_modell_python3/x86_64/km_q10_2.mod\n");
 hoc_register_limits(_mechtype, _hoc_parm_limits);
 hoc_register_units(_mechtype, _hoc_parm_units);
 }
static int _reset;
static char *modelname = "CA1 KM channel from Mala Shah";

static int error;
static int _ninits = 0;
static int _match_recurse=1;
static void _modl_cleanup(){ _match_recurse=1;}
static int rate(double);
 
static int _ode_spec1(_threadargsproto_);
/*static int _ode_matsol1(_threadargsproto_);*/
 static int _slist1[1], _dlist1[1];
 static int state(_threadargsproto_);
 
double alpt (  double _lv ) {
   double _lalpt;
 _lalpt = exp ( 0.0378 * zetat * ( _lv - vhalft ) ) ;
   
return _lalpt;
 }
 
static void _hoc_alpt(void) {
  double _r;
   _r =  alpt (  *getarg(1) );
 hoc_retpushx(_r);
}
 
double bett (  double _lv ) {
   double _lbett;
 _lbett = exp ( 0.0378 * zetat * gmt * ( _lv - vhalft ) ) ;
   
return _lbett;
 }
 
static void _hoc_bett(void) {
  double _r;
   _r =  bett (  *getarg(1) );
 hoc_retpushx(_r);
}
 
/*CVODE*/
 static int _ode_spec1 () {_reset=0;
 {
   rate ( _threadargscomma_ v ) ;
   Dm = ( inf - m ) / tau ;
   }
 return _reset;
}
 static int _ode_matsol1 () {
 rate ( _threadargscomma_ v ) ;
 Dm = Dm  / (1. - dt*( ( ( ( - 1.0 ) ) ) / tau )) ;
  return 0;
}
 /*END CVODE*/
 static int state () {_reset=0;
 {
   rate ( _threadargscomma_ v ) ;
    m = m + (1. - exp(dt*(( ( ( - 1.0 ) ) ) / tau)))*(- ( ( ( inf ) ) / tau ) / ( ( ( ( - 1.0 ) ) ) / tau ) - m) ;
   }
  return 0;
}
 
static int  rate (  double _lv ) {
   double _la , _lqt ;
 _lqt = pow( q10 , ( ( celsius - 35.0 ) / 10.0 ) ) ;
   inf = ( 1.0 / ( 1.0 + exp ( ( _lv - vhalfl ) / kl ) ) ) ;
   _la = alpt ( _threadargscomma_ _lv ) ;
   tau = b0 + bett ( _threadargscomma_ _lv ) / ( a0t * ( 1.0 + _la ) ) ;
    return 0; }
 
static void _hoc_rate(void) {
  double _r;
   _r = 1.;
 rate (  *getarg(1) );
 hoc_retpushx(_r);
}
 
static int _ode_count(int _type){ return 1;}
 
static void _ode_spec(_NrnThread* _nt, _Memb_list* _ml, int _type) {
   Datum* _thread;
   Node* _nd; double _v; int _iml, _cntml;
  _cntml = _ml->_nodecount;
  _thread = _ml->_thread;
  for (_iml = 0; _iml < _cntml; ++_iml) {
    _p = _ml->_data[_iml]; _ppvar = _ml->_pdata[_iml];
    _nd = _ml->_nodelist[_iml];
    v = NODEV(_nd);
  ek = _ion_ek;
     _ode_spec1 ();
  }}
 
static void _ode_map(int _ieq, double** _pv, double** _pvdot, double* _pp, Datum* _ppd, double* _atol, int _type) { 
 	int _i; _p = _pp; _ppvar = _ppd;
	_cvode_ieq = _ieq;
	for (_i=0; _i < 1; ++_i) {
		_pv[_i] = _pp + _slist1[_i];  _pvdot[_i] = _pp + _dlist1[_i];
		_cvode_abstol(_atollist, _atol, _i);
	}
 }
 
static void _ode_matsol_instance1(_threadargsproto_) {
 _ode_matsol1 ();
 }
 
static void _ode_matsol(_NrnThread* _nt, _Memb_list* _ml, int _type) {
   Datum* _thread;
   Node* _nd; double _v; int _iml, _cntml;
  _cntml = _ml->_nodecount;
  _thread = _ml->_thread;
  for (_iml = 0; _iml < _cntml; ++_iml) {
    _p = _ml->_data[_iml]; _ppvar = _ml->_pdata[_iml];
    _nd = _ml->_nodelist[_iml];
    v = NODEV(_nd);
  ek = _ion_ek;
 _ode_matsol_instance1(_threadargs_);
 }}
 extern void nrn_update_ion_pointer(Symbol*, Datum*, int, int);
 static void _update_ion_pointer(Datum* _ppvar) {
   nrn_update_ion_pointer(_k_sym, _ppvar, 0, 0);
   nrn_update_ion_pointer(_k_sym, _ppvar, 1, 3);
   nrn_update_ion_pointer(_k_sym, _ppvar, 2, 4);
 }

static void initmodel() {
  int _i; double _save;_ninits++;
 _save = t;
 t = 0.0;
{
  m = m0;
 {
   rate ( _threadargscomma_ v ) ;
   m = inf ;
   }
  _sav_indep = t; t = _save;

}
}

static void nrn_init(_NrnThread* _nt, _Memb_list* _ml, int _type){
Node *_nd; double _v; int* _ni; int _iml, _cntml;
#if CACHEVEC
    _ni = _ml->_nodeindices;
#endif
_cntml = _ml->_nodecount;
for (_iml = 0; _iml < _cntml; ++_iml) {
 _p = _ml->_data[_iml]; _ppvar = _ml->_pdata[_iml];
#if CACHEVEC
  if (use_cachevec) {
    _v = VEC_V(_ni[_iml]);
  }else
#endif
  {
    _nd = _ml->_nodelist[_iml];
    _v = NODEV(_nd);
  }
 v = _v;
  ek = _ion_ek;
 initmodel();
 }}

static double _nrn_current(double _v){double _current=0.;v=_v;{ {
   ik = gbar * pow( m , st ) * ( v - ek ) ;
   }
 _current += ik;

} return _current;
}

static void nrn_cur(_NrnThread* _nt, _Memb_list* _ml, int _type){
Node *_nd; int* _ni; double _rhs, _v; int _iml, _cntml;
#if CACHEVEC
    _ni = _ml->_nodeindices;
#endif
_cntml = _ml->_nodecount;
for (_iml = 0; _iml < _cntml; ++_iml) {
 _p = _ml->_data[_iml]; _ppvar = _ml->_pdata[_iml];
#if CACHEVEC
  if (use_cachevec) {
    _v = VEC_V(_ni[_iml]);
  }else
#endif
  {
    _nd = _ml->_nodelist[_iml];
    _v = NODEV(_nd);
  }
  ek = _ion_ek;
 _g = _nrn_current(_v + .001);
 	{ double _dik;
  _dik = ik;
 _rhs = _nrn_current(_v);
  _ion_dikdv += (_dik - ik)/.001 ;
 	}
 _g = (_g - _rhs)/.001;
  _ion_ik += ik ;
#if CACHEVEC
  if (use_cachevec) {
	VEC_RHS(_ni[_iml]) -= _rhs;
  }else
#endif
  {
	NODERHS(_nd) -= _rhs;
  }
 
}}

static void nrn_jacob(_NrnThread* _nt, _Memb_list* _ml, int _type){
Node *_nd; int* _ni; int _iml, _cntml;
#if CACHEVEC
    _ni = _ml->_nodeindices;
#endif
_cntml = _ml->_nodecount;
for (_iml = 0; _iml < _cntml; ++_iml) {
 _p = _ml->_data[_iml];
#if CACHEVEC
  if (use_cachevec) {
	VEC_D(_ni[_iml]) += _g;
  }else
#endif
  {
     _nd = _ml->_nodelist[_iml];
	NODED(_nd) += _g;
  }
 
}}

static void nrn_state(_NrnThread* _nt, _Memb_list* _ml, int _type){
Node *_nd; double _v = 0.0; int* _ni; int _iml, _cntml;
#if CACHEVEC
    _ni = _ml->_nodeindices;
#endif
_cntml = _ml->_nodecount;
for (_iml = 0; _iml < _cntml; ++_iml) {
 _p = _ml->_data[_iml]; _ppvar = _ml->_pdata[_iml];
 _nd = _ml->_nodelist[_iml];
#if CACHEVEC
  if (use_cachevec) {
    _v = VEC_V(_ni[_iml]);
  }else
#endif
  {
    _nd = _ml->_nodelist[_iml];
    _v = NODEV(_nd);
  }
 v=_v;
{
  ek = _ion_ek;
 { error =  state();
 if(error){fprintf(stderr,"at line 53 in file km_q10_2.mod:\n	SOLVE state METHOD cnexp\n"); nrn_complain(_p); abort_run(error);}
 } }}

}

static void terminal(){}

static void _initlists() {
 int _i; static int _first = 1;
  if (!_first) return;
 _slist1[0] = &(m) - _p;  _dlist1[0] = &(Dm) - _p;
_first = 0;
}

#if NMODL_TEXT
static const char* nmodl_filename = "/home/mohacsi/Desktop/optimizer/optimizer/new_test_files/Luca_modell_python3/km_q10_2.mod";
static const char* nmodl_file_text = 
  "TITLE CA1 KM channel from Mala Shah\n"
  ": M. Migliore June 2006\n"
  "\n"
  "UNITS {\n"
  "	(mA) = (milliamp)\n"
  "	(mV) = (millivolt)\n"
  "\n"
  "}\n"
  "\n"
  "PARAMETER {\n"
  "	v 		(mV)\n"
  "	ek\n"
  "	celsius 	(degC)\n"
  "	gbar=.0001 	(mho/cm2)\n"
  "        vhalfl=-35   	(mV)\n"
  "	kl=-10\n"
  "        vhalft=-35   	(mV)\n"
  "        a0t=0.009      	(/ms)\n"
  "        zetat=7    	(1)\n"
  "        gmt=.4   	(1)\n"
  "	q10=2\n"
  "	b0=60\n"
  "	st=1\n"
  "}\n"
  "\n"
  "\n"
  "NEURON {\n"
  "	SUFFIX km_q10_2\n"
  "	USEION k READ ek WRITE ik\n"
  "        RANGE  gbar,ik\n"
  "      GLOBAL inf, tau\n"
  "}\n"
  "\n"
  "STATE {\n"
  "        m\n"
  "}\n"
  "\n"
  "ASSIGNED {\n"
  "	ik (mA/cm2)\n"
  "        inf\n"
  "	tau\n"
  "        taua\n"
  "	taub\n"
  "}\n"
  "\n"
  "INITIAL {\n"
  "	rate(v)\n"
  "	m=inf\n"
  "}\n"
  "\n"
  "\n"
  "BREAKPOINT {\n"
  "	SOLVE state METHOD cnexp\n"
  "	ik = gbar*m^st*(v-ek)\n"
  "}\n"
  "\n"
  "\n"
  "FUNCTION alpt(v(mV)) {\n"
  "  alpt = exp(0.0378*zetat*(v-vhalft)) \n"
  "}\n"
  "\n"
  "FUNCTION bett(v(mV)) {\n"
  "  bett = exp(0.0378*zetat*gmt*(v-vhalft)) \n"
  "}\n"
  "\n"
  "DERIVATIVE state {\n"
  "        rate(v)\n"
  ":        if (m<inf) {tau=taua} else {tau=taub}\n"
  "	m' = (inf - m)/tau\n"
  "}\n"
  "\n"
  "PROCEDURE rate(v (mV)) { :callable from hoc\n"
  "        LOCAL a,qt\n"
  "        qt=q10^((celsius-35)/10)\n"
  "        inf = (1/(1 + exp((v-vhalfl)/kl)))\n"
  "        a = alpt(v)\n"
  "        tau = b0 + bett(v)/(a0t*(1+a))\n"
  ":        taua = 50\n"
  ":        taub = 300\n"
  "}\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  "\n"
  ;
#endif
