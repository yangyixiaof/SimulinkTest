% ワンショット タイマ
%  xがOFFからONに変化してからパラメータで設定した[sec]の間、yをONとする。
%  なお、xのON状態がパラメータで設定した[sec]以上継続した場合、あるいは設定以下
%  しか継続しない場合でも、yのON状態の期間はパラメータで設定した時間となる。
%       ud(1) = u(1) ;:入力信号
%       yold = u(2) ;:前回値
%       set = u(3) ;:時定数
%       timc(1) = u(4) ;:計算刻み
%       timc(2) = u(5) ;:経過時間
%       y : 出力信号
function[y] = OSHOTC(u)
       ud(1) = logical(u(1));
       yold = logical(u(2));
       set = u(3);
       timc(1) = u(4);
       timc(2) = u(5);
       
    if (ud == false) && (yold == false)
        w = 0;
        y = false;
    else
        if set > timc(2)
            y = true;
            w = timc(2) + timc(1);
        else
            y = false;
            w = timc(2);
            if u == false
                w = 0;
            end
        end
    end
    y = [double(y),w];
end