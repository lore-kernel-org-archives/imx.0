Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5C1DF73C
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878559; cv=none; b=ULJ1E2NXtaTYe91RLEdri0LmXrJCsqBZkusOJnr+3mipMVWfwk/pmRdTY8tgHjByZ/IhVXuyhQiCSbJsXEsPjo9kxlgbeADDr8VyfIvPzLcgVaRBk/E55r4retTsbjeXRHoq4mPAzKFcIGA0tvNYcoycwRdO3kFMGtudXhxUDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878559; c=relaxed/simple;
	bh=uVanfGYE8GJVCmIGdZwtcNhOll4tNtdy4QOFK3CEVJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxQ49Os5z6EIxc8WWz7kask1cRQZf2cpbQ6HzqNrpCdVWbVeALrzWdogR5iMzc9ID42+MGHwGaKlO+KgrHRoaXBVuqp0q8CNv8eAgu3tuotzSggPo4tNsq7iZyC1M0Kg3BJV438B2TMFsSCzs3HgOHP7vcIeq6y9l74inmoOIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwAWJgjO; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwAWJgjO"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3159557b3a.2
        for <imx@lists.linux.dev>; Mon, 02 Jun 2025 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748878557; x=1749483357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=;
        b=cwAWJgjOAMHEtkeUDN5W3FB2CAerwhsQNVpPNKO+71lRLvzy1K1fVz56C6pwTIsRjq
         kxpKkLYPRSSTwljX7SEYpZRTzV88sRSiNeERY/22v9jeggI05r9dD7Oj9i+Uu7ecLlZ1
         E4Il9Qtbdrr+p1vHtwDBfX0sqhw0XU1a4yD3wOfYzK+ngQgMi0O1eOJpX0TMs3IhMMha
         ct3AdtSR9SuPmMZ3LW2L2xF7ciM2iVZ6AxTdvsPnYn0URPIj5CVkO0JEraMoTDNRgbVF
         pGlg37sOl05R0AXwt2SLr+TOgJxMTCYutx3Dq+0qBt+Azp0g1geZmNVLgxuEXGLHO5Pd
         nkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878557; x=1749483357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=;
        b=lk4RolDb+589UwnEL6lgTC+ESey/HY3GoYqsMXK+0hgwrUpxxSEFS/ZUICyU3C1q1i
         VjhSSXV/9wfM2Fa+HA+6Jp2HeF21kYDBGU5xyT5H7V4byAyZYvQPmj4a4SbQk0D22KwS
         NSJHxWOax3tGtuYm1yQbcu6vhawR6ZmGdDxmGmIH3g03J7DSzXcJIxkycBF47S+BPwDG
         ivbq2M+hy7qsJNz/ZV48GwLp2Sla+0Yy5dwLnbNJ2lKSvIapEupkR82336cxdZBCKbNz
         Ty1nfu6+KoBBueAtdbIUP/VKyjU3bDsrBUdpM0Zsa2NEa383RtEyr+SAb60AdI6NkLIu
         rBrg==
X-Forwarded-Encrypted: i=1; AJvYcCX+XOQcXIdwiteUpBufyzlC3msM5EKAsNHgL4HXJr1huLmJGoMNaTaSZXMciyI9vOQ9eUw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxZhuNWCzUmWNdhnw5C630v4MXXoJE6mnXuwhI9jWimdlK929G
	WKR9QrYgaeRa2fHPwcwiUpQQlzdBrHmRE1P7xEe6cII43O2vUBmnfqWEdfxMshRHc96Wa5AseUj
	WACvspuLzvNgZr1pF8Jogk75OHW79dHA=
X-Gm-Gg: ASbGncteHQp4ngjTbpk1VDex3oxBbXXPmjbGPnogE7ooVTTEf1cr0TsC9lKP0a5bnRt
	eIJlLJ3lWRDrdu8PbWnnIy0ey52OcxutUY8ExT+d6hEcU1KwSyvFBUf7Eix96Bqv1fFJC05+dtM
	PrVrVJGNkYnz2P4PSPSGJpMZr30U5GvmtoAcHsgkNNEe0=
X-Google-Smtp-Source: AGHT+IE8dA1Pco98GdRrtQc3CXC3zKuqxixGckqlX0jZC5qF1ahyeT/uWicDjaPk55wZT7A9YkfMRqlC7hap1CDu8es=
X-Received: by 2002:a05:6a00:88e:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-747bd96bb7bmr16842852b3a.10.1748878557404; Mon, 02 Jun 2025
 08:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de>
In-Reply-To: <20250601183620.npuicmipv6kv54z6@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 2 Jun 2025 10:35:46 -0500
X-Gm-Features: AX0GCFv__4JuP0qoSXHoB0hrfnXBe2PzvmOKWGMVmTMtI6s693tpZjD_UaOkNuc
Message-ID: <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 1:36=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> Hi Adam,
>
> thanks for the patch.
>
> On 25-05-30, Adam Ford wrote:
> > The defaults for this SoC are configured for overdrive mode, but
> > the VPU clocks are currently configured for nominal mode.
> > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> >
> > This requires adjusting the clock parents. Since there is already
> > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > This frees up the VPU_PLL to be configured at 700MHz to run
> > the G2 clock at 700MHz.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 909555a5da4b..848b25c9b752 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> >                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G1>;
> > -                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> > -                     assigned-clock-rates =3D <600000000>;
> > +                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_=
800M>;
> > +                     assigned-clock-rates =3D <800000000>;
> >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G1>;
> >               };
> >
> > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> >                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G2>;
> > -                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_=
1000M>;
> > -                     assigned-clock-rates =3D <500000000>;
> > +                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> > +                     assigned-clock-rates =3D <700000000>;
> >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
> >               };
> >
> > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                       clock-names =3D "g1", "g2", "vc8000e";
> >                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&clk =
IMX8MP_CLK_VPU_BUS>;
> > -                     assigned-clock-parents =3D <0>, <&clk IMX8MP_VPU_=
PLL_OUT>;
> > -                     assigned-clock-rates =3D <600000000>, <600000000>=
;
> > +                     assigned-clock-parents =3D <0>, <&clk IMX8MP_SYS_=
PLL1_800M>;
> > +                     assigned-clock-rates =3D <700000000>, <800000000>=
;
>
> I think we can drop the "assigned-clocks =3D <&clk IMX8MP_VPU_PLL>" part
> completely.
>
> Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.

I think you're right.  I'll fix that up and do a V2.  I forgot to add
my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.

adam
>
> Regards,
>   Marco
