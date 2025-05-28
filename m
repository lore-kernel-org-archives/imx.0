Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E5C28B514
	for <imx@lists.linux.dev>; Wed, 28 May 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443650; cv=none; b=X/U8aFBTSPuD3tv3vC0IsSveipaPQWMVZt+PTUKB7n0nWCy7m277Qvwn9dGgarRVl0EDVnOWEaM0Bw5a60xNEyU7roS8QXDdHKoivlbXVKDmHJSr9Fktucf8ECsyJPUb1cVY08lJmx+jdRsVbHGcvSV381k0Nf5vzcTBM26ZLrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443650; c=relaxed/simple;
	bh=QVusH8ytRFHR18qIeA5nN1QKmrPz1Ltl6HMFW3sfcwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkxUX43hOXzY245A9UyuIqWCS76acINSYdhn1b99jCsak14Ht8Dp+90CfrTwsuAOkY29a6/jrToFpSh7jNlRp4pR2jgInoAVDhYGE5+k4QNdMUQekpEKCSeKnzvGvWnRhjvtYGfdqoD6M5sH04C5jSfQG49o157MkQ8uSWxJd7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYC1lPxg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYC1lPxg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30e542e4187so3223139a91.3
        for <imx@lists.linux.dev>; Wed, 28 May 2025 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748443648; x=1749048448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=;
        b=PYC1lPxgJjxKRjEFgBsD4O4F0Pvqn5OlN5EmVTsEehGt3OzKt1c0WkZ0H3J+HfCSI/
         gyRkekqqyoKwJ/to5Ne4GmIcH8pyJ1Y/Aj9DyhdjBNC+SK0/PFkmlWN8C9hjwMLliAgC
         /btUptswjd3HPwysDkN3M6oarAqptTeBltzVyiZ8ElMtsLOE8U03hkOHpHKLjOIGyzYE
         CuqqXlQf1zB6AnNCtPiOyaU70wKj3w+DyoU0CtWrBD5Il2epLsxlTe0C1HLF0G19FqN9
         eiXgj6teGKxz9jv5Hkf/897g56td1rw/i95J1olPzHmLR+sX64fE26jh/BCcP0suExm4
         7XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443648; x=1749048448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=;
        b=LQ0Gvjod9yUaSmZ/UnSpkkupMGskgT7N01L5JdMkEYr28Qf/bILH+23iGlHyviIww7
         JvTj5aqNOLACud2fT4WAMolKJpO3lCKjPfd11xZfxmyOGa6kB8pIAxubOElrNq5Ymla3
         9RncKvxr3QiG5FIA9hY+lLUd8WZZ58s5xgkRQqkFV17SYz8znjAJ7lxY6DDC+RJufTC4
         6swEYIVC/iKe3gDhRZOO65f12Pp6sYf9i0YiCyZvpyNRIfUoTiSxbF1Y86CTPtBEkt0n
         mOa53qn2dvGHEE6cKhPIB3XUKuMFmhB4cH6DkNDiw5QgY+LUYlLfLW0DdUb+ebVAcgks
         9ARg==
X-Forwarded-Encrypted: i=1; AJvYcCV5m0jeK/ZhgjM39ZlE8A/aGlPov8FAKx2t5o3GIkz/zAph+NOZbniYtr/OYZ0+cTjMC98=@lists.linux.dev
X-Gm-Message-State: AOJu0YxahAD0b8NsA0jJq+CcgDGQhIu+jQosDei16z/4DR5I+r9nOUKs
	bxurwVb5dB6Hfvp6I8T2nGCKRf3Ym9DHeFWFgCSHjdCL6rUamA4lfOf+CVq2wji/Y59eDj4JsIA
	uMzmRKLnYJPHNQDngUQ4aTiNljYFEeJI=
X-Gm-Gg: ASbGnctCtbAAD7aSEqusOU+gT51VsfFocM6yRMxyz9RrEAJ7VzYlkSTa9FxkKk12xAw
	v3VUfSGCeXsDs4cbpsQ5OLt6w+gWdHlnZTwXEfywXPi1oK0XsFiG44EFj/P6uHsch+T7qGlA9jH
	h6SFGO+tn4DWFe22qi+xLhYH/lcV/RiaqH
