Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE01BC41;
	Sun, 17 Mar 2024 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710695846; cv=none; b=nuWD8ylyQxGzM6BoTbgvPCESALcNxYTsXiWop5QLiKPyGqd7M25Mk25JEII2c4rHnIae+P7hWkE4G3XIL97k2WvY+RbJfFI92DwSsWIwuCbOnD99ad0IPqNOqeoEgEvhUKV6JUcr405zyLe0wmI45+zMlVflV9mFlHsrkshlv5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710695846; c=relaxed/simple;
	bh=OqkVxS8XRSy/eUTJqsZzpofJTgWK6zKV6Yb8K1kQqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG/34pUY4V4CI09h93NjK/BSEh3NklKjg0wrsx5ORrJMMfr2nPsSDKcU+cFFXahb1GJzZsOckdeugq87dN0OLjatMkKaLeMMEdJ2VBkDIB3x5HGaa8utdPSR3WnadFajuBqrWgdnbmV26b7ogvY3Jh8XPlalQl6cLwazKTcEV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=24ihppUy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="24ihppUy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7mTTnmjAS8jp1c/LI59SLovIlaMTZF6yt6vDy4nwrmU=; b=24ihppUy08duJhc07pHJlxm+J3
	CYZfOWgHpk9MOoicotsCpS3n7ZZGNcvhDoEFpZIQXpeWfZvQMmHO1hFHekyWzMnTWO0LGC7p9IDzw
	IUIpW817KKJpxnR7cXEGqOs3t3j0FUOckCrj1eS/bNkAkRGbURIA9xq9LELe7dynBgkY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rlu8L-00AYOs-Q9; Sun, 17 Mar 2024 18:17:17 +0100
Date: Sun, 17 Mar 2024 18:17:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: Add device tree for
 Compulab UCM-iMX8M-Plus
Message-ID: <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>

> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* Atheros AR8033 on v1.0, Realtek RTL8211E on v1.1 */
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			eee-broken-1000t;
> +		};

Hi Laurent

Do you happen to know what is broken with respect to EEE? It seems
like a lot of IMX boards have this, so i suspect it is the MAC. Maybe
we should be keying off the MAC compatible and disabling this in the
ethernet driver rather than have every .dts file needing it?

