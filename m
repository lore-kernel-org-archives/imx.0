Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3F3E8C40;
	Thu, 19 Mar 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935035; cv=none; b=ivW0/wxq1UpFGLIReMWi+ahmztBl46rTCU2EYQf6RNFPaAwjVZ8kPk50o0RgWkAPQHLxP6Kxp5DSoTOFhPgMX6fPtmQI+pbwXJJv5V984Zm29KS2MP5ZKw63pwNlYIlsj9kbZHf1BVkDUFSABz38XF8rxsHki5EYC/ll2BQ3me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935035; c=relaxed/simple;
	bh=HzuIh3GtWitApe6Y9ROKOpHb45OpEmsZrxOCBpxUC70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANqko8xeETbpb5ILQ7IgOBqS0z7AaUWE71WMmBQYqdWQPrnlXujXzvQdIIDj4Adv/fLy3qQ7elPL5pwsr40yDaFUD4Af1oIgaEhHTszC7W+drpjGU7bhj1te7FqRc6B19NAwBk4UKUXfA4rf84mqed0ZKav/bgUd2gOsaYtOalw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fH/Ts+Oq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fH/Ts+Oq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=k+RW68aVkI9iLNvIqRQgkb95WN+LSHBz85KEiW1L0vU=; b=fH/Ts+OqzrlIgE4J7Pm11SorfU
	Zcj6b6UkIugNxQHPWpeB2LgEtpbDGDwOqPR8NfsowHL5k0xS0FTxQJVNhR/hQDcxViB+hqfRcFKHE
	okGcxegOflerZjqnYLRQCC+E0Bg6NQiY0aVAZrSwTPEtgpDhfdM/1R7PEq0VyM+h1r1c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3FXA-00CPBt-KF; Thu, 19 Mar 2026 16:43:40 +0100
Date: Thu, 19 Mar 2026 16:43:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Message-ID: <4124e5ae-52a2-405c-a02d-7a1f48aa2b57@lunn.ch>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>

> +&eqos {
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;

Is that a valid property for "snps,dwmac-mdio"?

~/linux/drivers/net/ethernet/stmicro/stmmac$ grep  clock-frequency *
~/linux/drivers/net/ethernet/stmicro/stmmac$ 

	Andrew
