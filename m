Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E228489E
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233857; cv=none; b=if+AjeajJnuGYvzmOja1OGLLp3WDkwGdDSe3xsB6IaAs+LvolzJ9I7xAZWbVik36P7j7Bw8DpzzdEVYdSCVFPqLb8XhU5emSlEDdyVs6YhSVsD5WfZ9v9XNkgRUp6KP+Zw3LA/lVqNO0JCpEzd+JPHq9hnQhlw7WPRgN0w0zO2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233857; c=relaxed/simple;
	bh=jUieC0lBFZSQ/SZySCEiOOp4+YSwNd1XEU2ZN/W1gaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVFF+EGcr9aQZUG6Th833ihAohO+kCgMytGDfl1rvnYCASMFIyPho6WaR9lnXC+PTasgNNeGl/y1F6OY5D/C3gJ27iBngXNHxtqsN8Ds7V+MK4rs2tJ4zlrdLT6q2zCjkmS4WaaId9vAdp5u3jxisHhTLSZe/bfqVWyZNOyTXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VATDK8RJ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VATDK8RJ"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fDy5R1Rxqz9tVQ;
	Mon, 16 Feb 2026 10:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1771233851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2vy6a1Meu+skf7rOG8rJ02x19jQsoOB+N+i06OG6jo=;
	b=VATDK8RJSlC2sJH92HI3+Xk72/x56bq1logEqJaAjaGfbVTFDoqdqEEVJyGNMxIZoODhNy
	c3eE1WaySM1Kdvks+bvwiLBIt9hjoBmJTXLZEESlvEhzNvu/OB5vTVGbsCzqr779/j+UPn
	YRaVzcu1RhRq2oZ4qOkJFJPKi3kFtpZnPfTUMNC8wdmqg9yY2ajeEu1+OuwQBIcHD5qNRI
	uIIqfutbvd6YMH892tkQqrw4Ynka/UNeLGJjanx7RLglG+XMkzwDPe2Zzs7zZjXtZAggj5
	lCNYEA3j+Alg39iq6OAVvW8AgSULz3cGOrXSmU7r+tkPHjPnqSBLhBmYahv35w==
Date: Mon, 16 Feb 2026 10:23:59 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v23 2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20260216102359.37586219@wsk>
In-Reply-To: <20260206112454.2e9a686f@wsk>
References: <20260204232135.1024665-1-lukasz.majewski@mailbox.org>
	<20260204232135.1024665-3-lukasz.majewski@mailbox.org>
	<20260205182805.196fd832@kernel.org>
	<20260206112454.2e9a686f@wsk>
Organization: mailbox.org
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 251ff2ea1f4baad21a7
X-MBO-RS-META: z4bao4g3s7pd9hey7cm8gwcj5wtksdmj

Hi Jakub,

> Hi Jakub,
>=20
> > On Thu,  5 Feb 2026 00:21:30 +0100 Lukasz Majewski wrote: =20
> > > This patch series provides support for More Than IP L2 switch
> > > embedded in the imx287 SoC.
> > >=20
> > > This is a two port switch (placed between uDMA[01] and
> > > MAC-NET[01]), which can be used for offloading the network
> > > traffic.
> > >=20
> > > It can be used interchangeably with current FEC driver - to be
> > > more specific: one can use either of it, depending on the
> > > requirements.
> > >=20
> > > The biggest difference is the usage of DMA - when FEC is used,
> > > separate DMAs are available for each ENET-MAC block.
> > > However, with switch enabled - only the DMA0 is used to
> > > send/receive data to/form switch (and then switch sends them to
> > > respecitive ports).
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukasz.majewski@mailbox.org>
> > > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>   =20
> >=20
> > Transient build failure here:
> >=20
> > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1072:32: warning:
> > variable =E2=80=98priv=E2=80=99 set but not used [-Wunused-but-set-vari=
able] 1072 |
> >       struct mtip_ndev_priv *priv; |
> > ^~~~
> >=20
> > I sent out the AI code reviews while at it, without looking at them.
> > So please approach them with caution.. =20
>=20
> IMHO, issues pointed with AI review have been at discussed and
> (to my best knowledge) addressed.
>=20
> Shall I prepare next version of this patch set?
>=20

I'm a bit confused regarding the next steps for this driver.

There was no reply regarding my last question - and I don't know how I
shall proceed...

--=20
Best regards,

=C5=81ukasz Majewski
