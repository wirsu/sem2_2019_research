!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 
!   tts :   three timescale toy model by Pingyu Nan (PhD thesis, 2014)
!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 

SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP) 
!--------- ---- 

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM, IJAC, ICP(*)
  DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
  DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
  DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,*), DFDP(NDIM,*)

  DOUBLE PRECISION X, Y, Z
  DOUBLE PRECISION A, A0, B, B0, ALPHA1, ALPHA2, BETA1, BETA2, GAMMA, DELTA, EPS
  DOUBLE PRECISION A1, A2, A3, B1, B2, C, C0
  
       ! Define the state variables
       X = U(1)
       Y = U(2)
       Z = U(3)

       ! Fixed parameter values
       A=2.0
       A0=0.1
       B=25.0
       B0=26.5
       ALPHA1=0.2
       ALPHA2=0.65
       BETA1=0.7
       BETA2=0.95

       ! Grouping parameters
       A1=6*A*ALPHA1*ALPHA2
       A2=3*A*(ALPHA1+ALPHA2)
       A3=2*A
       B1=6*B*(BETA1*BETA2-ALPHA1*ALPHA2)
       B2=3*B*((BETA1+BETA2)-(ALPHA1+ALPHA2))
       C=B/A
       C0=(A*B0+A0*B)/A
       
       ! Define the system parameters
       GAMMA = PAR(1)
       DELTA = PAR(2)
       EPS   = PAR(3)

       ! Define the integration time as a parameter

       ! Definethe right-hand side
       F(1) = Y-(A3*X**3-A2*X**2+A1*X+A0)
       F(2) = DELTA*(B2*X**2-B1*X-C*Y-Z+C0)
       F(3) = DELTA*EPS*(X-GAMMA)
END SUBROUTINE FUNC
!---------------------------------------------------------------------- 

SUBROUTINE STPNT(NDIM,U,PAR,T)

!     ---------- ----- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM
      DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
      DOUBLE PRECISION, INTENT(IN) :: T
 
      ! VARIABLES
      U(1)  = 1.00d0                ! VARIABLE X
      U(2)  = 0.56d0                ! VARIABLE Y
      U(3)  = 0.50d0                ! VARIABLE Z
      
      ! PARAMETERS
      PAR(1)  =   1.000d0           ! PARAMETER GAMMA
      PAR(2)  =   0.001d0           ! PARAMETER DELTA
      PAR(3)  =   0.100d0           ! PARAMETER EPSILON


END SUBROUTINE STPNT
!---------------------------------------------------------------------- 

SUBROUTINE PVLS
END SUBROUTINE PVLS

SUBROUTINE BCND 
END SUBROUTINE BCND

SUBROUTINE ICND 
END SUBROUTINE ICND

SUBROUTINE FOPT 
END SUBROUTINE FOPT
!---------------------------------------------------------------------- 
