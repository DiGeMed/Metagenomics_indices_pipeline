# Quantifiable Assessment Of Gut Microbiome <img src="gut_microbiome_logo.png" alt="Gut Microbiome Logo" width="200" height="200"/>

## In this project entitled “Quantifiable Assessment of Gut Microbiome,” a comprehensive approach was undertaken to develop and evaluate microbiome health indices using the curated MetagenomicData resource.

## Leveraging an automated data processing pipeline, key health-related indices were systematically computed to quantify microbial dysbiosis and overall gut health status. To interpret the contributions of these indices to disease prediction models, advanced explainable artificial intelligence techniques, namely LIME and SHAP, were applied.

## Directory Structure

The project is organized as follows:

### 1. `METHODOLOGY/`

*Description of the methodology, approaches used, and detailed workflows.*

-   **Subfolders:**
    -   CuratedMetagenomicDatabase

    -   DATA

    -   HACK_Code_Analysis

    -   Health_indices_pipeline

    -   LIME AND SHAP

    -   Mlxtrend and Learning Curve

    -   Q2PD

    -   ROC curve

## Subfolders

### 1. CuratedMetagenomicDatabase

-   **Description:**\
    Contains curated gut microbial datasets used for analysis.

-   **Scripts:**

    -   batch_processing_score_data.R:

        -   it can eaily calculate the health indices of large taxonomic files by dividing into chucks.
        -   Then, compile it into one csv output file.

    -   disease_ratio_each_study.R:

        -   finds the study wise disease sample count data from metadata.
        -   give output in csv file.

    -   extraction_from_curated_metagenomic_datasets.R:

        -   extract all gut microbiome data by taking only stool samples from adult (age\>18).
        -   give output in csv format.

    -   Phenotype_counts_process.R:

        -   filter sample data based on phenotypic disease wise sample count
        -   give output in csv format

    -   plot_study_wise_data.R:

        -   plots study-wise data stacked bar graph.

### 2. DATA

-   **Description:**\
    Containing datasets of CuratedMetagenomicData taxnomic files of gut microbiomes.

-   **Inputs:**\
    Raw data files, phenotype tables, and sample metadata.

### 3. HACK_Code_Analysis

-   **Description:**\
    Scripts and notebooks for calculating the HACK Index.

-   **Inputs:**

    -   Specific RData files are provided in the data files folder along with the script folder
    -   Scripts folder, such as CS, SS, HS, are the main ones to generate to get HACK scores

-   **How to Run:**

    -   Navigate to the desired script folder and run analysis scripts.

-   **Output:**

    -   Output of results will be in the form of R dataframes and can be saved in CSV files.

### 4. Health_indices_pipeline

-   **Description:**\
    Pipeline for calculating health indices based on microbiome data.

-   **Pipeline Flowchart:**

    ![[***Health Indices Flowchart***]{.underline}](RESULTS/Flowchart_Health_Indices.png)

-   **Inputs:**\
    Species abundance tables, clinical metadata.

-   **How to Run:**

    -   Open the Indices_output.R file to run the pipeline.
    -   If the taxonomic profile is large, then use the batch_processing script, present in CuratedMetagenomicData

-   **Output:**\
    Calculated health indices CSV output file.

### 5. LIME AND SHAP

-   **Description:**

    -   Interpretability analyses using LIME and SHAP methods on predictive models. - Here used Random Forest to implement the LIME and SHAP.

-   **Inputs:**

    -   curated_score_data_final.csv

-   **How to Run:**

    -   Jupyter Notebook for generating interpretability reports.

-   **OUTPUTS**

    -   plots and evaluation metric in form of pdfs and table.

### 6. Mlxtrend and Learning Curve

-   **Description:**

    -   Scripts related to model training trends and learning curve evaluations.

-   **Inputs:**

    ```         
    -   curated_score_data_final.csv
    ```

-   **How to Run:**

    ```         
    -   Notebook with comments is there to implement the Mlxtrend
    ```

-   **OUTPUTS**

    -   give plots in pdf format.

### 7. Q2PD (q2-predict_dysbiosis)

-   **Description:**

    -   Latest 2025 health index to assess healthy vs diseased samples.

-   **Repository:**\
    For detailed code and usage, visit the [q2-predict-dysbiosis GitHub repository](https://github.com/Kizielins/q2-predict-dysbiosis).

-   **Inputs:**\
    Stratified and Unstratified Pathway abundance tables and sample metadata.

-   **How to Run:**

    -   Process the input data from curatedMetagenomicDatabase using data extraction.R script

    -   Then run the Q2PD_results.ipynb notebook to save the result dataframe.

    -   

        ## Finally, run q2pd_evaluation_plots_and_metrics to get the evaluation plots and table.

### 2. `PPT/`

*Presentation materials related to the project.*

-   **CANVA LINK**

    -   Contains the Link to the Presentation in the CANVA Platform.

------------------------------------------------------------------------

### 3. `README.md`

*This file. Explains project and folder contents.*

------------------------------------------------------------------------

### 4. `REPORT/`

*Reports and documentation generated during the project.*

-   **Documents:**
    -   Quantifiable Assessment Of Gut Microbiome.pdf
    -   Quantifiable Assessment Of Gut Microbiome.docx
-   **Purpose:**
    -   Comprehensive progress report includes Introduction, Methodology, Results and References.

### 5. `RESEARCH PAPERS/`

*Collection research papers or publications relevant to the project.*

-   **Papers:**
    -   Contains all the relevant research papers related to Gut Microbiome.

------------------------------------------------------------------------

### 6. `RESULTS/`

*Contains result files and data outputs from analysis.*

-   **Data files:**
    -   Contains all the plots and pdfs of the results

------------------------------------------------------------------------

## Contact & Support

For questions, issues, or collaboration, please contact:\
- Harshil Walia - Email: [harshil21walia\@gmail.com](mailto:harshil21walia@gmail.com){.email}\
- GitHub: [Harshilwalia777](https://github.com/Harshilwalia777)

------------------------------------------------------------------------

## License

Specify the license terms if applicable.

------------------------------------------------------------------------

*This README was generated to provide clear guidance for users and collaborators. Fill in details in each section to ensure completeness and clarity.*

*Last updated: 2025-08-24 23:19:28*\
Automated update to README.md file.

------------------------------------------------------------------------

*Last updated: 2025-08-25 11:47:53*\
Automated update to README.md file.

------------------------------------------------------------------------

*Last updated: 2025-08-25 12:31:49*\
Automated update to README.md file.
