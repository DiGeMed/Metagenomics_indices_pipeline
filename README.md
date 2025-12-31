# Quantifiable Assessment Of Gut Microbiome <img src="gut_microbiome_logo.png" alt="Gut Microbiome Logo" width="200" height="200"/>

## In this project entitled “Quantifiable Assessment of Gut Microbiome,” a comprehensive approach was undertaken to develop and evaluate microbiome health indices using the curated MetagenomicData resource.

## Leveraging an automated data processing pipeline, key health-related indices were systematically computed to quantify microbial dysbiosis and overall gut health status. To interpret the contributions of these indices to disease prediction models, advanced explainable artificial intelligence techniques, namely LIME and SHAP, were applied.



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



### 3. `README.md`

*This file. Explains project and folder contents.*
