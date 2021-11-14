# Revision

## Editor

> Thank you for the submission. Your manuscript has been examined by three expert reviewers. 
> Two of the reviewers raised some significant concerns regarding the manuscript that can only be addressed by additional analyses and work. 
> In particular, please pay special attention to the comment by reviewer #3, as follows:
> "In addition to the two peptidome studies used by the authors, many comprehensive immunopeptidomes are available for analysis. 
> For example, the NIH Immune Epitiope Database and Analysis Resource lists several hundred studies with many hundreds of thousands of epitopes. 
> A detailed analysis of the frequency of TMH in experimentally determined MHC-I and MHC-II peptidomes (rather than predicted binders) 
> could provide the information sought by the authors."
> Should you decide to revise the manuscript and resubmit, 
> please make sure that you address all of the reviewer's concerns in the interactive forum. 
> If you need additional time for the revision, please feel free to let me know.

We thank you for your help and the reviewers' feedback. Below we address all reviewers' comments.

First and foremost, it is clear something had gone wrong with the figures 
and their corresponding legends.
This must have been horrible for the reviewers!
Instead of assuming everything 'just works', 
we have double-checked the latest version of the manuscript,
as well as the new submission.

As requested, we have added another source of data for naturally occurring epitopes, 
which is the IEDB (the Immune Epitope Database), resulting in a rewrite of paragraph 2.2 ('Peptide Elution Studies')
and an new figure 2. The collection of this new data was the main reason for needing 
the extended amount of time. The added IEDB data strengthened the message of this paper.

## Reviewer 1

> Interactive review activated: 26 Sep 2021
> This Reviewer withdrew from the peer-review of this manuscript and independent review report is not submitted. 

## Reviewer 2

 * Independent review report submitted: 04 Sep 2021
 * Recommendation for the Editor: The manuscript can be accepted 

> The manuscript entitled "Transmembrane helices are an overlooked and 
> evolutionarily conserved source of major histocompatibility complex class I 
> and II epitopes" by R.J.C. Bilderbeek et al. reports a rigorous bioinformatics 
> analysis with the aim to address two key questions in the field of antigen 
> presentation. This work is a continuation of their previous work on the 
> over-presentation of transmembrane helices (TMH)-derived epitopes by MHC class 
> I molecules (Fornt. Immunol. 20017), which is now extended to the MHC-II class. 
> Their key finding is that TMH-derived epitopes irrespective of the origin 
> of the protein, are presented more often for almost all human MHC-I and MHC-II 
> haplotypes. An additional analysis of single nucleotide polymorphisms (SNPs) 
> in the human proteome supports previous observations that TMHs are evolutionary 
> more conserved than soluble protein domains, an observations that underpins 
> the evolutionary advantage of their key finding.

> The bioinformatics analysis has been performed using suitable methodology 
> as clearly described in the text and the supporting information, and the 
> statistical methods are correct. In fact, I find that the statistical analysis 
> and cutoffs used in this study give rise to more realistic observations 
> about the conservation score of TMHs than previous reports. Thus the 
> observations drawn are supported by their analysis to the extent displayed 
> by the statistics. The manuscript is very well written, in a concise but 
> comprehensive manner, and the quality of the figures is fine. It should be 
> noted that Fig. 2 was not included in the manuscript, probably due to a 
> mislabeling of Fig. 3-4. This should be corrected, although the exact numbers 
> can be found in Table S6.

> Overall, the work is of high quality and has the merit of a very interesting 
> notion that the field might have overlooked. Thus, albeit the work is not 
> characterized by high level of novelty, I endorse its publication in 
> Frontiers in Immunology with the hope that it will set the basis for 
> further research in the field of antigen presentation.

Thanks for the appreciation of our work!

### Minor comments:

> The authors might want to comment on their observation that a lower percent 
> of variability is explained by the hydrophobicity score of TMH-derived 
> epitopes in MHC-II than in MHC-I, with regard to the discussion in section 4.2

@Frans: deze vind jij denk ik mooi om te doen!

> L. 64: "[6] found that" can be written as "S. Tang et al. [6] found that"

