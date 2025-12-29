Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233B1D86DC;
	Mon, 29 Dec 2025 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767032694; cv=none; b=P7PMgMipDS9QvoEbK0AQqCj+ovRP/6NSgydn4+wWbQBXhag6sbXa7dbE0TXIZzk2n5zWRCHDVg36zIw9tIWnkgWfRwwxiYrt7Fa1kgt046fW8nT/4BNzCAegCOb4fOpQ4Bzh+Q09eN3B1/5cfDPZlDNAHkonmRrny2eeBAm6jwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767032694; c=relaxed/simple;
	bh=TwZUtr7ddPyOP0IlCPWeh/PSO5fNU6jcEsmo6z2xurg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdcrGonjE3DxZ3gIyU1RESWesKeSrb/Mua9kZTG8Ak+1KycMeWo5m0m7wPPHLyxbJePwaK4lIasM+P6uXFx3DTa3MQ5n/0eivQcfrSohXp9JcSy0C+LGngY90ANO5WrvmUx9KtS7RZdDmLGyZKLfSz5R7BknlIQYtonVto04hm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dScYmoVu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dScYmoVu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G6OFf6qhaZUZaSxhy68zC+vqqr64ZivU7vCX7ZbM4a4=; b=dScYmoVu2rUO1D2Qr8lmxofk3c
	IVcMp2uBfLTgDyuzVrpND5X5YQkuLdzzf8Trxdfi+73qhcrv0pA1LojXYskM2Yh2LoTHlcPiLa4KQ
	aQRn2YdcnsuobBwpMq5vOSvKlMmgxdKe9jgkuOum2SAycVTZBjeQBcMYTEEQJqJrj1rI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaHvG-000ogh-NL; Mon, 29 Dec 2025 19:24:50 +0100
Date: Mon, 29 Dec 2025 19:24:50 +0100
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
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <0afc0945-af65-410d-8556-1d09792981cb@lunn.ch>
References: <20251229150421.57616-1-stefano.r@variscite.com>
 <20251229150421.57616-4-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229150421.57616-4-stefano.r@variscite.com>

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

This node is O.K, thanks for the comment.

> +
> +&enetc_port2 {
> +	phy-mode = "10gbase-r";
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <10000>;
> +		full-duplex;
> +		link-gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
> +	};
> +};

What is this ethernet connected to? In the commit message you mention
an SFP? So i would expect a phandle pointing to the SFP cage node,
which follows:

Documentation/devicetree/bindings/net/sff,sfp.yam

	Andrew
