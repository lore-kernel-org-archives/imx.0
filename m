Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE12206A6
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826005; cv=none; b=B9sl1x6HiHVHeHM/UP0QAQ7URP/1p3UX5OCkjbVsS7v6TtoN59bIIuPhR0nOQu5XmgGWbhaR0i4H9flqOOyiOHBHYS3b51RzepF9Z4EK8nq6M9MjnX/N6rAJbt26h3ZqyKQ3GFgtZD1l7ze0y4Y1PgC60h5G0WSoVXZMCxv9tdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826005; c=relaxed/simple;
	bh=vHKy9Eu5YOu8HwZrm54A0VoUJII7CXBIo0gGClqXxxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXDO4oYgl3Wuci/+/8DPAf/OO31/5RWeF3fcSnarydEb0avc7LlAM1GuTeKTttsV+XaoNwA8/ezByuJxOlBWtsH+FWJQl+UktcY7Otnv+7CHA42aNpPT4GnKzxUZcaa6qZdTHbn5TebA31jbG/sg0mZfY4iFyqcOLA1xfWxf2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEP0735N; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEP0735N"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-87967784150so107756239f.3
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752826002; x=1753430802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx0q77AoxjqthF4ccMdayGHHZsrST9CpwJM5Mt74LpI=;
        b=cEP0735N3h6OwALpZYgaNUQh0nzDxSpTfWRz0SpkMQBJKwpTAn0ilV3XG/HDgWpEAT
         UGAW6w+Po9zGJkoIBCqfPPoIWrUb6BPSXVdiJ7k4Y0TAQKQK9gPGGD2zTR6VILy3xiLt
         6ZwG6y/AarL7yUqnIOEh+LeMWtzST/Vt+wZ17qaHjFUx5Wo425UTTKOrA+Dn7xsSsHo1
         WeJHEkPSfdADGBdnl7hUf7+Z6vUwNtl2lPC/oT0PYfK5Ov2SMgEJ/1n02nZvQT9ahEpI
         NI2T1Lhx1sPtezXEH2uuX5q8a/HIzbZaGMDj0RkVx5kb1AddcINjDPjxPneuDDK9+qKx
         rYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826002; x=1753430802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx0q77AoxjqthF4ccMdayGHHZsrST9CpwJM5Mt74LpI=;
        b=dHeCK+LguWZDNYjiqmmy2g4DyRPA8dy3jg2XUGtaXGIZ76jnrSgjGgHVKbDkuPiiAe
         KulhM2ChRjyXmzVE2PJK1UwL/8ubkqXBeAtiKZxrF9baLvekqn9/NlMr+WAAjILWvIOV
         JDePKEM/K4bDZyC3PU4PC8U47qImSFtgtSzA/qW84h5H0M3tm2VLA+QYeNnj3T3vLpXu
         CtahrLGUG3AfFOMbm1Tq5hDYbR7wE4O0k06Gk4E2vH66Ss9UYLkS5tHm2TfwPdUOkTP0
         O0AKDfOwOPSmes/IJfjytVylVWF+w4VU34CUXcnaqCz0mgcA+y/2L7u1ua2fW3LR8qyl
         ayVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYt1IEaj91Pwys2BijMNoxVRXYk42CveZbDuRGCQLxii4ofUmBJRGuOoFLxMA/+4E8/sA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxbFdIlnKmpzFKwa7k+YNEYHt3MAeYsmBNLCdP8Z8Ai6MCgAhp
	PICHbcf0f01a0dEiLr/rapSaCvvYyd4J426rPp+FMvSIhWmTVzRFz7TyvZaxNCTJ3EaFl2VGItY
	6WuAWtma2Z2k9/ooPWVRENMMUIT9UOdA=
X-Gm-Gg: ASbGnctnNAoyJwCa/i1GIoiU6IuQEyCM2yQayTeFNqDZogQGVA+AA3IOt+bhEZk/X3f
	OCGawOHCccjLZA+DLsk4Xygs77NHYUm4w8PoURBO41YEV0gsz4QPmr3+HxDm1aGpxZhHsJIJyB8
	coPUHt9TdYnognG9Uoi9zyQlqQXi7NwYZuu7POkjD/kfIlYbxBhx7F8LFoP8VaTlnz7utnWML/G
	IbCDxg=
