Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9D26EB4D
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714032586; cv=none; b=C/FkpQTgyBHjctEWhxWB4RtNpN8XD9akWCHjp/0pxxX12kbak196dReQTWcBRe7qrgzJwEW9zP539hlh4xoh95KIKOaxciv3ePsWDkyjSW+mKDFyXGFVs8tb1bMBB3RpZN4LJ3F35sjmFC9OpcokqeXzrDhZ1zt/ednbZPobsbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714032586; c=relaxed/simple;
	bh=3pH9BI+mmlAYKS5yzMrgsCLtEZ/uEG/QYW/gdUS91Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh0WOtjd8VP6yl5q/Xl5i8m5Y3QR1KJ7TlBxhT+JFRsd4VSVIaE0tJmLTiOJLyA4v/iP5E3rETPRXuiBuCbAL1sA+ewd1/p4TLRG2eVXY/3eVzqCY69AMqF88tri/TEmb5VkOQM+P3yZ/QDjSPxQ8yMSF7t1mA1UvVIM9mn7ulY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Ulb28jPk; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Ulb28jPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hhIHs+++PP0WLQlgo22/+Sat6DJyqVSqCbFqSFZstCo=;
	b=Ulb28jPkDiZlNFVgGvgt8/JLdOQ7HLSIlJZpgD3bLO3AtPPju5WtO+8scuG/1f
	beBMrkNELiqbSTGMdebscziZHPwBiT/OjZIKxqW13u3sSaVq+fc8ipJTHH+QRuLd
	byXwcu2NrghChiECnpUscS7oGcFQBX3GhrsTBk+YepkgQ=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAC3f_muDypmRaZtAw--.40896S3;
	Thu, 25 Apr 2024 16:09:20 +0800 (CST)
Date: Thu, 25 Apr 2024 16:09:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] arm64: dts: imx8qm-mek: add fec2 support
Message-ID: <ZioPrhKPWBrTdLUS@dragon>
References: <20240422-dts_8qm_audio-v3-0-680cee731ced@nxp.com>
 <20240422-dts_8qm_audio-v3-10-680cee731ced@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422-dts_8qm_audio-v3-10-680cee731ced@nxp.com>
X-CM-TRANSID:ClUQrAC3f_muDypmRaZtAw--.40896S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7Aw1rtw1DCFWrGFWruFg_yoW5Xr1Dpr
	W5JrWFgrs7AF1rGw13ur17JFy5Jr409aykW3srJry8uFsxuFnrGa4Fvr4qkrykGrW5Xw4a
	qFWjgF1293WSg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFRDLZV6NnF4SGwAAsz

On Mon, Apr 22, 2024 at 03:50:12PM -0400, Frank Li wrote:
> Add fec2 support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index cef395e919395..570a9bf583132 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -40,6 +40,15 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		enable-active-high;
>  	};
>  
> +	reg_fec2_supply: fec2_nvcc {

regulator-fec2-nvcc for node name?

Shawn

> +		compatible = "regulator-fixed";
> +		regulator-name = "fec2_nvcc";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&max7322 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reg_can01_en: regulator-can01-gen {
>  		compatible = "regulator-fixed";
>  		regulator-name = "can01-en";
> @@ -381,6 +390,19 @@ ethphy1: ethernet-phy@1 {
>  	};
>  };
>  
> +&fec2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec2>;
> +	phy-mode = "rgmii-txid";
> +	phy-handle = <&ethphy1>;
> +	phy-supply = <&reg_fec2_supply>;
> +	nvmem-cells = <&fec_mac1>;
> +	nvmem-cell-names = "mac-address";
> +	rx-internal-delay-ps = <2000>;
> +	fsl,magic-packet;
> +	status = "okay";
> +};
> +
>  &usdhc1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_usdhc1>;
> @@ -500,6 +522,24 @@ IMX8QM_QSPI0B_SS1_B_LSIO_QSPI0B_SS1_B     0x06000021
>  		>;
>  	};
>  
> +	pinctrl_fec2: fec2grp {
> +		fsl,pins = <
> +			IMX8QM_COMP_CTL_GPIO_1V8_3V3_ENET_ENETA_PAD		0x000014a0
> +			IMX8QM_ENET1_RGMII_TX_CTL_CONN_ENET1_RGMII_TX_CTL	0x00000060
> +			IMX8QM_ENET1_RGMII_TXC_CONN_ENET1_RGMII_TXC		0x00000060
> +			IMX8QM_ENET1_RGMII_TXD0_CONN_ENET1_RGMII_TXD0		0x00000060
> +			IMX8QM_ENET1_RGMII_TXD1_CONN_ENET1_RGMII_TXD1		0x00000060
> +			IMX8QM_ENET1_RGMII_TXD2_CONN_ENET1_RGMII_TXD2		0x00000060
> +			IMX8QM_ENET1_RGMII_TXD3_CONN_ENET1_RGMII_TXD3		0x00000060
> +			IMX8QM_ENET1_RGMII_RXC_CONN_ENET1_RGMII_RXC		0x00000060
> +			IMX8QM_ENET1_RGMII_RX_CTL_CONN_ENET1_RGMII_RX_CTL	0x00000060
> +			IMX8QM_ENET1_RGMII_RXD0_CONN_ENET1_RGMII_RXD0		0x00000060
> +			IMX8QM_ENET1_RGMII_RXD1_CONN_ENET1_RGMII_RXD1		0x00000060
> +			IMX8QM_ENET1_RGMII_RXD2_CONN_ENET1_RGMII_RXD2		0x00000060
> +			IMX8QM_ENET1_RGMII_RXD3_CONN_ENET1_RGMII_RXD3		0x00000060
> +		>;
> +	};
> +
>  	pinctrl_flexcan1: flexcan0grp {
>  		fsl,pins = <
>  			IMX8QM_FLEXCAN0_TX_DMA_FLEXCAN0_TX			0x21
> 
> -- 
> 2.34.1
> 

