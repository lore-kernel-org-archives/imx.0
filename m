Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E2A921
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161302; cv=none; b=ZWzmwNpjoUomvIXOAXNqbPPAoJlaDikBjvjt9UNwWNpQ2oaYIuXGJgF2q3wHxvu2pR7odvtWkirkEhg/0OrrKqkpzPqRAK56amYQVKaa5zJQNnyG89EKVDrSe6+ciNgr/9+bKXCPNT5B5hO/jACYGfwo8raLYF+fE0OpIf83lJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161302; c=relaxed/simple;
	bh=3/0pK6RZdlAUSX4eLAsbqqK6Heip1k4OrjIbZstPLcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCrQRzuHyAItRBUMKt4rFSyXdLgNLL0xpUFk+gc6fO4Vwk2WEFhGuoIPN+W4BAuDxpd/EJsCyA0Z2KsKNtla26A5XGuYZqzAXDPIX4hN1q6jWJtfYjKXqXYax6w2Ek4w0iWaKo5xVbQe1GuY+f4g4h2qbgkrda+VUzkyqRosfRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jCgcceB5; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jCgcceB5"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2E4951FB51;
	Tue, 29 Oct 2024 01:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1730161295;
	bh=pa7F/vUvrn4cS13peqpoEOrrLHgGBeJ8P7o1ocNJ7DE=; h=From:To:Subject;
	b=jCgcceB5HSLOBpEBB7R/TjUpQ1RpZeVNeJXKsVFTtzFcoLi6FUxcDKEJ9kf7S7MWX
	 8y66rOLrTNaS359sWo6MvBDcTbM+8NBKb3y45GYgvQJ1BXb+dwNBtXDMTMO2FKGTvw
	 tyj17FT6M0pRralD89hYsxNTZkP2amGmaOAgOGqAfi0X6sNIbv88ET+dNd8T5vXstf
	 0riM9j1aQ8LVQmmdEQHDZYE/ay0Cl7GEWUcDIUu1kHgaCWk5+Hx0vAOaP7SQJisWMR
	 H58MR7b/mtMh37rN2o678RHEebdqRtfuKIDxuGe/ngspeKxJI+yhbyp/cGYiNFjEtO
	 c1C9diqdVU3lw==
Date: Tue, 29 Oct 2024 01:21:31 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: add audio-codec cs42888 and
 related nodes
Message-ID: <20241029002131.GA10307@francesco-nb>
References: <20241028220318.2047870-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028220318.2047870-1-Frank.Li@nxp.com>

Hello Frank,

On Mon, Oct 28, 2024 at 06:03:18PM -0400, Frank Li wrote:
> Add audio-codec cs42888, enable esai0 and asrc0.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 82 ++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index e983633a4bb31..31cf02275ca9e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -134,6 +134,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		enable-active-high;
>  	};
>  
> +	reg_audio: regulator-audio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cs42888_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>  	reg_fec2_supply: regulator-fec2-nvcc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fec2_nvcc";
> @@ -223,6 +230,27 @@ simple-audio-card,codec {
>  		};
>  	};
>  
> +	sound-cs42888 {
> +		compatible = "fsl,imx-audio-cs42888";
> +		model = "imx-cs42888";
> +		audio-cpu = <&esai0>;
> +		audio-codec = <&cs42888>;
> +		audio-asrc = <&asrc0>;
> +		audio-routing = "Line Out Jack", "AOUT1L",
> +				"Line Out Jack", "AOUT1R",
> +				"Line Out Jack", "AOUT2L",
> +				"Line Out Jack", "AOUT2R",
> +				"Line Out Jack", "AOUT3L",
> +				"Line Out Jack", "AOUT3R",
> +				"Line Out Jack", "AOUT4L",
> +				"Line Out Jack", "AOUT4R",
> +				"AIN1L", "Line In Jack",
> +				"AIN1R", "Line In Jack",
> +				"AIN2L", "Line In Jack",
> +				"AIN2R", "Line In Jack";
> +		status = "okay";
remove status=okay, not needed

> +	};
> +
>  	sound-wm8960 {
>  		compatible = "fsl,imx-audio-wm8960";
>  		model = "wm8960-audio";
> @@ -301,12 +329,45 @@ pca6416: gpio@20 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	cs42888: audio-codec@48 {
> +		compatible = "cirrus,cs42888";
> +		reg = <0x48>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "mclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_cs42888_reset>;
> +		VA-supply = <&reg_audio>;
> +		VD-supply = <&reg_audio>;
> +		VLS-supply = <&reg_audio>;
> +		VLC-supply = <&reg_audio>;
> +		reset-gpios = <&lsio_gpio4 25 GPIO_ACTIVE_LOW>;
> +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
> +		status = "okay";

remove status=okay, not needed
