Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCFAFBF3
	for <imx@lists.linux.dev>; Wed, 27 Mar 2024 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711500688; cv=none; b=SuIwz0XY2zT96U2qlHkxkCVzCIswDsbDrr306bZJfqTBh6kBka/GbF2xN/k9uqKHjr477gUPfqA1N0Vqd9sb/0ATjp2FSEIFFCi6LCrAzFGPyBYipLyq/NusFhdUmAnoIxfIzT32xLMs0gdeyICgde+R9abtwK/Sq1PdOAD+I30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711500688; c=relaxed/simple;
	bh=XLqVF++2sYQQwN5zavZgNts6rrlqki7tOPN2OuSbgWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unp1s2LyY7w07yGuPQkKTV9wSM5RBFtX/EwEkGvHVBVeAgpw6V+5Q0al/QMmE1imCA+OK0tPR7djz19JoQOi+hxDitNdAXYviGBisVC7lleKT8wKYpTfnb+0HqRNXxxjF8V4QkXbRrC67qn3LyrYglvO/13gtAOMRfCTOnb0k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O8NaBgJq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O8NaBgJq"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F3BF505;
	Wed, 27 Mar 2024 01:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711500652;
	bh=XLqVF++2sYQQwN5zavZgNts6rrlqki7tOPN2OuSbgWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8NaBgJqEyY0xf4GqKytvkDTk67gu0V0oK9ZograZ3QVsmo0pQ3jLL8udaHkxxgAD
	 5A367BvSn7HgWytuT6+xrfZIOJHLPyzNSpTqsCGtVMfllDo77RZpgvmOQgLMELkrit
	 kvN1IWM923w+m4/OE0Y8Nq/makbhG7fMnADLzQAA=
Date: Wed, 27 Mar 2024 02:51:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] arm64: dts: debix-a: Remove i2c2 from base .dts
Message-ID: <20240327005115.GC14986@pendragon.ideasonboard.com>
References: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
 <171144729683.3566204.12672101779935759480@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171144729683.3566204.12672101779935759480@ping.linuxembedded.co.uk>

On Tue, Mar 26, 2024 at 10:01:36AM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2024-03-25 22:50:48)
> > From: Jacopo Mondi <jacopo@jmondi.org>
> > 
> > The I2C2 bus is used for the CSI and DSI connectors only, no devices are
> > connected to it on neither the Debix Model A nor its IO board. Remove
> > the bus from the board's .dts and rely on display panel or camera sensor
> > overlsy to enable it when necessary.
> 
> s/overlsy/overlays/

Oops. Shawn, could you fix this when taking the patch in your tree, or
would you live me to submit a v2 ?

> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> > 
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
> >         };
> >  };
> >  
> > -&i2c2 {
> > -       clock-frequency = <100000>;
> > -       pinctrl-names = "default";
> > -       pinctrl-0 = <&pinctrl_i2c2>;
> > -       status = "okay";
> > -};
> > -
> >  &i2c3 {
> >         clock-frequency = <400000>;
> >         pinctrl-names = "default";
> > @@ -392,13 +385,6 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA                                    0x400001c2
> >                 >;
> >         };
> >  
> > -       pinctrl_i2c2: i2c2grp {
> > -               fsl,pins = <
> > -                       MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL                                 0x400001c2
> > -                       MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA                                 0x400001c2
> > -               >;
> > -       };
> > -
> >         pinctrl_i2c3: i2c3grp {
> >                 fsl,pins = <
> >                         MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2

-- 
Regards,

Laurent Pinchart
