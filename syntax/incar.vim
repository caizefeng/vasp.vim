if exists('b:current_syntax')
  finish
endif

" For comment plugins
setlocal commentstring=#\ %s

" INCAR syntax (VASP + DeltaSpin extensions)

syntax clear
syn case ignore

" -----------------------------
" Comments / operators
" -----------------------------
syntax match incarComment /#.*/ contains=@Spell
syntax match incarComment /!.*/ contains=@Spell
syntax match incarComment "\m[#!].\{-}\(\\.*\n[^\\]*\)\+"

" Broad catch-all: all unrelated strings as comments
syntax match incarComment "\m[A-Za-z]\+[^=]*[!#]\?.*$"  

syntax match incarOperator /=/

" -----------------------------
" Tag names
" -----------------------------
let s:deltaspin_tags = [
      \ 'BFIELD','SCTYPE','CONSTRL','NSC','NSCMIN','SCDIFF','INISC','SCCUT','NELMSCT','NELMSCI',
      \ 'IALGOSC','IALGOSC_DIAG','LCUTSC_TRIAL','LDESC','IDECOSC','SCDECAY','SCDIFFB',
      \ 'SCCONVB','SCCONVB_GRAD','IDECAY_GRAD','SCDECAY_GRAD','SCGRADB','NGRAD',
      \ 'NGRAD_STEP','NGRAD_VALUE','LAMBDA_Q','CONSTRL_Q','NSC_Q','SCDIFF_Q','INISC_Q',
      \ 'LDESC_Q','EDIFF_Q'
      \ ]

