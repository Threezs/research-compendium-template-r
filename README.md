# Research Compendium Template for R

这是一个可以从零复制的 R-first 研究项目模板，适合 bulk RNA-seq、网络药理学、分子对接结果整理、临床队列和其他需要反复运行的生物信息学项目。

它把成熟项目中的四个原则合并到一起：

1. **targets** 管理依赖图和增量运行；
2. **renv** 锁定 R/CRAN/Bioconductor 依赖；
3. **Quarto** 生成分析网页、报告和论文；
4. **GitHub Actions** 在提交时做最小化检查。

## 快速开始

~~~r
install.packages(c("targets", "tarchetypes", "renv", "here", "yaml"))
renv::init()
targets::tar_make()
targets::tar_visnetwork()
quarto::quarto_render()
~~~

第一次使用时，把 `data/mock/` 的演示文件替换为自己的输入，并在 `config/project.yml` 中填写项目登记、物种、分组、主要对比和数据位置。真实数据、大型中间文件和隐私数据默认由 `.gitignore` 排除。

## 目录结构

~~~text
.
├─ _targets.R             # pipeline 入口
├─ _quarto.yml            # Quarto 网站/报告配置
├─ R/                      # 可复用函数；不把业务逻辑堆在 qmd 中
├─ config/project.yml      # 项目登记和阈值
├─ data/
│  ├─ mock/               # 可公开演示数据
│  ├─ raw/                # 原始数据，默认不提交
│  └─ processed/          # 可重建的衍生数据
├─ analysis/              # 编号的 QMD 分析记录
├─ reports/                # manuscript/webpage/slides
├─ outputs/               # figures/tables/logs
├─ tests/                 # 关键函数测试
├─ renv/                  # renv 激活脚本由 renv::init() 生成
├─ renv.lock              # renv::snapshot() 生成
├─ DESCRIPTION            # 研究汇编的项目元数据
├─ CITATION.cff
└─ .github/workflows/     # 自动检查
~~~

## targets 的基本规则

- 一个可重复步骤对应一个 `tar_target()`。
- 文件输入使用 `format = "file"`，让 targets 跟踪文件变化。
- 图表和报告尽量从 target 读取，而不是在多个脚本中重复计算。
- `_targets/` 是缓存和元数据，通常不提交。
- `tar_read()` 只读取已完成的 target；`tar_destroy()` 用于清理缓存。

## renv 的基本规则

~~~r
renv::status()
renv::snapshot()
renv::restore()
~~~

提交 `renv.lock`、`.Rprofile`、`renv/activate.R` 和 `renv/settings.json`；不提交项目级 library。对于 Bioconductor 项目，在锁文件中保留 R、Bioconductor 和仓库版本信息。

## 参考的成熟模板

- [ropensci/targets](https://github.com/ropensci/targets)：声明式、可增量运行的 R pipeline。
- [r-lib/renv](https://github.com/r-lib/renv)：项目级依赖隔离和锁定。
- [benmarwick/rrtools](https://github.com/benmarwick/rrtools)：研究汇编结构。
- [SCIproj](https://www.stats.bris.ac.uk/R/web/packages/SCIproj/vignettes/SCIproj.html)：数据来源、FAIR 和 Docker 约定。
- [AaronGullickson/research-template](https://github.com/AaronGullickson/research-template)：Quarto、bibliography 和报告层。
- [TheDataFlowCompany/the-science-repository](https://github.com/TheDataFlowCompany/the-science-repository)：分析引擎与多种报告共享同一数据流。
- [workflowr](https://workflowr.github.io/workflowr/)：把分析记录和版本信息发布成可浏览网页。

## 与本账号其他仓库的关系

这个仓库是通用骨架；具体 bulk RNA-seq 流程放在 [rnaseq-analysis-template](https://github.com/Threezs/rnaseq-analysis-template)，文献元数据放在 [bioinformatics-literature-workbench](https://github.com/Threezs/bioinformatics-literature-workbench)，可复用配方放在 [bioinformatics-methods-cookbook](https://github.com/Threezs/bioinformatics-methods-cookbook)。

