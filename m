Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06270218ADD;
	Fri, 20 Mar 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013418; cv=none; b=Q3C1yBtXeTbsVR3ZlZGL/DBT2Ebl2Xoht7kCQcRNDtJhJvZv5dIEQIuRetcHug9ZAxaJcBkCezNvgKlB4U0zDKnhqctwI9Z0D05dThe4KySRQscAk6l4OWDJZT6z6I3XPwFlESakfIxeoF050yhmML1ERbudqWml79oP/yPBaTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013418; c=relaxed/simple;
	bh=9r9gw5R9AHSl87yaT04zB6hs5VlEcDyQ7zCIOorfEpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lujxtt+8Q91BI5vMWj2UTo31HT5xxa5kAEficxCsB+KWgeoyT5cWtpvsZVAiXxWFzyqBq77azjhMyUC9rSXIVqCrrhIdZwZLCkPJ0lX6Zk4IOoRl0ywgoC7jn8EpO2QpON73GAoWhYhXGzegepOUCwoyLzN3znXzlGTexCY/tKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fLm+T28Z; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fLm+T28Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KPEmOBrzJQ5lJjApNclCXD+tVOjngOyNohE76noQaxY=; b=fLm+T28ZNDiK0i9piqLnCiMh7t
	Jh/tkhITAG24PpexF47gsPCC+d17/moI3bicAbShxZZvlE3bWbqVprDNLBBa++Qo+vMXPPpQ7ICvt
	Y2EAKSa94KAGnKgS9fp0ezD/6FPxushXDUNoAyXlrK5eQ8nda9pN+jrFxwI63/aEHQU8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3ZvS-00CYvA-49; Fri, 20 Mar 2026 14:30:06 +0100
Date: Fri, 20 Mar 2026 14:30:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Message-ID: <43d91381-4f11-47b6-b37d-7c624402af5b@lunn.ch>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
 <4124e5ae-52a2-405c-a02d-7a1f48aa2b57@lunn.ch>
 <abzmpBHDRrsd/Mvr@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abzmpBHDRrsd/Mvr@shlinux89>

On Fri, Mar 20, 2026 at 02:18:31PM +0800, Peng Fan wrote:
> On Thu, Mar 19, 2026 at 04:43:40PM +0100, Andrew Lunn wrote:
> >> +&eqos {
> >> +	phy-handle = <&ethphy1>;
> >> +	phy-mode = "rgmii-id";
> >> +	pinctrl-0 = <&pinctrl_eqos>;
> >> +	pinctrl-names = "default";
> >> +	status = "okay";
> >> +
> >> +	mdio {
> >> +		compatible = "snps,dwmac-mdio";
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +		clock-frequency = <5000000>;
> >
> >Is that a valid property for "snps,dwmac-mdio"?
> 
> It is a valid property in 
> Documentation/devicetree/bindings/net/mdio.yaml

Yes, it is in general a valid property. But does snps,dwmac-mdio
actually implement it?

The danger here is, it is currently ignored, and the MDIO bus is
clocked at 2.5MHz, and your board works. But sometime in the future,
somebody actually implements it, your board jumps to 5MHz, and stops
working.

That is not the usual definition of a regression, so i guess we will
leave your board broken.

So you need to accept the risk. Or remove the property. Or actually
implement the property.

   Andrew
