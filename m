Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452AD531
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090229; cv=none; b=MJJuGzAOeAPS99epukRqGQdKqjMAnZYEKnSs2hfA2rFIbMEFRAZUmz9Nen1PczOaDuiFGTsLT3gXVG4P23pcP9r+jg6Gpos6xO+Iu3+1AMJOMNaJbP0vHEM2mub5gbOQbf5obeJuaKOEsI69AanARU7XcCuXcPR2P2okLCt10h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090229; c=relaxed/simple;
	bh=ElElpE5RI1lH2dckfWn+mTh2+L8kYUvgE3xhIammmVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfkwxJG8ulfaKpxir1KFvlzbBijF6Wo28f1aUZPEE/PN61L/+HTzN9tCj7F8cmaPSoEenM8Ej+0g1rQyv/NI0GSO64E8LWr8BB/o4efS/pjxaM0bF0lQ1anAVzaT8QP91C5hD46YgzI/b5pRWmtjXTFgh49GBZ3rxCHL/0OzN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyFTg5fq; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyFTg5fq"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d3d58d6e08so3081578a91.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724090227; x=1724695027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuuVS1ITiXegZviCSVA69/H214SGYPE8ceZUaExnSkA=;
        b=YyFTg5fqU6NeXJ63f4QzaCghHMEixiI5hSb5LgXkhg4WGskMNwNQXoOc+73p82yM7+
         VAK9tVjoTPJyzKn+/Fvn75VS7sm3VaUUErbknJnpaWwVwgRNpXjnZzqSj3EO8bE8N863
         TKsQx6iNdObZZ13itQytxoY6NzuvdUU3hV+QSTmiV3QAe1dsXeE1tabrTy3S0XleSGed
         YjiGKBfUFVOFX/gRfXRhCiiWRwmQhEmB2r6G6u6NPnp5ICetWzSAUaiitL12cENM3K7f
         JmWaVkHu9QbiLlCaVAHYv4Qj6t1PxcD8Yg9EtNpqS5gNj4OKCH/OE7algNt7S9TZUhwB
         m1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724090227; x=1724695027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuuVS1ITiXegZviCSVA69/H214SGYPE8ceZUaExnSkA=;
        b=wUzOX2aCqnuzQYKx8CzDKqbEhNZixXuIPlHtbq5bQPHBkQQlx8uOIeqH2kEQs6Kob9
         zRIoqyy9XV7NuwEWmJXwqlYYCNrhmmgeaZuM0WhXEP5Iz/ZudEDocc3/q5K7e/kJF9Vt
         3cFOkmhXzQ6/5OGSJiFJ0hVsFg/rwK/w1EjnKNihoCAb0G48XW0oTCnAkqd5hYoCYwjU
         5wbWmeNdTecQKAl4wP9Co+wnNSLq8EXwttRHHV9aMQckVo0YdLme/JZn08uDhlbZb+Hq
         C1E5t5f7bX/PM3NSxHRqC9/dJHIRLj75lEhTB/wu5aqYTQFy11JUrs1+KzJaprI7GR27
         zKGw==
X-Forwarded-Encrypted: i=1; AJvYcCUOlXhlGeIg3Akhfa7Pavfwfv/2qeUxnJdu+/2aHWIjxe2qu6phC0DjbCFozOolQpnYLvn27E/NqZELq6pnDegJHUmt
X-Gm-Message-State: AOJu0Ywm+22+bfRPmkGYUeEbjNMYHj7BY8HwKVhFb0vPULXfczGlOI7Z
	ACWGj6lDWmfRGYwslidHQVtvN6aGDxYL2keQTo1Nqmh4mP12OjdK5PUWFHeKX6+i/v0L+ileVfA
	WVSssUH7q9eLyQPboVyCXxUF7iCQuvw==
