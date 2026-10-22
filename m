Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680885;
	b=DOdJSNgmBU437xGrBU6ha0W8SIXqmkKuYUchyoNnhxYuC4NOq5An094TYEC7R7XH1mTC
	 6Vd3O2Z56wkKvHAtUqxArrEkGdJOWS8sgIGADjh0jm7qiEraZEXuPBpHht7qjvsWvN1p2
	 7AI4ODzswQaCF6es4Fqw3giNEIHZJq4Yw+0+gcgOXLjUpMP52M4LXBfPdcL5QvtErfAjk
	 0ojOMT6yf+IXMU34YBr9xmqQ5DXhN+YJHINT2nGnkS9I7zaP7FV3mUNE3y/Y3p0xpV6zH
	 WjrZ9u0bOV0FYL+OsM0hRdb8kgeHbP9O8M8XzoQ11iwVTStST9h3i537zIsFEQElE5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680885;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/rs7KfnMctJsUxFdqxcrOXyGmSlB+NmHzCiazsGd9hk=;
	b=uncT8jqT9G+rXgQPKSLE6DdwapQSinAlD8vZIISkVXX33u2+E4Z2ItPBet4Cl6ia7WvM
	 lv+9e0rxtFoQhQPzytuwRtdSLpYHHM4XJ8VWcac146Mq9YT0JkZXdP1Mp8FPWkHWAdARY
	 LdiEDUocYc2Lml1OZEPa3jUzWc2NU709AAbvg0HvbkjUPR+qSR8deaWOKfxWPvta24voF
	 tNXjOPT6Ld4Skf/Aw6NTJL79rtCx6lcIfA1qcfx4+vdeW5TclEgVBstQrDHTFKonbYusQ
	 a9gudHvXSTFx+Ga4kJrIFESn+VOoFo5eEB2TXOwhP1xJck3SoSheMk5tESJzy7XjQPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9xEmPlc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0F606A319
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9xEmPlc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384D11F000C2;
	Thu, 22 Oct 2026 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792680884;
	bh=/rs7KfnMctJsUxFdqxcrOXyGmSlB+NmHzCiazsGd9hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9xEmPlcdeksAaC09uVOHw505B8vIu6LNnAy/iOen2qErS94tcP0hbLkPSiZ2kmJB
	 StGPcNybG6Y4QCVVJzkpYZJ7eF6A49M7yjAhzqw6iwv0bsmL8YFQbOzUtqnbe2XpG4
	 ksgGfte7XQzCAllHShHeYjib/7/mq3aC0CgKO4mh50Gh8r6WO2ZHsnUjQkJiA0svmP
	 Jx7ThDjDBykwPWr1vpBXWym8ppRx/NJzrP7G1AxJ6xH5u9hw5ZYZtijWkybbItbGNS
	 ANDzdGR9kQO9aj9hcme45NTintAs8nvNRvJ2PbTLasbRLjGnZXU6PUBHS8XtH9WgoI
	 DOJyYlX9RpNHw==
Message-ID: <sashiko-outbox-181659@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net 2/4] net: enetc: do not rely on mEMAC hardware
 frame padding
Reply-To: sashiko-reviews@lists.linux.dev
To: vladimir.oltean@nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261021145314.1435049-3-vladimir.oltean@nxp.com>
References: <20261021145314.1435049-1-vladimir.oltean@nxp.com>
 <20261021145314.1435049-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 14:54:43 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: enetc: unreleased one-step timestamp lock in enetc_start_xmit=
()
--

commit f785a6d3699d340412051eda6871e1a582901866
Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>

net: enetc: do not rely on mEMAC hardware frame padding

This commit pads transmitted frames to ETH_ZLEN in software using
eth_skb_pad() for non-GSO packets and a shared zero-filled DMA padding
buffer descriptor for short GSO segments.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index ab4bfefda6c8f..f0f9ba94b4df6 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c

[ ... ]

> @@ -1053,6 +1088,9 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff =
*skb,
>  			enetc_unlock_mdio();
>  		}
>  	} else {
> +		if (eth_skb_pad(skb))
> +			return NETDEV_TX_OK;
> +

[Severity: High]
Can this leave ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS permanently locked when
eth_skb_pad() fails on a short one-step PTP Sync packet?

At the beginning of enetc_start_xmit() in
drivers/net/ethernet/freescale/enetc/enetc.c, a packet with
ENETC_F_TX_ONESTEP_SYNC_TSTAMP acquires the bit lock:

	if (enetc_cb->flag & ENETC_F_TX_ONESTEP_SYNC_TSTAMP) {
		if (test_and_set_bit_lock(ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS,
					  &priv->flags)) {
			skb_queue_tail(&priv->tx_skbs, skb);
			return NETDEV_TX_OK;
		}
	}

Normally, this bit is only cleared by enetc_tx_onestep_tstamp() after TX
completion schedules priv->tx_onestep_tstamp from enetc_clean_tx_ring():

	clear_bit_unlock(ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS, &priv->flags);
	skb =3D skb_dequeue(&priv->tx_skbs);
	if (skb)
		enetc_start_xmit(skb, priv->ndev);

An IEEE 802.3 L2 PTPv2 Sync frame is 58 bytes (shorter than ETH_ZLEN) and
enters the non-GSO branch. If eth_skb_pad() fails with -ENOMEM, it frees
the skb and enetc_start_xmit() returns NETDEV_TX_OK without scheduling
priv->tx_onestep_tstamp or clearing ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS.

Because the skb was never queued to the TX ring, enetc_clean_tx_ring()
will never run for it, leaving ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS set and
causing all subsequent one-step Sync skbs to accumulate in priv->tx_skbs
indefinitely. Should eth_skb_pad() be called before acquiring the
ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS lock, or should the failure path
release the lock and kick the work item?

>  		if (unlikely(skb_shinfo(skb)->nr_frags > priv->max_frags))
>  			if (unlikely(skb_linearize(skb)))
>  				goto drop_packet_err;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021145314.1435=
049-1-vladimir.oltean@nxp.com?part=3D2