X-Google-Smtp-Source: AGHT+IE7GtvrLtIVr6iZFDN2EctnHvZOIyXlxWh6MzNugLEC1QoF3JNN0biXxaa1KHAjBcNYlASQWsOf7emqcbdQTgg=
X-Received: by 2002:a05:6602:6b07:b0:861:d8ca:3587 with SMTP id
 ca18e2360f4ac-879c29170cdmr1158031539f.4.1752826002287; Fri, 18 Jul 2025
 01:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
 <20250716061114.2405272-2-shengjiu.wang@nxp.com> <aHf6q9asHvmw2Zc8@lizhi-Precision-Tower-5810>
In-Reply-To: <aHf6q9asHvmw2Zc8@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 18 Jul 2025 16:06:30 +0800
X-Gm-Features: Ac12FXzO6DToRCzTYT9Ee12DWJJ77xXjVtDSkAwa86OZgA_lFa-sYoMhsihMh14
Message-ID: <CAA+D8AM_3zK5Gp0_OWzc9B-qJU9CNYvDynMH5_a-o8+4ShE6Mw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: imx8mm-evk: support more sample rates for
 wm8524 card
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 3:17=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jul 16, 2025 at 02:11:12PM +0800, Shengjiu Wang wrote:
> > The wm8524 codec is connected to the SAI interface. There are two audio
> > plls on i.MX8MM, one pll can be the clock source of 44kHz series rates,
> > another pll can be clock source of 48kHz series rates.
> >
> > Add mclk-fs property for the clock ratio, remove 'clocks' property for
> > codec that doesn't need to handle clock enablement, add
> > 'system-clock-direction-out' for clock is from cpu dai.
>
> Can you provide the reason why need such change?

As commit
17cc308b1833 ASoC: wm8524: enable constraints when sysclk is configured.
make wm8524 release the constraint when codec's sysclk is not configured
so we can configure the cpu dai's sysclk to support more rates. previously =
it
only support 48k series rates, now it can support 44k series rates.

will add these info is commit message.

>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mm-evk.dtsi
> > index 622caaa78eaf..ff7ca2075230 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> > @@ -147,6 +147,7 @@ sound-wm8524 {
> >               simple-audio-card,format =3D "i2s";
> >               simple-audio-card,frame-master =3D <&cpudai>;
> >               simple-audio-card,bitclock-master =3D <&cpudai>;
> > +             simple-audio-card,mclk-fs =3D <256>;
>
> what's measn 256? Do you need mention in commit message?

mclk-fs is the ratio to calculate the sysclk,  sysclk =3D mclk-fs * sample =
rate.
256 is a common ratio for audio.

will add these info in commit message.

best regards
Shengjiu Wang
>
> Frank
> >               simple-audio-card,widgets =3D
> >                       "Line", "Left Line Out Jack",
> >                       "Line", "Right Line Out Jack";
> > @@ -158,11 +159,11 @@ cpudai: simple-audio-card,cpu {
> >                       sound-dai =3D <&sai3>;
> >                       dai-tdm-slot-num =3D <2>;
> >                       dai-tdm-slot-width =3D <32>;
> > +                     system-clock-direction-out;
> >               };
> >
> >               simple-audio-card,codec {
> >                       sound-dai =3D <&wm8524>;
> > -                     clocks =3D <&clk IMX8MM_CLK_SAI3_ROOT>;
> >               };
> >       };
> >
> > @@ -570,9 +571,17 @@ &sai2 {
> >  &sai3 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pinctrl_sai3>;
> > -     assigned-clocks =3D <&clk IMX8MM_CLK_SAI3>;
> > -     assigned-clock-parents =3D <&clk IMX8MM_AUDIO_PLL1_OUT>;
> > -     assigned-clock-rates =3D <24576000>;
> > +     assigned-clocks =3D <&clk IMX8MM_AUDIO_PLL1>,
> > +                       <&clk IMX8MM_AUDIO_PLL2>,
> > +                       <&clk IMX8MM_CLK_SAI3>;
> > +     assigned-clock-parents =3D <0>, <0>, <&clk IMX8MM_AUDIO_PLL1_OUT>=
;
> > +     assigned-clock-rates =3D <393216000>, <361267200>, <24576000>;
> > +     fsl,sai-mclk-direction-output;
> > +     clocks =3D <&clk IMX8MM_CLK_SAI3_IPG>, <&clk IMX8MM_CLK_DUMMY>,
> > +             <&clk IMX8MM_CLK_SAI3_ROOT>, <&clk IMX8MM_CLK_DUMMY>,
> > +             <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_AUDIO_PLL1_OUT>,
> > +             <&clk IMX8MM_AUDIO_PLL2_OUT>;
> > +     clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k=
", "pll11k";
> >       status =3D "okay";
> >  };
> >
> > --
> > 2.34.1
> >
