# Revision

 * R: Richel
 * F: Frans Bianchi
 * M: Maxim Baranov
 * G: Geert van den Bogaart

R: First, something must have gone wrong with the figures at the
Frontier back-end, as the paper is automatically rebuilt
from LaTex to PDF by a continuous integration script,
with the current latest version at 
https://github.com/richelbilderbeek/bbbq_article/releases/tag/v1.6.

## Editor

> Thank you for the submission. Your manuscript has been examined by three expert reviewers. Two of the reviewers raised some significant concerns regarding the manuscript that can only be addressed by additional analyses and work. In particular, please pay special attention to the comment by reviewer #3, as follows:
> "In addition to the two peptidome studies used by the authors, many comprehensive immunopeptidomes are available for analysis. For example, the NIH Immune Epitiope Database and Analysis Resource lists several hundred studies with many hundreds of thousands of epitopes. A detailed analysis of the frequency of TMH in experimentally determined MHC-I and MHC-II peptidomes (rather than predicted binders) could provide the information sought by the authors."
> Should you decide to revise the manuscript and resubmit, please make sure that you address all of the reviewer's concerns in the interactive forum. If you need additional time for the revision, please feel free to let me know.

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

TODO: Add to manuscript

 * [ ] @Frans: you want to add this?
 * [ ] @Geert: you want to add this?
 * [ ] @Maxim: you want to add this?

> L. 64: "[6] found that" can be written as "S. Tang et al. [6] found that"

Thanks, we changed the LaTeX to:

> For example, S. Tang et al. \cite{tang2011genome} found that, 

## Check List

> a. Is the quality of the figures and tables satisfactory?
> - Yes

Great!

> b. Does the reference list cover the relevant literature adequately and in an unbiased manner?
> - No

TODO: How to solve this?

 * [ ] @Frans: ideas?
 * [ ] @Geert: ideas?
 * [ ] @Maxim: ideas?

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

We completely agree that the paper does not prove that TMH-derived epitopes
are presented in vivo. We think that our in silico experiments do encourage 
to actually do such in vivo work (or the other way around: 
would our in silico experiments have found 
that TMH-derived are unlikely to be be presented, in vivo work 
would be discouraged)

> The authors do present an example of TMH that are known to be presented by 
> MHC-I and MHC-II, from two peptide elution studies. These data indeed appear 
> to show that TMH are found among the eluted peptides (“appears” because the 
> figure is missing). However, the authors do not provide any analysis of 
> whether the frequency of such epitopes is more or less than would be 
> expected by chance, as they do in detail for the predicted epitopes, just 
> the presence of TMH-derived epitopes in the peptidome is noted.

The reviewer is right that we do not show any statistics here;
we were simply already convinced that 1.3% (for MHC-I) and 3.9% (for MHC-II)
of the in vivo presented epitopes to be of (predicted) TMH origin,
as the expected percentages would be zero percent.
We agree with the reviewer and we did [some statistical tests]

 * [R]: do this

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

Although the NIH Immune Epitope Database and Analysis Resource is a great 
resource, we [?]

[R: well, we can do some more, but then the question is how much more we should
do?]

 * [ ] @Frans: ideas?
 * [ ] @Geert: ideas?
 * [ ] @Maxim: ideas?

There are other major issues:

> 2) The figures are numbered incorrectly and don’t correspond to the text. 
> Figure 1 matches its legend, but Figure 2 appears to be missing. 
> Figure 3 legend appears to correspond to Figure 2.TIF but with the panels 
> scrambled. Figure 4 legend appears to correspond to Figure 3.TIFF, but the 
> bold red line on each plot is not described, and indicated confidence 
> intervals are missing.

First, something seems to have gone wrong at the back-end of the Frontiers
website, as the paper is automatically rebuilt
from LaTex to PDF by a continuous integration script,
with the current latest version at 
https://github.com/richelbilderbeek/bbbq_article/releases/tag/v1.6 .
Also, of course, we have taken the effort to re-order the figures correctly [1]
and that the TIFFs are valid [2]. 
Just to make sure, we will go through the data again.

