Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78329E115
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757531979; cv=none; b=a6Kt40fh64KtGfRuRs9YuAYhPPCrcZQ8K661K5Qfa8nLL2O9hqI0wh7ySpP0IColeVsf0v8daDSMaEtFY91gWEmXn8x8vW0amjW0TT45JHx8CgpxTusavrmN5JWoM8rKS2sXLQ2zctDlWkG4b58V3BlLL8J/qeLt0fqHVQiuxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757531979; c=relaxed/simple;
	bh=a+dv0UV8rJBpw5xyo6IBTrbeTMXkPWVPM8ER8nxUixY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lj/90SZBGZeTaASZCwud8H7a/FrvWu5JEgfBpSgcP6QHuUCVrCuO1ajDFEUaWyMbM5mSoafrULR8wZB4/ct3mkGQmB0hGk9TgYELUex2IwSsGhz4kyxjPibfMXQXI2e6M+3KITptGmpBRKvUs+h8b33eUvWEwGNLCfw0shETbQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=S/DgMXTG; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="S/DgMXTG"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1uwQLq-00000002518-1t3O
	for imx@lists.linux.dev;
	Wed, 10 Sep 2025 21:19:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6gz3FXQu3DOFyH5Z/Yxt5ftIBimKEIJZnXppi88qYoQ=; b=S/DgMXTG9T1+Ocjo962KJ96UaF
	anWelgQmGO/UfRZPPlKdjlmpkrnpewf2mmdKcL4ZnXofMfK6ODsm6s7oh7b4M5k4RMXWCfp/XPBXH
	3MwMaQj1B/0RTfum51nzotVj5vc+982luD2HDTLjF8cIQzn1Vj0w4MDeXodebLl1aTafz+DLIzGER
	+DKZKKCIylemE0bvBATwKOZY0uaIobx1bhiUVmBdE3x0j9iXHdnloksfYoIR0No9Yrb2L8fUiMY1y
	ozK9zlaRZpU9/STU323PodgcPRhe0nOxqdYY9iyRN+/snTgZFbX4fH306Fg//Ji/s/RUcgW/GpgS1
	gZ3CSndA==;
Date: Wed, 10 Sep 2025 21:18:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Frank Li <Frank.li@nxp.com>
Cc: Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250910211804.5d88f12b@akair>
In-Reply-To: <aMGdH7Ab+9t/v3CB@lizhi-Precision-Tower-5810>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
	<20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
	<aMGdH7Ab+9t/v3CB@lizhi-Precision-Tower-5810>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 10 Sep 2025 11:45:35 -0400
schrieb Frank Li <Frank.li@nxp.com>:

> On Tue, Sep 09, 2025 at 10:33:02PM +0200, Andreas Kemnade wrote:
> > To be able to fully describe how the SY7636A is connected to the system,
> > add properties for the EN and VCOM_EN pins. To squeeze out every bit
> > of unused current, in many devices it is possible to power off the
> > complete chip. Add an input regulator to allow that.
> >
> > Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> > ---
> >  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > index ee0be32ac0204..054b97dd0c5c7 100644
> > --- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > @@ -32,6 +32,22 @@ properties:
> >        Specifying the power good GPIOs.
> >      maxItems: 1
> >
> > +  enable-gpios:
> > +    description:
> > +      If EN pin is not hardwired, specify it here to have it set up.  
> 
> Need descript function of enabel-gpios, you can ref data sheet sy7636a.
> 
> "enable-gpios" is good self documented by property name, needn't
> description at all.
> 
What you are saying is contradictory. I would prefer to have a mapping
crystal clear visible between properties and pins. That is why I want
that description. I remember I have got the datasheet from the company
site with registration without acknowledging any terms. But I do not
find that site.

> > +    maxItems: 1
> > +
> > +  vcom-en-gpios:
> > +    description:
> > +      If VCOM_EN pin is not hardwired, specify it here to have it set up.
> > +    maxItems: 1
> > +
> > +  vin-supply:
> > +    description:
> > +      Supply for the chip. Some vendor kernels and devicetrees declare this
> > +      as a GPIO named "pwrall" which does not exist in the datasheet,
> > +      disabling it makes the chip disappear on the bus.
> > +  
> 
> The same here, descript function. such as power supply for whole chip.

I think it is useful what I am writing here. DT maintainers are
apparently fine with it, since it has earned a Reviewed-By.

Regards,
Andreas
