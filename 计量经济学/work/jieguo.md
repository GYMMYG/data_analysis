# 总

```python
医生有无简介          4.606183e-03
总文章数            4.983684e-04
患者满意度           9.183658e-05
欢迎词字数           7.917123e-04
字数平方           -2.881028e-06
city_一线城市       3.842371e-02
city_二线城市       2.509793e-02
profession_1   -2.864207e-02
profession_2   -1.698018e-02
profession_3   -2.117574e-02
profession_4   -1.583196e-02
profession_5   -1.970226e-02
intercept       1.311885e-17
dtype: float64
                            OLS Regression Results                            
==============================================================================
Dep. Variable:               log(IST)   R-squared:                       0.084
Model:                            OLS   Adj. R-squared:                  0.078
Method:                 Least Squares   F-statistic:                     13.81
Date:                Sat, 17 Apr 2021   Prob (F-statistic):           8.42e-28
Time:                        10:40:57   Log-Likelihood:                 1939.9
No. Observations:                1810   AIC:                            -3854.
Df Residuals:                    1797   BIC:                            -3782.
Df Model:                          12                                         
Covariance Type:            nonrobust                                         
================================================================================
                   coef    std err          t      P>|t|      [0.025      0.975]
--------------------------------------------------------------------------------
医生有无简介           0.0046      0.005      0.907      0.365      -0.005       0.015
总文章数             0.0005      0.000      1.553      0.121      -0.000       0.001
患者满意度         9.184e-05   3.94e-05      2.329      0.020    1.45e-05       0.000
欢迎词字数            0.0008   9.86e-05      8.034      0.000       0.001       0.001
字数平方         -2.881e-06   4.19e-07     -6.878      0.000    -3.7e-06   -2.06e-06
city_一线城市        0.0384      0.005      6.991      0.000       0.028       0.049
city_二线城市        0.0251      0.005      5.135      0.000       0.016       0.035
profession_1    -0.0286      0.019     -1.494      0.135      -0.066       0.009
profession_2    -0.0170      0.007     -2.365      0.018      -0.031      -0.003
profession_3    -0.0212      0.011     -1.908      0.057      -0.043       0.001
profession_4    -0.0158      0.007     -2.226      0.026      -0.030      -0.002
profession_5    -0.0197      0.008     -2.588      0.010      -0.035      -0.005
intercept     1.312e-17      0.002   6.71e-15      1.000      -0.004       0.004
==============================================================================
Omnibus:                     1268.137   Durbin-Watson:                   1.939
Prob(Omnibus):                  0.000   Jarque-Bera (JB):            17834.085
Skew:                           3.199   Prob(JB):                         0.00
Kurtosis:                      16.983   Cond. No.                     1.63e+05
==============================================================================

Notes:
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
[2] The condition number is large, 1.63e+05. This might indicate that there are
strong multicollinearity or other numerical problems.
```



# 一线

```
医生有无简介          0.028711
总文章数            0.000182
患者满意度           0.000098
欢迎词字数           0.000855
字数平方           -0.000003
profession_1    0.627000
profession_2   -0.038959
profession_3   -0.060862
profession_4   -0.062257
profession_5   -0.078852
intercept       0.021470
dtype: float64
                            OLS Regression Results                            
==============================================================================
Dep. Variable:               log(IST)   R-squared:                       0.078
Model:                            OLS   Adj. R-squared:                  0.060
Method:                 Least Squares   F-statistic:                     4.345
Date:                Sat, 17 Apr 2021   Prob (F-statistic):           7.40e-06
Time:                        15:25:19   Log-Likelihood:                 489.88
No. Observations:                 524   AIC:                            -957.8
Df Residuals:                     513   BIC:                            -910.9
Df Model:                          10                                         
Covariance Type:            nonrobust                                         
================================================================================
                   coef    std err          t      P>|t|      [0.025      0.975]
--------------------------------------------------------------------------------
医生有无简介           0.0287      0.013      2.263      0.024       0.004       0.054
总文章数             0.0002      0.001      0.269      0.788      -0.001       0.002
患者满意度         9.813e-05   4.79e-05      2.048      0.041    3.99e-06       0.000
欢迎词字数            0.0009      0.000      3.791      0.000       0.000       0.001
字数平方         -2.966e-06   9.24e-07     -3.211      0.001   -4.78e-06   -1.15e-06
profession_1     0.6270      4.498      0.139      0.889      -8.210       9.464
profession_2    -0.0390      0.015     -2.517      0.012      -0.069      -0.009
profession_3    -0.0609      0.028     -2.203      0.028      -0.115      -0.007
profession_4    -0.0623      0.015     -4.151      0.000      -0.092      -0.033
profession_5    -0.0789      0.016     -4.917      0.000      -0.110      -0.047
intercept        0.0215      0.052      0.410      0.682      -0.081       0.124
==============================================================================
Omnibus:                      314.049   Durbin-Watson:                   1.990
Prob(Omnibus):                  0.000   Jarque-Bera (JB):             2579.413
Skew:                           2.578   Prob(JB):                         0.00
Kurtosis:                      12.569   Cond. No.                     2.19e+07
==============================================================================

Notes:
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
[2] The condition number is large, 2.19e+07. This might indicate that there are
strong multicollinearity or other numerical problems.
```

