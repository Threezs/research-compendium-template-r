# Research Compendium Template (R)

这是一个以 R、Quarto、renv 和 targets 为核心的可复现研究项目模板。它适合把研究问题、数据登记、分析脚本、结果表和报告放在同一个可追踪的项目中。

## 与本账号其他仓库的关系

这个仓库是通用骨架；具体 bulk RNA-seq 流程放在 [rnaseq-analysis-template](https://github.com/Threezs/rnaseq-analysis-template)，文献元数据放在 [bioinformatics-literature-workbench](https://github.com/Threezs/bioinformatics-literature-workbench)，可复用配方放在 [bioinformatics-methods-cookbook](https://github.com/Threezs/bioinformatics-methods-cookbook)。

## 把近期方法接入本模板

1. 先在 [nature-methods-bioinformatics-catalog](https://github.com/Threezs/nature-methods-bioinformatics-catalog) 的 docs/function_map.md 按科研问题选择入口。
2. 复制 catalog 的 templates/method_run_manifest.yml 到项目 config/，填入 species、sample/donor、输入路径、checkpoint、baseline 和限制。
3. 把输入审计、方法运行和 sample-level summary 分成独立的 target。
4. 对 CellRank、Mellon density、embedding、niche 或细胞比例，先在 sample/donor 层汇总，再写入 evidence card。
5. 对 MISO/SCMMI/scMultiBench，单独保存 modality manifest、共享 key、任务和 split；只把任务级 benchmark 结果写进报告。
6. 对 NaRMBench，保存 chemistry、ground truth、retraining 和校准日志，不把模型调用结果混入 bulk 主统计。
7. 将“模型输出”“支持的最小结论”“替代解释”和“下一步验证”分别保存，避免把探索性预测直接写成机制结论。
