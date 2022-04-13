# Taxa Bar plots form Plyloseq Data
# Andrew McCracken
# 3/30/22

setwd("/Users/blairchristensen/Downloads/Seastar1221")

# Load Libraries (idk if you need them all but here we go) 
library(microbiome)
library(phyloseq)
library(qiime2R)
library(knitr)
library(kableExtra)
#  install.packages("remotes")
remotes::install_github("gmteunisse/Fantaxtic")
library("devtools")
#install_github("joey711/phyloseq")
#install_github("microbiome/microbiome")
#install_github("jbisanz/qiime2R")
#install_github("FrederickHuangLin/ANCOMBC")
#install_github("GeoBosh/rbibutils")
library(phyloseq)
library(remotes)
library(fantaxtic)
library(reshape2)

# import phyloseq files
physeq_all<-qza_to_phyloseq(
  features="table.qza",
  tree="rooted-tree.qza",
  taxonomy="taxonomy.qza",
  metadata = "pyc_manifest")

#Filter to Family Level
filter_fam <- tax_glom(physeq_all, "Family")
filter_ord <- tax_glom(physeq_all, "Order")


##### Merging samples into Groups before merging for relative abundance ####
# phyloseq object sample_data need to be coerced to a numeric class before running the merge.
# https://github.com/joey711/phyloseq/issues/663
df <- as.data.frame(lapply(sample_data(filter_fam),function (y) if(class(y)!="factor" ) as.factor(y) else y),stringsAsFactors=T)
row.names(df) <- sample_names(filter_fam)
sample_data(filter_fam) <- sample_data(df)

df_ord <- as.data.frame(lapply(sample_data(filter_ord),function (y) if(class(y)!="factor" ) as.factor(y) else y),stringsAsFactors=T)
row.names(df_ord) <- sample_names(filter_ord)
sample_data(filter_ord) <- sample_data(df_ord)


#run merge
physeq_merge <- merge_samples(filter_fam, "site.animal.health")
physeq_merge_ord <- merge_samples(filter_ord, "site.animal.health")



# OR Randomly sample 4 from each SAH Group



#normalize AFTER merging
norm_abund_fam <- transform_sample_counts(physeq_merge, function(x) x / sum(x))
norm_abund_ord <- transform_sample_counts(physeq_merge_ord, function(x) x / sum(x))


#Filter top taxa
#https://rdrr.io/github/gmteunisse/Fantaxtic/man/get_top_taxa.html
top_tax_merge <- get_top_taxa(norm_abund_fam, 15, relative = TRUE, discard_other = FALSE, other_label = "Other")

top_tax_merge_ord <- get_top_taxa(norm_abund_ord, 15, relative = TRUE, discard_other = FALSE, other_label = "Other")


###### Plot #####
plot_bar(top_tax_merge, "site.animal.health", "Abundance", fill="Family")
plot_bar(top_tax_merge_ord, "site.animal.health", "Abundance", fill="Order")


# if you want to get rid of black bars
p <- plot_bar(top_tax_merge, "site.animal.health", "Abundance", fill="Family")
p + geom_bar(aes(color=Family, fill=Family), stat="identity", position="stack")









