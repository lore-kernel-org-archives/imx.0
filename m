Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649B3DCD8D;
	Wed, 18 Mar 2026 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845400; cv=none; b=g1hHzZnbLmyJEgzcfTtAnFHQmbRPVadzxQ+AcPn8mODaso5hrJZuZIo+icqodkqJBhVE72ZiuhQr2rugHquGi+l0WbDdGCrZuaEK3v1e1jojSVYpHU2H5sy2tJKLY1bBF/ii0IdY1evQv16n1K6AGzCdCemamKSD0I5oZkwSrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845400; c=relaxed/simple;
	bh=9sp7ic2A4tYoabfs8cQthhVCsHAFRDscN5mF42RGDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwsseKHH+hcgY7DQZiIp0T7LLuoQCFwFU5VXCi9zhS1Uraj6zTmMME739WhyTTeSNly0xngDJN9Y586lJo3dKNa0ijKuPy2I2u+gcbd1M8hAsEJcMvDPbRDqfzIlkEEcyWjOTW19wQMR/zIYXBBNb5sZvAc51wH7CY+QlVtEPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fumxlMwK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fumxlMwK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=l6sRWleBROSAIKjmZl8aqivYkkcoorUS3OENKywjR0g=; b=fumxlMwKTZeGe5Z+IvbQRQtvEl
	xoSotIXCQ4wxrS95ciCdMMSz/J/6ydBs40tflbSLxCquvnRf56tAMyWF+IEOHVJKmlYahSTM6Mzy+
	5iqUXF7hUb+td6Bzex9tPWeD8rgkSkej7EbGr1bCUZxwUfEtLpScGzUDxA2j8+5F4jp0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2sDK-00CDdK-Fu; Wed, 18 Mar 2026 15:49:38 +0100
Date: Wed, 18 Mar 2026 15:49:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Message-ID: <d67fafc1-4261-4818-8b58-7f3a874613e4@lunn.ch>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>

On Tue, Mar 17, 2026 at 12:17:01PM +0100, Alexander Stein wrote:
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy_eqos: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_eqos_phy>;
> +			interrupt-parent = <&gpio3>;
> +			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;

Hi Alexander

Haven't we been here before? EDGE interrupts are generally wrong for
PHYs.

> +			reset-gpios = <&expander0 0 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy_fec>;
> +	fsl,magic-packet;

Has WoL been tested?

    Andrew