" Curated official VASP tags (expanded from the VASP wiki category pages).
let s:vasp_tags = [
      \ 'ADDGRID', 'AEXX', 'AGGAC', 'AGGAX', 'ALDAC', 'ALDAX', 'ALGO', 'ALPHA_VDW', 'AMGGAC', 'AMGGAX',
      \ 'AMIN', 'AMIX', 'AMIX_MAG', 'ANDERSEN_PROB', 'ANTIRES', 'APACO', 'BANDGAP', 'BEXT', 'BEXX',
      \ 'BMIX', 'BMIX_MAG', 'BPARAM', 'BSEELECTRON', 'BSEHOLE', 'BSEPREC', 'CH_AMPLIFICATION',
      \ 'CH_LSPEC', 'CH_NEDOS', 'CH_SIGMA', 'CLL', 'CLN', 'CLNT', 'CLZ', 'CMBJ', 'CMBJA', 'CMBJB',
      \ 'CMBJE', 'CPARAM', 'CSHIFT', 'DEPER', 'DIMER_DIST', 'DIPOL', 'DQ', 'EBREAK', 'EDIFF', 'EDIFFG',
      \ 'EFERMI', 'EFERMI_NEDOS', 'EFIELD', 'EFIELD_PEAD', 'EFOR', 'EINT', 'ENAUG', 'ENCUT', 'ENCUTFOCK',
      \ 'ENCUTGW', 'ENCUTGWSOFT', 'ENCUTLR', 'ENINI', 'EPSILON', 'ESTOP', 'EVENONLY', 'EVENONLYGW',
      \ 'FERDO', 'FERWE', 'FINDIFF', 'FOCKCORR', 'GAMMA_VDW', 'GGA', 'GGA_COMPAT', 'HFALPHA', 'HFLMAX',
      \ 'HFRCUT', 'HFSCREEN', 'HILLS_BIN', 'HILLS_H', 'HILLS_W', 'HITOLER', 'IALGO', 'IBAND', 'IBRION',
      \ 'IBSE', 'ICHARG', 'ICHIBARE', 'ICORELEVEL', 'IDIPOL', 'IEPSILON', 'IFC_ASR', 'IFC_LR', 'IGPAR',
      \ 'IMAGES', 'IMIX', 'INCREM', 'INIMIX', 'INIWAV', 'INMRPRINT', 'IPEAD', 'ISIF', 'ISMEAR', 'ISPIN',
      \ 'ISTART', 'ISYM', 'IVDW', 'IVDW_NL', 'IWAVPR', 'I_CONSTRAINED_M', 'KBLOCK', 'KGAMMA', 'KPAR',
      \ 'KPOINTS_OPT_MODE', 'KPOINTS_OPT_NKBATCH', 'KPOINT_BSE', 'KPUSE', 'KSPACING', 'LADDER', 'LAECHG',
      \ 'LAMBDA', 'LANCZOSTHR', 'LASPH', 'LASYNC', 'LATTICE_CONSTRAINTS', 'LBERRY', 'LBLUEOUT', 'LBONE',
      \ 'LCALCEPS', 'LCALCPOL', 'LCHARG', 'LCHARGH5', 'LCHIMAG', 'LCORR', 'LDAU', 'LDAUJ', 'LDAUL',
      \ 'LDAUPRINT', 'LDAUTYPE', 'LDAUU', 'LDIAG', 'LDIPOL', 'LDISENTANGLED', 'LDMATRIX', 'LDOWNSAMPLE',
      \ 'LEFG', 'LELF', 'LEPSILON', 'LFINITE_TEMPERATURE', 'LFOCKACE', 'LFOCKAEDFT', 'LFOCKSTD', 'LFXC',
      \ 'LH5', 'LHARTREE', 'LHFCALC', 'LHYPERFINE', 'LIBMBD_ALPHA', 'LIBMBD_C6AU', 'LIBMBD_K_GRID',
      \ 'LIBMBD_K_GRID_SHIFT', 'LIBMBD_MBD_A', 'LIBMBD_MBD_BETA', 'LIBMBD_METHOD', 'LIBMBD_N_OMEGA_GRID',
      \ 'LIBMBD_PARALLEL_MODE', 'LIBMBD_R0AU', 'LIBMBD_TS_D', 'LIBMBD_TS_SR', 'LIBMBD_VDW_PARAMS_KIND',
      \ 'LIBMBD_XC', 'LIBXC1', 'LIBXC1_PN', 'LIBXC2', 'LIBXC2_PN', 'LKPOINTS_OPT', 'LKPOINTS_WAN',
      \ 'LKPROJ', 'LLRAUG', 'LMAXFOCK', 'LMAXFOCKAE', 'LMAXMIX', 'LMAXPAW', 'LMAXTAU', 'LMIXTAU',
      \ 'LMODELHF', 'LMONO', 'LMP2LT', 'LNABLA', 'LNICSALL', 'LNMRLEG', 'LNMR_SYM_RED', 'LNOAUGXC',
      \ 'LNONCOLLINEAR', 'LOCPROJ', 'LOPTICS', 'LORBIT', 'LORBMOM', 'LPARD', 'LPARDH5', 'LPEAD',
      \ 'LPHON_DISPERSION', 'LPHON_POLAR', 'LPHON_READ_FORCE_CONSTANTS', 'LPLANE', 'LPOSNICS', 'LREAL',
      \ 'LRHFCALC', 'LRPA', 'LRPAFORCE', 'LSCAAWARE', 'LSCALAPACK', 'LSCALER0', 'LSCALU', 'LSCDM',
      \ 'LSCK', 'LSCRPA', 'LSCSGRAD', 'LSELFENERGY', 'LSEPB', 'LSEPK', 'LSFBXC', 'LSINGLES', 'LSMP2LT',
      \ 'LSORBIT', 'LSOSHIFT', 'LSPECTRAL', 'LSPECTRALGW', 'LSPIN_VDW', 'LSPIRAL', 'LSUBROT',
      \ 'LTBOUNDLIBXC', 'LTEMPER', 'LTHOMAS', 'LTRIPLET', 'LTSSURF', 'LUSENCCL', 'LUSE_VDW', 'LVACPOTAV',
      \ 'LVDWEXPANSION', 'LVDWSCS', 'LVDW_EWALD', 'LVDW_ONECELL', 'LVGVAPPL', 'LVGVCALC', 'LVHAR',
      \ 'LVTOT', 'LWANNIER90', 'LWANNIER90_RUN', 'LWAVE', 'LWAVEH5', 'LWEIGHTED', 'LWRITE_MMN_AMN',
      \ 'LWRITE_SPN', 'LWRITE_UNK', 'LWRITE_WANPROJ', 'LZEROZ', 'LZORA', 'MAGMOM', 'MAXMEM', 'MAXMIX',
      \ 'MDALGO', 'METAGGA', 'MINROT', 'MIXPRE', 'ML_AFILT2', 'ML_CALGO', 'ML_CDOUB', 'ML_CSIG',
      \ 'ML_CSLOPE', 'ML_CTIFOR', 'ML_CX', 'ML_DESC_TYPE', 'ML_EATOM_REF', 'ML_EPS_LOW', 'ML_EPS_REG',
      \ 'ML_ESTBLOCK', 'ML_FF_AFILT2_MB', 'ML_FF_CDOUB', 'ML_FF_CSF', 'ML_FF_CSIG', 'ML_FF_CSLOPE',
      \ 'ML_FF_CTIFOR', 'ML_FF_EATOM', 'ML_FF_IAFILT2_MB', 'ML_FF_IBROAD1_MB', 'ML_FF_IBROAD2_MB',
      \ 'ML_FF_ICOUPLE_MB', 'ML_FF_ICUT1_MB', 'ML_FF_ICUT2_MB', 'ML_FF_IERR', 'ML_FF_IREG_MB',
      \ 'ML_FF_ISAMPLE', 'ML_FF_ISCALE_TOTEN_MB', 'ML_FF_ISOAP1_MB', 'ML_FF_ISOAP2_MB', 'ML_FF_ISTART',
      \ 'ML_FF_IWEIGHT', 'ML_FF_LAFILT2_MB', 'ML_FF_LBASIS_DISCARD', 'ML_FF_LCONF_DISCARD',
      \ 'ML_FF_LCOUPLE_MB', 'ML_FF_LCRITERIA', 'ML_FF_LEATOM_MB', 'ML_FF_LHEAT_MB', 'ML_FF_LMAX2_MB',
      \ 'ML_FF_LMLFF', 'ML_FF_LNORM1_MB', 'ML_FF_LNORM2_MB', 'ML_FF_MB_MB', 'ML_FF_MCONF',
      \ 'ML_FF_MCONF_NEW', 'ML_FF_MHIS', 'ML_FF_MRB1_MB', 'ML_FF_MRB2_MB', 'ML_FF_MSPL1_MB',
      \ 'ML_FF_MSPL2_MB', 'ML_FF_NATOM_COUPLED_MB', 'ML_FF_NDIM_SCALAPACK', 'ML_FF_NHYP1_MB',
      \ 'ML_FF_NHYP2_MB', 'ML_FF_NMDINT', 'ML_FF_NR1_MB', 'ML_FF_NR2_MB', 'ML_FF_NWRITE',
      \ 'ML_FF_RCOUPLE_MB', 'ML_FF_RCUT1_MB', 'ML_FF_RCUT2_MB', 'ML_FF_SIGV0_MB', 'ML_FF_SIGW0_MB',
      \ 'ML_FF_SION1_MB', 'ML_FF_SION2_MB', 'ML_FF_W1_MB', 'ML_FF_W2_MB', 'ML_FF_WTIFOR', 'ML_FF_WTOTEN',
      \ 'ML_FF_WTSIF', 'ML_IAFILT2', 'ML_IALGO_LINREG', 'ML_ICOUPLE', 'ML_ICRITERIA', 'ML_IREG',
      \ 'ML_ISCALE_TOTEN', 'ML_ISTART', 'ML_IWEIGHT', 'ML_LAFILT2', 'ML_LBASIS_DISCARD', 'ML_LCOUPLE',
      \ 'ML_LEATOM', 'ML_LERR', 'ML_LFAST', 'ML_LHEAT', 'ML_LIB', 'ML_LMAX2', 'ML_LMLFF', 'ML_LSPARSDES',
      \ 'ML_LUSE_NAMES', 'ML_MB', 'ML_MB_MIN', 'ML_MCONF', 'ML_MCONF_NEW', 'ML_MHIS', 'ML_MODE',
      \ 'ML_MRB1', 'ML_MRB2', 'ML_NATOM_COUPLED', 'ML_NCSHMEM', 'ML_NHYP', 'ML_NMDINT',
      \ 'ML_NRANK_SPARSDES', 'ML_OUTBLOCK', 'ML_OUTPUT_MODE', 'ML_RCOUPLE', 'ML_RCUT1', 'ML_RCUT2',
      \ 'ML_RDES_SPARSDES', 'ML_SCLC_CTIFOR', 'ML_SIGV0', 'ML_SIGW0', 'ML_SION1', 'ML_SION2', 'ML_W1',
      \ 'ML_WTIFOR', 'ML_WTOTEN', 'ML_WTSIF', 'M_CONSTR', 'NATURALO', 'NBANDS', 'NBANDSEXACT',
      \ 'NBANDSGW', 'NBANDSO', 'NBANDSV', 'NBANDS_WAVE', 'NBLK', 'NBLOCK', 'NBMOD', 'NBSEBLOCKO',
      \ 'NBSEBLOCKV', 'NBSEEIG', 'NCORE', 'NCORE_IN_IMAGE1', 'NCRPA_BANDS', 'NEDOS', 'NELECT', 'NELM',
      \ 'NELMDL', 'NELMGW', 'NELMIN', 'NFREE', 'NGX', 'NGXF', 'NGY', 'NGYF', 'NGYROMAG', 'NGZ', 'NGZF',
      \ 'NHC_NCHAINS', 'NHC_NRESPA', 'NHC_NS', 'NICS', 'NKRED', 'NKREDX', 'NKREDY', 'NKREDZ', 'NLSPLINE',
      \ 'NMAXFOCKAE', 'NOMEGA', 'NOMEGAPAR', 'NOMEGAR', 'NOMEGA_DUMP', 'NPACO', 'NPAR', 'NPPSTR', 'NRMM',
      \ 'NSIM', 'NSTORB', 'NSUBSYS', 'NSW', 'NTARGET_STATES', 'NTAUPAR', 'NTEMPER', 'NUCIND', 'NUM_WANN',
      \ 'NUPDOWN', 'NWRITE', 'ODDONLY', 'ODDONLYGW', 'OFIELD_A', 'OFIELD_KAPPA', 'OFIELD_Q6_FAR',
      \ 'OFIELD_Q6_NEAR', 'OMEGAMAX', 'OMEGAMIN', 'OMEGATL', 'PARAM1', 'PARAM2', 'PFLAT',
      \ 'PHON_BORN_CHARGES', 'PHON_DIELECTRIC', 'PHON_DOS', 'PHON_G_CUTOFF', 'PHON_LBOSE', 'PHON_LMC',
      \ 'PHON_NEDOS', 'PHON_NSTRUCT', 'PHON_NWRITE', 'PHON_SIGMA', 'PHON_TLIST', 'PLEVEL', 'PMASS',
      \ 'POMASS', 'POSNICS', 'POTIM', 'PREC', 'PRECFOCK', 'Profiling', 'PROUTINE', 'PSTRESS', 'PSUBSYS',
      \ 'PTHRESHOLD', 'QMAXFOCKAE', 'QSPIRAL', 'QUAD_EFG', 'RANDOM_GENERATOR', 'RANDOM_SEED', 'ROPT',
      \ 'RSMBJ', 'RWIGS', 'SAXIS', 'SCALEE', 'SCISSOR', 'SCSRAD', 'SHAKEMAXITER', 'SHAKETOL',
      \ 'SHAKETOLSOFT', 'SIGMA', 'SMASS', 'SMBJ', 'SMEARINGS', 'SPRING', 'SPRING_K', 'SPRING_R0',
      \ 'SPRING_V0', 'STEP_MAX', 'STEP_SIZE', 'STOP_ON', 'SYMPREC', 'SYSTEM', 'TEBEG', 'TEEND',
      \ 'TILAMBDA', 'TIME', 'TRANSPORT_NEDOS', 'TRANSPORT_RELAXATION_TIME', 'TSUBSYS', 'VACPOTFLAT',
      \ 'VALUE_MAX', 'VALUE_MIN', 'Vaspwiki_standards', 'VCA', 'VCAIMAGES', 'VCUTOFF', 'VDW_A1',
      \ 'VDW_A2', 'VDW_ALPHA', 'VDW_C6', 'VDW_C6AU', 'VDW_CNRADIUS', 'VDW_D', 'VDW_R0', 'VDW_R0AU',
      \ 'VDW_RADIUS', 'VDW_S6', 'VDW_S8', 'VDW_SR', 'VELOCITY', 'VOSKOWN', 'WANNIER90_WIN', 'WC',
      \ 'WEIMIN', 'WRT_NMRCUR', 'WRT_POTENTIAL', 'XC', 'XCM_PN', 'XC_C', 'ZAB_VDW', 'ZVAL',
      \ ]

