# DriveMind

![DriveMind lockup](assets/logo/drivemind-lockup.svg)

[English](./README.md) · [简体中文](./README.zh-CN.md) · [GitHub 仓库](https://github.com/Yuzc-001/DriveMind) · [Issues](https://github.com/Yuzc-001/DriveMind/issues)

[![Version](https://img.shields.io/badge/version-v0.5.0-0B1738?style=flat-square)](./CHANGELOG.md)
[![License](https://img.shields.io/badge/license-BUSL--1.1-23C993?style=flat-square)](./LICENSE.md)
[![Validated](https://img.shields.io/badge/validated-Claude%20Code%20%7C%20Codex%20%7C%20OpenClaw-5B6CFF?style=flat-square)](./docs/github-release-v0.5.0.md)
[![Codex](https://img.shields.io/badge/install-codex-29A8D8?style=flat-square)](./docs/installation.md)
[![Claude%20Code](https://img.shields.io/badge/install-claude%20code-4466F2?style=flat-square)](./docs/installation.md)

> **一个温柔、理性的 AI 可靠性层。**
>
> 为真实人机协作提供清晰目标、明确边界，以及足够的行动自由。

DriveMind 面向那些不希望 agent 像“莽撞执行器”一样工作的人。它希望 agent 更像一个有分寸的协作者：在重要任务上多坚持一点、在边界不清时先问人、在任务结束后留下可复用经验，同时在协作过程中保持可感知，而不是失联，也不是把每一步都表演成流程。

DriveMind 建立在一个很简单的判断上：**最好的协作者，不论是人还是 AI，需要的都是清晰的目标、明确的底线，以及足够的自由度——而不是一份操作手册。**

**当前版本：** `v0.5.0`

DriveMind v0.5.0 在 v0.4 上下文智能层的基础上，进一步把 DriveMind 明确为一套协作原则：清晰目标、明确边界、足够自由度——而不是一份操作手册。

## DriveMind 的核心定位

DriveMind 想做的不是“更猛地推进”，而是“更有分寸地推进”。
它围绕三件事展开：
1. 有证据地继续，而不是固执地硬撑
2. 安全边界变得不清楚时，及时升级给人
3. 把做过的事沉淀成可复用经验，而不是一次性输出。

## 为什么需要 DriveMind

当 agent 开始进入更长、更真实的工作流时，问题通常会出在这四类地方：
1. 上下文容易丢
2. 遇到障碍停得太早
3. 等待指令过于被动
4. 不确定时做出质量很差的取舍。

DriveMind 的目标，就是让这种行为变得更平稳、更安全、更值得信任。

## 这个仓库现在提供什么

DriveMind `v0.5.0` 当前包含：
- `skill/SKILL.md` 里的正式版 DriveMind skill
- `skill/references/` 下的 persistence、escalation、mode、task-typing、decision-gates、stuck-resolution、session-handoff、confidence-signaling 参考文档
- `skill/templates/` 下的 diary、review、distill 模板
- `scripts/` 下的本地安装与一键 bootstrap 脚本
- `docs/` 下的定位、安装、许可、交互模型与路线图文档
- 仓库根目录下的贡献、变更、商标、安全与协作规范
- `.github/workflows/` 里的最小验证流程
- `assets/logo/` 下的官方 logo 源资产
- `examples/` 里的行为示例与对比演示。

## 宿主与验证状态

DriveMind 当前已经在三种宿主/工作流中完成验证：
- **Claude Code**
- **Codex**
- **OpenClaw**

当前仓库中的安装文档主要覆盖 **Claude Code** 和 **Codex** 两类安装目标。
**OpenClaw** 已经是 DriveMind 的真实验证宿主环境，但它更偏向 skill hosting 与工作流承载，而不是这个仓库里的一键 bootstrap 目标。

## 安装

### 一条命令，自动完成

安装脚本会自动检测你安装了哪些 AI 工具（Claude Code、Codex），并同时安装到所有检测到的目标。无需任何参数。

**macOS / Linux**

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash
```

**Windows（PowerShell）**

```powershell
irm https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 | iex
```

脚本会自动判断：
- 检测到 `~/.claude` → 安装 `claude-personal`
- 检测到 `~/.codex`（或 `$CODEX_HOME`）→ 安装 `codex-personal`
- 都没检测到 → 默认安装 `claude-personal`

### 指定目标安装

<details>
<summary>高级用法：手动指定安装目标</summary>

**macOS / Linux**

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- claude-personal
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- codex-personal
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- claude-project /path/to/your-project
```

**Windows（PowerShell）**

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp claude-personal; Remove-Item $tmp
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp codex-personal; Remove-Item $tmp
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp claude-project D:\path\to\your-project; Remove-Item $tmp
```

**从本地克隆仓库安装**

```powershell
./scripts/install.ps1 codex-personal
./scripts/install.ps1 claude-personal
./scripts/install.ps1 claude-project D:\path\to\your-project
```

```bash
bash ./scripts/install.sh codex-personal
bash ./scripts/install.sh claude-personal
bash ./scripts/install.sh claude-project /path/to/your-project
```

</details>

完整安装矩阵、别名、更新方式和目标路径见 [docs/installation.md](docs/installation.md)。

## 分发方式

DriveMind 不拆成 `personal` 和 `project` 两套不同产品。
它只维护一份便携的 `drivemind` skill 包，再根据目标环境安装到不同位置。

这样做的好处是：产品口径更统一、维护成本更低、用户也更容易信任。
更多说明见 [docs/distribution-strategy.md](docs/distribution-strategy.md)。

## DriveMind 会带来什么变化

DriveMind 会给 agent 工作方式加入四层变化：
- **更平稳的持续性**：重要任务不会一遇到障碍就停
- **更清楚的安全边界**：不清楚或高风险时先问人
- **更自然的人机协作**：把进度、阻塞和边界问题及时交代清楚
- **更可复用的复盘与记忆**：做完之后不是结束，而是留下下次能继续用的经验。

## 适合谁

DriveMind 主要适合：
- 在构建 agent 工作流的开发者
- 高频使用 AI 执行重复任务的高级用户
- 研究 agent 可靠性的研究者
- 希望人机协作更平稳的团队。

## 它不是什么

DriveMind 不是：
- 一个靠“人设”包装出来的 prompt gimmick
- 一个只有 diary 功能的记录工具
- 一个孤立的 memory plugin
- 一张允许 agent 盲目重试的通行证。

它更像一层协作原则与可靠性基础设施：让 agent 在清晰目标和明确边界内，更稳、更可解释、更容易被人监督，也保有足够的行动自由。

## 基本启用方式

例如：
- `Enable DriveMind in execution mode.`
- `Use DriveMind for this task. Stay steady and keep me informed.`
- `Stay with this a little longer before concluding, but ask me before crossing an unclear boundary.`
- `Review this task after completion and preserve what should be remembered.`

当 DriveMind 被启用后，agent 应该：
1. 在判定失败前先补足证据
2. 在升级前先尝试有限且合理的替代路径
3. 更早、更清楚地提出边界问题
4. 在有意义的任务结束后留下复用性经验。

## 仓库结构

- `README.md` / `README.zh-CN.md`：英文与中文的公开入口
- `PROJECT.md`：产品定义与范围说明
- `PROMO.md`：发布文案与宣传话术
- `CHANGELOG.md`、`CONTRIBUTING.md`、`TRADEMARKS.md`、`SECURITY.md`、`CODE_OF_CONDUCT.md`：治理、协作和边界文件
- `.github/workflows/`：脚本与 markdown 链接的验证流程
- `.github/ISSUE_TEMPLATE/`：issue 入口与联系渠道配置
- ssets/logo/：官方 logo 源资产
- ssets/social/：GitHub social preview 与发布配图资产
- docs/：品牌、安装、许可、原则、交互模型、路线图等支撑文档
- `scripts/`：本地安装、远程 bootstrap 和 logo 导出脚本
- `skill/`：DriveMind skill、参考文档和模板
- `examples/`：DriveMind 行为示例与对比演示。

## 路线图

### `v0.1 Foundation`
- 稳定品牌定位与语气
- 发布第一版可复用 DriveMind skill
- 支持 Codex / Claude Code 一键安装
- 支持 personal / project 多安装目标
- 建立标准 source-available 许可边界
- 完成第一版 logo 和品牌资产
- 补齐 persistence / escalation / collaboration 参考
- 提供 review / diary / distill 模板
- 补齐示例、双语 README、治理文档和最小验证流程。

### `v0.2 Validated`
- 更强的自然语言触发能力，覆盖稳推进与边界感表达
- `Intensive` 模式命名与更清晰的结构化汇报预期
- 结构化但更自然的 review 行为
- 新增 review style guide，减少模板感
- 已完成显式触发、隐式触发、升级边界、真实排障、真实取舍、真实复盘等多类验证

### `v0.3 正式版`
- 轻量任务分型：判断、边界、推进、定位、沉淀
- 面向高影响动作的 decision gates：覆盖 release / production / external representation / data deletion 等关键场景

### `v0.4 上下文智能层`
- session handoff 协议：跨 session 连续性，默认静默，由用户触发，短任务完全无感
- 置信度信号参考：有证据 / 推断 / 假设 三级结构，含验证路径与反模式指导
- 语言一致性：所有 skill references 统一翻译为英文
- 零配置安装：自动探测 Claude Code 和 Codex，一条命令安装到所有检测到的目标
- stuck resolution：让“继续推进”变成识别阻塞、恢复流动的解阻机制
- compression rule：让短任务保持自然表达，不把方法框架外显成模板感

## 使用边界

截至 **2026-03-11**，DriveMind 当前采用 **BUSL-1.1 source-available** 模式，不是 Open Source。
在 **2030-03-11** 之前，如需生产环境使用，需要额外获得许可方授权。
仓库计划在 **2030-03-11** 转为 **GPL-2.0-or-later**。
详细说明见 [LICENSE.md](LICENSE.md) 和 [docs/licensing.md](docs/licensing.md)。

## 协作与沟通

- Issues：https://github.com/Yuzc-001/DriveMind/issues
- 邮箱：`zxyu24@outlook.com`

适合公开讨论的 bug、安装问题、文档缺口、功能建议，请优先走 Issues。
涉及许可、私下协作、或不适合公开开线程的问题，可以直接发邮件。


## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Yuzc-001/DriveMind&type=Date)](https://star-history.com/#Yuzc-001/DriveMind&Date)
## 继续阅读

- [README.md](README.md)
- [PROJECT.md](PROJECT.md)
- [CHANGELOG.md](CHANGELOG.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [TRADEMARKS.md](TRADEMARKS.md)
- [PROMO.md](PROMO.md)
- [docs/github-presence.md](docs/github-presence.md)
- [docs/brand-kit.md](docs/brand-kit.md)
- [docs/licensing.md](docs/licensing.md)
- [docs/installation.md](docs/installation.md)
- [docs/distribution-strategy.md](docs/distribution-strategy.md)
- [docs/principles.md](docs/principles.md)
- [docs/interaction-model.md](docs/interaction-model.md)
- [docs/activation.md](docs/activation.md)
- [docs/use-cases.md](docs/use-cases.md)
- [docs/with-vs-without.md](docs/with-vs-without.md)
- [docs/release-notes-v0.1.md](docs/release-notes-v0.1.md)
- [skill/SKILL.md](skill/SKILL.md)