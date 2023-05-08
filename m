Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE0233E3
	for <imx@lists.linux.dev>; Mon,  8 May 2023 07:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B69C433D2;
	Mon,  8 May 2023 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683531979;
	bh=kO6fJ/GkPqwLv735oDhZh3GcxwMT25MvPjdP9/q6LWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsJASFt06VowLI4Mojie4o75uKwK4x8l3NIR2zXGgoXLJisE91lOQtoOs0Aicbx3N
	 a6/vQU4f/ARxugTFcJF8XT2PWkjfYEcNUaezefnR7vg5+CsPspqyaGOKQlHVcpF4Z+
	 EyHeCKrN3z89UH6lE7hDbJQsxBzakyfXAKBVmQ9eXsKkkGfdWJf/mLbhX4ubY6RGq3
	 swjDAfLofuceyifU3rfTQ6pXP+EZSohgGs1Xe61Xnc6U5MU932sKfnRbFfou98b5qx
	 kVTq1HwhHjE8xjN5vMN4SFwStCBu4pGRhz+/MgkbCN1zMq8Crc114B8wtj0PGjdl3o
	 WFTz/uCmt/0VQ==
Date: Mon, 8 May 2023 13:16:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: kishon@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, fushi.peng@nxp.com
Subject: Re: [PATCH 1/2] phy: cadence: salvo: Add
 usb2-disconnect-threshold-microvolt property
Message-ID: <ZFioxpLaXNeDUnFY@matsya>
References: <20230505185247.1854677-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505185247.1854677-1-Frank.Li@nxp.com>

On 05-05-23, 14:52, Frank Li wrote:
> Add usb2-disconnect-threshold-microvolt property to address fake USB
> disconnection issue during enumeration or suspend state for difference
> platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8x-mek.dtsi |  1 +
>  drivers/phy/cadence/phy-cadence-salvo.c      | 30 +++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-mek.dtsi b/arch/arm64/boot/dts/freescale/imx8x-mek.dtsi
> index 2f8fe59fc131..6a396844c02d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8x-mek.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8x-mek.dtsi
> @@ -1051,6 +1051,7 @@ &usbotg1 {
>  
>  &usb3_phy {
>  	status = "okay";
> +	usb2-disconnect-threshold-microvolt = <645>;
>  };
>  
>  &usbotg3 {
> diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
> index 23be27a747a9..06e705dbbc3c 100644
> --- a/drivers/phy/cadence/phy-cadence-salvo.c
> +++ b/drivers/phy/cadence/phy-cadence-salvo.c
> @@ -5,7 +5,7 @@
>   *
>   * Copyright (c) 2019-2020 NXP
>   */
> -

why this change?

> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -91,9 +91,19 @@
>  
>  /* USB2 PHY register definition */
>  #define UTMI_REG15				0xaf
> +#define UTMI_AFE_RX_REG0			0x0d
>  #define UTMI_AFE_RX_REG5			0x12
>  #define UTMI_AFE_BC_REG4			0x29
>  
> +/* Align UTMI_AFE_RX_REG0 bit[7:6] define */
> +enum usb2_disconn_threshold {
> +	USB2_DISCONN_THRESHOLD_575 = 0x0,
> +	USB2_DISCONN_THRESHOLD_610 = 0x1,
> +	USB2_DISCONN_THRESHOLD_645 = 0x3,
> +};
> +
> +#define RX_USB2_DISCONN_MASK			GENMASK(7, 6)
> +
>  /* TB_ADDR_TX_RCVDETSC_CTRL */
>  #define RXDET_IN_P3_32KHZ			BIT(0)
>  /*
> @@ -125,6 +135,7 @@ struct cdns_salvo_phy {
>  	struct clk *clk;
>  	void __iomem *base;
>  	struct cdns_salvo_data *data;
> +	enum usb2_disconn_threshold usb2_disconn;
>  };
>  
>  static const struct of_device_id cdns_salvo_phy_of_match[];
> @@ -261,6 +272,12 @@ static int cdns_salvo_phy_init(struct phy *phy)
>  
>  	cdns_salvo_write(salvo_phy, USB2_PHY_OFFSET, UTMI_AFE_RX_REG5,
>  			 0x5);
> +
> +	value = cdns_salvo_read(salvo_phy, USB2_PHY_OFFSET, UTMI_AFE_RX_REG0);
> +	value &= ~RX_USB2_DISCONN_MASK;
> +	value = FIELD_PREP(RX_USB2_DISCONN_MASK, salvo_phy->usb2_disconn);
> +	cdns_salvo_write(salvo_phy, USB2_PHY_OFFSET, UTMI_AFE_RX_REG0, value);
> +
>  	udelay(10);
>  
>  	clk_disable_unprepare(salvo_phy->clk);
> @@ -315,6 +332,7 @@ static int cdns_salvo_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct cdns_salvo_phy *salvo_phy;
>  	struct cdns_salvo_data *data;
> +	u32 val;
>  
>  	data = (struct cdns_salvo_data *)of_device_get_match_data(dev);
>  	salvo_phy = devm_kzalloc(dev, sizeof(*salvo_phy), GFP_KERNEL);
> @@ -326,6 +344,16 @@ static int cdns_salvo_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(salvo_phy->clk))
>  		return PTR_ERR(salvo_phy->clk);
>  
> +	if (of_property_read_u32(dev->of_node, "usb2-disconnect-threshold-microvolt", &val))
> +		val = 575;
> +
> +	if (val < 610)
> +		salvo_phy->usb2_disconn = USB2_DISCONN_THRESHOLD_575;
> +	else if (val < 645)
> +		salvo_phy->usb2_disconn = USB2_DISCONN_THRESHOLD_610;
> +	else
> +		salvo_phy->usb2_disconn = USB2_DISCONN_THRESHOLD_645;
> +
>  	salvo_phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(salvo_phy->base))
>  		return PTR_ERR(salvo_phy->base);
> -- 
> 2.34.1

-- 
~Vinod
