%% クルマを描画する
% 前輪操舵後輪駆動4輪の一般的な自動車を描画する関数mファイル
% 前提として車体は長方形とみなしその中心が重心の重なるものとて考える
% 座標系は→ｘ　↑yとする
%% グラフのパラメータを設定

% 車に関するパラメータ
dredFrontM=2;       % 前輪ドレッド[m]
dredRearM = 2;      % 後輪ドレッド[m]
WheelbaseM = 5;     % ホイールベースの長さ[m]
carWidthM = 2;      % 車体幅[m]
carLengthM = 5;     % 車体長さ[m]
tireWidthM = 0.3;   % 上から見た時のタイヤの幅[m]
tireLengthM = 0.3;   % 上から見た時のタイヤの前後方向の長さ[m]

% グラフの描画に関するパラメータ
% グラフのサイズ

% 仮にパラメタ
GoC.x = 0;
GoC.y = 0;
GoCTire.x = 0;
GoCTire.y = 0;

%% 描画アルゴリズム

% 図の描画
figure;
% 上から見た車体の四角形を左上の点から時計回りに指定（ｘ座標）始点と終点は重ねている
carBodyX=[GoC.x - (carWidthM / 2) GoC.x + (carWidthM / 2) GoC.x + (carWidthM / 2) GoC.x - (carWidthM / 2) GoC.x - (carWidthM / 2)];

% 上から見た車体の四角形を左上の点から時計回りに指定（y座標）
carBodyY=[GoC.y + (carLengthM / 2) GoC.y + (carLengthM / 2) GoC.y - (carLengthM / 2) GoC.y - (carLengthM / 2) GoC.y + (carLengthM / 2)];

% 車体の描画
line(carBodyX,carBodyY);
% 上から見た時に前方左側から時計周りに四角形を描画（車体）

% 空間がゆがまないように設定
pbaspect([1 1 1]);

% グリッドを描画
grid on;
% 重心画像の描画
% 上から見た時に前方左から時計周りにタイヤのシルエットを描画
for tireIndex=1:4

    % ある一つのタイヤを描画する処理
    
    % 上から見たあるタイヤの四角形を左上の点から時計回りに指定（ｘ座標）始点と終点は重ねている
    tireX=[GoCTire.x - (tireWidthM / 2) GoCTire.x + (tireWidthM / 2) GoCTire.x + (tireWidthM / 2) GoCTire.x - (tireWidthM / 2) GoCTire.x - (tireWidthM / 2)];

    % 上から見たあるタイヤの四角形を左上の点から時計回りに指定（y座標）始点と終点は重ねている
    tireY=[GoCTire.y + (tireLengthM / 2) GoCTire.y + (tireLengthM / 2) GoCTire.y - (tireLengthM / 2) GoCTire.y - (tireLengthM / 2) GoCTire.y + (carLengthM / 2)];

    % タイヤの描画
    line(tireX,tireY);
end

%line