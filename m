Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA00537F0
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712128018; cv=none; b=ZK8bquji0eut8EnN4w+LuX1o7uMECA7D6wQosWt8hcl56N7CRLJI2Js19BMeJeTj5Z/yUNzBaHkAy1U+1eY88Nx2z9x9IaCZY4RE1E63SWaGp6rwKHN/C8cbClQcD67OHYdWqX9VVw+L2IbEaLkzy7M1FGJ2TGJulklDC7WzxV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712128018; c=relaxed/simple;
	bh=WLvW8jaBuOqhMrbc7NT/Nyj4axuoziQWZTmEs6pzTs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH1lT3Gz6lrEWr9vVMq/cKSEVhqOA46NDyOP7HeTTiZo8ytijfnoJu0f8YQZOQw6b3DnikU7KrFkSe094PxsWgb/pMTTsB5zWdpTSsGKidxNjA20vrshCUQTChFk7/bBu+8v3M3ltilG2ZS4scRUOLk6S4w+h2DhND40mVDPIGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hq3xOYk1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hq3xOYk1"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 349501F9B3;
	Wed,  3 Apr 2024 09:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1712128013;
	bh=b/iyQ0g7EhgQ4rUty3uF5SLfMr97q4ikk+EFJcnzj3c=; h=From:To:Subject;
	b=hq3xOYk1jDcOsS1lYrZCd6Vj55jVi0+0S6yj+4UaSuQE3xv/q0S5h7UJousEqAKHE
	 /t+Mu7HbHdfZwUNo+nTP/ABi4zccdWBk+ecigRiwtnz+3BTGZtOS9i9fcgIyf8QOnq
	 lYSIc5e3Qp70DCks5MI8d/MTsnCmYwQmgsyeTB8P9vcHxAB87Ro3tTNEn7HR/FW2jz
	 9uRH70jQOi53Mh5RyS0+IkMUIGQWhresUrXoRefm9nPLnAIGwzatIz6u8MJsmGfS9z
	 ngUTmwo848uEYcij6dJPrF0CYhtBFQGKMPObwS2NHZLmasjB14tieQIIX5plNnLf8Y
	 vnJPrllZGtpjA==
Date: Wed, 3 Apr 2024 09:06:51 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo2@yeah.net>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add device tree source for the Au-Zone
 Maivin Starter Kit
Message-ID: <20240403070651.GB5070@francesco-nb>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
 <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
 <ZgyjE05p/1NZnzaK@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgyjE05p/1NZnzaK@dragon>

Hello Laurent,

On Wed, Apr 03, 2024 at 08:30:11AM +0800, Shawn Guo wrote:
> On Mon, Mar 25, 2024 at 10:32:45PM +0200, Laurent Pinchart wrote:
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> > new file mode 100644
> > index 000000000000..2d1c8e782465
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> > @@ -0,0 +1,236 @@

[...]

> > +/* Verdin I2C_2_DSI */
> > +&i2c2 {
> > +	status = "okay";
> > +
> > +	clock-frequency = <400000>;
> > +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> We usually end property list with 'status'.

This is now a written and explicit guideline, no longer tribal knowledge,
see https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Francesco