"
" Category overlays
" These are a curated classification layer on top of the generic/known tag matchers.
let s:cat_global = [
      \ 'ADDGRID', 'ICHARG', 'ISTART', 'ISYM', 'KGAMMA', 'KPAR', 'KPOINTS_OPT_MODE',
      \ 'KPOINTS_OPT_NKBATCH', 'KPUSE', 'KSPACING', 'LAECHG', 'LCHARG', 'LCHARGH5', 'LELF', 'LH5',
      \ 'LPARD', 'LPARDH5', 'LPLANE', 'LREAL', 'LSYNCH5', 'LVACPOTAV', 'LVHAR', 'LVTOT', 'LWAVE',
      \ 'LWAVEH5', 'NCORE', 'NCORE_IN_IMAGE1', 'NELECT', 'NGX', 'NGXF', 'NGY', 'NGYF', 'NGZ', 'NGZF',
      \ 'NKRED', 'NKREDX', 'NKREDY', 'NKREDZ', 'NPAR', 'NWRITE', 'PREC', 'SYSTEM', 'VACPOTFLAT',
      \ ]

let s:cat_static = [
      \ 'EDIFF', 'EMAX', 'EMIN', 'ENAUG', 'ENCUT', 'ENCUTLR', 'GGA', 'GGA_COMPAT', 'ISMEAR', 'LASPH',
      \ 'LORBIT', 'METAGGA', 'NATURALO', 'NBANDS', 'NEDOS', 'NELM', 'NELMDL', 'NELMIN', 'ROPT', 'RSMBJ',
      \ 'RWIGS', 'SCISSOR', 'SIGMA', 'SMBJ', 'VOSKOWN',
      \ ]

