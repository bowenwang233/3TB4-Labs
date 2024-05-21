/*
 * ballbeam_start.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "ballbeam_start".
 *
 * Model version              : 3.4
 * Simulink Coder version : 9.8 (R2022b) 13-May-2022
 * C source code generated on : Mon Mar 11 17:20:07 2024
 *
 * Target selection: quarc_linux_rt_armv7.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: ARM Compatible->ARM 7
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ballbeam_start.h"
#include "rtwtypes.h"
#include "ballbeam_start_private.h"
#include <string.h>
#include "rt_nonfinite.h"
#include "ballbeam_start_dt.h"

/* Block signals (default storage) */
B_ballbeam_start_T ballbeam_start_B;

/* Continuous states */
X_ballbeam_start_T ballbeam_start_X;

/* Block states (default storage) */
DW_ballbeam_start_T ballbeam_start_DW;

/* Real-time model */
static RT_MODEL_ballbeam_start_T ballbeam_start_M_;
RT_MODEL_ballbeam_start_T *const ballbeam_start_M = &ballbeam_start_M_;

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 1;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  ballbeam_start_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  ballbeam_start_output();
  ballbeam_start_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  ballbeam_start_output();
  ballbeam_start_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model output function */
void ballbeam_start_output(void)
{
  real_T rtb_HILReadTimebase_o1;
  real_T rtb_PulseGenerator;
  if (rtmIsMajorTimeStep(ballbeam_start_M)) {
    /* set solver stop time */
    if (!(ballbeam_start_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&ballbeam_start_M->solverInfo,
                            ((ballbeam_start_M->Timing.clockTickH0 + 1) *
        ballbeam_start_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&ballbeam_start_M->solverInfo,
                            ((ballbeam_start_M->Timing.clockTick0 + 1) *
        ballbeam_start_M->Timing.stepSize0 +
        ballbeam_start_M->Timing.clockTickH0 *
        ballbeam_start_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(ballbeam_start_M)) {
    ballbeam_start_M->Timing.t[0] = rtsiGetT(&ballbeam_start_M->solverInfo);
  }

  if (rtmIsMajorTimeStep(ballbeam_start_M)) {
    /* S-Function (hil_read_timebase_block): '<S1>/HIL Read Timebase' */

    /* S-Function Block: ballbeam_start/Ball&Beam Core/HIL Read Timebase (hil_read_timebase_block) */
    {
      t_error result;
      result = hil_task_read(ballbeam_start_DW.HILReadTimebase_Task, 1,
        &ballbeam_start_DW.HILReadTimebase_AnalogBuffer,
        &ballbeam_start_DW.HILReadTimebase_EncoderBuffer,
        NULL,
        NULL
        );
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
      } else {
        rtb_HILReadTimebase_o1 = ballbeam_start_DW.HILReadTimebase_AnalogBuffer;
        ballbeam_start_B.HILReadTimebase_o2 =
          ballbeam_start_DW.HILReadTimebase_EncoderBuffer;
      }
    }

    /* S-Function (inverse_modulus_block): '<S1>/Inverse Modulus' */
    /* S-Function Block: ballbeam_start/Ball&Beam Core/Inverse Modulus (inverse_modulus_block) */
    {
      static const real_T sampling_period = 0.002;
      real_T half_range = ballbeam_start_P.InverseModulus_Modulus / 2.0;
      real_T du, dy;
      if (ballbeam_start_DW.InverseModulus_FirstSample) {
        ballbeam_start_DW.InverseModulus_FirstSample = false;
        ballbeam_start_DW.InverseModulus_PreviousInput =
          ballbeam_start_B.HILReadTimebase_o2;
      }

      du = (real_T) ballbeam_start_B.HILReadTimebase_o2 -
        ballbeam_start_DW.InverseModulus_PreviousInput;
      if (du > half_range) {
        ballbeam_start_DW.InverseModulus_Revolutions =
          ballbeam_start_DW.InverseModulus_Revolutions - 1;
        dy = du - ballbeam_start_P.InverseModulus_Modulus;
      } else if (du < -half_range) {
        ballbeam_start_DW.InverseModulus_Revolutions =
          ballbeam_start_DW.InverseModulus_Revolutions + 1;
        dy = du + ballbeam_start_P.InverseModulus_Modulus;
      } else {
        dy = du;
      }

      rtb_PulseGenerator = ballbeam_start_B.HILReadTimebase_o2 +
        ballbeam_start_DW.InverseModulus_Revolutions *
        ballbeam_start_P.InverseModulus_Modulus;
      ballbeam_start_DW.InverseModulus_PreviousInput =
        ballbeam_start_B.HILReadTimebase_o2;
    }

    /* Bias: '<S1>/Bias' incorporates:
     *  Gain: '<S1>/Rad//Rev'
     */
    ballbeam_start_B.Bias = ballbeam_start_P.RadRev_Gain * rtb_PulseGenerator +
      ballbeam_start_P.Bias_Bias;

    /* Gain: '<S1>/cm//V' */
    ballbeam_start_B.cmV = ballbeam_start_P.cmV_Gain * rtb_HILReadTimebase_o1;

    /* DiscretePulseGenerator: '<Root>/Pulse Generator' */
    rtb_PulseGenerator = (ballbeam_start_DW.clockTickCounter <
                          ballbeam_start_P.PulseGenerator_Duty) &&
      (ballbeam_start_DW.clockTickCounter >= 0) ?
      ballbeam_start_P.PulseGenerator_Amp : 0.0;
    if (ballbeam_start_DW.clockTickCounter >=
        ballbeam_start_P.PulseGenerator_Period - 1.0) {
      ballbeam_start_DW.clockTickCounter = 0;
    } else {
      ballbeam_start_DW.clockTickCounter++;
    }

    /* End of DiscretePulseGenerator: '<Root>/Pulse Generator' */

    /* Sum: '<Root>/Subtract2' incorporates:
     *  Constant: '<Root>/Constant'
     */
    ballbeam_start_B.DesiredPosition = rtb_PulseGenerator -
      ballbeam_start_P.Constant_Value;

    /* Sum: '<Root>/Subtract1' */
    ballbeam_start_B.Subtract1 = ballbeam_start_B.DesiredPosition -
      ballbeam_start_B.cmV;

    /* Gain: '<Root>/Gain2' */
    ballbeam_start_B.Gain2 = ballbeam_start_P.z * ballbeam_start_B.Subtract1;
  }

  /* Gain: '<Root>/Gain1' incorporates:
   *  Sum: '<Root>/Add'
   *  TransferFcn: '<Root>/Transfer Fcn'
   */
  rtb_HILReadTimebase_o1 = ((ballbeam_start_P.TransferFcn_C *
    ballbeam_start_X.TransferFcn_CSTATE + ballbeam_start_P.TransferFcn_D *
    ballbeam_start_B.Subtract1) + ballbeam_start_B.Gain2) * ballbeam_start_P.Kc;

  /* Saturate: '<Root>/Saturation1' */
  if (rtb_HILReadTimebase_o1 > ballbeam_start_P.Saturation1_UpperSat) {
    /* Saturate: '<Root>/Saturation1' */
    ballbeam_start_B.DesiredAngle = ballbeam_start_P.Saturation1_UpperSat;
  } else if (rtb_HILReadTimebase_o1 < ballbeam_start_P.Saturation1_LowerSat) {
    /* Saturate: '<Root>/Saturation1' */
    ballbeam_start_B.DesiredAngle = ballbeam_start_P.Saturation1_LowerSat;
  } else {
    /* Saturate: '<Root>/Saturation1' */
    ballbeam_start_B.DesiredAngle = rtb_HILReadTimebase_o1;
  }

  /* End of Saturate: '<Root>/Saturation1' */

  /* Gain: '<Root>/Gain' incorporates:
   *  Sum: '<Root>/Subtract'
   */
  rtb_HILReadTimebase_o1 = (ballbeam_start_B.DesiredAngle -
    ballbeam_start_B.Bias) * ballbeam_start_P.Gain_Gain;

  /* Saturate: '<Root>/Saturation' */
  if (rtb_HILReadTimebase_o1 > ballbeam_start_P.Saturation_UpperSat) {
    /* Saturate: '<Root>/Saturation' */
    ballbeam_start_B.Saturation = ballbeam_start_P.Saturation_UpperSat;
  } else if (rtb_HILReadTimebase_o1 < ballbeam_start_P.Saturation_LowerSat) {
    /* Saturate: '<Root>/Saturation' */
    ballbeam_start_B.Saturation = ballbeam_start_P.Saturation_LowerSat;
  } else {
    /* Saturate: '<Root>/Saturation' */
    ballbeam_start_B.Saturation = rtb_HILReadTimebase_o1;
  }

  /* End of Saturate: '<Root>/Saturation' */

  /* Gain: '<S1>/For direction' */
  ballbeam_start_B.Fordirection = ballbeam_start_P.Fordirection_Gain *
    ballbeam_start_B.Saturation;
  if (rtmIsMajorTimeStep(ballbeam_start_M)) {
    /* S-Function (hil_write_analog_block): '<S1>/HIL Write Analog' */

    /* S-Function Block: ballbeam_start/Ball&Beam Core/HIL Write Analog (hil_write_analog_block) */
    {
      t_error result;
      result = hil_write_analog(ballbeam_start_DW.HILInitialize_Card,
        &ballbeam_start_P.HILWriteAnalog_channels, 1,
        &ballbeam_start_B.Fordirection);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
      }
    }
  }
}

/* Model update function */
void ballbeam_start_update(void)
{
  if (rtmIsMajorTimeStep(ballbeam_start_M)) {
    rt_ertODEUpdateContinuousStates(&ballbeam_start_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++ballbeam_start_M->Timing.clockTick0)) {
    ++ballbeam_start_M->Timing.clockTickH0;
  }

  ballbeam_start_M->Timing.t[0] = rtsiGetSolverStopTime
    (&ballbeam_start_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.002s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++ballbeam_start_M->Timing.clockTick1)) {
      ++ballbeam_start_M->Timing.clockTickH1;
    }

    ballbeam_start_M->Timing.t[1] = ballbeam_start_M->Timing.clockTick1 *
      ballbeam_start_M->Timing.stepSize1 + ballbeam_start_M->Timing.clockTickH1 *
      ballbeam_start_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Derivatives for root system: '<Root>' */
void ballbeam_start_derivatives(void)
{
  XDot_ballbeam_start_T *_rtXdot;
  _rtXdot = ((XDot_ballbeam_start_T *) ballbeam_start_M->derivs);

  /* Derivatives for TransferFcn: '<Root>/Transfer Fcn' */
  _rtXdot->TransferFcn_CSTATE = ballbeam_start_P.TransferFcn_A *
    ballbeam_start_X.TransferFcn_CSTATE;
  _rtXdot->TransferFcn_CSTATE += ballbeam_start_B.Subtract1;
}

/* Model initialize function */
void ballbeam_start_initialize(void)
{
  /* Start for S-Function (hil_initialize_block): '<S1>/HIL Initialize' */

  /* S-Function Block: ballbeam_start/Ball&Beam Core/HIL Initialize (hil_initialize_block) */
  {
    t_int result;
    t_boolean is_switching;
    result = hil_open("ni_myrio_1900", "0",
                      &ballbeam_start_DW.HILInitialize_Card);
    if (result < 0) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
      return;
    }

    is_switching = false;
    result = hil_set_card_specific_options(ballbeam_start_DW.HILInitialize_Card,
      "enc0_en=1,enc1_en=1,enc2_en=1,enc3_en=1,pwm0_en=1,pwm1_en=1,pwm2_en=1,pwm3_en=1,pwm4_en=1,pwm5_en=1,pwm6_en=1,pwm7_en=1",
      120);
    if (result < 0) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
      return;
    }

    result = hil_watchdog_clear(ballbeam_start_DW.HILInitialize_Card);
    if (result < 0 && result != -QERR_HIL_WATCHDOG_CLEAR) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
      return;
    }

    if ((ballbeam_start_P.HILInitialize_AIPStart && !is_switching) ||
        (ballbeam_start_P.HILInitialize_AIPEnter && is_switching)) {
      result = hil_set_analog_input_ranges(ballbeam_start_DW.HILInitialize_Card,
        ballbeam_start_P.HILInitialize_AIChannels, 12U,
        ballbeam_start_P.HILInitialize_AILow,
        ballbeam_start_P.HILInitialize_AIHigh);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
        return;
      }
    }

    if ((ballbeam_start_P.HILInitialize_AOPStart && !is_switching) ||
        (ballbeam_start_P.HILInitialize_AOPEnter && is_switching)) {
      result = hil_set_analog_output_ranges(ballbeam_start_DW.HILInitialize_Card,
        ballbeam_start_P.HILInitialize_AOChannels, 8U,
        ballbeam_start_P.HILInitialize_AOLow,
        ballbeam_start_P.HILInitialize_AOHigh);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
        return;
      }
    }

    if ((ballbeam_start_P.HILInitialize_AOStart && !is_switching) ||
        (ballbeam_start_P.HILInitialize_AOEnter && is_switching)) {
      {
        int_T i1;
        real_T *dw_AOVoltages = &ballbeam_start_DW.HILInitialize_AOVoltages[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOVoltages[i1] = ballbeam_start_P.HILInitialize_AOInitial;
        }
      }

      result = hil_write_analog(ballbeam_start_DW.HILInitialize_Card,
        ballbeam_start_P.HILInitialize_AOChannels, 8U,
        &ballbeam_start_DW.HILInitialize_AOVoltages[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
        return;
      }
    }

    if ((ballbeam_start_P.HILInitialize_EIPStart && !is_switching) ||
        (ballbeam_start_P.HILInitialize_EIPEnter && is_switching)) {
      result = hil_set_encoder_quadrature_mode
        (ballbeam_start_DW.HILInitialize_Card,
         &ballbeam_start_P.HILInitialize_EIChannels, 1U,
         (t_encoder_quadrature_mode *)
         &ballbeam_start_P.HILInitialize_EIQuadrature);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
        return;
      }
    }

    if ((ballbeam_start_P.HILInitialize_EIStart && !is_switching) ||
        (ballbeam_start_P.HILInitialize_EIEnter && is_switching)) {
      result = hil_set_encoder_counts(ballbeam_start_DW.HILInitialize_Card,
        &ballbeam_start_P.HILInitialize_EIChannels, 1U,
        &ballbeam_start_P.HILInitialize_EIInitial);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
        return;
      }
    }
  }

  /* Start for S-Function (hil_read_timebase_block): '<S1>/HIL Read Timebase' */

  /* S-Function Block: ballbeam_start/Ball&Beam Core/HIL Read Timebase (hil_read_timebase_block) */
  {
    t_error result;
    result = hil_task_create_reader(ballbeam_start_DW.HILInitialize_Card,
      ballbeam_start_P.HILReadTimebase_SamplesInBuffer,
      &ballbeam_start_P.HILReadTimebase_AnalogChannels, 1U,
      &ballbeam_start_P.HILReadTimebase_EncoderChannels, 1U,
      NULL, 0U,
      NULL, 0U,
      &ballbeam_start_DW.HILReadTimebase_Task);
    if (result >= 0) {
      result = hil_task_set_buffer_overflow_mode
        (ballbeam_start_DW.HILReadTimebase_Task, (t_buffer_overflow_mode)
         (ballbeam_start_P.HILReadTimebase_OverflowMode - 1));
    }

    if (result < 0) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
    }
  }

  /* Start for S-Function (inverse_modulus_block): '<S1>/Inverse Modulus' */

  /* S-Function Block: ballbeam_start/Ball&Beam Core/Inverse Modulus (inverse_modulus_block) */
  {
    ballbeam_start_DW.InverseModulus_FirstSample = true;
    ballbeam_start_DW.InverseModulus_Revolutions = 0;
  }

  /* Start for DiscretePulseGenerator: '<Root>/Pulse Generator' */
  ballbeam_start_DW.clockTickCounter = 0;

  /* InitializeConditions for TransferFcn: '<Root>/Transfer Fcn' */
  ballbeam_start_X.TransferFcn_CSTATE = 0.0;
}

