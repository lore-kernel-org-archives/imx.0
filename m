Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BA15AE
	for <imx@lists.linux.dev>; Tue, 14 Mar 2023 00:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89DEC433D2;
	Tue, 14 Mar 2023 00:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678755042;
	bh=9ZcYiL84JD2ivJTcELoaAPrOPmrjmIwHm+C09gsRD1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/D2dEB2UKV2a8bF9fUfTCwYeTnj6McYEWabEbDP/8kENUMiimn9UutFjXCNA2Rvq
	 4XiZI7hV9eXHcpP5UsYroV8BhMPDgFZTI3ke3a7LJJPuFeFijcWyOboEXabaCYnS8S
	 hQsVMISmdcSuJz03X8KP/jpR1POAQGCy85jPuS8Jm+oPIhZW0inTSG7LRwHwA8eCjC
	 mAlgNsj+ouo1zjrwnpjGETbRwIv3I6/CJGcOean+Er5fwa7Klt57VFput2jn/ib1GS
	 /gCFDPFpcIM8FAcdoP4D5mEdd0Aqm0K08+o6nTqJUSx6lc9KYvrHIH+6R27y/erSB8
	 Q6Kp5NQ3lZ52A==
Date: Tue, 14 Mar 2023 08:50:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] arm64: dts: imx8qxp: add cadence usb3 support
Message-ID: <20230314005035.GT143566@dragon>
References: <20230213222229.686072-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213222229.686072-1-Frank.Li@nxp.com>

On Mon, Feb 13, 2023 at 05:22:27PM -0500, Frank Li wrote:
> There are cadence usb3.0 controller in 8qxp and 8qm.
> Add usb3 node at common connect subsystem.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../boot/dts/freescale/imx8-ss-conn.dtsi      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> index 4852760adeee..94692cee25a0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> @@ -138,6 +138,56 @@ fec2: ethernet@5b050000 {
>  		status = "disabled";
>  	};
>  
> +	usbotg3: usb@5b110000 {
> +		compatible = "fsl,imx8qm-usb3";

Is the compatible documented?

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		reg = <0x5b110000 0x10000>;
> +		clocks = <&usb3_lpcg IMX_LPCG_CLK_1>,
> +			 <&usb3_lpcg IMX_LPCG_CLK_0>,
> +			 <&usb3_lpcg IMX_LPCG_CLK_7>,
> +			 <&usb3_lpcg IMX_LPCG_CLK_4>,
> +			 <&usb3_lpcg IMX_LPCG_CLK_5>;
> +		clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> +			"usb3_ipg_clk", "usb3_core_pclk";

Can we align the indent at " on above line?

> +		assigned-clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> +			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> +			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;

Can we align the indent at < on above line?

Shawn

> +		assigned-clock-rates = <125000000>, <12000000>, <250000000>;
> +		power-domains = <&pd IMX_SC_R_USB_2>;
> +		status = "disabled";
> +
> +		usbotg3_cdns3: usb@5b120000 {
> +			compatible = "cdns,usb3";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "host", "peripheral", "otg", "wakeup";
> +			reg = <0x5b130000 0x10000>,     /* memory area for HOST registers */
> +			      <0x5b140000 0x10000>,   /* memory area for DEVICE registers */
> +			      <0x5b120000 0x10000>;   /* memory area for OTG/DRD registers */
> +			reg-names = "xhci", "dev", "otg";
> +			phys = <&usb3_phy>;
> +			phy-names = "cdns3,usb3-phy";
> +			status = "disabled";
> +		};
> +	};
> +
> +	usb3_phy: usb-phy@5b160000 {
> +		compatible = "nxp,salvo-phy";
> +		reg = <0x5b160000 0x40000>;
> +		clocks = <&usb3_lpcg IMX_LPCG_CLK_6>;
> +		clock-names = "salvo_phy_clk";
> +		power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> +		#phy-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	/* LPCG clocks */
>  	sdhc0_lpcg: clock-controller@5b200000 {
>  		compatible = "fsl,imx8qxp-lpcg";
> @@ -234,4 +284,26 @@ usb2_lpcg: clock-controller@5b270000 {
>  		clock-output-names = "usboh3_ahb_clk", "usboh3_phy_ipg_clk";
>  		power-domains = <&pd IMX_SC_R_USB_0_PHY>;
>  	};
> +
> +	usb3_lpcg: clock-controller@5b280000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5b280000 0x10000>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
> +				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
> +				<IMX_LPCG_CLK_6>, <IMX_LPCG_CLK_7>;
> +		clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> +			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> +			 <&conn_ipg_clk>,
> +			 <&conn_ipg_clk>,
> +			 <&conn_ipg_clk>,
> +			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> +		clock-output-names = "usb3_app_clk",
> +				     "usb3_lpm_clk",
> +				     "usb3_ipg_clk",
> +				     "usb3_core_pclk",
> +				     "usb3_phy_clk",
> +				     "usb3_aclk";
> +		power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> +	};
>  };
> -- 
> 2.34.1
> 
