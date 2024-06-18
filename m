Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2F77F2D
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712442; cv=none; b=LJKqDVCt3jFZM/bwKBFa+TXnaAYsSpp6QZhzWGVTiOrtefqstR1wmFMbMM+NWJN76UY10nasGueRnJxqMRX2DySn8LrdI+pnXnOwJIbw+L/ChdWmbq60PwlBEbrvyjQGtzRyDVbmCCodvuwKd5CKTNo+a/xpIyAtjSE8Hmt7QZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712442; c=relaxed/simple;
	bh=zIMNWACWd3M1Cq3jpWfZKiQ5Xh7liCvscnKOrJX2hTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcpeEzfpNR2mQkm5DO0C35pZF/2ZtREXGROYS+SsEZ8q79nlxuq+p+1g/q6XIkxgORZWXFyJDhY8YNzBDk9ioFf3U6QVif7SChz3bNssuMgi+MG4v+KE3kZU+zA3oNbzofuarsLXelxHFJ7XoS954upEHOEgZsJARqCUp28tTII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ6l++yI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ6l++yI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c3051aee3fso4456772a91.3
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718712440; x=1719317240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qMW/fhC5hVCG/nXgj+a3Q82/zqzq5GMfidhC1/vwWQ=;
        b=aJ6l++yIiglQ5xqk6UhCZbxwY39I5QiOhp7mlxsdrklC28+3PVKJjwYe+z7opaBJ+r
         DEIlfo5jKFaSYjJoxernCh00UxhYaSwryjmwxs2Q78QtSw8X5vRnZpWXK2xAj1Mnxein
         Eou5uiNB1hGyvcevDP4VJi7TVFnXty82Z3Ou5Rdx1SimmJWBbx/6Kox1qC24oZcVnVWg
         2nFeNIxCzcxxq6eVKUv/HGHlskgyJhP4LKA9jjkFr8C1aenVHxkGwDEgaqVQMsKQoitz
         T5AdOnGjagcA0xn7UTBUKhU2rUESdns2d6icOSTyYDnctVkcQMsy2vyn6pFnXZee0P8l
         pt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712440; x=1719317240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qMW/fhC5hVCG/nXgj+a3Q82/zqzq5GMfidhC1/vwWQ=;
        b=pCAXsCI2kExWapWNbZ/zv3BYsVTSqG1L2H0NbyKL048AkHjWWFmiKqses8SDBhDRLE
         ofR2DL3iN5WwMTm3Cb8Gci7K8bZT3teHI6yNSnx7BZ9p/ZWreZHZdtYgicm6fLoM9JxO
         F1JMOkTA02VHrQTWJASeVAfX1PzO74Pov3+INN4S5geg2hK23mgWGN4ZnlrJ9aWxQ1E0
         YkIKHexcAghxVvv4s+OFmSNZwHDD7lB7YQY85kimrjrR6lhEeCD+W+7I1QyroSrcwBXN
         3Xlc8TxBw51Ym9W4su8NmKqGutV4hayBRnEbDn2Pcvk8JGrUpQBD7+7Z/gUYshd+1eSH
         okog==
X-Forwarded-Encrypted: i=1; AJvYcCW40u8NXAF6d/2m1HhqTUS/YgcjBgSFTEv6WDFpqln4uAsmbg01+x2fZWxW9iNmYsOtjoCh1DRBDtgwrqgpAYK5NYuc
X-Gm-Message-State: AOJu0YyVf9UeQgpMRNxMPJLzX+XUy6uxagGvhCGzskGCXZaBfyG/2XEf
	zfkfyBTsQnFkKK7fcu26qFIBvteMFJEGWSE8uteNliMJDppiv2smaPL+xrWCmpqgbRpnqyzNmda
	owoktqLN9CvVagDuk0kAcy7GoVto=
X-Google-Smtp-Source: AGHT+IHg1X7qgFSor7TxKpGXZBPsKGWKdT3X+Qx1Ip3e8IAZa58OsBuEF8S062FwXsVLE54KZxZg9btByg4FhvGFjdA=
X-Received: by 2002:a17:90b:4d8b:b0:2c4:aa67:895c with SMTP id
 98e67ed59e1d1-2c4db242648mr11431737a91.17.1718712439650; Tue, 18 Jun 2024
 05:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617223952.1899201-1-aford173@gmail.com> <5814494.DvuYhMxLoT@steina-w>
