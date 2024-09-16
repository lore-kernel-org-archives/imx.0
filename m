Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D015C146
	for <imx@lists.linux.dev>; Mon, 16 Sep 2024 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726519841; cv=none; b=k724xUyfkBx6LpQGFtwBjnvCuuyGqr2+Z3UT9oHWjoQTrEy7qbvgJF9tAbeftPVOxzzJ/Z+L9XAZZQdtxqqqmOBbRr8l+pJgFwFgFEyfumLi3b260b1h6jw0R45OBtdnOYnLBKbmXztU8OGLwLjftF4NOkzxsFN72HHT7fvavGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726519841; c=relaxed/simple;
	bh=EPuS2/x+Apeqo+h5PlDJ57xWx6EiaLVNmNHDNkprA+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIYR/FoxJBoz9OErWh3YWNriy85iZKL2K4C4O9+zTHmy1N8fcssN8kGUh2lHhE20D16IkSauUDbhIDCUjR32N8CqSDhuJjKh4TJ5iBVYgw1wUdX/VsfnJ4bsZ8rYAoNjnwxQ9olOjDIfNZAHU8U5APmW/eh4dSkpdMLPXD4sk1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDtKgk7X; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDtKgk7X"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e1a9dc3f0a3so4572282276.0
        for <imx@lists.linux.dev>; Mon, 16 Sep 2024 13:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726519839; x=1727124639; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/uji5axtWcw2sGeJ1wr4Dagb+N5kE/4J37Qx8pyTE=;
        b=jDtKgk7XQ5VzwneteT1PONAwmikrYHoxrTzTPUjK1bI4i0Z7EUwL+QrJxcweVHKGlF
         qDrO3g7sjhBOAMosWoc3T/6y6qT+HQ7IkNOhH1MdzP8uy6Y8port3JsV0Yw4Yy2COuvj
         /7Cy/2u9qN8aqvq3UesNndFxGJEJED+iFadJTtiIk02czW8NBqFqgANAQmc4Q4li/Sz4
         5Ii3ScKtH6swSu8866ldEsj2tRj/L1qpBgm+GdYlBFhIQwdtPkGvGK++WDjWqqpa7fmI
         2IWCfWgUeE2O8s4rzmSPy2xUyzQXbD3a2soyuCdEsAl4aM29U1TiampAim+MK8ORiK5U
         p7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726519839; x=1727124639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x/uji5axtWcw2sGeJ1wr4Dagb+N5kE/4J37Qx8pyTE=;
        b=DRtWZIoUzKiOYvTTY7g3cybRICmOJHP6uz0nVDumjHOWet2Qdt0NclN6mVUsUpzACP
         wJJW7YaG2WQEeso9SlOmvxoydG2vW7Ci3JvPKNRtRq2o3FSOl3ZOTxGIFM0uBkI+d7y0
         qwVLDDXSDXlXDTyKfjf+Pziap7LlFWfDoUtqzEx3A7dqVAD/OeQav0Bck8i+l94CJDSy
         /SzHUpKJCpI7YfDShd+8qPrWFaxeTsfuDd2id4YC8qeOdFEYcJYUTaqS8+XGfUuocYdb
         8HEe/L+hYMoTQfew1b98J6Jhm9gEz3liOSov2SNnhvxrVgm0WHJq/o71WZf8xmZM5fn8
         eRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzqpraRiH9E7+4HQIIV7mDEZdRq7XNkR6BWbkqc7uHV3DYGWlZ4O03FOWBpMAB2Mmc0LM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk2WX3Kv2hCv2Mo0H0NBaDOWGiKQeDSp+AZwropNBTN2rRa3dv
	oDEjK4i7tdCVmgOoRFUNse24YbbsGnD4c7Ueh6i5HCkO3n+m6T89AQjJgtPJf0RtrqjO23fMnjv
	bOnsnRY4dged8zuFHkxt337xpcYItGOR5O76nxw==
X-Google-Smtp-Source: AGHT+IHNWoBnckh4JzG0DDNvv5RpTkKQzvqOqO9Ri3IKF30PiwhxsioNGUI2YVdoXHTZXLgQWO0U4qG9goXSQaXULW0=
X-Received: by 2002:a05:6902:1246:b0:e1d:33f1:cb91 with SMTP id
 3f1490d57ef6-e1d9dc2c28emr14379688276.39.1726519838644; Mon, 16 Sep 2024
 13:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240916200255.2566209-1-diogo.pais@ttcontrol.com> <eb3ec7f1-388c-4613-b995-69b8ad6ef2c0@kernel.org>
In-Reply-To: <eb3ec7f1-388c-4613-b995-69b8ad6ef2c0@kernel.org>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 16 Sep 2024 22:50:27 +0200
Message-ID: <CAJpoHp4MbeNCz4Sys1_khQiG7BG6F-aVkrgivHGY_JYP831teg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8: Fix lvds0 device tree
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, aisheng.dong@nxp.com, Frank.Li@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

Sorry for the broken tag, will fix on a resend.