X-Google-Smtp-Source: AGHT+IHQJXU3p+rSsWqzxaLHSULaSjkoRZugP1vvKeH7LmxHkr7nUsvjweRVqC9eZYhDskDFMsLev7oBi7HQV+tKXmM=
X-Received: by 2002:a17:90b:4b8b:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-311d670ad95mr4555012a91.21.1748443647809; Wed, 28 May 2025
 07:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de> <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de> <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
 <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
In-Reply-To: <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 28 May 2025 09:47:14 -0500
X-Gm-Features: AX0GCFs7evzjkWRmfqngQQTZHj2yQaZWL0ja3DzZVNAah62H09qmX0qG_o41Jko
Message-ID: <CAHCN7xJJz2cOHBbyT0mr3QTndiB4Z6_Gtgy4k2giJt5qg4fH6A@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, benjamin.gaignard@collabora.com, 
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

On Wed, May 28, 2025 at 9:14=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le mardi 27 mai 2025 =C3=A0 22:05 -0500, Adam Ford a =C3=A9crit :
> > On Fri, May 2, 2025 at 11:55=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 25-05-02, Adam Ford wrote:
> > > > On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@peng=
utronix.de> wrote:
> > > > >
> > > > > The VPU_PLL clock must be set before the VPU_BUS clock which is d=
erived
> > > > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 6=
00MHz.
> >
> > I did verify the current clock rate ends up at 300MHz instead of the
> > desired 600 or 800MHz, so we should do something.
> >
>
> This reminded me of:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20250217-b4-hantr=
o-av1-clock-rate-v2-1-e179fad52641@collabora.com/
>
> Which also made me discover that this patch wasn't picked despite being m=
ark accepted. We
> will favour DT clock settings from here, since its not really managable o=
therwise, old board
> will stay like this, otherwise we face backward compatibility issues.
>
> Note that G2 and VC8K can be run at higher rate, but to be stable, you ne=
ed
> to also control voltage and proper cooling, not something we want "by def=
ault".

From what I can tell, imx8m_vpu_hw.c doesn't actually set the clock
rates.  It looks like it just enables and disables them.  I think the
clocks are all set via the device tree.  The 8MP datasheets list the
clock rates based on what they call 'nominal' and 'overdrive' which
determined by some SoC voltages.  600MHz seems reasonable for what NXP
states as Nominal.  I didn't see any NXP downstream voltage or cooling
options.

adam

>
> Nicolas
>
> >
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mp.dtsi
> > > > > index 97b09b647ec7..7f4bdefb3480 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > > > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>=
;
> > > > >                         clock-names =3D "g1", "g2", "vc8000e";
> > > > > -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_=
BUS>, <&clk IMX8MP_VPU_PLL>;
> > > > > -                       assigned-clock-parents =3D <&clk IMX8MP_V=
PU_PLL_OUT>;
> > > > > +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>=
, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > > +                       assigned-clock-parents =3D <0>, <&clk IMX=
8MP_VPU_PLL_OUT>;
> > > > >                         assigned-clock-rates =3D <600000000>, <60=
0000000>;
> > > >
> > > > I think there was a move to make the default be overdrive [1]  and =
[2]
> > > > and use a 'nominal' device tree for those who are not in overdrive
> > > > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > > > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > > > values here should be 800MHz and if we should add the nominal value=
s
> > > > of 600MHz to the imx8m-nominal.dtsi file.
> > >
> > > You're right, Ahamd and Lucas did change this. I will adapt it later =
on.
> >
> > I updated my device tree to run in overdrive mode and ran fluster at
> > the higher rates:
> > VPU_G1 - 800MHz,
> > VPU-G2 - 700MHz
> > VPU-Bus - 800MHz
> >
> > ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > Ran 57/61 tests successfully               in 5.922 secs
> > (vs 7.059 secs at nominal speed)
> >
> > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > Ran 129/135 tests successfully               in 40.107 secs
> > (vs 45.741 secs at nominal speed)
> >
> > If you want, I can submit the clock updates I have for overdrive or
> > send them to you to save you some time.
> >
> > adam
> >
> > >
> > > Regards,
> > >   Marco
