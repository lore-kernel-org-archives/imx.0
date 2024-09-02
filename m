Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9901388
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725239134; cv=none; b=PkMgsd6pDjC7neMhAFSwQ0KPd6+pIKm5kqMu85ZzVnnDsB8lhC+2t6coUA9b0SzYqRisF15UXhrXAEPvQs6AUmciyc8lZskMmxQIcfyEID22J/Ijj3l21d1n/1H4nztz2VAfDU93cjqS8COpO3LReCWq/I8kddiwoXxcqFwclw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725239134; c=relaxed/simple;
	bh=mk4Tc+Fg5S0r2OG5I+C8xCZ5mKb9489aBVsVAb6IQHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVX7W6+ovzqw0BRZaok9vmtR4TC2iqYFnNRmGoLRSJX1xEePW9Xf+2XesSzJ9+SU1vnP+A6aMaBsp27izhrjYBbBi37CQ2umd5Smn4MLbU6x+7tSWnMgzt6F+JzcBqMR7vz7h1elch/EVStrNDK02DIYFKARdeI785RIFdYs5+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GbkXV4Hp; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GbkXV4Hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=3sKEpH+xCvLzUUO9LCz+T63fbAqzCeSORVkVVEo5rPI=;
	b=GbkXV4HpPdKQkfCYlizdWWgxVp2Gb1hnhxuPhOsqLyedFRDTOglJt5uTqKGRj8
	ezze6zhCIxHTk86xeoVGiQC/k3R4F/wdY/lbIvqD8RVOLVf55Kd6vDgWNiukLW+r
	lcEJspwcggBafOEv2B/Id4UevVtU0YO9mguVVXVIsak24=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3XjNFD9VmbmFLAA--.37616S3;
	Mon, 02 Sep 2024 09:05:11 +0800 (CST)
Date: Mon, 2 Sep 2024 09:05:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: imx6qdl: align pin config nodes with
 bindings
Message-ID: <ZtUPRciha9lSbraF@dragon>
References: <20240831-dts-nxp-imx6-pinctrl-v1-0-f5811032bd40@linaro.org>
 <20240831-dts-nxp-imx6-pinctrl-v1-4-f5811032bd40@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831-dts-nxp-imx6-pinctrl-v1-4-f5811032bd40@linaro.org>
X-CM-TRANSID:Mc8vCgB3XjNFD9VmbmFLAA--.37616S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfJw4DAF4fJF1kArW7CF4fAFb_yoW8XFy5Xo
	WDC3WSvr1vkw45Jwn8Xwn0yayvqwsxJFWDKa95ZrZxJF17Za4xJr4F9r4jvwn0qFyIqrn8
	uw1v9Fyavr1xGrZ5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVXo2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAglOZWbU5NNWYgAAsR