We have also fixed the legends as suggested by the reviewer.

 * [R] Check TIFFs again
 * [R] Add legends

 * [1] https://github.com/richelbilderbeek/bbbq_article/issues/222
 * [2] https://github.com/richelbilderbeek/bbbq_article/issues/223

> 3) A key message from this would appear to be that TMH sequences are 
> overlooked as a source of MHC-I and MHC-II epitopes, but this statement is 
> not supported by any data. There are many published instances of TMH 
> sequences as MHC-I epitopes, as noted by the authors themselves in their 
> peptidome analysis. HLA-E is well-known to bind signal sequence peptides, 
> which are a type of TM sequences.

 * [ ] @Frans: ideas?
 * [ ] @Geert: ideas?
 * [ ] @Maxim: ideas?

> 4) It is claimed that both that data suggest that both cytolytic and 
> helper T cells respond to more to membrane proteins, but no T cell data at 
> all are considered or analyzed. Presentation of MHC-I and MHC-II bound 
> peptides is related to T cell responses, presentation does not imply T 
> cell response because T cell selection has not been considered. If TMH 
> sequences are highly conserved across organisms, and such TM-peptides are 
> highly represented in thymic epithelium, one might expect that TM-specific
> T cells would be deleted or tolerized. So TMH-specific responses might be 
> promoted or suppressed by increased TM peptide presentation.

 * [ ] @Frans: want to have a stab here?
 * [ ] @Geert: want to have a stab here?
 * [ ] @Maxim: want to have a stab here?

> Also some parts of manuscript are confusing:

> 5) The use of MHC haplotype to refer to a particular MHC allele is 
> incorrect and confusing. An MHC haplotype is a set of HLA genes present on 
> a single chromosome and therefore genetically linked. The peptide binding 
> molecules are called MHC proteins or HLA gene products or (less 
> frequently) MHC allotypes.

[R: I agree with the reviewer here. I assumed we used this incorrect
terminology as to match the previous paper. I would happily uses allele
here as well!]

 * [ ] @Frans: agree to use allele?
 * [ ] @Geert: agree to use allele?
 * [ ] @Maxim: agree to use allele?

> 6) The authors search for the “physiological reason” why peptides derived 
> from TMHs are frequently presented is puzzling, as they state that it 
> is already known that MHC protein prefer hydrophobic peptide and TMHs 
> are hydrophobic. This would appear to be the reason. They seem to be asking
> how the preference of MHCs to bind TMHs impacts MHC cellular and 
> immunological function and evolution, but those are consequences, not reasons.

[R: I guess we should supply the reasons why this is puzzling
more clearly, e.g. it will be hard for a hydrophobic epiptope to
be transported across a cell membran. I assume we do, yet apparently
not clearly enough]

 * [ ] @Frans: you want this one?
 * [ ] @Geert: you want this one?
 * [ ] @Maxim: you want this one?

> 5) The section on T cells recognizing different parts of an immunogenic 
> protein than B cells is confusing and unnecessary since this is already 
> well appreciated.

[R: I suggest to remove it then :-) ]

 * [ ] @Frans: you want this one?
 * [ ] @Geert: you want this one?
 * [ ] @Maxim: you want this one?

> 6) Finally, the analyses of chance versus observed epitopes do not include 
> any uncertainly estimates.

[R: I will do this one!]

 * [R] Do this

## Check List

> a. Is the quality of the figures and tables satisfactory?
> - No

[R: I will the one to hopefully fix this]

> b. Does the reference list cover the relevant literature adequately and in an unbiased manner?
> - Yes

> c. Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
> - No

[R: I will the one to hopefully fix this]

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

[R: Interesting point! As we work with alleles -and we should have used that
work instead of haplotype-, this is not a problem to address]

 * [ ] @Frans: agree?
 * [ ] @Geert: agree? 
 * [ ] @Maxim: agree? 

> 2. Why the authors stated that MHC alleles are slightly hydrophobic? Some 
> of the allotypes they used are highly hydrophilic because they have highly 
> polarized anchor positions.

[R: do we? I guess that the term 'MHC alleles' is already confusing, as
this is a piece of DNA. Assuming this to be 'MHC complex' instead, I see
no reason why these proteins would have a different hydrophobicity. 
Does anyone else know what the reviewer could mean here?]

 * [ ] @Frans: ideas?
 * [ ] @Geert: ideas? 
 * [ ] @Maxim: ideas? 

