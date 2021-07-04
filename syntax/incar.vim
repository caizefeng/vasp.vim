if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "incar"

set commentstring=#\ %s

syn clear


" source
"http://cms.mpi.univie.ac.at/wiki/index.php/Category:INCAR
syn keyword incarKeyword
 \ AGGAC AGGAX ALDAC AMIN AMIX ANDERSEN_PROB ANTIRES APACO BMIX CH_LSPEC CH_NEDOS
 \ CH_SIGMA CLL CLN CLNT CLZ CMBJ CMBJA CMBJB DEPER DIMER_DIST DIPOL DQ EBREAK 
 \ EFIELD EFIELD_PEAD EINT ENAUG ENCUTFOCK ENCUTGW ENCUTGWSOFT ENINI
 \ EPSILON ESTOP EVENONLY EVENONLYGW FERDO FERWE FINDIFF HFRCUT HILLS_BIN HILLS_H
 \ HILLS_W HITOLER IBAND ICHIBARE ICORELEVEL IDIPOL IEPSILON IGPAR IMAGES IMIX
 \ INCREM INIMIX INIWAV IPEAD IVDW IWAVPR KBLOCK KGAMMA KPOINT_BSE KPUSE KSPACING
 \ LADDER LAMBDA LANGEVIN_GAMMA LANGEVIN_GAMMA_L LASPH LASYNC LATTICE_CONSTRAINTS
 \ LBERRY LBLUEOUT LBONE LCALCPOL LCHARG LCHIMAG LCORR LDAUPRINT LDIAG LDIPOL LEFG
 \ LELF LFOCKACE LFOCKAEDFT LHARTREE LHYPERFINE LKPROJ LLRAUG LMAXFOCK LMAXFOCKAE
 \ LMAXPAW LMAXTAU LMIXTAU LMONO LMP2LT LNABLA LNMR_SYM_RED LOCPROJ LORBMOM LPARD
 \ LSCAAWARE LSCALAPACK LSCALU LSCSGRAD LSELFENERGY LSEPB LSEPK LSMP2LT LSPECTRALGW
 \ LSPIRAL LSUBROT LTHOMAS LUSE_VDW LVDW_EWALD LVDW_ONECELL LVDWEXPANSION
 \ LWANNIER90_RUN LWRITE_MMN_AMN LWRITE_UNK LWRITE_WANPROJ LZEROZ M_CONSTR MAXMEM
 \ MAXMIX METAGGA MINROT MIXPRE ML_FF_AFILT2_MB ML_FF_CDOUB ML_FF_CSF ML_FF_CSIG
 \ ML_FF_CSLOPE ML_FF_CTIFOR ML_FF_EATOM ML_FF_IAFILT2_MB ML_FF_IBROAD1_MB
 \ ML_FF_IBROAD2_MB ML_FF_ICOUPLE_MB ML_FF_ICUT1_MB ML_FF_ICUT2_MB ML_FF_IERR
 \ ML_FF_IREG_MB ML_FF_ISAMPLE ML_FF_ISCALE_TOTEN_MB ML_FF_ISOAP1_MB ML_FF_ISOAP2_MB
 \ ML_FF_ISTART ML_FF_IWEIGHT ML_FF_LAFILT2_MB ML_FF_LBASIS_DISCARD ML_FF_LCONF_DISCARD
 \ ML_FF_LCOUPLE_MB ML_FF_LCRITERIA ML_FF_LEATOM_MB ML_FF_LHEAT_MB ML_FF_LMAX2_MB
 \ ML_FF_LMLFF ML_FF_LNORM1_MB ML_FF_LNORM2_MB ML_FF_MB_MB ML_FF_MCONF ML_FF_MCONF_NEW
 \ ML_FF_MHIS ML_FF_MRB1_MB ML_FF_MRB2_MB ML_FF_MSPL1_MB ML_FF_MSPL2_MB ML_FF_NATOM_COUPLED_MB
 \ ML_FF_NDIM_SCALAPACK ML_FF_NHYP1_MB ML_FF_NHYP2_MB ML_FF_NMDINT ML_FF_NR1_MB ML_FF_NR2_MB
 \ ML_FF_NWRITE ML_FF_RCOUPLE_MB ML_FF_RCUT1_MB ML_FF_RCUT2_MB ML_FF_SIGV0_MB ML_FF_SIGW0_MB
 \ ML_FF_SION1_MB ML_FF_SION2_MB ML_FF_W1_MB ML_FF_W2_MB ML_FF_WTIFOR ML_FF_WTOTEN
 \ ML_FF_WTSIF NBANDSGW NBLK NBLOCK NBMOD NBSEEIG NCORE NCORE_IN_IMAGE1 NCRPA_BANDS
 \ NDAV NELMDL NGYROMAG NKRED NKREDX NKREDY NKREDZ NLSPLINE NMAXFOCKAE NMAXFOCKAE
 \ LMAXFOCKAE NOMEGAPAR NOMEGAR NPACO NPPSTR NSIM NSTORB NSUBSYS NTARGET_STATES
 \ NTAUPAR NUPDOWN ODDONLY ODDONLYGW OFIELD_A OFIELD_KAPPA OFIELD_Q6_FAR OFIELD_Q6_NEAR
 \ OMEGAMAX OMEGAMIN OMEGATL PARAM1 PARAM2 PFLAT PHON_LBOSE PHON_LMC PHON_NSTRUCT
 \ PHON_NTLIST PHON_TLIST PLEVEL PMASS POMASS Profiling PROUTINE PSTRESS PSUBSYS
 \ PTHRESHOLD QMAXFOCKAE QSPIRAL QUAD_EFG RANDOM_SEED ROPT RWIGS SCALEE SCSRAD
 \ SHAKEMAXITER SHAKETOL SMEARINGS SPRING STEP_MAX STEP_SIZE SYMPREC SYSTEM TSUBSYS
 \ VALUE_MAX VALUE_MIN Vaspwiki_standards VCA VCAIMAGES VCUTOFF VDW_A1 VDW_A2 VDW_C6
 \ VDW_CNRADIUS VDW_D VDW_R0 VDW_RADIUS VDW_S6 VDW_S8 VDW_SR WC WEIMIN ZVAL
 \ LCLIMB ICHAIN IOPT 
 \ SCTYPE CONSTRL NSC SCDIFF INISC SCCUT NELMSCT NELMSCI IALGOSC IALGOSC_DIAG LDESC 
 \ LAMBDA_Q CONSTRL_Q NSC_Q SCDIFF_Q INISC_Q LDESC_Q skipwhite

