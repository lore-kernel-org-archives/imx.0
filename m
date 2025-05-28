Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E141C7009
	for <imx@lists.linux.dev>; Wed, 28 May 2025 03:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748401537; cv=none; b=nmyZLk/rpGzzRjJHuy3MmMmtohKetYjfvOfaKrsuZfjZE57VjDE+iQVAqCMnp8kxDAstxuWMQUzwd5uz4SAcPMf5x+qIHpP9WkN8rgDNIe/8ESzuyZTU99V8fu6wJolg7FeT8+vc6Fr+nZKniwekzd2UHBUyKkcO2EcIxizws+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748401537; c=relaxed/simple;
	bh=P4NoW3ykcOBCx61JzkfeuKAq1Yv3n1sxMGQ2EH9VqOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxssXA0mAvfVGExtsqN2J3C+tUiH38nJyaFF0IQXXyLxKBQumEE7Hy/SzTR9SBjjZUBrtWQ6Xtpg8AGR3odkj8SI2EmNUmu22Qli+6SbjUf3NB1MDutlAdkQQng7D4nK57vdUJAqvLZEu/5WaXP/nlPhv8Fo2KeulVgn9m20kF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF3D7XxR; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF3D7XxR"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso1094281a12.3
        for <imx@lists.linux.dev>; Tue, 27 May 2025 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748401535; x=1749006335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=;
        b=WF3D7XxRo+Zecfsgajh0J1LkrQfOEsZ5dfEw2lHqQC9Pj2G0TGl8bdQ5x5XtzQKUfR
         Z3s5pPhTaTSvlOVfDdJ5+4Z4hletGXr6PSs7W4jndpuSh8kjtxmADs/RTDpyCZCD3RFe
         guve0LTO9yM7U2eYbZi2ZkJ5hUh0/y6qVNNKS9jEsL41LFXutS14Ha2xyFWJQ2ouW2EB
         qKWaObrC//A8cj7065R6vKPAghRxs69OxoxcBp1JNoB1Ymnz+i6lFOmZZt9MoXjwY1sW
         DC2OPW5WCxR4F3MLNpo1gd6UXAkKRMcZbQN6WeSAfOBJW4rfKuu72+Ok0uzJvZ9XPa3h
         MWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748401535; x=1749006335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=;
        b=PJF/BjkRYDC19k87nC3iT8oQpY43fsBnJ1YYM4jTjKEujFwmMEx0IC43pWX/pUxiOg
         AXAry12hq1JUcDSlaDQCexw/IM+mwD4vBjerMFkDZWVTQpfz8TugXaQEmotTBZzVJ+7r
         Po5CJ+eyOEw6Y2AlLcAnyStO2tIwAz+Btg3mSJ1MTwt17sjSiVMw0umFO6byIWQ9x84u
         TZCPt7KDaneYvM1IjY6kCW/touhz2nAi+SB8ewCon80ErcDAABMvCmR2k6d5NRUx/VNS
         Yud94UCm+13jEWosRYo9oHVAkGVC0TUnk71S8L8LnVuUoDS0RkAbvXx0XODTZ2aXWjfa
         rCeA==
X-Forwarded-Encrypted: i=1; AJvYcCUe25ke7Ht9PoSUjbo+NA8VmuDQbds+QiGU50J6C3pCSvkxoyRDvbF923DNfCTur4t3Jvo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzot9Oq3h8B7No1VKYwqnyJ8vc+sgotMT9Ri7XxfwgqSKmTfeF
	l0IGWosiZavOB7ilSLMKP2ukV0/bwN9UTZ2aAJH5X06Cnk9fE6KqXXDtTzQ9JvT2dohu1TWvz4N
	p0s0AeftpObfaDA1PGPbcRO8AhyUUGS8=
X-Gm-Gg: ASbGncspf5MXi2zQMB4/oZF9ry6374Srri/Q7tsM5T4nQwTJCs/1ObjHfizdrjp0sYb
	8vmLaBAsRT7FbTL4lWPb+iCyym+b4nUzXW6qUiz4VjU2ud2JlWSt4rHsHzVmzndXlY4f/fIXzM3
	S7ee05ktQftd/cwXKA98rS5aEwmKGNzuV6K6c/+cN/yiY=
X-Google-Smtp-Source: AGHT+IEZ6LkUmKwlZlKmCgrqaa17DjFrtDszVlcH7RcGvuUieg+Ee25K0BY70YK/3VI5vchDvPkcpByMtCn4N3Ku04o=
X-Received: by 2002:a17:90b:4b8b:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-311d670ad95mr2330419a91.21.1748401535339; Tue, 27 May 2025
 20:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de> <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
In-Reply-To: <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 May 2025 22:05:23 -0500
X-Gm-Features: AX0GCFu8yyPWk2ODj0OO3w1sV1GGZuj2FPHpU_Gczh74crcCq6_GDYUbvmDndvY
Message-ID: <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:55=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 25-05-02, Adam Ford wrote:
> > On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > The VPU_PLL clock must be set before the VPU_BUS clock which is deriv=
ed
> > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MH=
z.

I did verify the current clock rate ends up at 300MHz instead of the
desired 600 or 800MHz, so we should do something.

> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 97b09b647ec7..7f4bdefb3480 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > >                         clock-names =3D "g1", "g2", "vc8000e";
> > > -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_BUS>=
, <&clk IMX8MP_VPU_PLL>;
> > > -                       assigned-clock-parents =3D <&clk IMX8MP_VPU_P=
LL_OUT>;
> > > +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&=
clk IMX8MP_CLK_VPU_BUS>;
> > > +                       assigned-clock-parents =3D <0>, <&clk IMX8MP_=
VPU_PLL_OUT>;
> > >                         assigned-clock-rates =3D <600000000>, <600000=
000>;
> >
> > I think there was a move to make the default be overdrive [1]  and [2]
> > and use a 'nominal' device tree for those who are not in overdrive
> > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > values here should be 800MHz and if we should add the nominal values
> > of 600MHz to the imx8m-nominal.dtsi file.
>
> You're right, Ahamd and Lucas did change this. I will adapt it later on.

I updated my device tree to run in overdrive mode and ran fluster at
the higher rates:
VPU_G1 - 800MHz,
VPU-G2 - 700MHz
VPU-Bus - 800MHz

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 57/61 tests successfully               in 5.922 secs
(vs 7.059 secs at nominal speed)

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 129/135 tests successfully               in 40.107 secs
(vs 45.741 secs at nominal speed)

If you want, I can submit the clock updates I have for overdrive or
send them to you to save you some time.

adam

>
> Regards,
>   Marco
