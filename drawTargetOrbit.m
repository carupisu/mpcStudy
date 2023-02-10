% x,yのデータが完全に対応している事が使用前提条件
% 1列目をx座標のデータとして格納
xData = out.simout(:,1);

% 2列目をy座標のデータとして格納
yData = out.simout(:,2);

% アニメション付きラインオブジェクトの作成
figure = animatedline;

%% プロット設定

plotSpeed = 1 ;                 % 1つの窓が表示される時間[s]
totalTime = 10;                 % グラフ全体の秒数[s]
windowRange = 20;               % 窓のサイズ
plotXRAnge= 5;                  % x軸プラス方向のプロット範囲
plotXmargine = 1;               % x軸方向の最小、最大からのマージン数
plotYRAnge= 5;                  % y軸プラス方向のプロット範囲
plotYmargine = 1;               % y軸方向の最小、最大からのマージン数

%% 描画アルゴリズム

% グリッドを表示
grid on

% 描画速度制御の為にタイマーをセットする
Timer = tic;

% ライン全体の描画用ループ
for k = 1:(length(xData) - windowRange)

    % 現在のプロットデータのｘ、ｙ座標値を配列から引き出す
    xVector = xData(k :k + windowRange);
    yVector = yData(k :k + windowRange);
    
    % 座標軸を現在プロットする範囲から事前に設定した範囲に設定
    axis([ min(xVector) - plotXmargine, min(xVector) + plotXRAnge + plotXmargine,min(yVector)- plotYmargine,min(yVector)+plotYRAnge + plotYmargine])
   
    % 点を追加
    addpoints(figure,xVector,yVector);
    
    
    while(true)
        
        % タイマーを確認
        currentTimer = toc(Timer);
    
        % 現在時刻を事前設定した1フレームの表示時間に達しているか判定
        if currentTimer > plotSpeed

            % 図を描画
            drawnow
    
            % タイマーをリセット
            Timer = tic;
            
            break
        end
    end
    
    % 点をクリア
    clearpoints(figure)
   
end


