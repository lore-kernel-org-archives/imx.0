Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359383090D9;
	Thu, 26 Mar 2026 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543280; cv=none; b=UJAOEkMdm77opyvbJsDufauRG7ZGsbqwLbqHSB18+i6uC64Ztt/IFwYsdpkPpqdghumjV609HbGbsDW1cwdrMX5w/ubMyCsuLpchVxkp8In62KfmUoGfEkAkd+lHc0Lbcnex9X1tpxp55aRwnJcNb/7ge3Gk8y43TrILw1rppVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543280; c=relaxed/simple;
	bh=khIsf09HQtQVSltTOpFlaqNb+U+eny/5md8ooQmm3wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxzywDfsxl0MDNxVnSWtcghaqBBTGwsM+effRjvD3OTWV3UJd6ugLDZ0cCN/blZy/glxtLZ/RPas7nujN8nHOaGPDwJX62avOfpr3P/lAH5XU9TvIhyIXtBvPaa7+OXWsxn7B5YpD/z8ENpns2o9sXscGdMjyz/g4Exk63ZDX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=q9TWMJPG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="q9TWMJPG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=agMaZ/GJdV/tQntvePGg+8RCVIEFh9a0LvO+9OiF9Gw=; b=q9TWMJPGOXFs5VNWji2LA6+xEP
	V/YB30gwd6WHEvU3qLBNOeIQbvcDQ7UFhm3M27rbkUztcWJ+HA353etvFovRlIqM9HMPEyvybMjMV
	6obeQZuh4oKjKNaTPvZHwHWca/1DvCiUesOJHyg7W+l0pOGYx/4Yy9s1DcU3yN9u6Yj4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5nlg-00DVjM-8f; Thu, 26 Mar 2026 17:41:12 +0100
Date: Thu, 26 Mar 2026 17:41:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX93
Message-ID: <bf7680d3-0c93-40c8-b56b-4f91e03f5e36@lunn.ch>
References: <cover.1774539301.git.stefano.r@variscite.com>
 <304e5edc9ed11a552ac96c28d1046e4b13d5f960.1774539301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <304e5edc9ed11a552ac96c28d1046e4b13d5f960.1774539301.git.stefano.r@variscite.com>

> +&eqos {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +	snps,clk-csr = <5>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		clock-frequency = < 1000000>;

As far as i know, stmmac does not implement that property. There is
the danger somebody does implement it sometime in the future, and your
board breaks because it does not work a 10MHz.

I suggest removing this.

	Andrew
