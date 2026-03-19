Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F763D4109;
	Thu, 19 Mar 2026 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935212; cv=none; b=Pjlt7Tiysxq2BO3MH2w0eZeJJzmrCUyayeHeprPQ7MYsoxPfaCUsr9eEnT+/RFeirrpjkHWTnLY2CV27b2nlwA/DH9tbuT3G+Far0kOVy97EizBDIVcIfnGSalMDF1HNEeSwbgtNcKPmY1uJpURxH/9RRhi9TeRuaSHWeLdDDqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935212; c=relaxed/simple;
	bh=1TaLvY2s0gVuFIpCU2ZFMbu6SEk1VEBNMCdYaR3Q5+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeRiENRVx59zV1IT33+mHkjGpYauoqiLFzI2ByOmgdgeD6swwQL1ltHEwSjS+CJ1SCaHC2jXVdHDA126AbdOB2BCdhGSUArCmTvISY9do65yIj1SifptzDqx21hQ+PjSCWTy39s91GcHJa7NsX483CiEQFRB8ICGxB2j5l92Y4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bmNR3BuW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bmNR3BuW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bPgQROPbIr09g3wvpZB0Bhc8nbj9eaIBPezjbWbhSAI=; b=bmNR3BuWpzUIHI2dF8A7XU23Iu
	v7mBSmHo2Y4f2FL27IQ5slgTt5Ou2k6B3JhdqjcNiMJ/c/JN9PQToDmTD7KMiwevK7NTna5ij9+VN
	GvSaxpNJstX3RPEix6V8G3jzW1b0zF9X5iVKIQcYukLUhOE3bU5Oi40jwm/WSuetKgnQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3Fa8-00CPDV-Qk; Thu, 19 Mar 2026 16:46:44 +0100
Date: Thu, 19 Mar 2026 16:46:44 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: add initial device tree
 for TQMa93xx/MBa93xxLA-MINI
Message-ID: <ea9038c3-7e7d-457b-a3fc-8d21e2744e32@lunn.ch>
References: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
 <20260319125013.2421621-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319125013.2421621-3-alexander.stein@ew.tq-group.com>

> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy_eqos>;
> +	status = "okay";
> +
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
> +			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
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
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy_fec: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_fec_phy>;
> +			interrupt-parent = <&gpio3>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +			reset-gpios = <&expander0 1 GPIO_ACTIVE_LOW>;
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

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
