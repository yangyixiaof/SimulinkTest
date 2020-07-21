% オフディレイ タイマ
%  xがOFFとなってからパラメータで設定した[sec]後にyがOFFとなる。
%  なお、xのOFF状態がパラメータで設定した[sec]続かずにON状態
%  へ戻った場合はyはON状態を継続する。
%       ud=u(1):入力信号
%       set=u(2)：時定数
%       timc(1)=u(3)：計算刻み
%       timc(2)(u4)：経過時間(前回値)
%       y : 出力信号
function[y] = OFDLC(u)
       ud=logical(u(1));      %:入力信号
       set=u(2);              %：セット時間
       timc(1)=u(3);          %：計算刻み
       timc(2)=u(4);          %：経過時間(前回値)

    if ud == true
        y = true; 
        w = set;
    else
        if timc(2) > 0 
            y = true;
            w = timc(2) - timc(1);
        else
            y = false;
            w = timc(2);
        end       
    end
    y = [double(y),w];
end