/* Model terminate function */
void ballbeam_start_terminate(void)
{
  /* Terminate for S-Function (hil_initialize_block): '<S1>/HIL Initialize' */

  /* S-Function Block: ballbeam_start/Ball&Beam Core/HIL Initialize (hil_initialize_block) */
  {
    t_boolean is_switching;
    t_int result;
    t_uint32 num_final_analog_outputs = 0;
    hil_task_stop_all(ballbeam_start_DW.HILInitialize_Card);
    hil_monitor_stop_all(ballbeam_start_DW.HILInitialize_Card);
    is_switching = false;
    if ((ballbeam_start_P.HILInitialize_AOTerminate && !is_switching) ||
        (ballbeam_start_P.HILInitialize_AOExit && is_switching)) {
      {
        int_T i1;
        real_T *dw_AOVoltages = &ballbeam_start_DW.HILInitialize_AOVoltages[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOVoltages[i1] = ballbeam_start_P.HILInitialize_AOFinal;
        }
      }

      num_final_analog_outputs = 8U;
    } else {
      num_final_analog_outputs = 0;
    }

    if (num_final_analog_outputs > 0) {
      result = hil_write_analog(ballbeam_start_DW.HILInitialize_Card,
        ballbeam_start_P.HILInitialize_AOChannels, num_final_analog_outputs,
        &ballbeam_start_DW.HILInitialize_AOVoltages[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(ballbeam_start_M, _rt_error_message);
      }
    }

    hil_task_delete_all(ballbeam_start_DW.HILInitialize_Card);
    hil_monitor_delete_all(ballbeam_start_DW.HILInitialize_Card);
    hil_close(ballbeam_start_DW.HILInitialize_Card);
    ballbeam_start_DW.HILInitialize_Card = NULL;
  }
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/

/* Solver interface called by GRT_Main */
#ifndef USE_GENERATED_SOLVER

void rt_ODECreateIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

#endif

void MdlOutputs(int_T tid)
{
  ballbeam_start_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  ballbeam_start_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  ballbeam_start_initialize();
}

void MdlTerminate(void)
{
  ballbeam_start_terminate();
}

/* Registration function */
RT_MODEL_ballbeam_start_T *ballbeam_start(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)ballbeam_start_M, 0,
                sizeof(RT_MODEL_ballbeam_start_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&ballbeam_start_M->solverInfo,
                          &ballbeam_start_M->Timing.simTimeStep);
    rtsiSetTPtr(&ballbeam_start_M->solverInfo, &rtmGetTPtr(ballbeam_start_M));
    rtsiSetStepSizePtr(&ballbeam_start_M->solverInfo,
                       &ballbeam_start_M->Timing.stepSize0);
    rtsiSetdXPtr(&ballbeam_start_M->solverInfo, &ballbeam_start_M->derivs);
    rtsiSetContStatesPtr(&ballbeam_start_M->solverInfo, (real_T **)
                         &ballbeam_start_M->contStates);
    rtsiSetNumContStatesPtr(&ballbeam_start_M->solverInfo,
      &ballbeam_start_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&ballbeam_start_M->solverInfo,
      &ballbeam_start_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&ballbeam_start_M->solverInfo,
      &ballbeam_start_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&ballbeam_start_M->solverInfo,
      &ballbeam_start_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&ballbeam_start_M->solverInfo, (&rtmGetErrorStatus
      (ballbeam_start_M)));
    rtsiSetRTModelPtr(&ballbeam_start_M->solverInfo, ballbeam_start_M);
  }

  rtsiSetSimTimeStep(&ballbeam_start_M->solverInfo, MAJOR_TIME_STEP);
  ballbeam_start_M->intgData.y = ballbeam_start_M->odeY;
  ballbeam_start_M->intgData.f[0] = ballbeam_start_M->odeF[0];
  ballbeam_start_M->intgData.f[1] = ballbeam_start_M->odeF[1];
  ballbeam_start_M->intgData.f[2] = ballbeam_start_M->odeF[2];
  ballbeam_start_M->contStates = ((real_T *) &ballbeam_start_X);
  rtsiSetSolverData(&ballbeam_start_M->solverInfo, (void *)
                    &ballbeam_start_M->intgData);
  rtsiSetIsMinorTimeStepWithModeChange(&ballbeam_start_M->solverInfo, false);
  rtsiSetSolverName(&ballbeam_start_M->solverInfo,"ode3");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = ballbeam_start_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;

    /* polyspace +2 MISRA2012:D4.1 [Justified:Low] "ballbeam_start_M points to
       static memory which is guaranteed to be non-NULL" */
    ballbeam_start_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    ballbeam_start_M->Timing.sampleTimes =
      (&ballbeam_start_M->Timing.sampleTimesArray[0]);
    ballbeam_start_M->Timing.offsetTimes =
      (&ballbeam_start_M->Timing.offsetTimesArray[0]);

    /* task periods */
    ballbeam_start_M->Timing.sampleTimes[0] = (0.0);
    ballbeam_start_M->Timing.sampleTimes[1] = (0.002);

    /* task offsets */
    ballbeam_start_M->Timing.offsetTimes[0] = (0.0);
    ballbeam_start_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(ballbeam_start_M, &ballbeam_start_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = ballbeam_start_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    ballbeam_start_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(ballbeam_start_M, 10.0);
  ballbeam_start_M->Timing.stepSize0 = 0.002;
  ballbeam_start_M->Timing.stepSize1 = 0.002;

  /* External mode info */
  ballbeam_start_M->Sizes.checksums[0] = (2485300602U);
  ballbeam_start_M->Sizes.checksums[1] = (3204771984U);
  ballbeam_start_M->Sizes.checksums[2] = (2749663773U);
  ballbeam_start_M->Sizes.checksums[3] = (4114907939U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    ballbeam_start_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(ballbeam_start_M->extModeInfo,
      &ballbeam_start_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(ballbeam_start_M->extModeInfo,
                        ballbeam_start_M->Sizes.checksums);
    rteiSetTPtr(ballbeam_start_M->extModeInfo, rtmGetTPtr(ballbeam_start_M));
  }

  ballbeam_start_M->solverInfoPtr = (&ballbeam_start_M->solverInfo);
  ballbeam_start_M->Timing.stepSize = (0.002);
  rtsiSetFixedStepSize(&ballbeam_start_M->solverInfo, 0.002);
  rtsiSetSolverMode(&ballbeam_start_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  ballbeam_start_M->blockIO = ((void *) &ballbeam_start_B);
  (void) memset(((void *) &ballbeam_start_B), 0,
                sizeof(B_ballbeam_start_T));

  /* parameters */
  ballbeam_start_M->defaultParam = ((real_T *)&ballbeam_start_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &ballbeam_start_X;
    ballbeam_start_M->contStates = (x);
    (void) memset((void *)&ballbeam_start_X, 0,
                  sizeof(X_ballbeam_start_T));
  }

  /* states (dwork) */
  ballbeam_start_M->dwork = ((void *) &ballbeam_start_DW);
  (void) memset((void *)&ballbeam_start_DW, 0,
                sizeof(DW_ballbeam_start_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    ballbeam_start_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 21;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  ballbeam_start_M->Sizes.numContStates = (1);/* Number of continuous states */
  ballbeam_start_M->Sizes.numPeriodicContStates = (0);
                                      /* Number of periodic continuous states */
  ballbeam_start_M->Sizes.numY = (0);  /* Number of model outputs */
  ballbeam_start_M->Sizes.numU = (0);  /* Number of model inputs */
  ballbeam_start_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  ballbeam_start_M->Sizes.numSampTimes = (2);/* Number of sample times */
  ballbeam_start_M->Sizes.numBlocks = (23);/* Number of blocks */
  ballbeam_start_M->Sizes.numBlockIO = (9);/* Number of block outputs */
  ballbeam_start_M->Sizes.numBlockPrms = (136);/* Sum of parameter "widths" */
  return ballbeam_start_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
