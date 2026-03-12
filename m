Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4353BAD90
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308975; cv=pass; b=gWlTmnGLBxJtV7Z6i42k+2wLILjX1HMujT+jEP0KaVZY6Cl64M/jV2VbXg6i/nnanFPwE1oSunLge61Qe47O8UFhmfn3QpOBbrRqie2uNfGJ6PmxJGyBibce9ICmwiadPhiXF7jeTun0TWOwoE9PcgZGTpXwpuA6ugCBBhRavuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308975; c=relaxed/simple;
	bh=I5YR2k0W1ulybpXJBmWDZB5GMpxTcVL88d3EYxbBDfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGPJzmQcK8EcddgYp2vjNv9FzZ7EOMQVtekUyKeKFmrGPtr3VK+UiJPmpEkrXRTIi4KsSGKeiIniN/PIOU5OXDMaV/2GkTgVMbXGsE/vTk2HGQkeu803dTRm+EiC/JHHihtn04AcGbsOvijSUgo7Vcts+jdmDVa9ipX07K1ts7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/dLEYPf; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/dLEYPf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae82df847bso6399235ad.2
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 02:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773308968; cv=none;
        d=google.com; s=arc-20240605;
        b=d+jVpFvMMsb2LHdv3e/rCTRvOe9J6bGRiXa1XV+tGfNK5MnYMTP37udQ4YQWwm/Mqw
         ucNRsOXoYpckDWXC64TmLhzKIox+LU9sbAeIrjvtXFwnLoobetsY1Pv/zGSav0j392fr
         OfXJogvDMBHbbsMWrbC8u5YZ2k86jfhNaxgBHwJjt7zpdjgD1q4KCi+P2wDgkqBtBuYM
         3xmHANz1AtZdjdFQVoOkVIIFFswQ3v+iJOp6ktkMfke+xiN2UR1PPpLRSEJ53d29u0gT
         KUMbx+Y22iPeosr5Za9owRMXKO0SGhPSsRelC2DrZISlF6PdCTkympVZoYsfVwS3MKBu
         bwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=;
        fh=/r9MC+Irhzo8J2raLGphkvikzJHGWuK71faQyKyKIgY=;
        b=IG3m/wPjQT5MsntF70P3xtD25oRim2lMnbQiiQIU4vETeQ6+J8jKm5atalS0wiV9zd
         LZzJLUjmtCyDdlkoMfirgcJJk5DMY71izMrwgvlaR53yX6B9wAJdDSlZXEGKO7/r2fqd
         Dj2v13w556POdyCcyVSQZtnVMcNjs6o7FdojrZajqcXMu8vUziq6mP01j0PdYEqCq2KV
         ZaDBJB7br//mM73uD07H+pSzyi+Exgb3Di04TwL/QJZfy/bAWMbzz8Cggppb9YugqL2R
         AoD0t8tI1oCKFjNn9VTI54y2qt4+lciApuEo+y1CbBIH3Jj26p3P8pBYH4iO7OmtDYiD
         9zBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308968; x=1773913768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=;
        b=M/dLEYPfBjltAIhY4W0CC7FtvcPaYy6lLJPhFM7cwEvha+eyj3PGUktiQFnMBIdAJ9
         9Byn9rUz0SHDDBWWCK9JnXzygAELy2J9jPCd/uP5OX8oVzDQtuYMu1scGRRsSBtD0KHV
         Ft/w8CY4ezYtMjaEAzPRuhWeUO5VAeo+Z8gTX6y4Vkn6q8DeYezH0GVLqqFgQ4L8jO8h
         1oRFUna5RP1G+10ya7OdlsOYjX+jassrfBk2espnWIVK0C7jRwCzhmz/EEf+47O/ypzb
         qb0bNWut9njcToE7qAehFV6XELkmTKapHJlwevvhP74lvsb1DKW5ot3tzo3F4GenH30Z
         qcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308968; x=1773913768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=;
        b=WWjj212lXNR61iTMj3iwI1LY7nB5minU17avQBBZotsCUA2aSz/uJY8F/P99Yn/VQJ
         iK5h1sU4AtpoetvBrRF3Tyx7c8/XmPtORitsqHeOPWxDkMZ5Bf29BdkKu1FRLmXwqgWN
         g54i0qMXNKsZLQCgoQgIyN9jNs3wNXX+KADvUfnPbWHldsVrM2AbHDQVgghOdUmu31EV
         GmvFc/MrVIPZD2ZBRAtCJEY8aB3ag16DGzegCXHPE4JTOvrj9zYvj2o3hQfiv16eRn/U
         z00wvHs63IMZAnijsa4zBt8fP2SNrfjbqKyyb/rX+zafczhABonPRWrWQNmBhc/eqI2U
         /1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4TPkypofS99hkJoslBtJZj02kDJeBQwWDNr3OqtQHkSJ+hw1VYL7IyYHcUKj1bq9Yuo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJGBuPwTwU3xge3D1kvjnDrTwhjAgUAOpmfwb0HIcVriPuRJeD
	tN00+y1rpNGbWg9ti+E3W7LdR+4d7KXho5Rr+6ppJotjc4hsmQEASw//G5Kc6esWsVUj9lmCM4g
	cBc4b6agcL44F4uHwb5pLK9RMe0wgrY8=
