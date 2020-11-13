# AHA-R
Examine factor that affect number of beds and hospital size from American Hospital Association Annual survey 2017 (AHA).


# Introduction
Hospital size tend to reflect hospital’s scale and development, and associate with the hospital’s efficiency and patients’ satisfaction. There are many factors that could affect hospital’s size from various aspects. Understanding those factors could help owner of hospitals to adjust its size to meet needs and maximise efficiency. I conducted the following research questions: 1) Is there a relationship between number of beds and total number of days patients spent in hospital per year (TDPSH)? We assume more patients and more days they stay in hospital, the hospital will be larger to accommodate them. 2) Does the type of organization that owns the hospital (TYPE) associate with hospital size? The type of organization may possess different funding and needs for hospital, and thus affecting hospital scale. 3) Does having a rural referral center(RRC) affect hospital size? I assume hospitals with rural referral center to be larger because of more needs in those centers.

# Methods
I choose a subset of the American Hospital Association Annual survey 2017(AHA) and use number of beds as response variable, which is commonly used to measure hospital size, total number of days patients spent in the hospital per year, the presence of rural referral center, and type of organization that owns the hospital. The final sample size is 2412 after missing data are excluded per the description of missing data in the codebook. Then I create a new category for factor version of RRC. I also create a variable dichotomising number of bed variable into “small hospitals” and “big hospitals” by 189, the average standard of bed numbers for a large hospital. I use one-sample t-test to test correlation between TDPSH and number of beds, chi-square and two-sample z-test to find whether TYPE affect hospital size, and two-sample t-test to explore whether the RRC influences number of beds.

# Results
From the linear model, we can conclude that there is a significant positive correlation between TDPSH and number of beds (F=9121, p<2e-16, slope=3.606e-03, see Table 2 in Appendix A). We also have significant evidence that there is a relationship between hospital size and TYPE (χ2=26.19, p=8.705e-06, see Table 1, 3 in Appendix A) from the chi-square t test. Then from the two-sample z-test, we further find that hospitals owned by for-profit organisations are less likely to possess hospitals of big size than church, non-profit organizations and state (χ2=14.716, 23.009, 3.8886, p=0.000125, 1.613e-06, 0.0486). For two-sample t test, we find the number of beds for hospitals with rurual referral center is significantly larger than those without (t=-4.53, p=8.453e-06, mean(without)=221, mean(with)=275, see Appendix A Table 4).

**Tables with descriptive statistics, tests of association, and p-values**

Table 1. Descriptive statistics for American Hospital Association Annual Survey 2017 [AHA]. N = 2412.
<img width="548" alt="Screenshot 2020-11-13 at 2 37 52 PM" src="https://user-images.githubusercontent.com/73702692/99037364-84629800-25be-11eb-8913-f46237f5e6ba.png">

Table 2. Linear regression results of bed numbers regressed on total number of days patients spend in hospital in the American Hospital Association Annual Survey 2017 (AHA). N = 2412.
<img width="557" alt="Screenshot 2020-11-13 at 2 42 21 PM" src="https://user-images.githubusercontent.com/73702692/99037371-875d8880-25be-11eb-8113-19401b10e84d.png">

Table 3. Chi-square results: small and big size hospital by organization type that owns the hospital. American Hospital Association Annual Survey 2017 (AHA). N = 2412.
<img width="550" alt="Screenshot 2020-11-13 at 2 38 16 PM" src="https://user-images.githubusercontent.com/73702692/99037377-89274c00-25be-11eb-9b32-e7fa2919a6c3.png">

Table 4. 2-sample t-test results: number of beds by presence of rural referral center. American Hospital Association Annual Survey 2017 (AHA). N = 2412.
<img width="548" alt="Screenshot 2020-11-13 at 2 38 24 PM" src="https://user-images.githubusercontent.com/73702692/99037385-8af10f80-25be-11eb-8215-dbc8cf3f4a3e.png">

**Bi-variate plots of Number of beds or Category of beds by total number of days patients spent in hospital, type of organization that owns hospital and the presence of rural referral center.**

Figure 1. Association between Total number of days patients spent in hospital and number of beds. American Hospital Association Annual Survey 2017 (AHA). N = 2412.
<img width="362" alt="Screenshot 2020-11-13 at 2 38 31 PM" src="https://user-images.githubusercontent.com/73702692/99037390-8cbad300-25be-11eb-9ebf-7e80e6d285b3.png">

Figure 2. Association between type of organization that owns hospital and hospital size. American Hospital Association Annual Survey 2017 (AHA). N = 2412.
<img width="478" alt="Screenshot 2020-11-13 at 2 38 39 PM" src="https://user-images.githubusercontent.com/73702692/99037397-904e5a00-25be-11eb-8d15-1e0a6c92895c.png">

Figure 3. Association between the presence of rural referral center and number of beds. American Hospital Association Annual Survey 2017 (AHA). N = 2412.
<img width="527" alt="Screenshot 2020-11-13 at 2 38 47 PM" src="https://user-images.githubusercontent.com/73702692/99037408-93494a80-25be-11eb-8ba7-d965e21a5d40.png">

# Discussion
From the result, we could further infer that 1) As there are more needs for patients to stay in hospital, the hospital will adjust its size to accommodate those needs. This correlates with common sense. 2) Different organizations with different needs and funding will have preference for hospitals of different sizes. It’s understandable that for-profit hospitals are usually owned by private owners, so they may be smaller. 3) Hospitals with a rural referral center tend to be larger to accommodate more patients and meet needs in rural areas. Moreover, from the plots in Appendix B we find three hospital outliers with over 2000 beds. The unusually large-scale hospitals could be explored further. However, sometimes number of beds can’t accurately reflect hospital size and scale so other factors like square footage may be included1.
