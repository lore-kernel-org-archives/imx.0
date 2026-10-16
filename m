Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433A3BE162
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148219; cv=none; b=AQNRO37lCEp2omXqYXLBgbDRDdALAFYUefayhfr9MlEu3HnrnMWT5quesVEpbQNgLJ81ZNzuuBW+SkXXWZrZmZmWenW2ck+IFH1wyjQBjJ367uHyjyOjudGbnjh4WzIR4+/7dK4zf8Sg+m7dhq2+iX3Q1M+EXjYojCL1/wccKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148219; c=relaxed/simple;
	bh=mvTFbFjW7scEceTLx1q5bdNx0DE8EXnFpX/Goz4mKlM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YTcnnHFMVI/MlYhWNPFUP+ehEMY+YEYkx8rX2naM6+D2rR0AOLYo8HrrZfPU3xzuZKBz5fJendjvaP5TW6mhSBqHPiLZDUQ+nGzAZsQ/LRMmI6SEbnchTd5Krh7tfgsR2YNSf25EtLJlz1PsIrDNHDgzEX89jc4hLv2JUX/kSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hf2CxPQm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hf2CxPQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4185D1F000C4;
	Fri, 16 Oct 2026 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148218;
	bh=fhjE1SMznZpqDY5Ufv2yEUMpYViYlwML7OuJRg9pr4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hf2CxPQmtmatECEAfjcLGiWhacKCyMtQPDSbbvJtDFhsZTX7MSUx3mpAbF0Ra/V2f
	 RS2LG1sMOyvNOprc13qpGPG8w1EAfjdezK9hYl1jW2ZDahqsgwqT6Qt/gKHnGMWxOS
	 ArXPRR/mEhQyPSVpc4y5kB4PdUREIo9CB8sRgXfxVFLGYEo5OrG1pnCbmXSHuuZnRR
	 Uq4ze9OYMCJL54T4ipLBc3wP4zsCypllBqMKAYJHTgfu4cDiqY64A4sRW+u8rmgo3m
	 cAAEHV9Td7u+UKzfJqtqO+FktjCn04EqryZ7IonbMfamkB7Vc2zYHyRm1aKyeFKKfE
	 cy4VCmq0w8bcg==
Message-ID: <sashiko-outbox-174214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net 5/8] net: enetc: ensure head buffer has at least
 16 octets
Reply-To: sashiko-reviews@lists.linux.dev
To: vladimir.oltean@nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261015105536.1692348-6-vladimir.oltean@nxp.com>
References: <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:56:57 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] enetc: missing lock release on dropped one-step tstamp packets
--

commit 9392e5d35a9d4208a5ea777cd38ae2adf7ac8c86
Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>
net: enetc: ensure head buffer has at least 16 octets

This commit addresses a hardware issue in ENETC devices where transmitting
frames with a head buffer under 16 bytes causes an interrupt storm. It adds
a check in enetc_start_xmit to pull at least 16 bytes into the linear skb
header, dropping the packet if that fails.

Closes: https://lore.kernel.org/netdev/b3d9136c-2803-4203-b1ea-1f9e62de80a1=
@gmail.com/

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 707c17fe4a4c5..89b47accbac84 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1079,6 +1079,12 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff=
 *skb,
>  		if (eth_skb_pad(skb))
>  			return NETDEV_TX_OK;
> =20
> +		if (unlikely(skb_headlen(skb) < ENETC_MIN_BUFF_SIZE &&
> +			     !pskb_may_pull(skb, ENETC_MIN_BUFF_SIZE))) {
> +			dev_kfree_skb_any(skb);
> +			return NETDEV_TX_OK;
> +		}
> +

[Severity: High]
Does this error path miss releasing the bit lock for one-step timestamp
packets?

Earlier in enetc_start_xmit(), the bit lock is acquired for packets with
the ENETC_F_TX_ONESTEP_SYNC_TSTAMP flag:

        if (enetc_cb->flag & ENETC_F_TX_ONESTEP_SYNC_TSTAMP) {
                if (test_and_set_bit_lock(ENETC_TX_ONESTEP_TSTAMP_IN_PROGRE=
SS,
                                          &priv->flags)) {
                        skb_queue_tail(&priv->tx_skbs, skb);
                        return NETDEV_TX_OK;
                }
        }

If the newly added pskb_may_pull() check fails, the packet is freed and the
function returns NETDEV_TX_OK without clearing the previously acquired lock.

Could this leave the ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS bit permanently se=
t,
causing subsequent one-step timestamp packets to queue infinitely to tx_skbs
without ever being dequeued?

>  		if (unlikely(skb_shinfo(skb)->nr_frags > priv->max_frags))
>  			if (unlikely(skb_linearize(skb)))
>  				goto drop_packet_err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015105536.1692=
348-1-vladimir.oltean@nxp.com?part=3D5