let s:cat_algo = [
      \ 'ALGO', 'AMIN', 'AMIX', 'AMIX_MAG', 'BMIX', 'BMIX_MAG', 'IALGO', 'IMIX', 'INCREM', 'INIMIX',
      \ 'KBLOCK', 'LSCALAPACK', 'LSCALU', 'LSCSGRAD', 'LSUBROT', 'MIXPRE', 'NBLOCK', 'NELMGW', 'NOMEGA',
      \ 'NOMEGAPAR', 'NOMEGAR', 'NRMM', 'NSIM', 'NTAUPAR', 'STOP_ON', 'TIME',
      \ ]

let s:cat_magnetic = [
      \ 'AMIX_MAG', 'BEXT', 'BMIX_MAG', 'GGA_COMPAT', 'ISPIN', 'I_CONSTRAINED_M', 'LNONCOLLINEAR',
      \ 'LORBMOM', 'LSORBIT', 'LSPIN_VDW', 'LSPIRAL', 'MAGMOM', 'M_CONSTR', 'NUPDOWN', 'QSPIRAL',
      \ 'SAXIS', 'VOSKOWN',
      \ ]

let s:cat_ion = [
      \ 'ANDERSEN_PROB', 'EDIFFG', 'IBRION', 'ICHAIN', 'IMAGES', 'IOPT', 'ISIF', 'LANGEVIN_GAMMA',
      \ 'LANGEVIN_GAMMA_L', 'LCLIMB', 'MDALGO', 'NFREE', 'NHC_NCHAINS', 'NHC_NRESPA', 'NHC_NS', 'NSW',
      \ 'NTEMPER', 'PMASS', 'POMASS', 'POTIM', 'RANDOM_SEED', 'SHAKEMAXITER', 'SHAKETOL', 'SHAKETOLSOFT',
      \ 'SMASS', 'SPRING', 'SPRING_K', 'SPRING_R0', 'SPRING_V0', 'TEBEG', 'TEEND', 'TILAMBDA',
      \ 'VELOCITY',
      \ ]

