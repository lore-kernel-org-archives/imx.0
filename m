Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301F3B71CE
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733336; cv=none; b=tfd+yAjY8V0LOPwKXpl0dGNFrRv0ILtXkf+epOx8q26zyZ+obklxySRKbtV+A+KBG4ibUBR0Sa+xpc8/cTMR3WnDHkv9kqQ8MIVVptTwgC/Ww4xNM+ytJ0Ik3c6uHsZGWHtUKWgWTsvkm9Ne07MAworme+Yvxlt5HetwI73f6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733336; c=relaxed/simple;
	bh=SJLeWOvQD8dXdtuDXo1OetRS6dL6iFPDYQiXDDBpRro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQXe+HmmazXrg9lxLPxlbR1DsCMd3RnNrmu6Ci2lWQ/br1wOvBhARULkac51AYHy+Sm1pGoutpxhKvRJamlgl0/hidMfNySEfMTplR1+k84l5NG/owCEm6Pp+Eiem3/Kj7NAXFKaV66reT97PBpsx7shZdPOkRutyEYpEuQ5AWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHRQ6un8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHRQ6un8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250f28f1cdso97313466b.0
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787733333; x=1788338133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xw7LZB2HbfnwC4ej5Y9HAOHCayPzVl8tY+L3ByVWnVI=;
        b=RHRQ6un8H+j4MptHuKV7KAqxGRqAgXH0PwjssvCfGgYfha3Z0XSPA4oMeZaf09Kba5
         GBgZOEAn+cCT2WZ1D0eUPdEDxmsDF9/rvVciV1maXZdZ5cMaRtCt+rn30fScTywB1+4q
         a8lSx1T4h4kQNvBcyH9UwHLeAAqKjttaEdl4stASpWJgXXVHwNLxOpWSHBXhKKjadTMv
         PgRxNkBW0OIm8GhRZzODG46HsGH/1rA5pEsHpk9qsE96beORHzNgHa52Nba2ciguwiMK
         Sleq91kS1nzUGCIVGanV1FFlNyNCyGEgnAVJHNVGJxldgjgzzd5iaFCFiUSf5ernMASW
         0evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733333; x=1788338133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xw7LZB2HbfnwC4ej5Y9HAOHCayPzVl8tY+L3ByVWnVI=;
        b=TFcTgGQdL/ybHOlJMwTVQd/IrcoErSgByYZg9mvrWaxRUj03Y2pEY6k99oU4iuF7Ee
         QXcbGmnXFFV55yqZKMw6qVZ5vCY9WfqGIQ9evRXvGGT8BoPf3L0iv6TSyncU7EdZ1kJM
         ktd4eY+FI6aRG4aw6IsUCH7doOmyiBemcsN1q8MGcNCQPB9rARn3XsBcypceKTVkqrlR
         qHGsUdMB1cPkKkRCiesnRQCDuC9zZaeTAv683fwUlyLhPhdiIUuknV2k3fbO5TXLvHpx
         Gi1rTz2yV2gk524XrzOp+uefQjvcuA7fOP70BTTechvN9V1fRjUoZX819r6paORyOVOs
         L6rg==
X-Forwarded-Encrypted: i=1; AHgh+RqHQdXFk5IoRuFvfrPNtERTzuuqcYoWGzAAj6QJNNdZfEy6SV56ZsX5krBksI6XDV7HbvU=@lists.linux.dev
X-Gm-Message-State: AFuF++ktDSJuKqvU3zJ/5lTDFSQAFCVfzwC51Q4RQNieZLjFloJRJp+Y
	yWonbmC3b+Ts931m1kNlzr5azKkT0/2JjmaLvJXqWYkObAaKyW889G+d
