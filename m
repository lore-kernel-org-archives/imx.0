Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017DB1DE8B5;
	Mon, 29 Dec 2025 02:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766976850; cv=none; b=J2CPVynMsfaCb7SeDdR7sa53sRbA9insGGCRmudAvowDfNubbSxRmqskPB3e/b8uTCIDoJidXEd0nDYaGIhuFrkEe5tTnmneseSv1Jm/wrvAWao0iWNNTTyMgFbHzIznbjXOTkKXoh7DU8eE+vikWS1PNkT05u0MLMP+VOBreUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766976850; c=relaxed/simple;
	bh=QZM5mGv9VhE/uWGcqaujT1EMdVbiKWIz+MuunJJxOjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCIVBmbBFWtXIU2DH/OCUVibmM7UQQbFz+/2N94VyLZKxATl8hJXtU5LdIih1YGC4TQqWje1Fez+moaiwo/sCX5qnHlV6MivTleBaEPbe40kdSN1XAT9BXHX/4tV4KC+xA2fEGNQkgwlcOCdQYJHQDYgyLSDww04fAY82vHQci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJrBn4xB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJrBn4xB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF3BC4CEFB;
	Mon, 29 Dec 2025 02:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766976849;
	bh=QZM5mGv9VhE/uWGcqaujT1EMdVbiKWIz+MuunJJxOjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJrBn4xBK+1bAL/v3+QJCND1+V5acXw3avlRpZ+QU3bHqTvGW1Oq1pzqTd0kQgP6X
	 7UIsAetPRDqmHvk91HvJgcmszrdS3AMLMy8frTQ2YcieiWCquyky+Dfu8KDrj5n1b/
	 QOAWBX7BWB52b6ageD1tkLRSEh2kO0V1A/bhagXQGFxfTlmzs7iUWvb0+kjefVBqQR
	 jnZrHbL5Ose0if437UDhiVbzjvZ2llT8FEBZNwfd0D7mKeGhYTi53xwviKgROKt7xW
	 IZJI6HMdV/sADIoxYUBGKsjDGwLXctDjhcM/CRM2BVFJX1duuxoGtEXfRO+jXRbDOc
	 CuflTHAgdButg==
Date: Mon, 29 Dec 2025 10:54:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-evk: add camera ov5640 and
 related nodes
Message-ID: <aVHtTRNYQS6ju_yQ@dragon>
References: <20251114155001.1195702-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114155001.1195702-1-Frank.Li@nxp.com>

On Fri, Nov 14, 2025 at 10:50:01AM -0500, Frank Li wrote:
> Add camera ov5640 and related nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 80 ++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 3730792daf501..f5c19549acce5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -74,6 +74,27 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency = <100000000>;
>  	};
>  
> +	reg_1v5: regulator-1v5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v5";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;

1800000 ?

> +	};
> +
> +	reg_2v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2v8";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;

2800000 ?

Shawn

> +	};
> +
>  	reg_audio_3v3: regulator-audio-3v3 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "audio-3v3";
> @@ -556,6 +577,30 @@ &i2c2 {
>  	pinctrl-0 = <&pinctrl_i2c2>;
>  	status = "okay";
>  
> +	camera@3c {
> +	       compatible = "ovti,ov5640";
> +	       reg = <0x3c>;
> +	       pinctrl-names = "default";
> +	       pinctrl-0 = <&pinctrl_csi0_pwn>, <&pinctrl_csi0_rst>, <&pinctrl_csi_mclk>;
> +	       clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +	       clock-names = "xclk";
> +	       assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +	       assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +	       assigned-clock-rates = <24000000>;
> +	       powerdown-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +	       AVDD-supply = <&reg_2v8>;
> +	       DVDD-supply = <&reg_1v5>;
> +	       DOVDD-supply = <&reg_1v8>;
> +	       status = "okay";
> +
> +	       port {
> +		       ov5640_mipi_0_ep: endpoint {
> +			       remote-endpoint = <&mipi_csi0_ep>;
> +			       data-lanes = <1 2>;
> +		       };
> +	       };
> +	};
> +
>  	hdmi@3d {
>  		compatible = "adi,adv7535";
>  		reg = <0x3d>;
> @@ -660,6 +705,10 @@ &i2c5 {
>  	 */
>  };
>  
> +&isi_0 {
> +	status = "okay";
> +};
> +
>  &lcdif1 {
>  	status = "okay";
>  };
> @@ -678,6 +727,19 @@ &micfil {
>  	status = "okay";
>  };
>  
> +&mipi_csi_0 {
> +	status = "okay";
> +
> +	ports {
> +	       port@0 {
> +		       mipi_csi0_ep: endpoint {
> +				remote-endpoint = <&ov5640_mipi_0_ep>;
> +				data-lanes = <1 2>;
> +		       };
> +	       };
> +	};
> +};
> +
>  &mipi_dsi {
>  	samsung,esc-clock-frequency = <10000000>;
>  	status = "okay";
> @@ -849,6 +911,24 @@ MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
>  		>;
>  	};
>  
> +	pinctrl_csi_mclk: csi_mclk_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x50
> +		>;
> +	};
> +
> +	pinctrl_csi0_pwn: csi0_pwn_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x10
> +		>;
> +	};
> +
> +	pinctrl_csi0_rst: csi0_rst_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06	0x10
> +		>;
> +	};
> +
>  	pinctrl_eqos: eqosgrp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> -- 
> 2.34.1
> 