As for the naming, if there is any reason for them to be named qm_*
it's totally fine, I'll revert it and only touch the clock names. I
changed them because comparing with lvds1, those ones do not contain
the qm_ prefix and I don't see how this dtsi relates specifically to
the imx8qm, since it is a imx8-ss... and not imx8qm-ss...
I didn't quite get the question about the nodes. Could you elaborate? Thanks

Best regards,
Diogo


On Mon, 16 Sept 2024 at 22:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 16/09/2024 22:02, Diogo Silva wrote:
> > From: Diogo Silva <diogompaissilva@gmail.com>
> >
> > Some clock output names on lvds0 device tree were duplicated from mipi1,
> > which caused an -EEXIST when registering these clocks during probe.
> > Also fixed the device naming to be consistent with lvds1.
> >
> > Fixes: 0fba24b3b956 ("arm64: dts: imx8: add basic lvds0 and lvds1 subsystem")
> > subsystem")
>
> Broken tags. They do not line-brake, BTW.
>
> > Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> > ---
> >  .../boot/dts/freescale/imx8-ss-lvds0.dtsi     | 22 +++++++++----------
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  4 ++--
> >  .../boot/dts/freescale/imx8qm-ss-lvds.dtsi    | 20 ++++++++---------
> >  3 files changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
> > index d00036204a8c..a4d94467039f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
> > @@ -10,34 +10,34 @@ lvds0_subsys: bus@56240000 {
> >       #size-cells = <1>;
> >       ranges = <0x56240000 0x0 0x56240000 0x10000>;
> >
> > -     qm_lvds0_lis_lpcg: qxp_mipi1_lis_lpcg: clock-controller@56243000 {
> > +     lvds0_lis_lpcg: clock-controller@56243000 {
> >               compatible = "fsl,imx8qxp-lpcg";
> >               reg = <0x56243000 0x4>;
> >               #clock-cells = <1>;
> > -             clock-output-names = "mipi1_lis_lpcg_ipg_clk";
> > +             clock-output-names = "lvds0_lis_lpcg_ipg_clk";
> >               power-domains = <&pd IMX_SC_R_MIPI_1>;
> >       };
> >
> > -     qm_lvds0_pwm_lpcg: qxp_mipi1_pwm_lpcg: clock-controller@5624300c {
> > +     lvds0_pwm_lpcg: clock-controller@5624300c {
> >               compatible = "fsl,imx8qxp-lpcg";
> >               reg = <0x5624300c 0x4>;
> >               #clock-cells = <1>;
> > -             clock-output-names = "mipi1_pwm_lpcg_clk",
> > -                                  "mipi1_pwm_lpcg_ipg_clk",
> > -                                  "mipi1_pwm_lpcg_32k_clk";
> > +             clock-output-names = "lvds0_pwm_lpcg_clk",
> > +                                  "lvds0_pwm_lpcg_ipg_clk",
> > +                                  "lvds0_pwm_lpcg_32k_clk";
> >               power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
> >       };
> >
> > -     qm_lvds0_i2c0_lpcg: qxp_mipi1_i2c0_lpcg: clock-controller@56243010 {
> > +     lvds0_i2c0_lpcg: clock-controller@56243010 {
> >               compatible = "fsl,imx8qxp-lpcg";
> >               reg = <0x56243010 0x4>;
> >               #clock-cells = <1>;
> > -             clock-output-names = "mipi1_i2c0_lpcg_clk",
> > -                                  "mipi1_i2c0_lpcg_ipg_clk";
> > +             clock-output-names = "lvds0_i2c0_lpcg_clk",
> > +                                  "lvds0_i2c0_lpcg_ipg_clk";
> >               power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
> >       };
> >
> > -     qm_pwm_lvds0: qxp_pwm_mipi_lvds1: pwm@56244000 {
> > +     pwm_lvds0: pwm@56244000 {
> >               compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
> >               reg = <0x56244000 0x1000>;
> >               clock-names = "ipg", "per";
> > @@ -48,7 +48,7 @@ qm_pwm_lvds0: qxp_pwm_mipi_lvds1: pwm@56244000 {
> >               status = "disabled";
> >       };
> >
> > -     qm_i2c0_lvds0: qxp_i2c0_mipi_lvds1: i2c@56246000 {
> > +     i2c0_lvds0: i2c@56246000 {
> >               compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> >               reg = <0x56246000 0x1000>;
> >               #address-cells = <1>;
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > index 62203eed6a6c..f7b9b319a58a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > @@ -96,7 +96,7 @@ vdevbuffer: memory@90400000 {
> >
> >       lvds_backlight0: backlight-lvds0 {
> >               compatible = "pwm-backlight";
> > -             pwms = <&qm_pwm_lvds0 0 100000 0>;
> > +             pwms = <&pwm_lvds0 0 100000 0>;
> >               brightness-levels = <0 100>;
> >               num-interpolated-steps = <100>;
> >               default-brightness-level = <80>;
> > @@ -541,7 +541,7 @@ &fec2 {
> >       status = "okay";
> >  };
> >
> > -&qm_pwm_lvds0 {
> > +&pwm_lvds0 {
>
> Why this cannot stay qm_pwm_lvds0? Are you sure nodes now have correct
> order?
>
>
>
> Best regards,
> Krzysztof
>