X-Gm-Gg: ATEYQzz6ymH8g+n1n2CPMMOgQUHm7fcjRKs2dc1rr1CcVs9/SUurSyKnvfq4A8Y0XXK
	zrXaOMZtHQC38/EpZyCwmDT9IT+A/uW7NTv3gccdbW0O2sOAwvUYx5zzo9Gt66Ip7luRzPvbhPo
	uilRv9F1TthA7IMbOqqYy7mnuhB0cU4wVF/l4w77oYu6wCXQCijajRmMM7vkgk5ujEkVa9ywHuN
	MyJI/SVmdmhmIkCbw6DCHZtPViu4aEIOT6gI/MvLMZUTCeWL5Dx4sZiNjiC0FzgMreWotPKDsWG
	DPxr4jw=
X-Received: by 2002:a17:902:db11:b0:2ae:572a:9f39 with SMTP id
 d9443c01a7336-2aeae7ae390mr54703625ad.18.1773308967815; Thu, 12 Mar 2026
 02:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-3-shengjiu.wang@nxp.com> <3918649.ElGaqSPkdT@steina-w>
In-Reply-To: <3918649.ElGaqSPkdT@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Mar 2026 17:49:09 +0800
X-Gm-Features: AaiRm50CUazvc_T7zmj0XI6ARnrNtJthYpyJMVhYBvsd-m3gH044OghfQFK0Z8w
Message-ID: <CAA+D8AP=cobxaw=0CuM=J_Q+3LMtJoO-B5LvScQWqE-9NswKXA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Donnerstag, 12. M=C3=A4rz 2026, 04:49:10 CET schrieb Shengjiu Wang:
> > Add wm8962 sound card. By connecting with ASRC1, the sound card support
> > sample rate conversion.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx952-evk.dts | 119 +++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/=
boot/dts/freescale/imx952-evk.dts
> > index 509704c23e89..ef0058b98573 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > @@ -110,6 +110,15 @@ reg_vref_1v8: regulator-adc-vref {
> >               regulator-max-microvolt =3D <1800000>;
> >       };
> >
> > +     reg_audio_pwr: regulator-audio-pwr {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "audio-pwr";
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             gpio =3D <&i2c4_pcal6408 1 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> >       reg_usdhc2_vmmc: regulator-usdhc2 {
> >               compatible =3D "regulator-fixed";
> >               pinctrl-names =3D "default";
> > @@ -131,6 +140,51 @@ reg_usb_vbus: regulator-vbus {
> >               enable-active-high;
> >       };
> >
> > +     sound-wm8962 {
> > +             compatible =3D "fsl,imx-audio-wm8962";
> > +             audio-asrc =3D <&asrc1>;
> > +             audio-codec =3D <&wm8962>;
> > +             audio-cpu =3D <&sai3>;
> > +             audio-routing =3D "Headphone Jack", "HPOUTL",
> > +                             "Headphone Jack", "HPOUTR",
> > +                             "Ext Spk", "SPKOUTL",
> > +                             "Ext Spk", "SPKOUTR",
> > +                             "AMIC", "MICBIAS",
> > +                             "IN3R", "AMIC",
> > +                             "IN1R", "AMIC";
> > +             hp-det-gpio =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
> > +             model =3D "wm8962-audio";
> > +             pinctrl-0 =3D <&pinctrl_hp>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +};
> > +
> > +&asrc1 {
> > +     assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX952_CLK_ASRC1>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>, <3612672000>,
> > +                            <393216000>, <361267200>, <49152000>;
> > +     fsl,asrc-rate  =3D <48000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&asrc2 {
> > +     assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX952_CLK_ASRC2>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>, <3612672000>,
> > +                            <393216000>, <361267200>, <49152000>;
> > +     fsl,asrc-rate  =3D <48000>;
> > +     status =3D "okay";
>
> Is asrc2 actually required? AFAICS this is not referenced.

Yes. It can provide memory to memory interface to user space standalone.

Best regards
Shengjiu Wang

>
> Best regards,
> Alexander
>
> >  };
> >
> >  /* pin conflict with PDM */
> > @@ -185,6 +239,27 @@ &lpi2c4 {
> >       pinctrl-0 =3D <&pinctrl_lpi2c4>;
> >       status =3D "okay";
> >
> > +     wm8962: audio-codec@1a {
> > +             compatible =3D "wlf,wm8962";
> > +             reg =3D <0x1a>;
> > +             clocks =3D <&scmi_clk IMX952_CLK_SAI3>;
> > +             AVDD-supply =3D <&reg_audio_pwr>;
> > +             CPVDD-supply =3D <&reg_audio_pwr>;
> > +             DBVDD-supply =3D <&reg_audio_pwr>;
> > +             DCVDD-supply =3D <&reg_audio_pwr>;
> > +             gpio-cfg =3D < 0x0000 /* 0:Default */
> > +                     0x0000 /* 1:Default */
> > +                     0x0000 /* 2:FN_DMICCLK */
> > +                     0x0000 /* 3:Default */
> > +                     0x0000 /* 4:FN_DMICCDAT */
> > +                     0x0000 /* 5:Default */
> > +                     >;
> > +             MICVDD-supply =3D <&reg_audio_pwr>;
> > +             PLLVDD-supply =3D <&reg_audio_pwr>;
> > +             SPKVDD1-supply =3D <&reg_audio_pwr>;
> > +             SPKVDD2-supply =3D <&reg_audio_pwr>;
> > +     };
> > +
> >       i2c4_pcal6408: gpio@21 {
> >               compatible =3D "nxp,pcal6408";
> >               reg =3D <0x21>;
> > @@ -312,6 +387,24 @@ &lpspi7 {
> >       status =3D "okay";
> >  };
> >
> > +&sai3 {
> > +     assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX952_CLK_SAI3>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>, <3612672000>,
> > +                            <393216000>, <361267200>, <12288000>;
> > +     pinctrl-0 =3D <&pinctrl_sai3>;
> > +     pinctrl-1 =3D <&pinctrl_sai3_sleep>;
> > +     pinctrl-names =3D "default", "sleep";
> > +     fsl,sai-amix-mode =3D "bypass";
> > +     fsl,sai-mclk-direction-output;
> > +     status =3D "okay";
> > +};
> > +
> >  &scmi_misc {
> >       nxp,ctrl-ids =3D <BRD_SM_CTRL_SD3_WAKE            1
> >                       BRD_SM_CTRL_M2E_WAKE            1
> > @@ -402,6 +495,12 @@ IMX952_PAD_GPIO_IO27__WAKEUPMIX_TOP_CAN2_RX       =
       0x39e
> >               >;
> >       };
> >
> > +     pinctrl_hp: hpgrp {
> > +             fsl,pins =3D <
> > +                     IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_GPIO2_IO_11  =
       0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_lpi2c2: lpi2c2grp {
> >               fsl,pins =3D <
> >                       IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL       =
       0x40000b9e
> > @@ -476,6 +575,26 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7 0=
x31e
> >               >;
> >       };
> >
> > +     pinctrl_sai3: sai3grp {
> > +             fsl,pins =3D <
> > +                     IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK    =
               0x31e
> > +                     IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_AUDMIX_TDM_OU=
T_TXBCLK       0x31e
> > +                     IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_AUDMIX_TDM_OU=
T_TXSYNC       0x31e
> > +                     IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_SAI3_RX_DATA_=
0              0x31e
> > +                     IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_AUDMIX_TDM_OU=
T_TXDATA       0x31e
> > +             >;
> > +     };
> > +
> > +     pinctrl_sai3_sleep: sai3sleepgrp {
> > +             fsl,pins =3D <
> > +                     IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_GPIO2_IO_17  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_GPIO2_IO_16  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_GPIO2_IO_26  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_GPIO2_IO_20  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_GPIO2_IO_21  =
       0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_tpm3: tpm3grp {
> >               fsl,pins =3D <
> >                       IMX952_PAD_GPIO_IO12__WAKEUPMIX_TOP_TPM3_CH2     =
       0x51e
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
>