let s:cat_correlation = [
      \ 'AEXX', 'AGGAC', 'AGGAX', 'ALDAC', 'ALDAX', 'AMGGAC', 'AMGGAX', 'ENCUTFOCK', 'FOCKCORR',
      \ 'HFALPHA', 'HFLMAX', 'HFRCUT', 'HFSCREEN', 'LDAU', 'LDAUJ', 'LDAUL', 'LDAUPRINT', 'LDAUTYPE',
      \ 'LDAUU', 'LFOCKACE', 'LFOCKAEDFT', 'LFOCKSTD', 'LFXC', 'LHFCALC', 'LIBMBD_ALPHA', 'LIBMBD_C6AU',
      \ 'LIBMBD_K_GRID', 'LIBMBD_K_GRID_SHIFT', 'LIBMBD_MBD_A', 'LIBMBD_MBD_BETA', 'LIBMBD_METHOD',
      \ 'LIBMBD_N_OMEGA_GRID', 'LIBMBD_PARALLEL_MODE', 'LIBMBD_R0AU', 'LIBMBD_TS_D', 'LIBMBD_TS_SR',
      \ 'LIBMBD_VDW_PARAMS_KIND', 'LIBMBD_XC', 'LIBXC1', 'LIBXC2', 'LMAXFOCK', 'LMAXFOCKAE', 'LMAXMIX',
      \ 'LMODELHF', 'LMP2LT', 'LRHFCALC', 'LSCRPA', 'LSELFENERGY', 'LSEPB', 'LSEPK', 'LSINGLES',
      \ 'LSMP2LT', 'LWANNIER90', 'LWANNIER90_RUN', 'NBANDSO', 'NBANDSV', 'NCRPA_BANDS', 'NMAXFOCKAE',
      \ 'PRECFOCK', 'QMAXFOCKAE', 'VDW_ALPHA', 'VDW_C6AU', 'VDW_R0AU', 'XC', 'XCM_PN', 'XC_C',
      \ ]

