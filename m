Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0AC1CD13
	for <imx@lists.linux.dev>; Tue, 19 Mar 2024 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848459; cv=none; b=tqKh1MAr4n2E7cSikCA+vqTftmCpzBVoyKG4eLxBVh/IbM1P6DfBrNPCoxbkGZLCpYqazgNTvJkjoFlA1VIbvKG1y8hTWc9w6OPmBDI6fFgD8jHEVCSFAc8Z0oiy5q6XFy4FEshUw2GJoxKUPQkiBAPc1KLa323oq2KDUZcRmUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848459; c=relaxed/simple;
	bh=F/m5KRIrynA1LYKemA3ffshHYyuHgyd7FWQW/bqBUv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXN6uclCU9nVpAqmFggs6Wtj6Aqg9gapSw1NYBaGWUw5or5fov4uSdhF4z8L6okJulCTNb0865nFw6LSBw2RPuo5HGjEkhHBDqNL4hast6Jqgw6L3Poo+UvbZQEO+5Gsgs9bs1SdpAl9eVwDuu8FY7E/06QVHyr/KUUi8qwaz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZD3GwFrp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZD3GwFrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3151C433F1
	for <imx@lists.linux.dev>; Tue, 19 Mar 2024 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710848458;
	bh=F/m5KRIrynA1LYKemA3ffshHYyuHgyd7FWQW/bqBUv0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZD3GwFrpGUHVcuNu/zt5jRNUCLVZaTZcdskqXAZ4d7hpiP/s1aSeWID2NbQ+sJ94G
	 NyMi7gfRD4a7Eft5NoeWL49Rh3V2mXWW6Q/EAdDOnjSIoomm7Gmnz2xKX4IwIxz9pW
	 019OFN4RHhHD4Np0NDF8glvLEJ/gy3gZ2JH4Gj5nDpK1zusY37WE+XplduVdUgajsK
	 VFPGGBwVF6TtQYL5E1frCJtqd31xGcnrZszbw0Fid7rhXWTMq+pJMGGlyn+DVGbAHx
	 7D4sw4pZoFgWXJCvR4tBFbXEzHEzfdxramhMctKv2kYV+qZco9FNRsHC8piw5TB7EV
	 Nm/q6p4/DLLOA==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so5037043276.1
        for <imx@lists.linux.dev>; Tue, 19 Mar 2024 04:40:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL1uokVRTUV2WswGxFHVOAq7wcqQNK4g4FJ5mbNT4s+1juWPOJiRGuXeBFpKOSgf5yV4M4xgLJJqDI/mqtRlUhNgVV
X-Gm-Message-State: AOJu0Yxq3zUlhuf51hdeACOSrB1pMcARegWuKzy8n/Mp5RyMl9Yjkngy
	1WyeT79JPp4Ml3dCCLfm3Qfgck3sf+ffeV2j1mAeNzEsLM+96+/QTob3DCQlbZMsvjRd49hP315
	ZMgDSzsk6GdFxY2ovRzslClGhG+M=
X-Google-Smtp-Source: AGHT+IHATFeNzsoxhyt570EbLkntC9pYyMr/OSSoT8xrNQbsjboRdpsS/tu5+5L4+zusEza+nJQmOI8hPlHyz0FZDVs=
X-Received: by 2002:a05:6902:2192:b0:dcb:aa26:50fe with SMTP id
 dl18-20020a056902219200b00dcbaa2650femr1889618ybb.15.1710848457842; Tue, 19
 Mar 2024 04:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313071332.1784885-1-joy.zou@nxp.com>
In-Reply-To: <20240313071332.1784885-1-joy.zou@nxp.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Mar 2024 07:40:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7cUkcD6SnPCxOBOL159USR0hsh7jrTV5zKOhM7=QeUhQ@mail.gmail.com>
Message-ID: <CA+5PVA7cUkcD6SnPCxOBOL159USR0hsh7jrTV5zKOhM7=QeUhQ@mail.gmail.com>
Subject: Re: [PATCH v1] imx: sdma: update firmware to v3.6/v4.6
To: Joy Zou <joy.zou@nxp.com>
Cc: linux-firmware@kernel.org, sherry.sun@nxp.com, tom.hochstein@nxp.com, 
	frank.li@nxp.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/174