Thanks, we changed the LaTeX to:

> For example, S. Tang et al. \cite{tang2011genome} found that, 

## Check List

> a. Is the quality of the figures and tables satisfactory?
> - Yes

Great!

> b. Does the reference list cover the relevant literature adequately and in an unbiased manner?
> - No

We regret this verdict and hope that the addition of the feedback
as given by the reviews resulted in a more unbiased literature list. 

> c. Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
> - Yes

Great!

> d. Are the methods sufficiently documented to allow replication studies?
> - Yes

Great!

# Reviewer 3

 * Independent review report submitted: 23 Sep 2021
 * Interactive review activated: 26 Sep 2021
 * Recommendation for the Editor: Substantial revision is required

> Bilderbeek et al investigate the role of transmembrane helices as sources for 
> class I and class II MHC epitopes. This is an interesting question in 
> MHC protein biology, with important implications for epitope prediction, 
> vaccine design, and understanding of intracellular antigen processing and 
> presentation pathways.

First and foremost, something must have gone wrong with the figures 
and their corresponding legends.
This must have been horrible for you (and the other reviewers)!

Instead of assuming everything 'just works', 
we have double-checked the latest version of the manuscript 
while processing all feedback,
as well as the new Frontiers submission 
(see https://github.com/richelbilderbeek/bbbq_article/issues/236).

> 1) The authors claim to have shown that transmembrane helices (TMH) are 
> important sources of MHC class I and class II epitopes. But they have not 
> analyzed actual MHC epitopes, only predicted epitopes generated by 
> MHC-peptide binding prediction algorithms. As pointed out repeatedly by the 
> authors, both MHC-I and MHC-II proteins are well-known to bind hydrophobic
> peptides, and this is reflected in the prediction algorithms. What the 
> authors have shown is that TMH are important sources of predicted epitopes. 
> Whether or not such peptides actually are processed, presented at the cell 
> surface, and recognized by T cells, has not been investigated. TMH might or 
> might be processed into peptide efficiently, they might or might not be 
> loaded well by the various MHC-I and MHC-II machinery, etc. The analyses of 
> how epitope prediction favors TMHs is interesting but only part of 
> the question.

Although the main focus in our works is on the predictions,
we now additionally show that epitopes taken from the IEDB
database are likelier to be TMH-derived.
We did this for epitopes that were obtained from an MHC assay (figure 2),
illustrating that indeed these peptides are presented on the surface of cells. 
Furthermore, we  mined the IEDB database for epitopes that evoke T-cell 
responses (as shown in figure S3), which are also likelier to be
derived from TMHs. 

Lastly, we correlated the percentage of TMH-derived epitopes
taken from 9-mers (for MHC-I) and 14-mers (for MHC-II) from
a human reference proteome, with these percentages as obtained
from the IEDB (as shown in figure S2), indicating that
our findings are robust.

> The authors do present an example of TMH that are known to be presented by 
> MHC-I and MHC-II, from two peptide elution studies. These data indeed appear 
> to show that TMH are found among the eluted peptides (“appears” because the 
> figure is missing). However, the authors do not provide any analysis of 
> whether the frequency of such epitopes is more or less than would be 
> expected by chance, as they do in detail for the predicted epitopes, just 
> the presence of TMH-derived epitopes in the peptidome is noted.

As discussed in the response above, we replaced the epitopes obtained
from two elustion studies by epitope sequences from the IEDB.
However, we cannot have an a priori prediction of how many IEDB epitopes
are presented, due to many biases in the IEBD protocols,
among others that hydrophobic peptides don't fly well in mass spectronomy,
are thus less likely to be sequenced,
and are thus less likely to be in the IEBD.

Bagag A, Jault J-M, Sidahmed-Adrar N, Réfrégiers M, Giuliani A,
Le Naour F. Characterization of hydrophobic peptides in the presence of
detergent by photoionization mass spectrometry. PLoS One (2013) 8:e79033.
doi:10.1371/journal.pone.0079033
26. Schindler PA, Van Dorsselaer A, Falick AM. Analysis of hydrophobic
proteins and peptides by electrospray ionization mass spectrometry. Anal
Biochem (1993) 213:256–63. doi:10.1006/abio.1993.1418

