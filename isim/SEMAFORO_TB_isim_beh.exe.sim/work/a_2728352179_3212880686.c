/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/angri/Documents/XILINX PROJECTS/SEMAFORO/OP_MODE.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2728352179_3212880686_p_0(char *t0)
{
    char t13[16];
    char t20[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t21;

LAB0:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3400);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 3496);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 2U);
    xsi_driver_first_trans_fast(t1);

LAB9:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(41, ng0);
    t3 = xsi_get_transient_memory(2U);
    memset(t3, 0, 2U);
    t7 = t3;
    memset(t7, (unsigned char)2, 2U);
    t8 = (t0 + 3496);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 2U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

LAB8:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 5524U);
    t7 = (t0 + 5553);
    t9 = (t13 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 1;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t14 = (1 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t1, t7, t13);
    if (t6 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 5524U);
    t4 = (t0 + 5555);
    t8 = (t20 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t14 = (1 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t15;
    t9 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t13, t3, t1, t4, t20);
    t10 = (t13 + 12U);
    t15 = *((unsigned int *)t10);
    t21 = (1U * t15);
    t2 = (2U != t21);
    if (t2 == 1)
        goto LAB14;

LAB15:    t11 = (t0 + 3496);
    t12 = (t11 + 56U);
    t16 = *((char **)t12);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 2U);
    xsi_driver_first_trans_fast(t11);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(45, ng0);
    t10 = xsi_get_transient_memory(2U);
    memset(t10, 0, 2U);
    t11 = t10;
    memset(t11, (unsigned char)2, 2U);
    t12 = (t0 + 3496);
    t16 = (t12 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t10, 2U);
    xsi_driver_first_trans_fast(t12);
    goto LAB12;

LAB14:    xsi_size_not_matching(2U, t21, 0);
    goto LAB15;

}

static void work_a_2728352179_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(56, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3560);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3416);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2728352179_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2728352179_3212880686_p_0,(void *)work_a_2728352179_3212880686_p_1};
	xsi_register_didat("work_a_2728352179_3212880686", "isim/SEMAFORO_TB_isim_beh.exe.sim/work/a_2728352179_3212880686.didat");
	xsi_register_executes(pe);
}
