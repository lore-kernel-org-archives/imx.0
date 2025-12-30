Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F413957E;
	Tue, 30 Dec 2025 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092002; cv=none; b=asrNftZNxgFylBwLplzbAHN9uyNPiNneC+rQlnh+eqJToqXXvLuL7WyrWOMlyaw8aSiG0RjBHKe0pmdtpeJPvTqpiKAur7ibM7m32fFU2Q1r0vZlYMLWUTprtwVVKUHeQm4D7kRtHY2pzjAuwM7XqNdCVSoeKu/GCpvDuJnzS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092002; c=relaxed/simple;
	bh=YH5K4RwvK0mSgWXXBkf+H6wGSy4p/o+F8pMT1PLCKno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ugx+rG7EW61skqjPzTEFts9uCiTCLJVWpWodFHE2nerrxPupwsdSEUNEzG5p6Oq2khrwTNabGKHttrftrfUDzeLSVr0/4w132QMOsNs+kRYt02KedcQhnDv3QuTpqKwsF85f7stJ8ODuj/V8yhf1A3/rVgOeM05bXDtQETT8K8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=VF9GFn1+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VF9GFn1+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RvrIXXtJkwQLpKLNYX+FQY6pO76+th3R8O23dDJCL7Y=; b=VF9GFn1+aPe5Sxe33P/Kxgmtza
	6sKw4xc5OUnR5WrTwjMLpMwF+Su7o9Yg1chE/E0HgIL9PXbmPwAC5RRjfJUVJjoGh/Q9VgfWTqevN
	MdRvAQ3AgTN/6x8xJZoQj+21QpMm1DS4lbrNtgIXleh17Kf/GndrGNAOFwRSBcPQeCuo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaXLp-000rca-IT; Tue, 30 Dec 2025 11:53:17 +0100
Date: Tue, 30 Dec 2025 11:53:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <138b59d1-e001-4c9b-bf8b-a5af703d747a@lunn.ch>
References: <20251229213726.79374-1-stefano.r@variscite.com>
 <20251229213726.79374-4-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229213726.79374-4-stefano.r@variscite.com>

> +	sfp0: sfp {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&lpi2c3>;
> +		los-gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;

Minimalist for GPIOs, but O.K.

> +		maximum-power-milliwatt = <2000>;
> +	};
> +};
> +
> +&enetc_port1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc1>;
> +	phy-handle = <&ethphy1>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	status = "okay";
> +};
> +
> +&enetc_port2 {
> +	phy-mode = "10gbase-r";
> +	sfp = <&sfp0>;
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <10000>;
> +		full-duplex;
> +	};
> +};

The fixed link is not needed. phylink will ask the SFP plugged into
the cage what it is, and then configure the MAC as needed, 10GBase-R,
5GBase-X, 2.5BaseX, 1000BaseX, SGMII etc.

	Andrew