The reviewer is right that we do not show any statistics here
and we are happy this omission was spotted.
However, unlike most omitted statistics tests, this would be an exception
when adding a statistical test would not make sense.

To clarify, we considered adding the text below to describe the statistical test:

We used a binomial statistical test to determine if more TMH-derived epitopes 
are presented than expected, with the number of epitopes being the number of trails,
the number of TMH-derived epitopes being the number of successful trials,
for a estimated chance of success of zero. This resulted in highly significant values,
indicating there were significantly more TMH-derived epitopes presented than expected.
 
We still feel it would be better to leave out this trivial statistics test, 
as it sets readers on the wrong foot: any binomial test with a chance of a successful trial, p, of zero 
(in R code: binom.test(x = 109, n = 7897, p = 0.0)) always results in a p value of zero.

> In addition to the two peptidome studies used by the authors, 
> many comprehensive immunopeptidomes are available for analysis. For example, 
> the NIH Immune Epitope Database and Analysis Resource lists several hundred 
> studies with many hundreds of thousands of epitopes. A detailed analysis of 
> the frequency of TMH in experimentally determined MHC-I and MHC-II peptidomes 
> (rather than predicted binders) could provide the information sought by 
> the authors.

The reviewer is right that we took two studies into account, where there
are plenty. For both MCH-I and MHC-II, we simply took the first study
we found on Google Scholar, as all we wanted to know was whether
TMH-derived epitopes would be presented at all.

As requested, we have the suggested source of data for naturally occurring epitopes, 
which is the IEDB (the Immune Epitope Database), resulting in a rewrite of paragraph 2.2 ('Peptide Elution Studies')
and an new figure 2. The added data strengthened the message of this paper.

> There are other major issues:

> 2) The figures are numbered incorrectly and don’t correspond to the text. 
> Figure 1 matches its legend, but Figure 2 appears to be missing. 
> Figure 3 legend appears to correspond to Figure 2.TIF but with the panels 
> scrambled. Figure 4 legend appears to correspond to Figure 3.TIFF, but the 
> bold red line on each plot is not described, and indicated confidence 
> intervals are missing.

We are sorry: the mismatch between legends and figures must have been horrible
for the reviewer! This time we double-check our Frontiers upload, instead
of assuming everything 'just works' [1].

The scrambled TIFFs are double-checked as well [2]

The red lines were indeed not described, as the legend was written for a 
black-and-white version of the tables. We have ensured these match now [3].

 * [1] https://github.com/richelbilderbeek/bbbq_article/issues/236
 * [2] https://github.com/richelbilderbeek/bbbq_article/issues/231
 * [3] https://github.com/richelbilderbeek/bbbq_article/issues/232
 
> 3) A key message from this would appear to be that TMH sequences are 
> overlooked as a source of MHC-I and MHC-II epitopes, but this statement is 
> not supported by any data. There are many published instances of TMH 
> sequences as MHC-I epitopes, as noted by the authors themselves in their 
> peptidome analysis. HLA-E is well-known to bind signal sequence peptides, 
> which are a type of TM sequences.

The key message of the paper that TMH are an overlooked source MHC-I and MHC-II epitopes comes from the fact that we predict that due to the hydrophobic nature of TMH, peptides derived from TMH make good binders for the majority of MHC alleles. Literature on TMH derived epitopes however is scarce, indeed for a specific class of TMH peptides signal peptides, mechanistic insights have been acquired, however for general polytopic trans membrane helices we have no understanding how they are processed for presentation on MHC, though we show that peptidome analysis reveals they are presented. 

> 4) It is claimed that both that data suggest that both cytolytic and 
> helper T cells respond to more to membrane proteins, but no T cell data at 
> all are considered or analyzed. Presentation of MHC-I and MHC-II bound 
> peptides is related to T cell responses, presentation does not imply T 
> cell response because T cell selection has not been considered. If TMH 
> sequences are highly conserved across organisms, and such TM-peptides are 
> highly represented in thymic epithelium, one might expect that TM-specific
> T cells would be deleted or tolerized. So TMH-specific responses might be 
> promoted or suppressed by increased TM peptide presentation.

