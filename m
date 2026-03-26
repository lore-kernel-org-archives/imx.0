Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E53E556A;
	Thu, 26 Mar 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537825; cv=none; b=ZbS3Rv1TLb2E5UKd9Tgjx+UJMKVPEAQXiegK1HrjrHQukG0+S1cr8CcB//NsQOMkHLwVb28p/gdk1gx1jdqb4ygz/atHHMjo4Xwis87a6WI4RKLZokpIL2OzyiEvBAtCL1HGKUMYwK3kj2IpuWy4Ze8W5qsHjkibppzWdxe34vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537825; c=relaxed/simple;
	bh=D4imjI5WMMkhmn8FtSqlwON9ML4MwD/yGgafFxavnwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve/gur1XwhQOXVie0pwE68h9qI5BnAm6JbBYZCGvW148mTrfftmL0eMYF3dRfWHiOoKV1ppDA65+Lzgv9S11QKKBSiPxvLVef4j5Vbfvt2y62B/1qzbsYUlD/xts3ffrIb9wmfvbHPjnzQrEamqfuNxPCanCgJ2Roo+sVO2l9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xnGji1Jc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xnGji1Jc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E1WcWP49WRlOseIMPKA5P5k1L+aqEj2muFD1LAEro78=; b=xnGji1JcCyyovsVkjEsrjcHRFr
	sj9polDFmSUb8jomZa5pyoY4bgPMkUK7NO8ocSSR7crkqCVpI6sPefzgssRLcDwbZLKVHLhrkPyVP
	+9KkAXZV9YKSnd4uVkeqzTZjdB4aaQj6OW5QSiqraOquHLCkhEbPUHDrnByXZswDAgY4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mLj-00DUyY-Uq; Thu, 26 Mar 2026 16:10:19 +0100
Date: Thu, 26 Mar 2026 16:10:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Message-ID: <729f552b-06c6-46a3-a573-3337ce4a49a1@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-5-b991b81639e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-5-b991b81639e6@nxp.com>

> 4. Remove clock-frequency property from mdio node.


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

???

	Andrew
