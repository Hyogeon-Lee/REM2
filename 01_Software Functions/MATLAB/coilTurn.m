function [Nturn, fillfactor] = coilTurn(dx, dy, awg)
    % 이름      : coilTurn
    % 용도      : 사각 코일 단면과 AWG 규격으로 권선수·점적률 추정
    % 작성자    : Hyogeon Lee / 2026
    % 사용법    : [Nturn, fillfactor] = coilTurn(dx, dy, awg)
    % 의존성    : 없음
    %
    % COILTURN  사각 단면(dx x dy)과 AWG 규격에 대한 코일 권선수 추정
    %
    %   [Nturn, fillfactor] = coilTurn(dx, dy, awg)
    %
    %   입력:
    %     dx  - 코일 단면 가용 폭   (mm)
    %     dy  - 코일 단면 가용 높이 (mm)
    %     awg - 도선 AWG 규격 (정수, 8 ~ 44)
    %
    %   출력:
    %     Nturn      - 단면 내 적층 가능한 최대 권선수 추정값
    %     fillfactor - 점적률 = 베어 구리 단면적 합 / (dx * dy)
    %
    %   가정 (assumptions):
    %     1) 적층 계산에는 절연 포함 외경 사용: NEMA MW1000 heavy build
    %        에나멜 절연 공칭 외경 테이블 (AWG 8~44)
    %     2) 베어 구리 직경은 ASTM B258 공식 d(mm) = 0.127 * 92^((36-awg)/39)
    %        점적률 분자는 베어 구리 면적만 사용 (절연 면적 제외)
    %     3) 정방형(square) 적층과 육각(hexagonal/orthocyclic) 적층을 모두
    %        계산하여 권선수가 많은 쪽을 채택 (육각은 행 방향 x/y 둘 다 시도)
    %     4) 도선은 완전한 원형 단면, 권선 장력에 의한 변형 및 보빈/절연지
    %        여유(clearance)는 무시
    %
    %   예시:
    %     [N, ff] = coilTurn(10, 5, 24);   % 10 mm x 5 mm 창, AWG 24
    
    % 플롯 옵션 (하드코딩으로 선택)
    option_plot = true;   % true: 적층 배치 시각화, false: 계산만 수행
    
    % 입력 검증
    validateattributes(dx,  {'numeric'}, {'scalar', 'positive', 'finite'}, mfilename, 'dx');
    validateattributes(dy,  {'numeric'}, {'scalar', 'positive', 'finite'}, mfilename, 'dy');
    validateattributes(awg, {'numeric'}, {'scalar', 'integer', '>=', 8, '<=', 44}, mfilename, 'awg');
    
    % AWG → 베어 구리 직경 / 절연 외경 (mm)
    [dBare, dIns] = awgWireDiameter(awg);
    
    % 후보 1: 정방형 적층
    [centerSq, nSq] = packSquare(dx, dy, dIns);
    
    % 후보 2: 육각 적층 (행 방향 = x축)
    [centerHexRow, nHexRow] = packHex(dx, dy, dIns);
    
    % 후보 3: 육각 적층 (행 방향 = y축, 좌표 전치 후 복원)
    [centerHexCol, nHexCol] = packHex(dy, dx, dIns);
    if ~isempty(centerHexCol)
        centerHexCol = centerHexCol(:, [2, 1]);
    end
    
    % 최다 권선수 후보 채택 (동수일 때는 단순한 정방형 우선)
    [Nturn, bestIdx] = max([nSq, nHexRow, nHexCol]);
    packCandidates = {centerSq, centerHexRow, centerHexCol};
    packNames      = {'square', 'hex (row-wise)', 'hex (column-wise)'};
    wireCenters = packCandidates{bestIdx};
    packType    = packNames{bestIdx};
    
    % 점적률 = 베어 구리 면적 합 / 가용 단면적
    fillfactor = Nturn * (pi / 4) * dBare^2 / (dx * dy);
    
    % 적층 배치 시각화
    if option_plot
        plotCoilLayout(dx, dy, wireCenters, dBare, dIns, Nturn, packType);
    end
