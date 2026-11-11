Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389671;
	b=QGZ7Zw6FfNSCNk+QDaNaMvb9Z6CDodckVxa4zgBpzEWU/1DNx0W02voLRuAr2yOYMiCB
	 xoPsNblkUf4ReW044Vgxj75fYDSkLAO7QoNdWQ8OQLyf03VSkw29HOoOsGxl/KWDVBnoS
	 jd6Ff86nfJeTvj2TW2L/B9TxUchmGiUnJPxk//8FiPrLdZoSzzvPKxwiuFmU2B/4lF99O
	 WBTHcxDvjuo5hy9zE4SsTovYQ9mHEmcU1B3WwvlORB/V+xIhuBhM9XrqI5jR8JOwzYhlQ
	 /rUMDaJntq11rta0M97Vd/NFdPf9BcXtMDwcfrzWEexAnlQsU8nnwcYvVUvecHCFg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389671;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QuiDQeSR9u6ftynF8Z5U/T47obifglQ4Sq5IlfMSK+A=;
	b=2g3BbCecljhp4AVftSD180wxcagMsLgBBe4iEkNmOvQPOwM0+0aEEoRWJtrG4bZNvwXs
	 KMf7w1WGiYuUGrmnQsIN1MQA2AVBsRjFGRO1dlyP9IcMVL2eU+beVfUlM+ovPDw3EGLkQ
	 OXRc5ZWpJAFl6oDAUaA5EEZe5tuQ4pUxbhnijlWURhoOBJbaJWlRLktyLVsFr4Bf94Krc
	 6EefmFsHdN1ZOuwbOWvKXhkdsLVHAjMid1sFJmGe12d+CaFuWcnkHmmIavMClsDOUcd7R
	 WZRv7ohU4So14EZITP2vzo+bNEQ486ZIK38pXTsyu2fBRMB+MLzxuHRNLHovdc1P79Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U+5/Uy+V";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80F6606A32E;
	Wed, 11 Nov 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+5/Uy+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D5E1F00A05;
	Wed, 11 Nov 2026 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389671;
	bh=QuiDQeSR9u6ftynF8Z5U/T47obifglQ4Sq5IlfMSK+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+5/Uy+VZnqRt/j/Qa8ceKPIbexYaIDmjXZ9qYWtGrUaTm7V+MpCOIWiIhVlDb2Fj
	 INCSNCIH+VpsT5j3GDLjCv0GKKdlvVo926zrv0EtVtq1nXH829mom1Y/7wwISS6E3w
	 mOTGEU8Fxx9pwJaNNdrJNhfAHjADY+i7yKUccnPQYASyBV/h6IKq4A7k1ihzBVaPr2
	 bYncOxQKElByqrw/YIlWbwvWXTincnnn9rjO2Pl914Msro00ly5QBF9TvQP9yNrAZ6
	 35N4b8ebseHEZK5q/QEPw/zcwyvA/Ry66USIV7v3w4tFCAmCZiSY2pl5SsVIhGLSB2
	 +cCf0qYAPy6TA==
Message-ID: <sashiko-outbox-208704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] ARM: dts: imx6ulz: Pull down BSH SMM-M2
 active-high WLAN IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111-add-bsh-smm-m2-v3-4-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
 <20261111-add-bsh-smm-m2-v3-4-4abdf10e9a7f@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:34:30 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] ARM: dts: imx6ulz: unexplained removal of cap-sdio-irq from
  usdhc2
- [Low] ARM: dts: imx6ulz: missing Fixes trailer for WLAN IRQ pull-down
  fix
--

commit 61c3fd2805764ab0c52e0d5e388368c4a4afb1cd
Author: Roman Smr=C5=BE <roman@amarulasolutions.com>

> ARM: dts: imx6ulz: Pull down BSH SMM-M2 active-high WLAN IRQ
>
> The pin is active when high, so pull-up configuration can trigger
> unwanted interrupts during module loading or unloading. Change the
> configuration to pull-down to avoid crashes there.
>
> Signed-off-by: Roman Smr=C5=BE <roman@amarulasolutions.com>
> Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>

[Severity: Low]
This fixes the pull-up configuration on the active-high WLAN IRQ pin.  Shou=
ld
this include a Fixes tag?

  Fixes: eb197dfe389a ("ARM: dts: imx6ulz-bsh-smm-m2: Add BSH SMM-M2 IMX6UL=
Z SystemMaster")

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/=
boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index dabe17222f139..91c76909c0867 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -81,7 +81,6 @@ &usdhc2 {
>  	non-removable;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
> -	cap-sdio-irq;
>  	mmc-pwrseq =3D <&usdhc2_pwrseq>;
>  	status =3D "okay";

[Severity: Low]
Why is cap-sdio-irq removed from usdhc2 here?  The commit message only
describes changing the MX6UL_PAD_UART1_CTS_B__GPIO1_IO18 pad configuration,
and sdhci_setup_host() sets MMC_CAP_SDIO_IRQ unconditionally regardless of
this property.  If dropping the redundant property is intentional, could it
be mentioned in the commit message or split into a separate commit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-add-bsh-sm=
m-m2-v3-0-4abdf10e9a7f@cn.bosch.com?part=3D4
