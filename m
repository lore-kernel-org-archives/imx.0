Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE58231A55;
	Mon, 29 Dec 2025 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767032451; cv=none; b=okCSHPxWnHL3ZBRuT63FrK/51+yy+5tK7t4d3jLEJMVruqmp85wXm81TJbxfojYAgfpRLYhfRc7qFuKbVo2ehAGocHT5wvm354GgHWpM/olpfULz0nYSuJUScfjeaUKEBoffmNJ70ezzQjy75/lYNfA/Y1zI6mQtGSFak3yzrSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767032451; c=relaxed/simple;
	bh=pkvZsTK4PupgdDJ62b0AK9/ELVMaLyWfxH7I4/AlAdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLq3xr1EMjPgKxBlT4nOvMt1KQNiK1jR59qxs7t9asMBJAy99l7OD/f2r61hWDUrnijuXLy4NHxGpdosTM9qpB8cS8ssZwwn6va8VRmoYwLHwnVwtuXgIStz6EfPCjTObY7HT1bL29U0uXxrxfXqLE19k+rTeQug0f2Qn8WrcT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pJ4qwmDB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pJ4qwmDB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ICh1WIs14/72JBYekVxgqDTz4f7l5ZEA7Hy4pPqFp3w=; b=pJ4qwmDBpJ94/ihnp+k4AIsvSD
	e/f3b0J59vsh4Gz7ArprL3pwsk+sxNdnEBakuuG7zzbo7bpm4/iJNok4bHzGjYDGvRldRIamZgXjL
	WZoEteTcB786+dG6gG4oVJNGIAKRiP93RCWF8sE6BWFgYlw+e1QcDd2RRud3TnSgZduc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaHr9-000ofX-UP; Mon, 29 Dec 2025 19:20:35 +0100
Date: Mon, 29 Dec 2025 19:20:35 +0100
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
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX95
Message-ID: <b8349d9c-7a18-43bb-baaa-7e2ec62218b2@lunn.ch>
References: <20251229150421.57616-1-stefano.r@variscite.com>
 <20251229150421.57616-3-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229150421.57616-3-stefano.r@variscite.com>

> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	status = "okay";
> +};

> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		reg = <0>;
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <100000>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_YELLOW>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
> +	};
> +};

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