end

% =====================================================================
function [dBare, dIns] = awgWireDiameter(awg)
    % AWG → 베어 구리 직경 dBare, heavy build 절연 외경 dIns (단위: mm)
    %   베어 직경: ASTM B258, d(mm) = 0.127 * 92^((36 - awg)/39)
    %   절연 외경: NEMA MW1000 heavy build 공칭 외경 (inch 테이블 → mm 변환)
    awgList = 8:44;
    heavyBuildOdInch = [ ...
        0.1324, 0.1181, 0.1054, 0.0941, 0.0840, 0.0750, 0.0670, 0.0599, ... % AWG  8-15
        0.0534, 0.0478, 0.0426, 0.0382, 0.0341, 0.0306, 0.0273, 0.0244, ... % AWG 16-23
        0.0218, 0.0195, 0.0174, 0.0156, 0.0139, 0.0126, 0.0112, 0.0100, ... % AWG 24-31
        0.0091, 0.0081, 0.0072, 0.0064, 0.0058, 0.0052, 0.0047, 0.0041, ... % AWG 32-39
        0.0037, 0.0033, 0.0030, 0.0026, 0.0024];                            % AWG 40-44
    
    dBare = 0.127 * 92^((36 - awg) / 39);
    
    tableIdx = find(awgList == awg, 1);
    if isempty(tableIdx)
        error('coilTurn:awgRange', 'AWG %d is outside the lookup table (8-44).', awg);
    end
    dIns = heavyBuildOdInch(tableIdx) * 25.4;
end

% =====================================================================
function [centers, n] = packSquare(dx, dy, d)
    % 정방형 격자 적층: 직경 d 원을 행/열로 단순 적층
    nx = floor(dx / d);
    ny = floor(dy / d);
    if nx < 1 || ny < 1
        centers = zeros(0, 2);
        n = 0;
        return;
    end
    [gridX, gridY] = meshgrid(d/2 + (0:nx-1)*d, d/2 + (0:ny-1)*d);
    centers = [gridX(:), gridY(:)];
    n = nx * ny;
end

% =====================================================================
function [centers, n] = packHex(dx, dy, d)
    % 육각(staggered) 적층: 짝수 행을 d/2 오프셋, 행 간격 d*sqrt(3)/2
    if dx < d || dy < d
        centers = zeros(0, 2);
        n = 0;
        return;
    end
    rowPitch = d * sqrt(3) / 2;
    nRows = 1 + floor((dy - d) / rowPitch);
    nOdd  = floor(dx / d);          % 홀수 행 도선 수 (시작 x = d/2)
    nEven = floor(dx / d - 0.5);    % 짝수 행 도선 수 (시작 x = d, d/2 오프셋)
    
    centers = zeros(nRows * nOdd, 2);   % 최대 크기로 선할당
    count = 0;
    for iRow = 1:nRows
        yCenter = d/2 + (iRow - 1) * rowPitch;
        if mod(iRow, 2) == 1
            nWire  = nOdd;
            xStart = d / 2;
        else
            nWire  = nEven;
            xStart = d;
        end
        if nWire >= 1
            xCenters = xStart + (0:nWire-1)' * d;
            centers(count+1:count+nWire, :) = [xCenters, repmat(yCenter, nWire, 1)];
            count = count + nWire;
        end
    end
    centers = centers(1:count, :);
    n = count;
end

