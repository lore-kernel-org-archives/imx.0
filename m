Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92D652
	for <imx@lists.linux.dev>; Fri, 11 Nov 2022 06:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7AEC433C1;
	Fri, 11 Nov 2022 06:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668149637;
	bh=aTTJfKh32lqRRfVziRQ6Aall3bT3N9NkQWZNacXzbGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tk4VEkwTnRtmWCK7nl9Qcazu/uTSbTsBsLhVZsCd2y/KOFuOTv0ODNcSnAxoaS6Tg
	 bSUje45Q46fLnSwZY7UhdchQW8InONSNbtQdgVJRYNipIDVIrvHMv9d7U+DvMVwYXM
	 JnoXf4X0iw4meWgCV6cu3144YTsWWS2Hw3+Hie8nHaKVshsFJqetwgEAl9gq6V0u1J
	 2Y0m+WoJo0ymUDLccqCe3aQ6CtT+r0voeLZpAQvryImtfTIGasbLmPPHuNqnlu5m8D
	 UZ/Zp/IGos9R/XlLpY+3B79vWNhJgAlO0QDmhl1TC+jEHJAtw0LEBXN+kURnT+w47C
	 TyCTdpQMWn84A==
Date: Fri, 11 Nov 2022 14:53:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: han.xu@nxp.com, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] arm64: dts: imx8dxl: add adc0 and adc1 support
Message-ID: <20221111065349.GN2649582@dragon>
References: <20221104192135.1661541-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104192135.1661541-1-Frank.Li@nxp.com>

On Fri, Nov 04, 2022 at 03:21:25PM -0400, Frank Li wrote:
> There are two adc controller in 8dxl.
> Add adc node at common dma subsystem.
> Enable adc0 at imx8dxl_evk boards dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 12 +++++

Could you make a split between board and SoC changes?

Shawn

>  .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |  4 ++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> index d7b4229bb4a2..bdbb660c2682 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> @@ -156,6 +156,34 @@ i2c3: i2c@5a830000 {
>  		status = "disabled";
>  	};
>  
> +	adc0: adc@5a880000 {
> +		compatible = "nxp,imx8qxp-adc";
> +		reg = <0x5a880000 0x10000>;
> +		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +		clocks = <&adc0_lpcg 0>,
> +			 <&adc0_lpcg 1>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_ADC_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		power-domains = <&pd IMX_SC_R_ADC_0>;
> +		status = "disabled";
> +	 };
> +
> +	adc1: adc@5a890000 {
> +		compatible = "nxp,imx8qxp-adc";
> +		reg = <0x5a890000 0x10000>;
> +		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +		clocks = <&adc1_lpcg 0>,
> +			 <&adc1_lpcg 1>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_ADC_1 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		power-domains = <&pd IMX_SC_R_ADC_1>;
> +		status = "disabled";
> +	};
> +
>  	i2c0_lpcg: clock-controller@5ac00000 {
>  		compatible = "fsl,imx8qxp-lpcg";
>  		reg = <0x5ac00000 0x10000>;
> @@ -203,4 +231,28 @@ i2c3_lpcg: clock-controller@5ac30000 {
>  				     "i2c3_lpcg_ipg_clk";
>  		power-domains = <&pd IMX_SC_R_I2C_3>;
>  	};
> +
> +	adc0_lpcg: clock-controller@5ac80000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5ac80000 0x10000>;
> +		#clock-cells = <1>;
> +		clocks = <&clk IMX_SC_R_ADC_0 IMX_SC_PM_CLK_PER>,
> +			 <&dma_ipg_clk>;
> +		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
> +		clock-output-names = "adc0_lpcg_clk",
> +				     "adc0_lpcg_ipg_clk";
> +		power-domains = <&pd IMX_SC_R_ADC_0>;
> +	};
> +
> +	adc1_lpcg: clock-controller@5ac90000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5ac90000 0x10000>;
> +		#clock-cells = <1>;
> +		clocks = <&clk IMX_SC_R_ADC_1 IMX_SC_PM_CLK_PER>,
> +			 <&dma_ipg_clk>;
> +		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
> +		clock-output-names = "adc1_lpcg_clk",
> +				     "adc1_lpcg_ipg_clk";
> +		power-domains = <&pd IMX_SC_R_ADC_1>;
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> index fc9647ea50e9..11b1ff90c06d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -91,6 +91,13 @@ reg_usdhc2_vmmc: regulator-3 {
>  		off-on-delay-us = <3480>;
>  	};
>  
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
>  	mii_select: regulator-4 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "mii-select";
> @@ -102,6 +109,11 @@ mii_select: regulator-4 {
>  	};
>  };
>  
> +&adc0 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> index 795d1d472fae..ac3362e32811 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> @@ -11,6 +11,10 @@ &dma_ipg_clk {
>  	clock-frequency = <160000000>;
>  };
>  
> +&adc0 {
> +	interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
>  &i2c0 {
>  	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
>  	interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.34.1
> 