X-Google-Smtp-Source: AGHT+IGbaJamB1WMkYOQP8y5T/PYjNZENVTB6C6IJlDHm2P8ZbvZAYpVTPylR32B0EEeQ7iuqG6aNEVdXU3TCrMt3ZQ=
X-Received: by 2002:a17:90b:1247:b0:2cd:5d13:40ba with SMTP id
 98e67ed59e1d1-2d3dffc8f3bmr12871217a91.14.1724090227028; Mon, 19 Aug 2024
 10:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819-imx_warning-v2-0-4c428bd11160@nxp.com>
 <20240819-imx_warning-v2-12-4c428bd11160@nxp.com> <CAOMZO5C_uvmuf-+QGH4E2X=Jei81a--N5wC83V-URPkXj-q7hw@mail.gmail.com>
In-Reply-To: <CAOMZO5C_uvmuf-+QGH4E2X=Jei81a--N5wC83V-URPkXj-q7hw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 19 Aug 2024 12:56:55 -0500
Message-ID: <CAHCN7xKYZDZdaQ7Noe1TrcDt-E5cU=kdnmkn7EBvBFRapvCApQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mm-beacon-kit: add DVDD-supply
 and DOVDD-supply
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 12:24=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Adding Adam.
>
> On Mon, Aug 19, 2024 at 2:03=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote=
:
> >
> > According to binding doc, DVDD-supply and DOVDD-supply is required
> > properties. Add these to fix below warning:
> > arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: camera@10: 'DVDD-s=
upply' is a required proper
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks for doing that!



Reviewed-by:  Adam Ford <aford173@gmail.com>

> > ---
> >  .../boot/dts/freescale/imx8mm-beacon-baseboard.dtsi      | 16 ++++++++=
++++++++
> >  .../boot/dts/freescale/imx8mn-beacon-baseboard.dtsi      | 16 ++++++++=
++++++++
> >  2 files changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi=
 b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > index 6086dae2e5fbe..ea1d5b9c6bae0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > @@ -56,6 +56,20 @@ pcie0_refclk_gated:  pcie0-refclk-gated {
> >                 enable-gpios =3D <&pca6416_1 2 GPIO_ACTIVE_LOW>;
> >         };
> >
> > +       reg_1v5: regulator-1v5 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "1V5";
> > +               regulator-min-microvolt =3D <1500000>;
> > +               regulator-max-microvolt =3D <1500000>;
> > +       };
> > +
> > +       reg_1v8: regulator-1v8 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "1V8";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +       };
> > +
> >         reg_audio: regulator-audio {
> >                 compatible =3D "regulator-fixed";
> >                 regulator-name =3D "3v3_aud";
> > @@ -187,6 +201,8 @@ camera@10 {
> >                 assigned-clock-parents =3D <&clk IMX8MM_CLK_24M>;
> >                 assigned-clock-rates =3D <24000000>;
> >                 AVDD-supply =3D <&reg_camera>;  /* 2.8v */
> > +               DVDD-supply =3D <&reg_1v5>;
> > +               DOVDD-supply =3D <&reg_1v8>;
> >                 powerdown-gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
> >                 reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi=
 b/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
> > index 20018ee2c803e..77d14ea459e57 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
> > @@ -40,6 +40,20 @@ led-3 {
> >                 };
> >         };
> >
> > +       reg_1v5: regulator-1v5 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "1V5";
> > +               regulator-min-microvolt =3D <1500000>;
> > +               regulator-max-microvolt =3D <1500000>;
> > +       };
> > +
> > +       reg_1v8: regulator-1v8 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "1V8";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +       };
> > +
> >         reg_audio: regulator-audio {
> >                 compatible =3D "regulator-fixed";
> >                 regulator-name =3D "3v3_aud";
> > @@ -158,6 +172,8 @@ camera@10 {
> >                 assigned-clock-parents =3D <&clk IMX8MN_CLK_24M>;
> >                 assigned-clock-rates =3D <24000000>;
> >                 AVDD-supply =3D <&reg_camera>;  /* 2.8v */
> > +               DVDD-supply =3D <&reg_1v5>;
> > +               DOVDD-supply =3D <&reg_1v8>;
> >                 powerdown-gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
> >                 reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> >
> >
> > --
> > 2.34.1
> >