let s:cat_optic = [
      \ 'BSEELECTRON', 'BSEHOLE', 'BSEPREC', 'CH_LSPEC', 'CH_NEDOS', 'CH_SIGMA', 'CSHIFT', 'DIPOL',
      \ 'EFERMI_NEDOS', 'EFIELD', 'EFIELD_PEAD', 'ENCUTGW', 'ENCUTGWSOFT', 'EPSILON', 'EVENONLYGW',
      \ 'IBSE', 'IDIPOL', 'IEPSILON', 'KPOINT_BSE', 'LBERRY', 'LCALCEPS', 'LCALCPOL', 'LCHIMAG',
      \ 'LDIPOL', 'LEPSILON', 'LNICSALL', 'LOPTICS', 'LPEAD', 'LPOSNICS', 'LRPA', 'LSPECTRAL',
      \ 'LSPECTRALGW', 'NBANDSGW', 'NICS', 'NUCIND', 'ODDONLYGW', 'OMEGAMAX', 'OMEGAMIN', 'OMEGATL',
      \ 'PHON_BORN_CHARGES', 'PHON_DIELECTRIC', 'PHON_DOS', 'PHON_G_CUTOFF', 'PHON_NEDOS', 'PHON_NWRITE',
      \ 'PHON_SIGMA', 'POSNICS', 'TRANSPORT_NEDOS', 'TRANSPORT_RELAXATION_TIME', 'WRT_NMRCUR',
      \ ]

" Exact tag-name matches on the left-hand side of assignments (strict lists only: official VASP + DeltaSpin).
" NOTE: no generic fallback matcher, so unknown/non-official tags will not be highlighted.

