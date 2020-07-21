% オンディレイ タイマ
%  xがONとなってからパラメータで設定した[sec]後にyがONとなる。
%  なお、xのON状態がパラメータで設定した[sec]続かずにOFF状態
%  へ戻った場合はyはOFF状態を継続する。
%       ud=u(1) :入力信号
%       set=u(2)：時定数
%       timc(1)=u(3)：計算刻み
%       timc(2)=u(4)：経過時間(前回値)
%       y : 出力信号
function [y] = ONDLC(u)
       ud = logical(u(1));
       set=u(2);
       timc(1)=u(3);
       timc(2)=u(4);
    if ud == false
        y = false;
        w = 0;
    else
        if timc(2) < set 
            y = false;
            w = timc(2) + timc(1);
        else
            y = true;
            w = timc(2);
        end
    end
    y = [double(y),w];
end