    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 7;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (ballbeam_start_P)
        ;%
            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% ballbeam_start_P.Kc
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_P.z
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% ballbeam_start_P.HILWriteAnalog_channels
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 31;
            section.data(31)  = dumData; %prealloc

                    ;% ballbeam_start_P.HILInitialize_OOTerminate
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_P.HILInitialize_OOExit
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 1;

                    ;% ballbeam_start_P.HILInitialize_OOStart
                    section.data(3).logicalSrcIdx = 5;
                    section.data(3).dtTransOffset = 2;

                    ;% ballbeam_start_P.HILInitialize_OOEnter
                    section.data(4).logicalSrcIdx = 6;
                    section.data(4).dtTransOffset = 3;

                    ;% ballbeam_start_P.HILInitialize_AOFinal
                    section.data(5).logicalSrcIdx = 7;
                    section.data(5).dtTransOffset = 4;

                    ;% ballbeam_start_P.HILInitialize_POFinal
                    section.data(6).logicalSrcIdx = 8;
                    section.data(6).dtTransOffset = 5;

                    ;% ballbeam_start_P.HILInitialize_AIHigh
                    section.data(7).logicalSrcIdx = 9;
                    section.data(7).dtTransOffset = 6;

                    ;% ballbeam_start_P.HILInitialize_AILow
                    section.data(8).logicalSrcIdx = 10;
                    section.data(8).dtTransOffset = 18;

                    ;% ballbeam_start_P.HILInitialize_AOHigh
                    section.data(9).logicalSrcIdx = 11;
                    section.data(9).dtTransOffset = 30;

                    ;% ballbeam_start_P.HILInitialize_AOLow
                    section.data(10).logicalSrcIdx = 12;
                    section.data(10).dtTransOffset = 38;

                    ;% ballbeam_start_P.HILInitialize_AOInitial
                    section.data(11).logicalSrcIdx = 13;
                    section.data(11).dtTransOffset = 46;

                    ;% ballbeam_start_P.HILInitialize_POFrequency
                    section.data(12).logicalSrcIdx = 14;
                    section.data(12).dtTransOffset = 47;

                    ;% ballbeam_start_P.HILInitialize_POInitial
                    section.data(13).logicalSrcIdx = 15;
                    section.data(13).dtTransOffset = 48;

                    ;% ballbeam_start_P.InverseModulus_Modulus
                    section.data(14).logicalSrcIdx = 16;
                    section.data(14).dtTransOffset = 49;

                    ;% ballbeam_start_P.RadRev_Gain
                    section.data(15).logicalSrcIdx = 17;
                    section.data(15).dtTransOffset = 50;

                    ;% ballbeam_start_P.Bias_Bias
                    section.data(16).logicalSrcIdx = 18;
                    section.data(16).dtTransOffset = 51;

                    ;% ballbeam_start_P.cmV_Gain
                    section.data(17).logicalSrcIdx = 19;
                    section.data(17).dtTransOffset = 52;

                    ;% ballbeam_start_P.PulseGenerator_Amp
                    section.data(18).logicalSrcIdx = 20;
                    section.data(18).dtTransOffset = 53;

                    ;% ballbeam_start_P.PulseGenerator_Period
                    section.data(19).logicalSrcIdx = 21;
                    section.data(19).dtTransOffset = 54;

                    ;% ballbeam_start_P.PulseGenerator_Duty
                    section.data(20).logicalSrcIdx = 22;
                    section.data(20).dtTransOffset = 55;

                    ;% ballbeam_start_P.PulseGenerator_PhaseDelay
                    section.data(21).logicalSrcIdx = 23;
                    section.data(21).dtTransOffset = 56;

                    ;% ballbeam_start_P.Constant_Value
                    section.data(22).logicalSrcIdx = 24;
                    section.data(22).dtTransOffset = 57;

                    ;% ballbeam_start_P.TransferFcn_A
                    section.data(23).logicalSrcIdx = 25;
                    section.data(23).dtTransOffset = 58;

                    ;% ballbeam_start_P.TransferFcn_C
                    section.data(24).logicalSrcIdx = 26;
                    section.data(24).dtTransOffset = 59;

                    ;% ballbeam_start_P.TransferFcn_D
                    section.data(25).logicalSrcIdx = 27;
                    section.data(25).dtTransOffset = 60;

                    ;% ballbeam_start_P.Saturation1_UpperSat
                    section.data(26).logicalSrcIdx = 28;
                    section.data(26).dtTransOffset = 61;

                    ;% ballbeam_start_P.Saturation1_LowerSat
                    section.data(27).logicalSrcIdx = 29;
                    section.data(27).dtTransOffset = 62;

                    ;% ballbeam_start_P.Gain_Gain
                    section.data(28).logicalSrcIdx = 30;
                    section.data(28).dtTransOffset = 63;

                    ;% ballbeam_start_P.Saturation_UpperSat
                    section.data(29).logicalSrcIdx = 31;
                    section.data(29).dtTransOffset = 64;

                    ;% ballbeam_start_P.Saturation_LowerSat
                    section.data(30).logicalSrcIdx = 32;
                    section.data(30).dtTransOffset = 65;

                    ;% ballbeam_start_P.Fordirection_Gain
                    section.data(31).logicalSrcIdx = 33;
                    section.data(31).dtTransOffset = 66;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% ballbeam_start_P.HILInitialize_EIInitial
                    section.data(1).logicalSrcIdx = 34;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_P.HILInitialize_POModes
                    section.data(2).logicalSrcIdx = 35;
                    section.data(2).dtTransOffset = 1;

                    ;% ballbeam_start_P.HILReadTimebase_Clock
                    section.data(3).logicalSrcIdx = 36;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% ballbeam_start_P.HILInitialize_AIChannels
                    section.data(1).logicalSrcIdx = 37;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_P.HILInitialize_AOChannels
                    section.data(2).logicalSrcIdx = 38;
                    section.data(2).dtTransOffset = 12;

                    ;% ballbeam_start_P.HILInitialize_EIChannels
                    section.data(3).logicalSrcIdx = 39;
                    section.data(3).dtTransOffset = 20;

                    ;% ballbeam_start_P.HILInitialize_EIQuadrature
                    section.data(4).logicalSrcIdx = 40;
                    section.data(4).dtTransOffset = 21;

                    ;% ballbeam_start_P.HILReadTimebase_SamplesInBuffer
                    section.data(5).logicalSrcIdx = 41;
                    section.data(5).dtTransOffset = 22;

                    ;% ballbeam_start_P.HILReadTimebase_AnalogChannels
                    section.data(6).logicalSrcIdx = 42;
                    section.data(6).dtTransOffset = 23;

                    ;% ballbeam_start_P.HILReadTimebase_EncoderChannels
                    section.data(7).logicalSrcIdx = 43;
                    section.data(7).dtTransOffset = 24;

            nTotData = nTotData + section.nData;
            paramMap.sections(5) = section;
            clear section

            section.nData     = 37;
            section.data(37)  = dumData; %prealloc

                    ;% ballbeam_start_P.HILInitialize_Active
                    section.data(1).logicalSrcIdx = 44;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_P.HILInitialize_AOTerminate
                    section.data(2).logicalSrcIdx = 45;
                    section.data(2).dtTransOffset = 1;

                    ;% ballbeam_start_P.HILInitialize_AOExit
                    section.data(3).logicalSrcIdx = 46;
                    section.data(3).dtTransOffset = 2;

                    ;% ballbeam_start_P.HILInitialize_DOTerminate
                    section.data(4).logicalSrcIdx = 47;
                    section.data(4).dtTransOffset = 3;

                    ;% ballbeam_start_P.HILInitialize_DOExit
                    section.data(5).logicalSrcIdx = 48;
                    section.data(5).dtTransOffset = 4;

                    ;% ballbeam_start_P.HILInitialize_POTerminate
                    section.data(6).logicalSrcIdx = 49;
                    section.data(6).dtTransOffset = 5;

                    ;% ballbeam_start_P.HILInitialize_POExit
                    section.data(7).logicalSrcIdx = 50;
                    section.data(7).dtTransOffset = 6;

                    ;% ballbeam_start_P.HILInitialize_CKPStart
                    section.data(8).logicalSrcIdx = 51;
                    section.data(8).dtTransOffset = 7;

                    ;% ballbeam_start_P.HILInitialize_CKPEnter
                    section.data(9).logicalSrcIdx = 52;
                    section.data(9).dtTransOffset = 8;

                    ;% ballbeam_start_P.HILInitialize_CKStart
                    section.data(10).logicalSrcIdx = 53;
                    section.data(10).dtTransOffset = 9;

                    ;% ballbeam_start_P.HILInitialize_CKEnter
                    section.data(11).logicalSrcIdx = 54;
                    section.data(11).dtTransOffset = 10;

                    ;% ballbeam_start_P.HILInitialize_AIPStart
                    section.data(12).logicalSrcIdx = 55;
                    section.data(12).dtTransOffset = 11;

                    ;% ballbeam_start_P.HILInitialize_AIPEnter
                    section.data(13).logicalSrcIdx = 56;
                    section.data(13).dtTransOffset = 12;

                    ;% ballbeam_start_P.HILInitialize_AOPStart
                    section.data(14).logicalSrcIdx = 57;
                    section.data(14).dtTransOffset = 13;

                    ;% ballbeam_start_P.HILInitialize_AOPEnter
                    section.data(15).logicalSrcIdx = 58;
                    section.data(15).dtTransOffset = 14;

                    ;% ballbeam_start_P.HILInitialize_AOStart
                    section.data(16).logicalSrcIdx = 59;
                    section.data(16).dtTransOffset = 15;

                    ;% ballbeam_start_P.HILInitialize_AOEnter
                    section.data(17).logicalSrcIdx = 60;
                    section.data(17).dtTransOffset = 16;

                    ;% ballbeam_start_P.HILInitialize_AOReset
                    section.data(18).logicalSrcIdx = 61;
                    section.data(18).dtTransOffset = 17;

                    ;% ballbeam_start_P.HILInitialize_DOPStart
                    section.data(19).logicalSrcIdx = 62;
                    section.data(19).dtTransOffset = 18;

                    ;% ballbeam_start_P.HILInitialize_DOPEnter
                    section.data(20).logicalSrcIdx = 63;
                    section.data(20).dtTransOffset = 19;

                    ;% ballbeam_start_P.HILInitialize_DOStart
                    section.data(21).logicalSrcIdx = 64;
                    section.data(21).dtTransOffset = 20;

                    ;% ballbeam_start_P.HILInitialize_DOEnter
                    section.data(22).logicalSrcIdx = 65;
                    section.data(22).dtTransOffset = 21;

                    ;% ballbeam_start_P.HILInitialize_DOReset
                    section.data(23).logicalSrcIdx = 66;
                    section.data(23).dtTransOffset = 22;

                    ;% ballbeam_start_P.HILInitialize_EIPStart
                    section.data(24).logicalSrcIdx = 67;
                    section.data(24).dtTransOffset = 23;

                    ;% ballbeam_start_P.HILInitialize_EIPEnter
                    section.data(25).logicalSrcIdx = 68;
                    section.data(25).dtTransOffset = 24;

                    ;% ballbeam_start_P.HILInitialize_EIStart
                    section.data(26).logicalSrcIdx = 69;
                    section.data(26).dtTransOffset = 25;

                    ;% ballbeam_start_P.HILInitialize_EIEnter
                    section.data(27).logicalSrcIdx = 70;
                    section.data(27).dtTransOffset = 26;

                    ;% ballbeam_start_P.HILInitialize_POPStart
                    section.data(28).logicalSrcIdx = 71;
                    section.data(28).dtTransOffset = 27;

                    ;% ballbeam_start_P.HILInitialize_POPEnter
                    section.data(29).logicalSrcIdx = 72;
                    section.data(29).dtTransOffset = 28;

                    ;% ballbeam_start_P.HILInitialize_POStart
                    section.data(30).logicalSrcIdx = 73;
                    section.data(30).dtTransOffset = 29;

                    ;% ballbeam_start_P.HILInitialize_POEnter
                    section.data(31).logicalSrcIdx = 74;
                    section.data(31).dtTransOffset = 30;

                    ;% ballbeam_start_P.HILInitialize_POReset
                    section.data(32).logicalSrcIdx = 75;
                    section.data(32).dtTransOffset = 31;

                    ;% ballbeam_start_P.HILInitialize_OOReset
                    section.data(33).logicalSrcIdx = 76;
                    section.data(33).dtTransOffset = 32;

                    ;% ballbeam_start_P.HILInitialize_DOFinal
                    section.data(34).logicalSrcIdx = 77;
                    section.data(34).dtTransOffset = 33;

                    ;% ballbeam_start_P.HILInitialize_DOInitial
                    section.data(35).logicalSrcIdx = 78;
                    section.data(35).dtTransOffset = 34;

                    ;% ballbeam_start_P.HILReadTimebase_Active
                    section.data(36).logicalSrcIdx = 79;
                    section.data(36).dtTransOffset = 35;

                    ;% ballbeam_start_P.HILWriteAnalog_Active
                    section.data(37).logicalSrcIdx = 80;
                    section.data(37).dtTransOffset = 36;

            nTotData = nTotData + section.nData;
            paramMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% ballbeam_start_P.HILReadTimebase_OverflowMode
                    section.data(1).logicalSrcIdx = 81;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(7) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (ballbeam_start_B)
        ;%
            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% ballbeam_start_B.HILReadTimebase_o2
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_B.Bias
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% ballbeam_start_B.cmV
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% ballbeam_start_B.DesiredPosition
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% ballbeam_start_B.Subtract1
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% ballbeam_start_B.Gain2
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% ballbeam_start_B.DesiredAngle
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% ballbeam_start_B.Saturation
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% ballbeam_start_B.Fordirection
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 6;
        sectIdxOffset = 1;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (ballbeam_start_DW)
        ;%
            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% ballbeam_start_DW.HILInitialize_AOVoltages
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_DW.HILInitialize_FilterFrequency
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 8;

                    ;% ballbeam_start_DW.HILReadTimebase_AnalogBuffer
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 9;

                    ;% ballbeam_start_DW.InverseModulus_PreviousInput
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 10;

                    ;% ballbeam_start_DW.InverseModulus_Revolutions
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 11;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% ballbeam_start_DW.HILInitialize_Card
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% ballbeam_start_DW.HILReadTimebase_Task
                    section.data(1).logicalSrcIdx = 6;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% ballbeam_start_DW.HILWriteAnalog_PWORK
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_DW.Scope_PWORK.LoggedData
                    section.data(2).logicalSrcIdx = 8;
                    section.data(2).dtTransOffset = 1;

                    ;% ballbeam_start_DW.Scope1_PWORK.LoggedData
                    section.data(3).logicalSrcIdx = 9;
                    section.data(3).dtTransOffset = 2;

                    ;% ballbeam_start_DW.Scope2_PWORK.LoggedData
                    section.data(4).logicalSrcIdx = 10;
                    section.data(4).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% ballbeam_start_DW.HILReadTimebase_EncoderBuffer
                    section.data(1).logicalSrcIdx = 11;
                    section.data(1).dtTransOffset = 0;

                    ;% ballbeam_start_DW.clockTickCounter
                    section.data(2).logicalSrcIdx = 12;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% ballbeam_start_DW.InverseModulus_FirstSample
                    section.data(1).logicalSrcIdx = 13;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 2485300602;
    targMap.checksum1 = 3204771984;
    targMap.checksum2 = 2749663773;
    targMap.checksum3 = 4114907939;

