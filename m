Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A512FF72
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026511; cv=none; b=Bkzijl+ovTKGq8Ykvdujm0qbJ3EkSMTIiJajYACazy3LJtzCDvMswyewbOBfDhfrJmq0QWp+oNIwOBi4n0zQLxHpcU78Ns9o5cWO2wFAW+0ikK0t9EgQXAp5qXTzScqzplJBc3VxkHTFFt/5qf5uhUy4azFiLr8j540WT3COQ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026511; c=relaxed/simple;
	bh=wbOJ7mRuz12sXrxgb8Gruc0IjSMNRZiQXSCKn6islOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTOQEqxhafkJTSeir9vXqIFj9QtRZCRHL2IdZh6smHapa9O//RuMzXKn3w7sRCoB984XMDCf4i8PPsY/8CoejWsC3KJsFh+xMD1qii7ohaWZUkUufvIWH71HVuui9CgLVCyjZpILYcUKo+1Ce4UCGAvtd5cce1hek7uoLIa/Gdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T2s4OCbS; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T2s4OCbS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B0B01BF205;
	Fri,  4 Oct 2024 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728026507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EB50ZWS7pX3weSaYhuDUsmGhx18VRAut/5Y88goDLAs=;
	b=T2s4OCbSOKMvGOHD6OxayLMLTxecMZym5OYdLujEe7H4xs0nCrgOAvHLLfNOa2GfC9cjWm
	0pNeenGg0ExLblVpsEvQOeLHb1QhZ3l1v8GxuN/VOyZ9lX6pUmnoJYtCX5YVNiGA/ycR51
	ShQINcdSv9RPwKw8QIzy6pI8TMh8iYxgRI/MHm8fWzKzmsYTgvQR+ma6mlA8Jsmbm55N4Q
	ffn/zyYmvXcPrdRFa5Xb0NkS+kJv5kURt2KxMKCz22acMTKuOfudWi5vMc7Gw8SlL+QeiH
	+w2l+R77SyZ/bz3JY0bKlpWDj8xk2w8zMEZJK5rsT8P0Gr04zosNtYL1Sh4Nnw==
Date: Fri, 4 Oct 2024 09:21:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241004092144.3e0d89b5@xps-13>
In-Reply-To: <20241003200508.x7tbf2lpbg6ngm7q@cozumel>
References: <20241002153944.69733-1-han.xu@nxp.com>
	<20241002153944.69733-2-han.xu@nxp.com>
	<20241003093840.2965be20@xps-13>
	<20241003150500.uz2efay7kadu47if@cozumel>
	<20241003172820.50324192@xps-13>
	<20241003200508.x7tbf2lpbg6ngm7q@cozumel>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Han,

han.xu@nxp.com wrote on Thu, 3 Oct 2024 15:05:08 -0500:

> On 24/10/03 05:28PM, Miquel Raynal wrote:
> > Hi Han,
> >=20
> > han.xu@nxp.com wrote on Thu, 3 Oct 2024 10:05:16 -0500:
> >  =20
> > > On 24/10/03 09:38AM, Miquel Raynal wrote: =20
> > > > Hi Han,
> > > >=20
> > > > han.xu@nxp.com wrote on Wed,  2 Oct 2024 10:39:44 -0500:
> > > >    =20
> > > > > The commit refactors the power management handling in the gpmi na=
nd
> > > > > driver. It removes redundant pm_runtime calls in the probe functi=
on,
> > > > > handles the pad control in suspend and resume, and moves the call=
s to
> > > > > acquire and release DMA channels to the runtime suspend and resume
> > > > > functions.   =20
> > > >=20
> > > > May I know the motivation to acquire and release the DMA channels
> > > > during suspend? In general it seems like a different change which I=
'd
> > > > prefer to see in its own commit with a justification. The rest looks
> > > > ok otherwise.   =20
> > >=20
> > > Hi Miquel,
> > >=20
> > > Thanks for your comments. IMHO there is no much logic changes indeed,=
 just move
> > > the dma channel acquire and release from system pm to the runtime pm,=
 releasing
> > > the unused resources as early as possible. If you think it's necessar=
y I will
> > > split the patch into two parts. =20
> >=20
> > Actually I don't understand why these channels are released and
> > acquired again. Does it make sense to do that in the (runtime)
> > suspend/resume path? I'd be in favor of avoiding this extra
> > configuration which as a first sight does not seem required here. =20
>=20
> Our local mxs-dma driver (will upstream the changes later) implemented th=
e runtime
> resume/suspend in channel alloc/release functions, so I did this in the g=
pmi
> nand driver suspend/resume path.

I think it no longer makes sense. RPM takes care of the
suppliers, at least since fw_devlink=3Drpm.

Thanks,
Miqu=C3=A8l
