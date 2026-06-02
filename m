Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE273DB652
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399980; cv=none; b=REVS6GBWjdQX8JybE5MSSYMQrF7dyGumGC93UUzGEc+Qg9CU4UFzPrKDSdIxNq8ZgX01/nWEN6KwOIrlouQYGf7GnqSbPYk2+02KVXGshqTUTJVYm9wwpUKLjf9ax7SLBiZmVQBn4YPNyJRQZ6Zns+ALKcmkLZ8qBUeWmA4oPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399980; c=relaxed/simple;
	bh=f6gbFEVe0jxYAz5eeppFKFSMwJPftK3cJp1ddRBfu6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KShiDvHFBIPX0QJQM59YU/MoO9tbe+nqaMDdaYNNmPZA7X2jOjmT97C1khSlKSoq+XSQfeElXlp+CM4bOsEEHsEIPtDem0U81yGgnCLMUJusyp1ZM/ixS4WAQZ5cMtzJZvuCKK68OBtAzX9P9pRh+rmyY/Q8WdUQsa61mceStw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI4dgAlA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI4dgAlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789D51F00899;
	Tue,  2 Jun 2026 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399975;
	bh=m2qysN7t8EeEDnBy3sMTkEimO/JutRDOHHPfO9wBuNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dI4dgAlADaOFszSCXmPmUIIwTkh/F3t+Ecm3+o2S0TUXDZ86zq/pJxOORmMWDC53f
	 OkXa98VAP5OyXqWyXJOIIlsXOmx1YZKxA4Lgm34zqytC3z0zPoGwvRIpQkLsW6mgXY
	 Ad7iiScPDfGXbw8y6eudr5qf5BrJR5dPtJdbAT0M2bb7eQt58PxW+qaf/1AtKkrntU
	 +NcsoBbVOen0Icz3VLs6zFqj44NOIbh6I11aC5WBpYJF9G4ZRAnDCh6mM06SfnJHFh
	 kGueOvaUA5U/afEl2DwOy6MJhgbm+Ad3LW+UcyJkv2IRekqMJB/fsnX6Fb48GJuHKj
	 cUp+CsGKe+KGw==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 3/7] net: mtip: Add buffers management functions
 to the L2 switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260601112437.2216043-4-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-4-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:54 +0000
Message-Id: <20260602113254.789D51F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] mtip_free_buffers() is invoked unconditionally on the mtip_ope=
n() error path, causing Use-After-Free for shared ring buffers when usage_c=
ount > 0.
- [High] mtip_free_buffers() frees DMA-mapped buffers without ensuring the =
hardware MAC/DMA engine is stopped.
- [Medium] Pending transmit sk_buffs are leaked in mtip_free_buffers().
--

commit 4b7d8928772619aad35c821850421906a5fec249
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>
Date:   Mon Jun 1 11:24:32 2026 +0000

net: mtip: Add buffers management functions to the L2 switch driver
   =20
This patch provides buffers management functions' content for the MTIP
L2 switch driver. It adds implementations for allocating and freeing
shared ring buffers and page pools.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/n=
et/ethernet/freescale/mtipsw/mtipl2sw.c
> index 1d1005a42306d..5b5229ee411df 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -892,11 +892,101 @@ static void mtip_get_drvinfo(struct net_device *de=
v,
> =20
>  static void mtip_free_buffers(struct net_device *dev)
>  {
> +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> +	struct switch_enet_private *fep =3D priv->fep;
> +	int i;
> +

[Severity: High]
Does this function ensure the hardware MAC and DMA engines are stopped
before freeing the buffers?

Looking at its caller in mtip_close(), mtip_free_buffers() is invoked when
fep->usage_count =3D=3D 1. However, mtip_close() does not appear to explici=
tly
stop the MAC, disable the DMA engine, or reset the hardware before calling
this. It only disables the clock after mtip_free_buffers() returns:

	if (fep->usage_count =3D=3D 1) {
		napi_disable(&fep->napi);
		netif_napi_del(&fep->napi);
		mtip_free_buffers(dev);
		clk_disable(fep->clk_ipg);
	}

If the hardware is still processing queued TX packets or receiving RX packe=
ts,
could it continue to perform DMA operations on the memory that has just been
freed and reallocated to the system?

[Severity: Critical]
Is it safe for the mtip_open() error path to call this function
unconditionally?

When a subsequent port is brought up (fep->usage_count > 0) and
mtip_mii_probe() fails, the error path goes to mtip_mii_probe_err and calls
mtip_free_buffers(dev) regardless of the usage count:

 mtip_mii_probe_err:
	mtip_free_buffers(dev);

Since these buffers are shared across all switch ports, won't this destroy
the page pool and free the TX bounce buffers while the first port's NAPI
and hardware DMA are still actively using them?

> +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> +		if (!fep->page[i])
> +			continue;
> +
> +		page_pool_put_full_page(fep->page_pool,
> +					fep->page[i], false);
> +		fep->page[i] =3D NULL;
> +	}
> +
> +	page_pool_destroy(fep->page_pool);
> +	fep->page_pool =3D NULL;
> +
> +	for (i =3D 0; i < TX_RING_SIZE; i++) {
> +		kfree(fep->tx_bounce[i]);
> +		fep->tx_bounce[i] =3D NULL;
> +	}

[Severity: Medium]
Are pending transmit sk_buffs leaked here?

This cleanup correctly frees the fep->tx_bounce buffers, but it does not
seem to iterate over the fep->tx_skbuff array to free any pending socket
buffers that were queued for transmission. Will any sk_buff still in
tx_skbuff[i] when the interface is closed be permanently leaked?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D3