We agree although T-cell responses against TMH derived epitopes have been reported we have no indication if more T-cells respond to membrane proteins than expected.
We adapted the text to the following:
"Our bioinformatics predictions indicate that the TMH-derived epitope repertoire is larger than expected by chance, regardless of the organism. Furthermore we see despite the bias towards hydrophilic peptides due to their enhanced ionization in mass spec that in several peptide elution studies still a higher fraction of TMH derived epitopes is found than predicted by chance. Therefor it's tempting to speculate that this would also result in enhanced T-cell responses, assuming that the conservation of TMH's across organisms does not effect the deletion of such T-cells by central tolerance mechanisms."

> Also some parts of manuscript are confusing:

> 5) The use of MHC haplotype to refer to a particular MHC allele is 
> incorrect and confusing. An MHC haplotype is a set of HLA genes present on 
> a single chromosome and therefore genetically linked. The peptide binding 
> molecules are called MHC proteins or HLA gene products or (less 
> frequently) MHC allotypes.

We agree that there has been a mix up of nomenclature and have modified the manuscript accordingly. 

> 6) The authors search for the “physiological reason” why peptides derived 
> from TMHs are frequently presented is puzzling, as they state that it 
> is already known that MHC protein prefer hydrophobic peptide and TMHs 
> are hydrophobic. This would appear to be the reason. They seem to be asking
> how the preference of MHCs to bind TMHs impacts MHC cellular and 
> immunological function and evolution, but those are consequences, not reasons.

Although we understand this reasoning we do not agree, first of all the fact that a peptide is hydrophobic does not mean it stems from a trans membrane helix. Second as the affinity of a peptide for MHC is generated by a few residues, there preference is not a prediction for the overall hydrophobic preference of the allele. Indeed it was previously reported that MHC-I in general seems to have a slight preference for hydrophobic residues, however their correlation with TMH was not yet addressed nor the consequences for the cellular and immunological function and evolution. 

> 5) The section on T cells recognizing different parts of an immunogenic 
> protein than B cells is confusing and unnecessary since this is already 
> well appreciated.

We agree with the reviewer that this is a well known phenomena stated in many text books. 
A consequence of TMH over representation is that the discrepancy between BCR epitopes and TCr epitopes is enhanced due to the fact that BCR's are unable to recognize TMH epitopes, however we agree that this information is not of significant importance and therefor removed the section.  

Although it's well known that T cells and B Cells seem to predominantly recognize different protein regions,this is enhanced by the over-presentation of TMH-derived epitopes, as TMH's buried in the lipid bilayer are unlikely to be recognized by BCR's. 



> 6) Finally, the analyses of chance versus observed epitopes do not include 
> any uncertainly estimates.

We have added the uncertainty estimates.

## Check List

> a. Is the quality of the figures and tables satisfactory?
> - No

We hope this is fixed now.

> b. Does the reference list cover the relevant literature adequately and in an unbiased manner?
> - Yes

> c. Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
> - No

We hope this is fixed now.

> d. Are the methods sufficiently documented to allow replication studies?
> - Yes


# Reviewer 4

 * Independent review report submitted: 26 Sep 2021
 * Interactive review activated: 26 Sep 2021
 * Recommendation for the Editor: The manuscript should be rejected

> This reviewer recommended rejection of the manuscript on 26 Sep 2021. Discussions for this review are closed.
> Reason:
> 
> The manuscript contains fundamental errors that cannot be rectified through author revisions.
> Note to the authors:
> 
> The authors have shown that TMH/TMP should be overrepresented in 
> MHC-associated peptidomes. However, they are overestimating the contribution 
> of these structures in the ligand generation considering that, in some cases, 
> the contribution of one residue of the TMH to the ligand is almost 
> anecdotic even more if this contribution mainly affects N or C-terminal 
> positions and not in anchor positions. To state that TMH are overrepresented 
> in the MHC peptidome, the authors should have considered at least a 
> minimum length where part of the TMH sequence binds to the main or 
> secondary positions of MHC allele.

