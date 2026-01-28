Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF89327202
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 21:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769636952; cv=none; b=bFxlNbWwlp2E1fqbeeQRrUGS1S3Bd2aL7RSlPf6N5kHWkmYDt0cnxhniEQl7b2UMCASkIegZ/6jvV6WuDoOw7KbQWYQgAuvbg9B0E4Trp/80fzfhi79XSIRznBM/Q1okqX7F8gkqS8Qdwu6Nz3cGC90NIOLYvEBw5POucq2G2hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769636952; c=relaxed/simple;
	bh=WrvAyanbpwZ6MTEpVe5ifEBlgTpCvqg1qgTjOkpLaBY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQ/XJ7CeopOQXZ8Jw3mi7oRdI0/pWrLtf06+q5cQoyVt+5b94WzYpOKxJbeBstk1zx+FAw3D9wWyUJfvrT9UE7IZw4Mzq8TSLcO1N00FbrMoaO+5/GH3I65oQnj3sQDNBZgS6n+fbMQrjw1AEL+BAscY4MvVQ3l3cKRfrEb8vZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aIGJEdcP; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aIGJEdcP"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f1bWc4D8zz9v9k;
	Wed, 28 Jan 2026 22:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769636940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruAirXc8ptlR96ve5/9BugE40WCJ6xsmkWJx5Uj7rfU=;
	b=aIGJEdcPUTNpCRPoxieT4ns0YAjlCS1SCWknUwnMSvmg9qMSU20pliO7EHJ/YKehTef8X4
	OfTEP83Ov9GJqRBfQnmvxyTZcUkhN3Isu8Z69m16GysXboDZgypVf6Kj9EW9o5rDTKZsMY
	NIcdir18IPW6rSkamg/khyUXsG3gehroa1KRAizet4EDWTmH8218TSM2mJHy+ejCWT3X0R
	RlbV1knLwiHUkLPAQpjKDcSOf9gjVgsxYEH1P6cGBrYcHW7AVeKncHeNW5OdTfn2+5JM62
	sRj7wXkwpjWQSCUAdP5w3MdePLt7m5N1DeC244DsjJqF2Be7TWLIy2uh2IH44A==
Date: Wed, 28 Jan 2026 22:48:52 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, horms@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 richardcochran@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, andrew@lunn.ch
Subject: Re: [net-next,v20,3/7] net: mtip: Add buffers management functions
 to the L2 switch driver
Message-ID: <20260128224852.62b16788@wsk>
In-Reply-To: <20260128022554.4151421-1-kuba@kernel.org>
References: <20260126103400.1683125-4-lukasz.majewski@mailbox.org>
	<20260128022554.4151421-1-kuba@kernel.org>
Organization: mailbox.org
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 0a70d41f27b7b89e913
X-MBO-RS-META: p4u7ozw7pi4bkkx54cikgzroe65njg1g

Hi Jakub,

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>=20
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-local.html ---
> net: mtip: Add buffers management functions to the L2 switch driver
>=20
> This patch adds buffer management functions for the MTIP L2 switch
> driver, implementing mtip_free_buffers(), mtip_create_page_pool(), and
> mtip_alloc_buffers() for RX page pool and TX bounce buffer handling.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 03c5163d6508..9c21a3d29c1c 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c @@ -888,11
> > +888,96 @@ static void mtip_get_drvinfo(struct net_device *dev,
> >
> >  static void mtip_free_buffers(struct net_device *dev)
> >  {
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	int i;
> > +
> > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > +		page_pool_put_full_page(fep->page_pool,
> > +					fep->page[i], false); =20
>=20
> Can fep->page[i] be NULL here?  When mtip_alloc_buffers() fails
> partway through the RX allocation loop, it calls mtip_free_buffers()
> via the error path.  At that point, only some fep->page[] entries
> have been allocated - the rest remain NULL from the kzalloc
> initialization.
>=20
> The call chain page_pool_put_full_page()->page_pool_put_netmem()->
> page_pool_unref_and_test()->page_pool_unref_netmem()->
> netmem_get_pp_ref_count_ref() will attempt to access
> &NULL->pp_ref_count when passed a NULL page, causing a NULL pointer
> dereference.
>=20
> Should there be a NULL check before calling page_pool_put_full_page()?
>=20

Yes, such check shall be added.

> > +		fep->page[i] =3D NULL;
> > +	}
> > +
> > +	page_pool_destroy(fep->page_pool);
> > +	fep->page_pool =3D NULL;
> > +
> > +	for (i =3D 0; i < TX_RING_SIZE; i++)
> > +		kfree(fep->tx_bounce[i]);
> >  } =20
>=20
> [ ... ]
>=20
> > +static int mtip_alloc_buffers(struct net_device *dev)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct cbd_t *bdp;
> > +	struct page *page;
> > +	int i, ret;
> > +
> > +	ret =3D mtip_create_page_pool(fep, RX_RING_SIZE);
> > +	if (ret < 0) {
> > +		dev_err(&fep->pdev->dev, "Failed to create page
> > pool\n");
> > +		return ret;
> > +	}
> > +
> > +	bdp =3D fep->rx_bd_base;
> > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > +		page =3D page_pool_dev_alloc_pages(fep->page_pool);
> > +		if (!page) {
> > +			dev_err(&fep->pdev->dev,
> > +				"Failed to allocate page for rx
> > buffer\n");
> > +			goto err;
> > +		} =20
>=20
> [ ... ]
>=20
> > + err:
> > +	mtip_free_buffers(dev); =20
>=20
> When this error path is taken, fep->page[] may contain NULL entries
> for pages that were never allocated.
>=20
> > +	return -ENOMEM;
> >  } =20

I will add proper fix for v21.

--=20
Best regards,

=C5=81ukasz Majewski
