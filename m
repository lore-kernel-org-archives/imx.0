Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA1281341
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637349; cv=none; b=pQ5EJTaLW/Ard09635hNbbIfBVUbh1bVajoYeHq9ybbH7UP5mb7pUXSdQ94yZ5H6aTHGbkl/fyVCTemLwKqRnd+WjNEXeKuZyLcXTMvai/E/4anTSB8iH4X2haMbGWdWZWvbYRXzQvM6NqgYXvILdPFpaJUUy2Cin9i3UN/t7I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637349; c=relaxed/simple;
	bh=rtlc8ND3kQL0NIdSXD14iX29D2IcjakQ54Oo3TC3yMw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUQy5mug7KJkXlPys9kH3nkRCn7PHI/lc7M8alGj7SOu2Twvg/z5F/MBcp9J/qTBpvzIk6wplK3JmRXxoCyMg55hKoW2T1R8GwkkCaOIvwIv9aoxXDZa42BFvJLWA2tJ1I/7DQNXe8ZHBIMk6TniBXWx9STSYbIBb/VnokAl3U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TaJgEHQl; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TaJgEHQl"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f1bgK6bvKz9tRk;
	Wed, 28 Jan 2026 22:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769637341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eBZD4epMES0NdK+WxDlXWeM4FddXXNNOQ9YNWAox1JI=;
	b=TaJgEHQlYscWxauinYwsmlhF2sJliF0ML/RKfyh0FeGPnYJ23Pg4U8+quRx3YpICZdsvwL
	hEjlSryZJ3JHzgW5WdshCJG+41enbyqom9M5kz+x7xoEYMEbkaPCcHfFofE8oeIAuf30NT
	ghTJvCQIN0rYoB9GbTUu823V3S64+M20mUSW1lEn0lBjt6sgWc1ptI0OpxWHUHkWbR6sc+
	s85lSEUwBQ4gvRxkr+545gMeUC94wTLIuRccJdoK2XVSSYD4DGAXkEVaMSZ2EhWATCL+iV
	gj6bITMHm6BV0beA0wKJiAIe8WJUIjG/Od9CmffBDkdjp7pbRF8vE6RSHnJ3OQ==
Date: Wed, 28 Jan 2026 22:55:33 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, horms@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 richardcochran@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, andrew@lunn.ch
Subject: Re: [net-next,v20,4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20260128225533.39665c74@wsk>
In-Reply-To: <20260128022558.4151582-1-kuba@kernel.org>
References: <20260126103400.1683125-5-lukasz.majewski@mailbox.org>
	<20260128022558.4151582-1-kuba@kernel.org>
Organization: mailbox.org
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 7d006a684c6f407a7af
X-MBO-RS-META: z11xxedxwyc1eh8qc7t7nd5s3ut5si6k

Hi Jakub,

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>=20
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-local.html ---
> net: mtip: Add net_device_ops functions to the L2 switch driver
>=20
> This patch adds the net_device_ops callback implementations for the
> MTIP L2 switch driver including transmit, timeout handling, multicast
> setup, MAC address configuration, and port parent ID retrieval.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 9c21a3d29c1c..a6424ee1a9d9 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c =20
>=20
> [ ... ]
>=20
> > +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> > +					struct net_device *dev,
> > int port) +{ =20
>=20
> [ ... ]
>=20
> > +	/* Push the data cache so the CPM does not get stale memory
> > +	 * data.
> > +	 */
> > +	bdp->cbd_bufaddr =3D dma_map_single(&fep->pdev->dev, bufaddr,
> > +					  MTIP_SWITCH_TX_FRSIZE,
> > +					  DMA_TO_DEVICE); =20
>=20
> The dma_map_single() call here creates a DMA mapping, but
> mtip_switch_tx() at this point in the series is an empty stub that
> never calls dma_unmap_single().

Yes.

> Is the intention for this to be
> resolved by a later patch in the series? Looking ahead, a4c3fa1c66c9
> ("net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch
> driver") does add the full TX completion handler with the
> dma_unmap_single() call. However, this commit on its own could cause
> DMA resource exhaustion if used standalone (e.g., during bisection).
>=20

The MTIP Kconfig define would not be available at this point of the
series.

The split is done as part of the agreement of how that large driver
shall be added.

The mtip_switch_rx|tx is a stub at this point to ease the review.

> Would it make sense to merge these two patches together, or at minimum
> have a note in the commit message explaining the dependency?
>=20

@Jakub - If possible I would keep things as they are now.

> [ ... ]



--=20
Best regards,

=C5=81ukasz Majewski