syn keyword vaspGlobal
 \ SYSTEM ISTART ICHARG LREAL ISYM PREC LWAVE LCHARG LAECHG ADDGRID LVTOT LVHAR NELECT LPLANE NPAR NWRITE KPAR NGX NGY NGZ NGXF NGYF NGZF skipwhite

syn keyword vaspStatic
 \ ISMEAR SIGMA LORBIT NEDOS ENCUT ENMAX NELM NELMIN NELMDL EDIFF GGA NBANDS NEDOS VOSKOWN GGA_COMPAT EMIN EMAX skipwhite

syn keyword vaspAlgo ALGO TIME IALGO skipwhite

syn keyword vaspMagnetic
 \ ISPIN MAGMOM AMIX_MAG BMIX_MAG VOSKOWN LSORBIT SAXIS GGA_COMPAT LNONCOLLINEAR I_CONSTRAINED_M skipwhite

syn keyword vaspIon
 \ NSW IBRION ISIF EDIFFG POTIM SMASS TEBEG TEEND MDALGO NFREE skipwhite

syn keyword vaspCorrelation
 \ LMAXMIX LDAU LDAUTYPE LDAUL LDAUU LDAUJ LHFCALC AEXX HFSCREEN PRECFOCK HFLMAX LWANNIER90 NOMEGA NBANDSO NBANDSV skipwhite

syn keyword vaspOptic
 \ CSHIFT LOPTICS LEPSILON LRPA LPEAD LCALCEPS LSPECTRAL skipwhite

"""""""""""""""""""""""""
"  SYNTAX FOR COMMENTS  "
"""""""""""""""""""""""""
" the \v key means vim's very magic regex 
syn match incarComment "\m#.*$"
syn match incarComment "\m!.*$"
syn match incarComment "\m[#!].\{-}\(\\.*\n[^\\]*\)\+"
syn match incarComment "\m[A-Za-z]\+[^=]*[!#]\?.*$"

" match systems' name
syn match systemName "\(SYSTEM\s*=\s*\)\@<=.*$"

" the space before the left bracket is necessary to match it, but other
" delimiters do not need the space
syn region incarComment start=' (' end=')'

"""""""""""""""
"  OPERATORS  "
"""""""""""""""
"In the INCAR file to assing values '=' it is used
syn match incarOperator "\m="

"""""""""""""""
"  CONSTANTS  "
"""""""""""""""
" params of ALGO
syn keyword incarIdentifier
 \ Normal VeryFast Fast Conjugate All Damped Subrot Eigenval Exact 
 \ None Nothing CHI G0W0 GW0 GW scGW0 scGW G0W0R GW0R GWR scGW0R scGWR ACFDT
 \ RPA ACFDTR RPAR BSE TDHF
" params of PREC
syn keyword incarIdentifier
 \ Low Medium High Normal Single Accurate 
" param of LREAL
syn keyword incarIdentifier
 \ On Auto
syn match incarIdentifier '\m\.TRUE\.'
syn match incarIdentifier '\m\.FALSE\.'
syn match incarIdentifier '\m\.T\.'
syn match incarIdentifier '\m\.F\.'
syn match incarConstant '\m[-+]\?\d\+\(\.\d*\)\?[eE]\?-\?\d*\s\?'


" Define the highlighting
hi link incarKeyword Keyword
hi link vaspGlobal Define
hi link vaspAlgo Define
hi link vaspCorrelation Function
hi link vaspStatic Function
hi link vaspIon Repeat
hi link vaspMagnetic Repeat
hi link vaspOptic Repeat
hi link incarComment Comment
hi link incarCommentInline Comment
hi link incarOperator String
hi link incarConstant Constant
hi link incarIdentifier Identifier
hi link systemName Identifier
