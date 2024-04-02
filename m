Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380C3D3A4
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044757; cv=none; b=q7xSmzxelHc1M539XxIKz5G2u75gPL0S3b2uC81Z6jBLn7EuoJaUisRV11po/NFCNgR0cu9ZEKuF++kQ+vU0L+DfR55cLZg1Q6NRTPfoiFdx2+uvrHurj7OolhN4j0+MAFvF1u5nk9kxrcu/dR/jeARZiD5WInGeArxCq3zox+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044757; c=relaxed/simple;
	bh=SoSBspWBsfBSc6I60FIMrcKMwveW12JgMXKjD2sYj3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs5Wii/KC3IAWQX6piNxPrrlUy5lajU+seNM+0L2wOVk1YFQVTpX1EMWzRKLO8bcLKwln4UHLAah1BBFF/QMsaYLyvOPdOLJIMD/IVRgm9D0Yjvr456ne2hOdrKXD5hmtglhQJIm/jxbUTMbaakfNufw9y7lM/JSp/pHzaIZ3Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L59hw+W3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L59hw+W3"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0624E83F;
	Tue,  2 Apr 2024 09:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712044717;
	bh=SoSBspWBsfBSc6I60FIMrcKMwveW12JgMXKjD2sYj3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L59hw+W3z6ZH1/6PWhL1jXWMRW9hNRPDInLat83deFTTQtuyoObiUMMV9wQNJ1OSF
	 fX/cYEyLpSzvbn+QzjnWBn5uGh8ocFXdBjkHkwzvjZaRZHw8YJhmhdX01/waxOgaIv
	 eXm0z0kAIr+Q/HUFcGSOEqn5alfZYEl0foB39Wj4=
Date: Tue, 2 Apr 2024 10:59:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: debix-a: Remove i2c2 from base .dts
Message-ID: <20240402075903.GB10288@pendragon.ideasonboard.com>
References: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
 <20240402065443.hpinj7oftcst6fwd@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402065443.hpinj7oftcst6fwd@pengutronix.de>

Hi Marco,

On Tue, Apr 02, 2024 at 08:54:43AM +0200, Marco Felsch wrote:
> On 24-03-26, Laurent Pinchart wrote:
> > From: Jacopo Mondi <jacopo@jmondi.org>
> > 
> > The I2C2 bus is used for the CSI and DSI connectors only, no devices are
> > connected to it on neither the Debix Model A nor its IO board. Remove
> > the bus from the board's .dts and rely on display panel or camera sensor
> > overlsy to enable it when necessary.
> 
> I would rather remove the status line instead of removing the whole node
> since the bus is intented to be used for CSI and DSI and therefore the
> muxing should be valid. This makes it easier for overlay authors since
> they don't need to check the mux setup each time.

Seems sensible to me. I will drop the clock-frequency property in
addition to the status property, as the frequency depends solely on the
devices connected to the CSI and DSI connectors.

> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../boot/dts/freescale/imx8mp-debix-model-a.dts    | 14 --------------
> >  1 file changed, 14 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > index 5ac77eaf23d5..26c303b7c7fa 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > @@ -210,13 +210,6 @@ ldo5: LDO5 {
> >  	};
> >  };
> >  
> > -&i2c2 {
> > -	clock-frequency = <100000>;
> > -	pinctrl-names = "default";
> > -	pinctrl-0 = <&pinctrl_i2c2>;
> > -	status = "okay";
> > -};
> > -
> >  &i2c3 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-names = "default";
> > @@ -392,13 +385,6 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
> >  		>;
> >  	};
> >  
> > -	pinctrl_i2c2: i2c2grp {
> > -		fsl,pins = <
> > -			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL					0x400001c2
> > -			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA					0x400001c2
> > -		>;
> > -	};
> > -
> >  	pinctrl_i2c3: i2c3grp {
> >  		fsl,pins = <
> >  			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL					0x400001c2

-- 
Regards,

Laurent Pinchart
