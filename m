Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FD9136643
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725178049; cv=none; b=tN/95arzZ+HJXHztryaXpYG/xlFQsePMLTZl3QjAaRCImHdR78/k7GNvx8fLgbDcnMqcZfzMtHCqIOk/raLGN/YO74amyfXOaS2304oWCBlGA6UrAP9hPNY3LLTq3M0hCsw3OjVDLpMKfF+93mVrRAlMDfePmKy9L8P8ZX2pMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725178049; c=relaxed/simple;
	bh=H+4H1RjbMlERyYCXKegid4WbrgXMo/agjaeT4+ZdI/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGZsP7wnDnv36lUwkWR6Gfk04tteFtZt9+xqEfwhnZHrXKXvhkNY94F1MnHf/i2Im67/aPOyaksCDJxW1quPEYBjQQPoA2iWUaYi5H+S/7T/09P5IGax04rVXoPmmPC5vt6pijMOjxUctMT61P93lH7pZi5uuvWU5etMHsVLb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FPrdAQY1; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FPrdAQY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7u7AOaHLwE9q3P+6liu00OMqbJ/gWmnFJKpZmoN9Dr8=;
	b=FPrdAQY1DM27COWhDwJugxNQf/KqQIdLYBlWIyNlx4Q1HyepMrxfzJmnt0tK/v
	bCT1rOMfSo9mbsab8xCxYj3K6072FOB4oX8XjRXJOYAELyGr1GMQHtbKSPu/dF+t
	M2DeA5hzAT8zMroZOJvu0fCy6aIoMAdynhxjPvK+i58X8=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnzwKlINRmKt9CAA--.32856S3;
	Sun, 01 Sep 2024 16:07:03 +0800 (CST)
Date: Sun, 1 Sep 2024 16:07:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: imx95: add usb3 related nodes
Message-ID: <ZtQgpYY9KjP9FUi5@dragon>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
 <20240826070854.1948347-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826070854.1948347-4-xu.yang_2@nxp.com>
X-CM-TRANSID:M88vCgDnzwKlINRmKt9CAA--.32856S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyftrW8CrWDCr1xCw47twb_yoW8try8p3
	srGayUZrs2gF1IkFWaqF48KF95J3y0kFZ5ur1fWryjkr9xZ3sFgFWIkF1S9r18XrsrXw4j
	qFsaqF12kFnxtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4g4fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgtNZWbUDSsrwgAAsc

On Mon, Aug 26, 2024 at 03:08:53PM +0800, Xu Yang wrote:
> Add usb3 phy and controller nodes for imx95.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 1bbf9a0468f6..06a7c2f1e211 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
>  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
>  			status = "disabled";
>  		};
> +
> +		usb3_phy: phy@4c1f0040 {
> +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> +			      <0x0 0x4c1fc000 0x0 0x100>;
> +			clocks = <&scmi_clk IMX95_CLK_HSIO>;
> +			clock-names = "phy";
> +			#phy-cells = <0>;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			orientation-switch;
> +			status = "disabled";
> +		};
> +
> +		usb3: usb@4c010010 {

Please try to sort nodes with unit-address in the address.

Shawn

> +			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> +			reg = <0x0 0x4c010010 0x0 0x04>,
> +			      <0x0 0x4c1f0000 0x0 0x20>;
> +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +				 <&scmi_clk IMX95_CLK_32K>;
> +			clock-names = "hsio", "suspend";
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> +			status = "disabled";
> +
> +			usb3_dwc3: usb@4c100000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x4c100000 0x0 0x10000>;
> +				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +					 <&scmi_clk IMX95_CLK_24M>,
> +					 <&scmi_clk IMX95_CLK_32K>;
> +				clock-names = "bus_early", "ref", "suspend";
> +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb3_phy>, <&usb3_phy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				snps,gfladj-refclk-lpm-sel-quirk;
> +				snps,parkmode-disable-ss-quirk;
> +				iommus = <&smmu 0xe>;
> +			};
> +		};
>  	};
>  };
> -- 
> 2.34.1
> 