josh

On Wed, Mar 13, 2024 at 3:05=E2=80=AFAM Joy Zou <joy.zou@nxp.com> wrote:
>
> Update sdma firmware to v3.6/v4.6:
>         -- add i2c script.
>         -- update multi-fifo SAI scripts to support multi-lans-per-fifo.
>         -- add dual fifo support for p_2_p on i.mx7d as i.mx6.
>         -- add 24bit support for multi-fifo script.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  imx/sdma/sdma-imx6q.bin | Bin 2746 -> 2970 bytes
>  imx/sdma/sdma-imx7d.bin | Bin 2862 -> 3202 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/imx/sdma/sdma-imx6q.bin b/imx/sdma/sdma-imx6q.bin
> index 4d0593cec7dfdae1a8bf28a2d83bdd1e95839b82..420256546e32ff52c07489ba4=
6433b8e6e0cbd10 100644
> GIT binary patch
> delta 1667
> zcmaJ>ZA@EL7(Vy(e)L}02QbzGgYvP_Zf>9xr^ak^WGtYmV+CA?GL}nl><n-rS=3DO0*
> zxtV{aS=3D8X!kKVS#CN47ze*D^u6Ei6$s~I6=3D#6_&=3DkNLx-n=3DUdVfhF}l_rgFYwt3t=
4
> zJ@5NI=3DQ-y*=3DUmN?xJsM$`u8{xLL%4(uxhaH!4e8WZ(@W7%Dk@37exqV;FE@d^98n_
> zzhU6;3&wL0bwc(V=3Dxqm^2P=3D0YbOCI<5TPdk+sOkS#5&mRk<`JNfI#L0e0hT0B=3D4c`
> z5U0O`k}BSwgwX_v3pkWiW#ZI)L^Pn&FX(g7#fMKNnt3I`g>4KDswW3hJGZ?UR@AC~
> zxpQlOu8=3DEyf|JB+I7(6dU9BUGL$aDAYB(R^kitA#$31EI!V((m%I?ZbD2a+?aQ{u|
> zCQwSZ*+}QZvi4Jt1hmpE$S+yM&MZUg4^NFO(n}v&<IF)B_qBy3#)UY4`_=3DiELk92A
> zPxC(gY3($>UMrbW)KftJ<N|%M^@PEd!2%j)v~5!{k@KScziFsGtzoldN>;^Iu8f21
> z+{5gjko`mB%zVVK{x8oeved$rN@_IPEpE(9AIPlA5i-TY0`iwwOT0vnVNX%&z*_F!
> zv-zC;<qAY3A$t=3DqQi^vsw3~{$9ai%A!b*-vSQlH5nw70ygY&Q>`BgiSmE*{3dJDMn
> za5Q48tX8(3g^0zByTW2x<nUzInv3YWO}ft!sJ>>-22#z#cnr&$2GG7h5=3DJKN5gqYY
> z%ya1LK(gu3$Sob=3Di}bpq;<Xv`0-nZL-zCkMhr!sXVJ!^jITM&~Cekx{x5VkSk>irC
> z9g}#y3vjvBN`wY)fh^xev?VUkwz$|MiF&V;rQ;B8;oCeBMwfZzRzw^5!o8a#eA_zX
> zZIL#jdQQiY%TOd*Mf)Y(vazjN;<U>V7kVB3xl-CP2)j4@!??LLZDWLf%9rMJLE~gM
> z!%y~<gLToL`Qp;PNU}$K2wxBIpGB5h&$3o`!6<>d)5*7e01!gxI$^#QQ@>EW^Aa#z
> zf-nHWW|8S;Jm79Nv+d!uar27F{EU)=3DGlhnPwYcyt{YWS_R+O}*=3D*_wd6um=3DhNXaB*
> z<YJkew0`>*^n70nrffa`4vM{_Jr-r>-jEUlS!7Yuixsw}w?GBUD|WsHME~ysmX=3Dp&
> z-vLiZ4LvSyTDM%%#g?QeBb4Bhf=3D4xNzcLeaM0|=3DnL;n)J6(3tX*^x7*m0&~G2#Xbn
> z6*5HkNFIem?cSqNN~BuPY;-Mb;AC%-geymTow20)OH?LqgWH7s9(|17ki5!QQ3>&C
> zHW6a<f#hB_8}*U92Cu#W57Sjz=3DB&%!67vz4HS$V~_Bks(g)zG$2#Gl>5#*bBAGvQR
> z30Lex`nj{t^?r<PEPF<?$N>1vQ^)}ID+Re7F-CGSz&UY{<G=3DjzNQ~~1x8`4sIi*y)
> zBAr8{fg5mz?!XlqqK4eDdIBcQz+;K<MC|!#dQaZxt{z;%uL9r3uNtH;Dem0NKPCuH
> QKd>fPe{k^83F-&`24&7ILjV8(
>
> delta 1395
> zcmZuxUu;ul6hHUt{nL9pw{=3D)n2BRCewj^v5jk?6>fWR_I%J6Q3S=3DuqW&5Y~#^RiIL
> zy}Q9T14iffVDG&(!NeCrG%?W^W7KsCHepMaOmuGbg^3Zng@+LlmRQf%?hiq3a_&9n
> zcfNDZ?>qUmcJ(*Dy3PZUeJ%hH(6*s9qD`ayB?G)m0LJP=3D)rH7bfC4^w1YX@z@~>?j
> z>pc{{?FV>R1JHxD%XsPo)&sHQXd{U4!QO5jfNta38+WCYMAN7|xO=3Dops1iOWSuJF`
> z>Y#l|-<KjuIg!=3D&rhGt>3iId~_o6ALB$ym38`_jnGF<A{@rCjEW6LV1Rk*!S@P7{r
> zv0K0y@55CgA743|<Xy%EzR_sWFYp0<YWAGR>&kcbxdcNV>>pJUCr2+KgI;71TV)_d
> zkC|za3n7b+yw1*V>V)>&`q!zcSveu@kFq3($%i_$|E+(8^rmK&g!mMkWjz1Ogy}p9
> zdb%O9*?5H9`%+YswtGa7pmeD?jksFh5G^I~0@8YZl~$ib3^7`61*0L83$PXaxk|3t
> z@&S*l5~Fe=3D7;VCc#f*`{VtUIJD7%YGD|P=3DP^%1W&zis`a&UbxFCW)-;*g348MP#Og
> z7{JG^%kYDm?R;zeX9GxtUgCGQ*w$y{H$sfpCEMyn%i|S@p29URt1Dfa)M5-voN?EB
> zM>6zN5^oG)U#|R1i{|+4l{bncNjD$gfp){9icoW4+T!ESn(vA92()v?H7jQOKuoej
> z9TMq&F5WD0dd#kdv-sueX!j?$qyD)OYoq%Eiw+5O-U=3D+78RoGxdwK_21+|3Qz!p1u
> zT3l~`58EHLH%f6aLcO;QD~05bT6U0+Gi#%gSo_)$n~!f)2JM(#8eSM?;{g`B*yTBW
> z#EM(YFDPD8s4*p?Ulq>LlVYv85L?sZni@B>7(gw)tlya{X;D-MM*CdEs3cWH)_P6$
> zK3;tHtm|-TU5CHxlgQWycjiRZqoEY*xX_vuZ(@ewik1#Pkzla=3D#PMBvSPRiTQiBW;
> zUr~w|=3D_x57i*P>E#VeWf^i%02&PRWdLOb_5Y$($e8yiGxEg~#dFjllyTJH`h|JtS6
> z6`LM%?+;vYDseM2XR=3Dx<IB_QJWD`k8*8C>d0Fi*vN3Xj>%A1Y^e4<RV9GY|cpSj|M
> zwI!2JT*ROEVamw|%f3UTx`^C!s452oU#wOvV&YLT(ZhG~VeP)DWUf1}(2wPV{$QHX
> zCCO~Uqcxz<JOw@4<ndQMa2U%Om2;CGj_=3D6bcj$Iyx9@P;EzO@$q{}d&-bCpyqV!wo
> z38lY$AT2=3Dw|8sy0q<_lMX{F6S@z{XO`hZMvfS0BpAF!DFkk%@VoAXcUpG*G-=3D=3D#6i
>
> diff --git a/imx/sdma/sdma-imx7d.bin b/imx/sdma/sdma-imx7d.bin
> index 148f4fe87bed695d16a610d91000feaa8317107e..3cec13a2c9a28e5683f9f161a=
a09c3fb6e70979b 100644
> GIT binary patch
> literal 3202
> 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
> Z@$;<PVY<=3Dr!GfOMNOZh^2Onp${{@C?S)Bj?
>
> delta 1588
> zcmZ`(YfKzf6h3oz9y_yZ3zP-=3Du)77iEDetz#Kxqt0;z_W(CWYf-Le!HF*x$j#3qo;
> z>_k(OHdPb6G1-}264K}o(^PF^e~7ge&}0+KFKVSc+NNluq5Q(&1I>EwF0TaK<jkJ?
> z-8<*|?wRl2cXof4=3DW94tU&8}{fUysw0^>GDNC7xY00s|~<fnG+1xVp<5rHGSGkM?M
> z!L}F59u@%H+yk&5-~9?#1z8QmPGKBDyvhNfVEwNVr#`N(yfmgnDxz{{Su{t;5iXOY
> zR$@AQP`9Yp#7Ms!Nov(G50HL^W%MJi$`oS~-0E_7dB)shT<q@XFQYTfODd=3DBbY?@U
> z;3mws{s^4$J`4*B;gzO--eC;z<;K(c0Poc&rrvO6I~E$+9fBcuc0`rP%h9({K^rP)
> zT~#24n$3jBm7t0f3p!iBs{!gB>epfuQ*uPC4Y5fMC;!r+Zdv~l<xNZ}5pf%w&A7JA
> z1n7O@cLkw7&-e$mx5sF&wBIFy1er~R=3D}V4hIgt)JJXJd^f2hRdysRa^u8OI&JiudX
> z#E=3D~EhbnNy#!P|2#`Lbk>;4U!l&SV8MtNSXeAW6>ooT#IZV_46C1M2BK13!nhyi@q
> zx&Ys*$%d1ocMKr)^j*Hlw5^ZH93jS0$+p@s7Em+MW7yXvb)`|0{6@FL89!OCOU?Rg
> z5^r>2U2ew}i?-asFYp1-;IKf$!y@S?K|cJX4#%Ci&S8*Xe)NXLhjY#IB7G6+IO9{R
> z(Ds0sUUxzw!QybG#F=3D`boezByr*l3U9K!yTPM@(RyEmvFZA+Ex*|~{IjxJfr9&w%O
> z9#ZYI$F+?rvb|MsvXc*+8)cH6ax~B8!y9EdyU@;vN_8_?0P~HkKb(HX3R^5sDcK~o
> z$CQXZEF89n;5}hP7#6a~2!EMx<V9F>uAt4gu6cLOxoO{;Y2$j)xQF#i(;4H6>MPN9
> z2Qjip4w1DslRZzRpDpXAU0gTq&-#bhRu5d77FCyqzV&e>YrY-C8HOucaE8i=3D=3D4@VG
> zst537(g&nihI&uhxYe{r^2#C%j5YG^v1jNf(o<x{rn8d2NQ^UDW=3Dlrw#}Lv88!I?g
> zG=3DUy;dX?|&%*&%TJ?^aas_`sr+GKB1i}}ZUBk^S9Xk69`Ozt4mdksJR+*zXJ$0gt+
> zZtZlOK5!O1p~eH+qRB^eybW@xAV23mi%5PNxfZ8QvfuaC>Kj*a;_viC3x0rr_PgmG
> zdo%v;3{A+#Y9FWdk^W@Fr7d92G6ggCFKaUHUNWIxGA32dNm_vaCeD;+MjY>%9f{Lw
> zcbO+Q;gn`hE7AoRSAW36^cWA5Ks%I<9fuMUr107TawuWX(%Z`OHRltoM;Xp@m}fZ8
> zCH{}|WMVVt)!8O`Kq(Jg*@p6B!ac|C#F^$56&+|yYTqa57p^jLKSA%g3UdEI4tBRL
> jr&-zEx}2bj+vmA~Dl?bs+SZEat}~jvqM@xj%N_a;aMu5I
>
> --
> 2.37.1
>