On Sat, Aug 31, 2024 at 12:28:21PM +0200, Krzysztof Kozlowski wrote:
> Bindings for other NXP pin controllers expect pin configuration nodes in
> pinctrl to match certain naming, so adjust these as well, even though
> their bindings are not yet in dtschema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi        | 10 +++++-----
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi     |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi     |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi      |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi       |  4 ++--
>  15 files changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
> index 758eaf9d93d2..f7fac86f0a6b 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
> @@ -506,7 +506,7 @@ MX6QDL_PAD_EIM_A22__GPIO2_IO16		0x1b0b0 /* PCIe reset */
>  		>;
>  	};
>  
> -	pinctrl_gpmi_nand: gpmi-nand {
> +	pinctrl_gpmi_nand: gpminandgrp {
>  		fsl,pins = <
>  			MX6QDL_PAD_NANDF_CLE__NAND_CLE     0xb0b1
>  			MX6QDL_PAD_NANDF_ALE__NAND_ALE     0xb0b1
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
> index 082a2e3a391f..b57f4073f881 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
> @@ -761,7 +761,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x170b9
> @@ -774,7 +774,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
> index 8ec442038ea0..090c0057d117 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
> @@ -750,7 +750,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -763,7 +763,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
> index 9df9f79affae..0ed6d25024a2 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
> @@ -833,7 +833,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -846,7 +846,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
> index 7f16c602cc07..c6e231de674a 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
> @@ -704,7 +704,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -717,7 +717,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
> index 7693f92195d5..d0f648938cae 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
> @@ -896,7 +896,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -909,7 +909,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
> index 9d0836df0fed..71911df881cc 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
> @@ -680,7 +680,7 @@ MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0 /* OC */
>  		>;
>  	};
>  
> -	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x4001b0b0 /* EMMY_EN */
>  			MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x4001b0b0 /* EMMY_CFG1# */
> @@ -710,7 +710,7 @@ MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170b9
>  			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100b9
> @@ -723,7 +723,7 @@ MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170f9
>  			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100f9
> @@ -752,7 +752,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -768,7 +768,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
> index f4cb9e1d34a9..716c324a7458 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
> @@ -817,7 +817,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -833,7 +833,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
> index 424dc7fcd533..453dee4d9227 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
> @@ -629,7 +629,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x170b9
> @@ -642,7 +642,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
> index 49ea25c71967..add700bc11cc 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
> @@ -569,7 +569,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -582,7 +582,7 @@ MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
> index d339957cc097..dff184a119f3 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
> @@ -397,7 +397,7 @@ MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x1f059	/* PWR */
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD    0x170B1
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK    0x100B1
> @@ -408,7 +408,7 @@ MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x170B1
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp_200mhz {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD    0x170F9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK    0x100F9
> @@ -434,7 +434,7 @@ MX6QDL_PAD_SD4_DAT7__SD4_DATA7 0x17070
>  		>;
>  	};
>  
> -	pinctrl_usdhc4_100mhz: usdhc4grp_100mhz {
> +	pinctrl_usdhc4_100mhz: usdhc4-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD4_CMD__SD4_CMD    0x170B1
>  			MX6QDL_PAD_SD4_CLK__SD4_CLK    0x100B1
> @@ -449,7 +449,7 @@ MX6QDL_PAD_SD4_DAT7__SD4_DATA7 0x170B1
>  		>;
>  	};
>  
> -	pinctrl_usdhc4_200mhz: usdhc4grp_200mhz {
> +	pinctrl_usdhc4_200mhz: usdhc4-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD4_CMD__SD4_CMD    0x170F9
>  			MX6QDL_PAD_SD4_CLK__SD4_CLK    0x100F9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
> index 0a3deaf92eea..99386421a48d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
> @@ -690,7 +690,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
>  			>;
>  		};
>  
> -		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +		pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
>  			fsl,pins = <
>  				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
>  				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
> @@ -705,7 +705,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170b9
>  			>;
>  		};
>  
> -		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +		pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
>  			fsl,pins = <
>  				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
>  				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> index e2fe337f7d9e..5a194f4c0cb9 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> @@ -373,7 +373,7 @@ MX6QDL_PAD_KEY_COL1__AUD5_TXFS		0x130b0 /* SSI1_FS */
>  		>;
>  	};
>  
> -	pinctrl_disp0_1: disp0grp-1 {
> +	pinctrl_disp0_1: disp0-1-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
>  			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
> @@ -406,7 +406,7 @@ MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
>  		>;
>  	};
>  
> -	pinctrl_disp0_2: disp0grp-2 {
> +	pinctrl_disp0_2: disp0-2-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
>  			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
> index 200559d7158d..d8283eade43e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
> @@ -346,7 +346,7 @@ MX6QDL_PAD_SD3_RST__GPIO7_IO08  0x17071
>  		>;
>  	};
>  
> -	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD1_CMD__SD1_CMD	0x170B9
>  			MX6QDL_PAD_SD1_CLK__SD1_CLK	0x100B9
> @@ -357,7 +357,7 @@ MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x170B9
>  		>;
>  	};
>  
> -	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD1_CMD__SD1_CMD	0x170F9
>  			MX6QDL_PAD_SD1_CLK__SD1_CLK	0x100F9
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
> index a1ea33c4eeb7..79d80632ee45 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
> @@ -436,7 +436,7 @@ MX6QDL_PAD_SD3_RST__GPIO7_IO08  0x13059
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_100mhz: usdhc3grp100mhzgrp {
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grpgrp {

s/grpgrp/grp?

>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x170B9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x100B9
> @@ -451,7 +451,7 @@ MX6QDL_PAD_SD3_RST__GPIO7_IO08  0x130B9
>  		>;
>  	};
>  
> -	pinctrl_usdhc3_200mhz: usdhc3grp200mhzgrp {
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grpgrp {

Ditto

Shawn

>  		fsl,pins = <
>  			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x170F9
>  			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x100F9
> 
> -- 
> 2.43.0
> 

