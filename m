Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD3A1B5AA
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 01:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810132; cv=none; b=aKXINO1nvgC9coEQXYz9AYOezj4fIlG7POzuDKjmmgkUjmS9EUDws7za1ZFnFxgaHBiU//bxCPwhKiI4dN9AVPoBDWStj9Fa3VzS9yA75+RpjBJ37ZxXSpTzDnRyg7uUyleTY/VcSmZXMr8IdtrqWNNl/aguecvLbLP70w8nofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810132; c=relaxed/simple;
	bh=7LuomIMMRpCXY0e/2DKIVqsSnL5Za8OyQ2iv7VsWxfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwF6QckWvKDKEwFx4nCbxUL7QXWU5ptxCWyUgGOBsvCakatvKtzTdA25S82LNDf9ZsHbpV2uSWJge7SdQwsM3vwM/jqG47Da3d05bmjjPGU2e9oRCrBqPwTchVKKwUp5at7JRBV6JROl8+7qxU/hLhdCRW8SsroHHl2c9HdlZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bVn8bss2; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bVn8bss2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IC04N3pSECFSR9IAB60w2wb7p2WDMSJzd/BCucDtm7U=;
	b=bVn8bss2XN+FPxol9grcpOrqjHbFRqZSgn66a4tOOZwOX2ph2r+4Q8/YOaA5wj
	hN+8VaE82coFlVG5SuhA1O20KkqviwA1ce7f3OTf/rYR0SRUAUsmDeqnBPTuhgKm
	mtS/gsMI7sGlqGGDH4zUoA6BVm5roizpDSB82ICOzmRdE=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3d1jhgM5mwYMNAA--.24374S3;
	Wed, 28 Aug 2024 09:44:03 +0800 (CST)
Date: Wed, 28 Aug 2024 09:44:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 6/6] ARM: dts: imx7ulp: add "nxp,sim" property for
 usbphy1
Message-ID: <Zs6A4OEgaC8a3gcw@dragon>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-6-xu.yang_2@nxp.com>
 <20240826065612.ol4fjib4g2jrvoy7@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826065612.ol4fjib4g2jrvoy7@hippo>
X-CM-TRANSID:Mc8vCgD3d1jhgM5mwYMNAA--.24374S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWkGF4rZF1xWryDAF4xZwb_yoWDtrg_Wr
	W7Cw1jka1rKrs5uFyDGr1kX343KwsrGrZ3X345Wr1kJF1ava18GFs7ta93XFy5Ca42gFWD
	ZFZ3Za4jqw1SkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8t3ktUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER9JZWbOG9TjXwAAs5

On Mon, Aug 26, 2024 at 02:56:12PM +0800, Xu Yang wrote:
> Hi Shawn,
> 
> On Fri, Jul 26, 2024 at 07:32:07PM +0800, Xu Yang wrote:
> > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - no changes
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > index ac338320ac1d..b093f2a447ae 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > @@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
> >  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> >  			#phy-cells = <0>;
> > +			nxp,sim = <&sim>;
> >  		};
> >  
> >  		usdhc0: mmc@40370000 {
> 
> Could you please pick up patch 3 and 6?

Patch #3 should go via usb tree, and ping me on #6 after #3 is applied.

Shawn