% =====================================================================
function plotCoilLayout(dx, dy, wireCenters, dBare, dIns, Nturn, packType)
    % 코일 적층 배치 시각화: 가용 사각 단면 + 절연 외경 원 + 베어 구리 단면
    
    % 플롯 스타일 기본 설정 (Common)
    fontSize   = 24;                   % 기본 폰트 크기 (revise에서 12~32 범위로 조절 가능)
    fontName   = 'Times New Roman';
    lineWidth  = 3.0;
    gridStyle  = '--';                 % 점선 그리드
    gridAlpha  = 0.25;                 % 그리드 투명도
    maxDefaultSeries = 6;              % 기본 시리즈 최대 개수 (= 범례 항목 최대)
    legendLocationCandidates = {'northeast', 'northwest', 'southeast', 'southwest', 'northoutside'};
    wireLineWidth = 1.0;               % 도선 원 외곽선 (다수 원 가독성용)
    colorOrder = [
        0,    0,    0;
        1,    0,    0;
        0,    0,    1;
        0.9,  0.3,  0.1;
        0,    0.5,  0;
        0.5,  0.2,  0.6;
        0,    1,    1;
        0,    1,    0
    ];
    
    fig = figure;
    ax = axes(fig);
    hold(ax, 'on');
    
    % 가용 단면 사각형 경계
    hRect = plot(ax, [0, dx, dx, 0, 0], [0, 0, dy, dy, 0], ...
        'LineStyle', '-', 'Color', colorOrder(1, :), 'LineWidth', lineWidth);
    
    nWire = size(wireCenters, 1);
    theta = linspace(0, 2*pi, 49)';
    
    if nWire > 0
        % 절연 외경 원: NaN 구분 단일 라인 객체로 일괄 플롯
        xIns = wireCenters(:, 1)' + (dIns / 2) * cos(theta);
        yIns = wireCenters(:, 2)' + (dIns / 2) * sin(theta);
        xIns = [xIns; nan(1, nWire)];
        yIns = [yIns; nan(1, nWire)];
        hIns = plot(ax, xIns(:), yIns(:), ...
            'LineStyle', '-', 'Color', colorOrder(3, :), 'LineWidth', wireLineWidth);
    
        % 베어 구리 단면: patch 열 단위 다각형으로 채움
        xCu = wireCenters(:, 1)' + (dBare / 2) * cos(theta);
        yCu = wireCenters(:, 2)' + (dBare / 2) * sin(theta);
        hCu = patch(ax, xCu, yCu, colorOrder(2, :), ...
            'EdgeColor', 'none', 'FaceAlpha', 0.6);
    end
    
    % 축 스타일: 폰트 / 박스 / 그리드
    set(ax, 'FontSize', fontSize, 'FontName', fontName, 'Box', 'on', ...
        'XGrid', 'on', 'YGrid', 'on', 'ZGrid', 'on', ...
        'GridLineStyle', gridStyle, 'GridAlpha', gridAlpha);
    
    % 라벨 (단위는 괄호 표기)
    xlabel(ax, 'Width (mm)');
    ylabel(ax, 'Height (mm)');
    
    % 축 한계: 데이터 범위 + 5% 여유, 기하 형상이므로 1:1 데이터 종횡비
    pad = 0.05 * max(dx, dy);
    xlim(ax, [-pad, dx + pad]);
    ylim(ax, [-pad, dy + pad]);
    daspect(ax, [1, 1, 1]);
    
    % 범례: 표시 개수 제한 + 개수에 따른 열 수 (1~3개 → 1열, 4~6개 → 2열)
    if nWire > 0
        legendHandles = [hRect, hIns, hCu];
        legendLabels  = {'Available area', ...
            sprintf('Insulated OD, %s', packType), ...
            sprintf('Bare copper, N = %d', Nturn)};
    else
        legendHandles = hRect;
        legendLabels  = {'Available area (no wire fits)'};
    end
    numLegendEntries = min(numel(legendLabels), maxDefaultSeries);
    if numLegendEntries <= 3
        numLegendColumns = 1;
    else
        numLegendColumns = 2;
    end
    % 위치는 후보 목록에서 선택: 도선이 영역을 채우므로 northoutside
    legend(ax, legendHandles(1:numLegendEntries), legendLabels(1:numLegendEntries), ...
        'Location', legendLocationCandidates{end}, 'NumColumns', numLegendColumns, ...
        'FontSize', fontSize, 'FontName', fontName);
    
    hold(ax, 'off');
end
