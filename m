Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF571A0732
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727777652; cv=none; b=q4/AfJuiXkacm29IeD6CEh5XP7qhNDQ9ZlhFz5xtAD1z0x51dTRYGtVPJdo6e4tAa0SLGrnUCf9fUaSo/M941RfhzBx9wHFiJ5HsnTrPVuPCX8DbJi8ZnR5xizMVQWUvZRo7tVOSHjt7/LyJGNSJW018+8e7EckHhuy3Gf4IJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727777652; c=relaxed/simple;
	bh=hVIMypBT4bCAUjVTWkYJiVDf09iIQdZRQqzyr34YB0o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwzJaM6SGXWo5c4HnHjjWn/K38Kogi8LUnMDyFdOZxUJfSmW7vyQM4CYa5zvx4cx1I2ZaNyw40It9V8w4Ya/MweFnItfXd83ptWJ0m2VZ4OO23k9p8IlCEbfPYUpO5JSn8/A9WISKDWT+dUywM+fjb9vGtUtjgMYdLlPvZ5Emr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UoFQEdcK; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UoFQEdcK"
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C0012C3C21
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 10:10:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8812FF805;
	Tue,  1 Oct 2024 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727777429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xubVqJbp/ImgvJZq5XqMA75Rfpb0feHIScO6KnEx6JQ=;
	b=UoFQEdcKcTswzD0h9lY0I0HxtNjl9YMJvGNaX4ivfPn+wBnDXOUeHzVXyzJ5rylv+jcOZO
	x4I0M7MuwuYHvrOltESyIQL1UnsN9nKhTZ+2KtEAqosTDBph9x2cY6+Mo6b4Hr5cdh2ydp
	RmsCqYcMVsmPU7/QENEbXX090Zw43mPb1f7LYePsWioFoWshrZcwQzjV7gzgm6logHF5yo
	aU4/FQT3m6EmqIGjwUtdkb5ZfBoHZ/diltHgxTCinrqH10NQjUQTm6W3drYzo7+P2WJdUF
	kl0Ff9+eg3Q3AVMWbPf9j8xHdxOhmwfRTauS+5//JJWFMO3En9/JYrCWpXU+Ww==
Date: Tue, 1 Oct 2024 12:10:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, bbrezillon@kernel.org,
 boris.brezillon@collabora.com, conor.culhane@silvaco.com,
 gregkh@linuxfoundation.org, imx@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 pthombar@cadence.com
Subject: Re: [PATCH v2 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C
 controller driver maintainer
Message-ID: <20241001121027.29a51284@xps-13>
In-Reply-To: <Zvra9mFa9vD30PGO@lizhi-Precision-Tower-5810>
References: <20240815141609.4089406-1-Frank.Li@nxp.com>
	<Zt9VDJ546znNR7AT@lizhi-Precision-Tower-5810>
	<20240930182235.52c4530e@xps-13>
	<Zvra9mFa9vD30PGO@lizhi-Precision-Tower-5810>
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

Hi Frank,

Frank.li@nxp.com wrote on Mon, 30 Sep 2024 13:08:06 -0400:

> On Mon, Sep 30, 2024 at 06:22:35PM +0200, Miquel Raynal wrote:
> > Hi Frank,
> >
> > Frank.li@nxp.com wrote on Mon, 9 Sep 2024 16:05:32 -0400:
> > =20
> > > On Thu, Aug 15, 2024 at 10:16:09AM -0400, Frank Li wrote: =20
> > > > Add Frank Li as NXP i3c controller driver as maintainer and add mai=
l list
> > > > imx@lists.linux.dev for it.
> > > >
> > > > Add Frank Li as I3C subsystem reviewer.
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > --- =20
> > >
> > > Miquel:
> > > 	Any comments? =20
> >
> > I guess we'll happily take your feedback on patches targeting the SVC
> > driver, you've been working a lot on it. However, in general there has
> > been a lot of discussions happening on your substantial patchsets and
> > little to no convergence in the end. =20
>=20
> I think this can't prevent no any feedback at this thread for more than
> 1 month.

Well, there's been a lot of discussion, then no convergence, that's
what I am pointing out as well. You cannot say there has been no
discussion.

> Basic, this patch did two things,

Actually 3, and this is usually too much.

> one add mail list imx@lists.linux.dev to
> keep us track all imx related patch in one mail list. generally, we don't
> check linux-i3c mail list frequently.
>=20
> The other things is add me to maintainer, If you have concern about it.
> You'd better said as
> - point to the path to be maintainer, such as do reviewer first for some
> times.
> - or simple reject this, I can post the patch, which only add
> imx@lists.linux.dev.
>=20
> Keep simple, two questions:
> 1: are you agree on add imx@lists.linux.dev?
> 2: are you agree on I as reviewer?

I've already answered these questions and made a difference between
reviewing driver changes and core changes.

> > I understand you want to push your
> > patches upstream and I also want to make things move forward, but maybe
> > one of the reasons for the stalls is the lack of fluent exchanges
> > between us and the difficulty to explain bigger pictures in a clear
> > way. =20

Thanks,
Miqu=C3=A8l