##  EVALUATION

> 1. There is a confusion, authors are working with allotypes instead 
> haplotypes. They are considering the protein expressed by one HLA allele, 
> so it is allotype or allomorph. For instance: HLA-A*02:01, HLA-B*27:05. 
> The only If they were considering haplotypes, they must notice that an 
> MHC haplotype considers a combination of more than one gene; i.e the DQ2.5, 
> DQ2.2 and DQ7.5, in this case each haplotype is a combination of two 
> specific alleles derived from DQA and/or DQB.

We agree that there has been a misconception in nomenclature and corrected the manuscript accordingly. 

> 2. Why the authors stated that MHC alleles are slightly hydrophobic? Some 
> of the allotypes they used are highly hydrophilic because they have highly 
> polarized anchor positions.

First, we assume that it was meant whether MHC alleles prefer epitopes
being hydrophobic (as an MHC allele is a piece of DNA),
however, we are unsure whether we interpret the question correctly.

Assuming the question is why we state that MHC alleles prefer epitopes
being hydrophobic, we feel that figures 1A and 1B demonstrate
that most MHC alleles have a positive hydrophobicity score.

> 3. It is not clear how the authors chose the MHC-I allotypes? It is 
> explained only for MHC-II alleles. I assume for their representation 
> in the population.

We agree that this can be more clearly stated and revised the text to the follwing: Both MCH-I and MHC-II alleles were selected to have a high occurrence,
where the alleles of the MHC-I haplotypes are the alleles representing the 13 supertypes 
with over 99.6\% coverage of the populations MHC-I repertoire as defined by [1, 2]
and the 21 MHC-II haplotype alleles, have a phenotypic frequency 
of 14\% or more in the human population [3].

 * [1] Lund, O., Nielsen, M., Kesmir, C. et al. Definition of supertypes for HLA molecules using clustering of specificity matrices. Immunogenetics 55, 797–810 (2004). https://doi.org/10.1007/s00251-004-0647-4
 * [2] Sette, A., Sidney, J. Nine major HLA class I supertypes account for the vast preponderance of HLA-A and -B polymorphism. Immunogenetics 50, 201–212 (1999). https://doi.org/10.1007/s002510050594
 * [3] Greenbaum, Jason, et al. "Functional classification of class II human leukocyte antigen (HLA) molecules reveals seven different supertypes and a surprising degree of repertoire sharing across supertypes." Immunogenetics 63.6 (2011): 325-335.

> 4. Is it significant the overlapping of one residue for MHC binding? 
> Why not consider only those peptides that are really predicted and 
> analyze them if they are really found in experimental data? Contribution 
> of one residue of the TMH to the ligand is almost anecdotic even more 
> if this contribution mainly affects N or C-terminal positions. 
> It is logically to see these residues located near outside the lipid
> bilayer because they are more “available” to be processed independently 
> of what the mechanistic process is. It would be nice to saw how the 
> TMH contributes to every position of the ligand predicted compared to 
> those experimentally confirmed.

The residue overlap was chosen on the basis of cellular mechanisms, the term TMH epitope has not been defined on the basis of the majority of amino acids stemming from a Trans membrane helix, but the fact that translocation of the TMH from the membrane is required for presentation. One residue stemming from a TMH segment is already has implications on the mechanistic by which the protein was proteolytically processed. Besides the definition of defining something as a TMH does not alter the result, as increasing the overlap equally reduces the chance that an epitope stem from a TMH. 
To prove this point, we did exactly the same analysis as shown in Figure 2a,
yet with defining a TMH-derived epitope as an epitope that overlaps with a TMH
for at least 2 AAs, as shown in Figure S16. As these two figures look identical (they are not), 
we also added the counts as numbers, with Table S14 showing the same data as S5, except the former uses 2 AAs overlap. Likewise, Table S15 showing the same data as S7, except the former uses 2 AAs overlap.