X-Gm-Gg: AR+sD114QbmNJB5/LFFTebrWSUu7k0NymbSMIwZ7/ePpdUAlD2N4Ju+k1CJ4jNIMds0
	BtiwI+WcXFuGtDDz6NV5zPRmHBHBXu4h5qTHCXHWqJ5XEFPjoHTfpKlIma5hK11T42kx9GPfcn0
	1ooDkMpUrcV9lVqAMg0QVnr1ODH2KSUmFcm9uaSOB3vS4XBVhG8cSCwq3roS+63+5bg/uNQmbMf
	dXJgbPEZjIspVPVVkaXQCb++kdmmsJGHw+b5RndZWdf1S91u28Bhm7xwZcAUpi90zYbF81Y5RUe
	KMe/Zrrb62wmeT/4o9DycBG3wokdpDjZrRKZm3sHzY3OLQ/RG3WyOxop+cJfe9P2/Xv82M+onmx
	71sakr9SnenTckIZkMFT7AtFSEO1KS9WMau0ba5U/4GtPjk5k8orxy/KC7dqglZXy5A/nuc2h7T
	WTyMx7Wbtb3g2jViJwZz9j/VPabu5ZZkILwcO/f/34a56XqcVqEhGbORwYZ4wW6l4hqMxFY+fom
	onbNNxbNAC9PMybGZdFABmr3Wg3XQ==
X-Received: by 2002:a17:907:1b24:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c250bbce005mr609918466b.8.1787733332977;
        Wed, 26 Aug 2026 01:35:32 -0700 (PDT)
Received: from GLaDOS.station ([91.80.77.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a7303casm498326866b.25.2026.08.26.01.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:35:32 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:35:24 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <ao6lTMiwplBt-4zm@GLaDOS.station>
References: <cover.1787674237.git.stefano.r@variscite.com>
 <749f32d1a92ec87ce76f1ac0ce0d780c431fdde2.1787674237.git.stefano.r@variscite.com>
 <20260826083133.C97A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826083133.C97A21F000E9@smtp.kernel.org>

On Wed, Aug 26, 2026 at 08:31:32AM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > index 0000000000000..aecc8c747f041
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> [ ... ]
> > +&usdhc1 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > +	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> > +	no-1-8-v;
> 
> [Severity: Medium]
> Does including the no-1-8-v property here needlessly cap SD card performance
> by explicitly disabling all 1.8V capabilities and preventing UHS-I
> negotiation?
> 
> The pinctrl configurations below for SD1_VSELECT prove the hardware supports
> 1.8V switching:
> 
> > +	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > +		fsl,pins = <
> > +			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59
> > +			MX7D_PAD_GPIO1_IO08__SD1_VSELECT	0x59
> > +		>;
> > +	};
> 
> With no-1-8-v present, the MMC subsystem will never switch to 1.8V, rendering
> the UHS-I pinctrl states dead code and capping speeds at 50MHz.

This is intentional. The board does not support reliable 1.8V signaling
on this SD interface, so no-1-8-v is required despite the presence of
the VSELECT pinmux.

> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > index 0000000000000..158158afc3391
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> [ ... ]
> > +	codec_wm8904: sound {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,bitclock-master = <&dailink_master>;
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,frame-master = <&dailink_master>;
> > +		simple-audio-card,name = "wm8904-audio";
> > +		simple-audio-card,routing =
> > +			"Headphone Jack", "HPOUTL",
> > +			"Headphone Jack", "HPOUTR",
> > +			"IN2L", "Line In Jack",
> > +			"IN2R", "Line In Jack",
> > +			"IN1L", "Microphone Jack",
> > +			"IN1R", "Microphone Jack",
> > +			"Microphone Jack", "MICBIAS";
> 
> [Severity: Medium]
> Does this routing contradict the configuration of IN1L as a digital input?
> 
> The routing maps the analog Microphone Jack to IN1L. However, the wm8904
> node configures IN1L as a digital microphone input via wlf,in1l-as-dmicdat1:
> 
> > +	wm8904: audio-codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
> [ ... ]
> > +		/* DMIC is connected to IN1L */
> > +		wlf,in1l-as-dmicdat1;
> > +	};
> 
> Because IN1L is placed in digital mode, does this cause the analog signal
> from the Microphone Jack to be ignored and break analog audio capture?


This is intentional. IN1L is used as DMICDAT1, while the analog
microphone path is handled through the remaining codec input routing.
The current routing matches the board hardware configuration.

Stefano
