# DriveMind

![DriveMind lockup](assets/logo/drivemind-v0.7-lockup.png)

[English](./README.md) · [简体中文](./README.zh-CN.md) · [GitHub 仓库](https://github.com/Yuzc-001/DriveMind) · [Issues](https://github.com/Yuzc-001/DriveMind/issues)

[![Version](https://img.shields.io/badge/version-v0.7.0-0B1738?style=flat-square)](./CHANGELOG.md)
[![License](https://img.shields.io/badge/license-BUSL--1.1-23C993?style=flat-square)](./LICENSE.md)
[![Type](https://img.shields.io/badge/type-execution--ceiling-5B6CFF?style=flat-square)](./skill/SKILL.md)

> **给 agent 的有边界执行能力。**
>
> 防止困难任务退化，逼出更强下一步，并把真实工作沉淀成下一轮的优势。

DriveMind 是一个 v0.7 agent skill，目标是切实提升模型的真实任务执行质量。

它服务的不是简单问答，而是那些模型明明还能做得更好、但工作开始退化的时刻：目标漂移、边界变糊、重试变成假动作、中断损坏连续性，或者 agent 停在低于自身能力上限的浅层答案。

DriveMind 不让 agent 更吵。它让下一步更难被敷衍。

**当前版本：** `v0.7.0`

---

## 产品中轴

DriveMind 有三个运行承诺：

1. **执行完整性**：让工作保持对齐、守住边界、可恢复。
2. **执行上限**：当当前结果低于模型可达到的能力时，推动一个更强的具体动作。
3. **经验复利**：让有意义的工作在收尾时留下能改善下一轮的 residue。

核心问题是：

# 这件事最可能在哪里退化？下一步怎样才算真的更强？

---

## 失败模型

DriveMind 对抗六种失败：

1. 目标漂移
2. 边界漂移
3. 连续性衰减
4. 卡住后的假忙退化
5. 模型能力未被充分发挥
6. 收口失败

如果任务不涉及这些风险，直接执行通常更好。

---

## 仓库内容

- `skill/SKILL.md`：运行入口
- `skill/references/drift-prevention.md`
- `skill/references/boundary-preservation.md`
- `skill/references/stuck-recovery.md`
- `skill/references/execution-ceiling.md`
- `skill/references/continuity-preservation.md`
- `skill/references/closure-compounding.md`
- `skill/references/residue-selection.md`
- `skill/templates/`：review、diary、distill 模板
- `scripts/`：强化后的安装和 bootstrap 脚本
- `evals/`：可执行的 v0.7 压力场景和通过标准
- `docs/`：v0.7 产品、安装、品牌和发布文档
- `assets/`：Signal Gate 视觉系统

---

## 启用示例

- `Use DriveMind here. Keep the thread stable.`
- `This may drift if we keep going. Enable DriveMind.`
- `Stay with this, but ask before crossing a risky boundary.`
- `This is below what the model can do. Use DriveMind and force a better execution path.`
- `We may continue tomorrow. Preserve continuity.`
- `Review this afterward and leave behind a next-time rule.`

---

## 安装

见 [docs/installation.md](docs/installation.md)。

DriveMind 作为一个便携的 `drivemind` skill 包安装到支持的 skill 目录。

---

## 继续阅读

- [skill/SKILL.md](skill/SKILL.md)
- [evals/README.md](evals/README.md)
- [docs/drivemind-v0.7-execution-ceiling.md](docs/drivemind-v0.7-execution-ceiling.md)
- [docs/drivemind-v0.7-stress-cases.md](docs/drivemind-v0.7-stress-cases.md)
- [docs/github-release-v0.7.0.md](docs/github-release-v0.7.0.md)
- [docs/installation.md](docs/installation.md)

---

## 联系

- Issues: <https://github.com/Yuzc-001/DriveMind/issues>
- Email: `zxyu24@outlook.com`