> 3. It is not clear how the authors chose the MHC-I allotypes? It is 
> explained only for MHC-II alleles. I assume for their representation 
> in the population.

We chose the MHC-I alleles based on our previous study [TODO: REF here],
which were chosen by [...]

 * [ ] @Frans: want to write this?
 * [ ] @Geert: want to write this?

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

[R: I feel the reviewer has his/her idea how to do this best, where we have
had ours. I admit I do not see how the reviewer wants to do this exactly.
I think we have chosen a clear definition with 'a TMH-derived epitope is
an epitope that has at least 1 amino acid overlapping with a TMH'
and we statistically test these are over-presented. I suggest to write the
reply down as such.]

 * [ ] @Frans: agree?
 * [ ] @Geert: agree?
 * [ ] @Maxim: agree?

> 5. The latter point is also more relevant to the case of MHC-II, 
> where the anchor positions are “internal” and the extremes are more 
> diverse and less conserved. Are the authors considering significant 
> to state that TMH are overrepresented if an MHC-II-derived peptide has 
> only one residue coming from a TMP/TMH which is almost “floating” in 
> extreme of the binding groove?

[R: I would say, similar to above: Yes!]

 * [ ] @Frans: agree?
 * [ ] @Geert: agree?
 * [ ] @Maxim: agree?

> 6. To state that TMH are overrepresented in the MHC peptidome, the authors 
> should have considered at least a minimum length where part of the 
> TMH binds to the main or secondary positions of MHC allele.

[R: don't we, with a minimum length of 1 amino acid overlapping?]

 * [ ] @Frans: agree?
 * [ ] @Geert: agree?
 * [ ] @Maxim: agree?

> 7. Considering that the predicted peptides of the TMH are hydrophobic, 
> are these values comparable to those obtained from peptide elution studies? 
> Is it well correlated of what we know about their peptide preferences of 
> each MHC in this study? There is no explanation of how MHC alleles with 
> polar binding preferences bind part of the TMH.

 * [ ] @Frans: want to do this one?
 * [ ] @Geert: want to do this one?
 * [ ] @Maxim: want to do this one?

> 8. Conservation of the TMH, or it is lack of variation, has been documented 
> many years ago by different biochemical experiments and it is mainly 
> explained by the nature of the few amino acids that can compose the 
> hydrophobic helix. However, the authors could try to explain if the SNPs
> identified by them could affect the presentation of some predicted or 
> experimental epitopes.

 * [ ] @Frans: want to do this one?
 * [ ] @Geert: want to do this one?
 * [ ] @Maxim: want to do this one?

> 9. Figure 2 has not explanation of what it is included in each graph. 
> Which one is from MHC-I? MHC-II? Is all together?

[R: I will fix this]

 * [ ] @Richel: TODO

> 10. There is no Figure 4 in the manuscript.

First, something must have gone wrong with the figures at the
Frontier back-end, as the paper is automatically rebuilt
from LaTex to PDF by a continuous integration script,
with the current latest version at 
https://github.com/richelbilderbeek/bbbq_article/releases/tag/v1.6 .

We agree that this is annoying and we will check again upon our next submission.

 * [ ] @Frans: could you check the final submission? 
 * [ ] @Geert: could you check the final submission? 
 * [ ] @Maxim: could you check the final submission?

> 11. This study would give more information if it was based on all the 
> experimental data available in public databases, as IEDB, instead the 
> proteome and predictive algorithms. I think authors must analyze the data 
> using a more immunologically point of view.

The reviewer is right that we took two studies into account, where there
are plenty. For both MCH-I and MHC-II, we simply took the first study
we found on Google Scholar, as all we wanted to know was whether
TMH-derived epitopes would be presented at all.

[R: well, we can do some more, but then the question is how much more we should
do?]

## Check List

> a. Is the quality of the figures and tables satisfactory?
> - No

[R: this one is on me]

> b. Does the reference list cover the relevant literature adequately and in an unbiased manner?
> - Yes

> c. Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
> - Yes

> d. Are the methods sufficiently documented to allow replication studies?
> - Yes