" Specific matches (official VASP list, DeltaSpin list, then category overlays).
execute 'syntax match vaspTagKnown /\%(^\|;\)\s*\zs\<\%(' . join(s:vasp_tags, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match deltaSpinTag /\%(^\|;\)\s*\zs\<\%(' . join(s:deltaspin_tags, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'

execute 'syntax match vaspGlobal /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_global, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match vaspStatic /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_static, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match vaspAlgo /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_algo, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match vaspMagnetic /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_magnetic, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match vaspIon /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_ion, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match vaspCorrelation /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_correlation, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'
execute 'syntax match vaspOptic /\%(^\|;\)\s*\zs\<\%(' . join(s:cat_optic, '\|') . '\)\>\ze\%(\s*\%(=\|[#!]\)\|\s*$\)/ contains=NONE'


" -----------------------------
" Values / literals
" -----------------------------
syntax match incarBoolean '\(=\s*\)\@<=\c\(\.TRUE\.\|TRUE\|T\|\.\T\.\)'
syntax match incarBoolean '\(=\s*\)\@<=\c\(\.FALSE\.\|FALSE\|F\|\.\F\.\)'
syntax match incarNumber /\v<[-+]?(\d+\.\d*|\d*\.\d+|\d+)([eEdD][-+]?\d+)?>/
syntax match incarNumber /\v<\d+\ze\*/  " repeat counts like 2*5.0
syntax region incarString start=/"/ skip=/\\"/ end=/"/
syntax region incarString start=/'/ skip=/\\'/ end=/'/

" Useful named value sets from VASP wiki (case-insensitive via :syn case ignore)
syntax match vaspValuePREC /\%(^\s*PREC\s*=\s*\)\@<=\%(Normal\|Single\|SingleN\|Accurate\|Low\|Medium\|High\)\>/
syntax match vaspValueLREAL /\%(^\s*LREAL\s*=\s*\)\@<=\%(\.FALSE\.\|\.TRUE\.\|Auto\|A\|On\|O\)\>/

" ALGO page includes additional values beyond the one-line summary (e.g. Old Fast, EVGW*, QPGW*, CRPA)
syntax match vaspValueALGO /\%(^\s*ALGO\s*=\s*\)\@<=\%(Normal\|VeryFast\|Old\s\+VeryFast\|Fast\|Old\s\+Fast\|Conjugate\|All\|Damped\|Subrot\|Eigenval\|Exact\|None\|Nothing\|CHI\|G0W0\|GW0\|GW\|scGW0\|scGW\|G0W0R\|GW0R\|GWR\|scGW0R\|scGWR\|ACFDT\|RPA\|ACFDTR\|RPAR\|BSE\|TDHF\|Timeev\|EVGW0\|EVGW\|QPGW0\|QPGW\|CRPA\|EVGW0R\|ACFDTRK\|ov\|vo\|of\|fo\)\>/

" GGA values (curated; VASP wiki list is long and evolving)
syntax match vaspValueGGA /\%(^\s*GGA\s*=\s*\)\@<=\%(LIBXC\|LI\|CA\|PZ\|PW92\|SL\|CA_C\|PZ_C\|PW92_C\|VW\|HL\|WI\|PE\|PBE_X\|PBE_C\|RE\|RP\|PS\|AM\|91\|B3\|B5\|BF\|OR\|BO\|MK\|ML\|CX\)\>/

" Common METAGGA values (the wiki list is extensive and grows with releases)
syntax match vaspValueMETAGGA /\%(^\s*METAGGA\s*=\s*\)\@<=\%(LIBXC\|TPSS\|TPSS_X\|TPSS_C\|RTPSS\|RTPSS_X\|RTPSS_C\|M06L\|M06L_X\|M06L_C\|MS0\|MS0_X\|MS0_C\|MS1\|MS1_X\|MS1_C\|MS2\|MS2_X\|MS2_C\|SCAN\|SCAN_X\|SCAN_C\|RSCAN\|RSCAN_X\|RSCAN_C\|R2SCAN\|R2SCAN_X\|R2SCAN_C\|SCANL\|RSCANL\|R2SCANL\|SREGTM1\|SREGTM2\|SREGTM3\|TASK_X\|LAK\|LAK_X\|LAK_C\|MSPBEL\|MSRPBEL\|MSB86BL\|RMSPBEL\|RMSRPBEL\|RMSB86BL\|OFR2\)\>/

" A few other common enum-ish tags
syntax match vaspValuePRECFOCK /\%(^\s*PRECFOCK\s*=\s*\)\@<=\%(Low\|Medium\|Fast\|Normal\|Accurate\)\>/

" SYSTEM line payload (up to inline comment)
syntax match incarSystemName /\%(^\s*SYSTEM\s*=\s*\)\@<=\_.\{-}\ze\s*[#!].*$\|\%(^\s*SYSTEM\s*=\s*\)\@<=.\+$/ contains=incarComment

" -----------------------------
" Highlight links
" -----------------------------
hi def link incarComment        Comment
hi def link incarOperator       String
hi def link incarBoolean        Identifier
hi def link incarNumber         Constant
hi def link incarString         String

hi def link vaspGlobal          Define
hi def link vaspAlgo            Define
hi def link vaspCorrelation     Function
hi def link vaspStatic          Function
hi def link vaspIon             Repeat
hi def link vaspMagnetic        Repeat
hi def link vaspOptic           Repeat
hi def link vaspTagKnown        Repeat
hi def deltaSpinTag      ctermfg=206 guifg=#ff79c6 gui=bold cterm=bold

hi def link vaspValueALGO       Identifier
hi def link vaspValuePREC       Identifier
hi def link vaspValueLREAL      Identifier
hi def link vaspValueGGA        Identifier
hi def link vaspValueMETAGGA    Identifier
hi def link vaspValuePRECFOCK   Identifier
hi def link incarSystemName     Identifier

let b:current_syntax = 'incar'

" Clean up script-local helper and temporaries.
unlet s:deltaspin_tags s:vasp_tags s:cat_global s:cat_static s:cat_algo s:cat_magnetic s:cat_ion s:cat_correlation s:cat_optic