In-Reply-To: <5814494.DvuYhMxLoT@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 18 Jun 2024 07:07:08 -0500
Message-ID: <CAHCN7xLPHx_W4GGkSknu=_3o29jT0gQZddLAakDMzUUR0ok=Lg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix pgc_mlmix location
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	marex@denx.de, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 1:15=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Adam,
>
> Am Dienstag, 18. Juni 2024, 00:39:51 CEST schrieb Adam Ford:
> > The pgc_mlmix shows a power-domain@24, but the reg value is
> > IMX8MP_POWER_DOMAIN_MLMIX which is set to 4.
> >
> > The stuff after the @ symbol should match the stuff referenced
> > by 'reg' so reorder the pgc_mlmix so it to appear as power-domain@4.
>
> Taking a look this mismatch seems to be also true for:
> * IMX8MP_POWER_DOMAIN_VPUMIX
> * IMX8MP_POWER_DOMAIN_VPU_G1
> * IMX8MP_POWER_DOMAIN_VPU_G2
> * IMX8MP_POWER_DOMAIN_VPU_VC8000E
>
> Would you mind fixing them as well?

I can do that.   I'll send out out later tonight.

adam
>
> Despite that, for this patch:
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>
> Thanks and best regards,
> Alexander
>
> > Fixes: 834464c8504c ("arm64: dts: imx8mp: add mlmix power domain")
> > Fixes: 4bedc468b725 ("arm64: dts: imx8mp: Add NPU Node")
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index b92abb5a5c53..3576d2b89b43 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -789,6 +789,23 @@ pgc_usb2_phy: power-domain@3 {
> >                                               reg =3D <IMX8MP_POWER_DOM=
AIN_USB2_PHY>;
> >                                       };
> >
> > +                                     pgc_mlmix: power-domain@4 {
> > +                                             #power-domain-cells =3D <=
0>;
> > +                                             reg =3D <IMX8MP_POWER_DOM=
AIN_MLMIX>;
> > +                                             clocks =3D <&clk IMX8MP_C=
LK_ML_AXI>,
> > +                                                      <&clk IMX8MP_CLK=
_ML_AHB>,
> > +                                                      <&clk IMX8MP_CLK=
_NPU_ROOT>;
> > +                                             assigned-clocks =3D <&clk=
 IMX8MP_CLK_ML_CORE>,
> > +                                                               <&clk I=
MX8MP_CLK_ML_AXI>,
> > +                                                               <&clk I=
MX8MP_CLK_ML_AHB>;
> > +                                             assigned-clock-parents =
=3D <&clk IMX8MP_SYS_PLL1_800M>,
> > +                                                                      =
<&clk IMX8MP_SYS_PLL1_800M>,
> > +                                                                      =
<&clk IMX8MP_SYS_PLL1_800M>;
> > +                                             assigned-clock-rates =3D =
<800000000>,
> > +                                                                    <8=
00000000>,
> > +                                                                    <3=
00000000>;
> > +                                     };
> > +
> >                                       pgc_audio: power-domain@5 {
> >                                               #power-domain-cells =3D <=
0>;
> >                                               reg =3D <IMX8MP_POWER_DOM=
AIN_AUDIOMIX>;
> > @@ -900,23 +917,6 @@ pgc_vpu_vc8000e: power-domain@22 {
> >                                               reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_VC8000E>;
> >                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_VC8KE_ROOT>;
> >                                       };
> > -
> > -                                     pgc_mlmix: power-domain@24 {
> > -                                             #power-domain-cells =3D <=
0>;
> > -                                             reg =3D <IMX8MP_POWER_DOM=
AIN_MLMIX>;
> > -                                             clocks =3D <&clk IMX8MP_C=
LK_ML_AXI>,
> > -                                                      <&clk IMX8MP_CLK=
_ML_AHB>,
> > -                                                      <&clk IMX8MP_CLK=
_NPU_ROOT>;
> > -                                             assigned-clocks =3D <&clk=
 IMX8MP_CLK_ML_CORE>,
> > -                                                               <&clk I=
MX8MP_CLK_ML_AXI>,
> > -                                                               <&clk I=
MX8MP_CLK_ML_AHB>;
> > -                                             assigned-clock-parents =
=3D <&clk IMX8MP_SYS_PLL1_800M>,
> > -                                                                      =
<&clk IMX8MP_SYS_PLL1_800M>,
> > -                                                                      =
<&clk IMX8MP_SYS_PLL1_800M>;
> > -                                             assigned-clock-rates =3D =
<800000000>,
> > -                                                                    <8=
00000000>,
> > -                                                                    <3=
00000000>;
> > -                                     };
> >                               };
> >                       };
> >               };
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