> 5. The latter point is also more relevant to the case of MHC-II, 
> where the anchor positions are “internal” and the extremes are more 
> diverse and less conserved. Are the authors considering significant 
> to state that TMH are overrepresented if an MHC-II-derived peptide has 
> only one residue coming from a TMP/TMH which is almost “floating” in 
> extreme of the binding groove?

See earlier answer we have showed that altering the overlap does not change the result. 

> 6. To state that TMH are overrepresented in the MHC peptidome, the authors 
> should have considered at least a minimum length where part of the 
> TMH binds to the main or secondary positions of MHC allele.

See earlier answer we have showed that altering the overlap does not change the result. 

> 7. Considering that the predicted peptides of the TMH are hydrophobic, 
> are these values comparable to those obtained from peptide elution studies? 
> Is it well correlated of what we know about their peptide preferences of 
> each MHC in this study? There is no explanation of how MHC alleles with 
> polar binding preferences bind part of the TMH.

Indeed, the predicted peptides of TMHs are usually hydrophobic, 
yet we cannot compare these hydrophobicity values with 
those obtained from peptide elution studies directly, as peptide elution studies
use mass spectrometry to detect peptides. A known feature of this technique
is that hydrophobic peptides are less likely to be detected. As for the later point Membrane regions are often flanked by tryptophans followed by charged residues, as the lipid head groups are often polar, these charges stabilize the TMH in the membrane. In Bianchi. et. al. 2017 we showed mapped the distance of the predicted binders to the TMH regions and showed that for especially MHC alleles that bind polar regions a peak was found at the interface of TMH, showing that these structural requirements make preferred antigens. 

> 8. Conservation of the TMH, or it is lack of variation, has been documented 
> many years ago by different biochemical experiments and it is mainly 
> explained by the nature of the few amino acids that can compose the 
> hydrophobic helix. However, the authors could try to explain if the SNPs
> identified by them could affect the presentation of some predicted or 
> experimental epitopes.

We agree with the reviewer that it is an interesting point to see if a 
certain SNP results in a TMH being absent or presented, as we actually 
tried that idea for a short time ourselves [1]. We abandoned this approach,
as this was beyond the goal of finding if TMHs are evolutionary conserved,
not of the consequences of a mutation. We do agree that this may be a nice follow-up study,
yet, we have experienced this idea -as far as we came- became computationally intractable!

 * [1] https://github.com/richelbilderbeek/bbbq_article/blob/v1.1/p_transition/create_dataset.R

> 9. Figure 2 has not explanation of what it is included in each graph. 
> Which one is from MHC-I? MHC-II? Is all together?

We can imagine one glosses over a legend if there is a mismatch between 
figures and legend. We have checked and it is there; here is a literal copy-paste:

'(B-C)  Correlation  between  the  percentages  of 
predicted  TMH-derived  epitopes  and  the  hydrophobicity  score  of  all  predicted 
epitopes  for  MHC-I  (B)  and  MHC-II  haplotypes  (C).  Diagonal  line:  linear 
regression  analysis.  Labels  are  shorthand  for  the  HLA  haplotypes,  see  the 
supplementary Table S8 for the names.'

> 10. There is no Figure 4 in the manuscript.

As already noted, something must have gone wrong with the figures.

We agree that this is unacceptable and we will check again upon our next submission.

> 11. This study would give more information if it was based on all the 
> experimental data available in public databases, as IEDB, instead the 
> proteome and predictive algorithms. I think authors must analyze the data 
> using a more immunologically point of view.

As requested, we have added another source of data for naturally occurring epitopes, 
which is the IEDB (the Immune Epitope Database), resulting in a rewrite of paragraph 2.2 ('Peptide Elution Studies')
and an new figure 2. The added data strengthened the message of this paper.

## Check List

> a. Is the quality of the figures and tables satisfactory?
> - No

We hope this is now fixed.

> b. Does the reference list cover the relevant literature adequately and in an unbiased manner?
> - Yes

> c. Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
> - Yes

> d. Are the methods sufficiently documented to allow replication studies?
> - Yes