# 二线

```
医生有无简介         -0.013818
总文章数            0.000987
患者满意度           0.000315
欢迎词字数           0.001010
字数平方           -0.000004
profession_1    0.015091
profession_2   -0.023958
profession_3   -0.008493
profession_4   -0.005617
profession_5   -0.001877
intercept       0.002682
dtype: float64
                            OLS Regression Results                            
==============================================================================
Dep. Variable:               log(IST)   R-squared:                       0.082
Model:                            OLS   Adj. R-squared:                  0.071
Method:                 Least Squares   F-statistic:                     7.248
Date:                Sat, 17 Apr 2021   Prob (F-statistic):           4.95e-11
Time:                        15:25:26   Log-Likelihood:                 842.05
No. Observations:                 818   AIC:                            -1662.
Df Residuals:                     807   BIC:                            -1610.
Df Model:                          10                                         
Covariance Type:            nonrobust                                         
================================================================================
                   coef    std err          t      P>|t|      [0.025      0.975]
--------------------------------------------------------------------------------
医生有无简介          -0.0138      0.008     -1.715      0.087      -0.030       0.002
总文章数             0.0010      0.001      1.971      0.049     4.1e-06       0.002
患者满意度            0.0003      0.000      1.497      0.135    -9.8e-05       0.001
欢迎词字数            0.0010      0.000      6.864      0.000       0.001       0.001
字数平方         -4.144e-06   6.38e-07     -6.494      0.000    -5.4e-06   -2.89e-06
profession_1     0.0151      0.031      0.483      0.629      -0.046       0.076
profession_2    -0.0240      0.012     -2.014      0.044      -0.047      -0.001
profession_3    -0.0085      0.017     -0.508      0.612      -0.041       0.024
profession_4    -0.0056      0.012     -0.471      0.637      -0.029       0.018
profession_5    -0.0019      0.012     -0.153      0.879      -0.026       0.022
intercept        0.0027      0.003      0.803      0.422      -0.004       0.009
==============================================================================
Omnibus:                      580.787   Durbin-Watson:                   1.897
Prob(Omnibus):                  0.000   Jarque-Bera (JB):             7059.598
Skew:                           3.194   Prob(JB):                         0.00
Kurtosis:                      15.896   Cond. No.                     1.53e+05
==============================================================================

Notes:
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
[2] The condition number is large, 1.53e+05. This might indicate that there are
strong multicollinearity or other numerical problems.
```

# 其他

```
医生有无简介          5.232539e-03
总文章数            4.597325e-04
患者满意度           1.408618e-04
欢迎词字数           2.862017e-04
字数平方           -3.850220e-07
profession_1   -1.832719e-02
profession_2    1.590178e-02
profession_3   -4.596372e-03
profession_4    1.467249e-02
profession_5    1.805588e-02
intercept      -2.043300e-02
dtype: float64
                            OLS Regression Results                            
==============================================================================
Dep. Variable:               log(IST)   R-squared:                       0.105
Model:                            OLS   Adj. R-squared:                  0.085
Method:                 Least Squares   F-statistic:                     5.358
Date:                Sat, 17 Apr 2021   Prob (F-statistic):           1.67e-07
Time:                        15:25:28   Log-Likelihood:                 739.55
No. Observations:                 468   AIC:                            -1457.
Df Residuals:                     457   BIC:                            -1411.
Df Model:                          10                                         
Covariance Type:            nonrobust                                         
================================================================================
                   coef    std err          t      P>|t|      [0.025      0.975]
--------------------------------------------------------------------------------
医生有无简介           0.0052      0.005      0.959      0.338      -0.005       0.016
总文章数             0.0005      0.001      0.875      0.382      -0.001       0.001
患者满意度            0.0001      0.002      0.084      0.933      -0.003       0.003
欢迎词字数            0.0003      0.000      2.117      0.035    2.05e-05       0.001
字数平方          -3.85e-07   6.01e-07     -0.641      0.522   -1.57e-06    7.96e-07
profession_1    -0.0183      0.016     -1.145      0.253      -0.050       0.013
profession_2     0.0159      0.008      1.977      0.049    9.48e-05       0.032
profession_3    -0.0046      0.013     -0.350      0.726      -0.030       0.021
profession_4     0.0147      0.008      1.853      0.065      -0.001       0.030
profession_5     0.0181      0.010      1.863      0.063      -0.001       0.037
intercept       -0.0204      0.016     -1.316      0.189      -0.051       0.010
==============================================================================
Omnibus:                      253.834   Durbin-Watson:                   1.901
Prob(Omnibus):                  0.000   Jarque-Bera (JB):             1445.888
Skew:                           2.398   Prob(JB):                         0.00
Kurtosis:                      10.151   Cond. No.                     1.05e+05
==============================================================================

Notes:
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
[2] The condition number is large, 1.05e+05. This might indicate that there are
strong multicollinearity or other numerical problems.
```

