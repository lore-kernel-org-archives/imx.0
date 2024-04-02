Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41ED4D9FB
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712046701; cv=none; b=NzrCig4xApGCQdVZKW+ycA3jb47DW4/OyVwS9radgoq/8B8j1YYTKW1zmSM/9KnRIh0u6Mw1roW3uzh2b/Ow9p4TCicSDkr2C4E/XqmtOEqz+CqDS7sL5RoJA++o4X/6O2riLBRbhfpNHBkoaX9Xy1mBqepJ/sojpYOMtsqyA50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712046701; c=relaxed/simple;
	bh=Z/qLSoyxcqYY45vOcGBrjpYcFtcLiSmPOnablfSkfFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPEOPy4LCflNP+9trpSeC/sbUJ+tixgcrw+MZx+McVPEgrNhFyCjWaii2P84BbJtOG1B5cs6iovj07RlFCtLKyMV+RmfAHTzYTUk+qPzH4y5AvDD1vzEWOVFPLCb5AE10Ug7B/IMBpo9CBOLLrHNfrnK+EGNEclweMd3ml0xw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MPya0UeM; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MPya0UeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=apDFZqziJ/YmD7Ot7Oe3WRkx6S7TtVnUEW5HigajFNQ=;
	b=MPya0UeM93328C53lUb1OqxrBn1MIbsPSHF2ROH7rduicC9q5sWhS3XxMlyaRg
	SYc71SweFvwm6blXbyMfulQq1QJqg3Vlly6w8VKH06Lq4WvbcR3Zi4M2sckJ7Vgn
	algtmVHN6I+ViYDjDlS8LcAQlGXAUR9MWLOA3KxUyg/6s=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrAAnjxhOwgtmy4WnAg--.42039S3;
	Tue, 02 Apr 2024 16:31:12 +0800 (CST)
Date: Tue, 2 Apr 2024 16:31:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, peter.chen@kernel.org,
	jun.li@nxp.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 02/11] arm64: dts: imx8ulp: add usb nodes
Message-ID: <ZgvCTgB4lp0F83Kn@dragon>
References: <20240321081439.541799-1-xu.yang_2@nxp.com>
 <20240321081439.541799-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321081439.541799-2-xu.yang_2@nxp.com>
X-CM-TRANSID:C1UQrAAnjxhOwgtmy4WnAg--.42039S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF1kArWrtFy8JFWfJr1kKrg_yoW5CF1rp3
	4DGFZ5Wr48ur17KFWYvF1qkF95JayrCF95ZF1ay3y8tr9F934Ut340q3ZYgr15Zr4xZw4a
	qFn3WF1fKF1qvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrhL8UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFRG0ZV6NnBkz1gAAsm

On Thu, Mar 21, 2024 at 04:14:30PM +0800, Xu Yang wrote:
> Add USB nodes on i.MX8ULP platform which has 2 USB controllers.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v5:
>  - no changes
> Changes in v6:
>  - drop usbphy aliases
> Changes in v7:
>  - no changes
> Changes in v8:
>  - no changes
> Changes in v9:
>  - no changes
> Changes in v10:
>  - no changes
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index c4a0082f30d3..7da9461a5745 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -472,6 +472,68 @@ usdhc2: mmc@298f0000 {
>  				status = "disabled";
>  			};
>  
> +			usbotg1: usb@29900000 {
> +				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
> +				reg = <0x29900000 0x200>;
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_USB0>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_USB0>;
> +				phys = <&usbphy1>;
> +				fsl,usbmisc = <&usbmisc1 0>;
> +				ahb-burst-config = <0x0>;
> +				tx-burst-size-dword = <0x8>;
> +				rx-burst-size-dword = <0x8>;
> +				status = "disabled";
> +			};
> +
> +			usbmisc1: usbmisc@29900200 {
> +				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
> +						"fsl,imx6q-usbmisc";
> +				#index-cells = <1>;
> +				reg = <0x29900200 0x200>;

Could you move 'reg' above so that it's after compatible?

> +				status = "disabled";
> +			};
> +
> +			usbphy1: usb-phy@29910000 {
> +				compatible = "fsl,imx8ulp-usbphy", "fsl,imx7ulp-usbphy";
> +				reg = <0x29910000 0x10000>;
> +				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_USB0_PHY>;
> +				#phy-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			usbotg2: usb@29920000 {
> +				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
> +				reg = <0x29920000 0x200>;
> +				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_USB1>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC2_USB1>;
> +				phys = <&usbphy2>;
> +				fsl,usbmisc = <&usbmisc2 0>;
> +				ahb-burst-config = <0x0>;
> +				tx-burst-size-dword = <0x8>;
> +				rx-burst-size-dword = <0x8>;
> +				status = "disabled";
> +			};
> +
> +			usbmisc2: usbmisc@29920200 {
> +				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
> +						"fsl,imx6q-usbmisc";
> +				#index-cells = <1>;
> +				reg = <0x29920200 0x200>;

Ditto

Shawn

> +				status = "disabled";
> +			};
> +
> +			usbphy2: usb-phy@29930000 {
> +				compatible = "fsl,imx8ulp-usbphy", "fsl,imx7ulp-usbphy";
> +				reg = <0x29930000 0x10000>;
> +				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_USB1_PHY>;
> +				#phy-cells = <0>;
> +				status = "disabled";
> +			};
> +
>  			fec: ethernet@29950000 {
>  				compatible = "fsl,imx8ulp-fec", "fsl,imx6ul-fec", "fsl,imx6q-fec";
>  				reg = <0x29950000 0x10000>;
> -- 
> 2.34.1
> 

