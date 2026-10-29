Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259958;
	b=OZjusrakq/5IeH1ODts2bojVceviQdKBpwFMny6PdE2uz8M3tISaI4QJzvTIrRiMk6rv
	 /gWPH40z2yjuShvO3Fxg8FSzyTgWTPGPDXAvgHnqHQWXqy0a1No8T+9C1BBvt78boeDL5
	 9bzz1w7pq21pqt11gOqenCtL5yX0gpJKRir3VQWJ62UQnH5c3cyA0+SPav6Ut5BikMInH
	 k14R99IG7JAGvF3gYTuu57L8XW5IniaaDoxW1XUFBali7OgfHbhw2cBCPyEE2cci28luX
	 jbB/AkTQiwZwMDByEIotufftERd4X5N2HVD/+deB/w0CY+mNbA9vo4u15l35sh4p/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259958;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vmBW4gO8Nky7yNYz4ZB3JPnpTFbjJCcHvhSFV7E0xW8=;
	b=qZPwGxLS37oSoGUY7357FP9aTMhnWas2jLaHmfsw4CF3YweHWP/FzY5jSxZY7JudnWS2
	 1fU8eLiPM/H0rLvuSCbXKucIz3QyXA8eoQt+Vve6iyUQsCk+1V4r0tKrsCgR+nP5eTDY7
	 2sj9bK7dFZiDrG5ILq/8mU2LoW2s5UhNKJKX/ViRjECdpdcY6rdvddBNaH681jO/WRcaP
	 QTS9rCEJNZ7A5AGfPSJ/UPuayQuD6IG5FmHwsma7vc1ZcemXFotaXKWGyuNT585n4Ke/j
	 soy5ciaMFEkAs2lNNapphjkKIocUIF/6p6PaLGLwSTlQTMl+cHnhhwclNi7fpO948Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ak8TvWra;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B1606A31A;
	Thu, 29 Oct 2026 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ak8TvWra
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1101F01825;
	Thu, 29 Oct 2026 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793259957;
	bh=vmBW4gO8Nky7yNYz4ZB3JPnpTFbjJCcHvhSFV7E0xW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ak8TvWraz70K0iuXwyFHK7lOKainVznU1cSfhXaJpR8Yy4/BF6jKIFxwtokgEjKjT
	 t0Ae7Kws64IhSSwVGnQX7KQC75VbhMpcI1h+Hx9Ta5B+ogbfq0CUsJf3+1B1R6WFM1
	 HW8MKeGizjH3WCaq755n3wnRNkdO1E772eCfylYD1oxw8zdIYYShGh79pN24R92nOG
	 jZV85qKTxA7PSHyZdOR4A/05cs/Jh7E7G+tWUCJFSPGRA6BX7Hr9KqQI1e9yTbgdsR
	 zDR44yPPLH4fME2bzE5m8C7rt2lpQbRYKu7KL/jUsRkem//fb3XinYGdajL3Y5L6Kw
	 AIoSjuPyKDrYA==
Message-ID: <sashiko-outbox-188896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: imx8ulp: add HiFi4 DSP node
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261029073257.84594-4-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:45:56 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: imx8ulp: dsp node bypasses sim_lpav clock gates
--

commit ab34f7c1f3585869d7aa05e36a532cefcf3ccd37
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

arm64: dts: imx8ulp: add HiFi4 DSP node

This patch adds a disabled HiFi4 DSP node to arch/arm64/boot/dts/freescale/=
imx8ulp.dtsi with its register region, clocks, mailbox channels, power doma=
in, and resets.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 777b89ed68490..4041f8ff5654d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
[ ... ]
> @@ -200,6 +201,28 @@ soc: soc@0 {
>  		ranges =3D <0x0 0x0 0x0 0x40000000>,
>  			 <0x60000000 0x0 0x60000000 0x1000000>;
> =20
> +		dsp: dsp@21170000 {
> +			compatible =3D "fsl,imx8ulp-hifi4";
> +			reg =3D <0x21170000 0x20000>;
> +			clocks =3D <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
> +				 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>,
> +				 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
> +				 <&cgc1 IMX8ULP_CLK_DUMMY>,
> +				 <&pcc5 IMX8ULP_CLK_MU3_B>;
> +			clock-names =3D "ipg", "ocram", "core", "debug", "mu";

[Severity: High]
Should the ipg, ocram, and core clocks in dsp@21170000 reference the leaf
clock gates in sim_lpav rather than the parent dividers in cgc2 directly?

In arch/arm64/boot/dts/freescale/imx8ulp.dtsi, sim_lpav consumes these three
cgc2 dividers as its input clocks:

	sim_lpav: clock-controller@2da50000 {
		compatible =3D "fsl,imx8ulp-sim-lpav";
		reg =3D <0x2da50000 0x10000>;
		clocks =3D <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
			 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
			 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
		clock-names =3D "bus", "core", "plat";

In drivers/clk/imx/clk-imx8ulp-sim-lpav.c, clk_imx8ulp_sim_lpav_probe()
registers the downstream HiFi4 clock gates in SIM_LPAV SYSCTRL0 (bits 17, 1=
8,
and 19) without CLK_IGNORE_UNUSED or CLK_IS_CRITICAL:

	static struct clk_imx8ulp_sim_lpav_gate gates[] =3D {
		IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "core", 17),
		IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "bus", 18),
		IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "plat", 19)
	};

Because dsp@21170000 points directly to &cgc2 instead of
<&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK>,
<&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT>, and
<&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_CORE>, the sim_lpav gates have no
consumers and will be gated off by clk_disable_unused().

When the DSP is later enabled and booted via remoteproc,
imx_dsp_runtime_resume() -> clk_bulk_prepare_enable() will only enable the
upstream cgc2 dividers while leaving the SIM_LPAV SYSCTRL0 clock gates
disabled (and imx8ulp_dsp_reset() in drivers/remoteproc/imx_dsp_rproc.c only
manipulates the reset lines). Won't this leave the HiFi4 core, PBCLK, and
platform clocks gated off when imx_dsp_rproc_load() accesses DSP TCM/OCRAM =
at
0x21170000?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029073257.8459=
4-1-shengjiu.wang@oss.nxp.com?part=3D3
