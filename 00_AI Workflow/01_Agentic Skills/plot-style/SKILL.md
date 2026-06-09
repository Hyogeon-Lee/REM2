---
name: plot-style
description: apply consistent scientific and engineering plotting conventions when writing or modifying code that creates figures, axes, legends, labels, limits, aspect ratios, subplots, frequency-response plots, or transfer-function plots. use for matlab plotting by default when no language is specified. when the user requests another language (python matplotlib, pandas, seaborn, plotly, etc.), apply the closest equivalent of every matlab rule defined in this skill. use when modifying user-provided plotting code, generating new plotting scripts, styling frf/bode/nyquist/step/impulse/frequency-response visualizations, or enforcing lab/report plot formatting.
---

# Plot Style

## Priority

User instructions override every default below. When modifying user code, preserve existing variable, function, and data-structure names; return the complete updated script (not a diff). Default language is MATLAB.

## Other languages

All rules in this skill are written for MATLAB. If the user requests Python (matplotlib, pandas `.plot`, seaborn, Plotly) or any other plotting language, translate every MATLAB rule into the closest equivalent of that language: same style block structure, same axes properties, same colors, same legend logic, same series-count rule, same logarithmic frequency-axis rule, same English-in-figures / Korean-in-comments convention. When a target package cannot implement a rule exactly, use the closest available equivalent and keep the rest intact.

## Style block (top of script)

```matlab
% 플롯 스타일 기본 설정
fontSize = 24;
fontName = 'Times New Roman';
lineWidth = 3;
maxDefaultSeries = 8;
legendLocationCandidates = {'northeast', 'northwest', 'southeast', 'southwest', 'northoutside'};
colorOrder = [
    0, 0, 0;
    1, 0, 0;
    0, 0, 1;
    0, 0, 0;
    0, 0.5, 0;
    1, 1, 0;
    0, 1, 1;
    0, 1, 0
];
```

Reference these throughout the script instead of hard-coding repeated values.

## Language in output

- Figure-rendered text (axis labels, legend, ticks, annotations, colorbar, text objects): **English**.
- Code comments and inline explanations: **Korean**.
- Override only when the user explicitly requests otherwise.

## Figure organization

- **Always dock figures by default.** Place `set(0, 'DefaultFigureWindowStyle', 'docked');` at the top of every script so all figures collect into a single MATLAB window. Apply even when only one figure is created. Override only when the user explicitly asks for floating/undocked figures.
- Consolidate related plots into one figure with multiple panels rather than creating many separate figures, unless the user asks for separates.
- Prefer `figure` + `subplot`. Do not use `tiledlayout` by default; use it only when explicitly requested, when existing user code already uses it, or when the layout cannot be done with `subplot`.

## Series-count rule

- ≤8 candidate series: plot all of them.
- More than 6 candidates: plot only the first 8 by default. Plot more only if the user explicitly asks.
- If the user requests more than 8 series, plot them and cycle the color order; all other rules still apply.

## Universal axes rules

Apply to every axes object (incl. subplots and secondary axes):

1. Font: **Times New Roman**, size **24**, referenced through the style block.
2. Box/border visible.
3. Grid on.
4. `xlabel` and `ylabel` present.
5. `xlim` and `ylim` set. If the user does not provide limits, compute padded limits from data or use domain-appropriate values.
6. Aspect ratio set with `pbaspect` (default `[2 1 1]` unless data or user dictates otherwise).
7. Legend present.
8. **No title** unless the user explicitly requests one.
9. Units in **parentheses**, not brackets: `Time (s)`, never `Time [s]`.

## Color and line rules

- Never use shorthand format strings (`'r-'`, `'b--'`, `'k:'`).
- Always set `LineStyle` and `Color` explicitly via name-value pairs.
- Use the color order from the style block. Drop the alpha (4th element) when the target function does not support it. Cycle through the sequence when more than 8 series are explicitly plotted.

## Legend rules

- Choose location from the candidates in the style block only (unless overridden). Pick the one that minimizes data overlap; prefer outside/top (`northoutside`) for crowded plots or many entries.
- Columns by displayed entry count: 1–3 → 1 column, 4–6 → 2 columns, 7+ → up to 4 columns, never exceeding the entry count.
- The legend describes only series actually plotted.

## MATLAB code patterns

Axes via handles when possible:

```matlab
set(ax, 'FontSize', fontSize, 'FontName', fontName, 'Box', 'on');
grid(ax, 'on');
```

Explicit line properties:

```matlab
plot(ax, t, y, 'LineStyle', '-', 'Color', colorOrder(1, :), 'LineWidth', lineWidth);
```

Every figure must include `xlabel`, `ylabel`, `xlim`, `ylim`, `pbaspect`, and `legend`.

Multi-panel structure:

```matlab
set(0, 'DefaultFigureWindowStyle', 'docked');
fig = figure;
ax1 = subplot(2, 1, 1, 'Parent', fig);
ax2 = subplot(2, 1, 2, 'Parent', fig);
```

Series-count and legend-column patterns:

```matlab
% 표시할 시리즈 개수 제한
numSeriesToPlot = numSeries;
if numSeries > 6
    numSeriesToPlot = min(maxDefaultSeries, numSeries);
end

% 범례 항목 개수에 따라 열 수 설정
numLegendEntries = numel(legendLabelsDisplayed);
if numLegendEntries <= 3
    numLegendColumns = 1;
elseif numLegendEntries <= 6
    numLegendColumns = 2;
else
    numLegendColumns = min(4, numLegendEntries);
end

legend(ax, hPlot, legendLabelsDisplayed, ...
       'Location', 'northoutside', ...
       'NumColumns', numLegendColumns, ...
       'FontSize', fontSize, ...
       'FontName', fontName);
```

## Frequency-response and transfer-function plots

For Bode, FRF, Nyquist-related frequency plots, and TF magnitude/phase plots: use logarithmic frequency scaling (`semilogx`, `loglog`). Magnitude versus frequency → log-log when physically meaningful. All other rules above still apply.

## Output behavior

- Editing existing code: return the complete revised script.
- New code: include all style commands inline so the figure renders correctly without manual editing.
