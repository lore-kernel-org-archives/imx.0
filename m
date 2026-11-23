Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393736;
	b=OLhTkfXq8FQCawGIuSC0ENzqx80DadBXHucro43Lj92xWIfqRwd99OrJCfne+Se2ojlX
	 8XUluhAnU61zEcJIO6z5RiDXh1314oxIA4B56qwq6GLjBuFeILBWK8RKn15RYUutRtbh0
	 MXMcZC+v/exJOF+M0H4BTfjpp5XOThJqt2XKsE/Z5TYlBdWMqrb/8Pc9NkXhKnJdnljE/
	 UtY7ySqa+5c0Z6cpAkEG9CKkqars+XXE+tWfc+ngOj3tnU1k78/FDOLjz126vGFjKVhdC
	 dqc5G+8JOlaRTxujeVa0r1LVbdZZecNIFpv39ioGU2TXi5j/XHc29Un23YmRrxrkiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393736;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=j2hyzzDNOVdZB/HbaRnmZg2TF5KrRkGypUydgkuULYM=;
	b=pdt0JHgCVCaa6lntMpbA6EdftI5s0LhAatY/famfy69dxiMdGIX4jhEADPZFroaDTa5o
	 vuzpNenXPllqSZSIZuuxNTbUnXW82GiLShBoRTPstrjYcMagWQ+K6m2O96CSg4rvC/30s
	 TDhIwWeu2bCUfJruGJRPlI4PFmIqJljQAjAf/Yu/DkM+GgPvSa16huln2T0TAidiIqxP0
	 xYIQARI7FV6b9qtL8YuIBpa7WQZA4B0+a2bda45MchHRPul6v/1S2OTbkMPQBf8iYZ7Ct
	 0Kd42ZbGko/PuXUqAGXVDPMm6F3UZiHGXhNjDYFWimdm/mrgWJCmMFO9OhC2nI4n0Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJRnZver;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84019606A32D;
	Mon, 23 Nov 2026 00:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJRnZver
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210AC1F000C6;
	Mon, 23 Nov 2026 00:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393735;
	bh=j2hyzzDNOVdZB/HbaRnmZg2TF5KrRkGypUydgkuULYM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EJRnZverzv4wtUNpJxZ5r6ESJw3NP586cLPDnlUkmJV82A1bNCwUmgd+PZBzlfjgn
	 UzOswbqw9B7UpMofAML5b3tXJXhHJEvz9JU1hkQ+XVabQ04dGm8NTS/vV2F8k/eGhB
	 yLOt0TROoyKwUld7QltyeqLGqfwta8aRO/MS+XuMjiSdJ97CJ4MbhUKavjFa6Bx4a6
	 cLmtdsCrqOalLg8ExvYz2Hc09X88rb6gJbp1t0hlZ/Oqk0D4NAdjsGeDPLSJCu3dd/
	 XNPLDZaHyNKxs6cxdcVhR9VJf8AnfP3y/VGmJ3Ai0CGy0BJP/Jm6VxJy868dtmGnU5
	 EiVU1kKM1ZuLQ==
Subject: Re: [PATCH v2 net 2/4] net: enetc: reserve VLAN extension BDs for
 software TSO
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:28:54 +0000
Message-ID: <179539373470.3135.3154873961019393933@kernel.org>
In-Reply-To: <20261118235055.1225115-3-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-3-vladimir.oltean@nxp.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message only describes the ring-space check in
  enetc_start_xmit().

Pre-existing issues:
- [High] This problem was not introduced by this patch, but it is a high-
  severity pre-existing issue: a lost wake-up race between stopping the…

--

net: enetc: reserve VLAN extension BDs for software TSO

This patch adds enetc_tso_count_descs(), which extends tso_count_descs()
with one extra extension BD per segment when the skb carries a VLAN tag.
It uses the new helper for the free-BD check in enetc_start_xmit() and
for the ring-size check in enetc_features_check().

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index 1606ac57016f3..7f089a84d9a65 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c

[ ... ]

> @@ -1034,7 +1045,7 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff *skb,
>  
>  			count = enetc_lso_hw_offload(tx_ring, skb);
>  		} else {
> -			if (enetc_bd_unused(tx_ring) < tso_count_descs(skb)) {
> +			if (enetc_bd_unused(tx_ring) < enetc_tso_count_descs(skb)) {
>  				netif_stop_subqueue(ndev, tx_ring->index);
>  				return NETDEV_TX_BUSY;
>  			}

[Severity: High]
This isn't a bug introduced by this patch, but can this stop path lose a
wake-up from TX completion?

When the free-BD check fails, enetc_start_xmit() calls
netif_stop_subqueue() and returns NETDEV_TX_BUSY. There is no smp_mb()
and no second enetc_bd_unused() check after the stop. The LSO path, the
non-GSO path and the trailing ENETC_TXBDS_MAX_NEEDED() stop all have the
same shape.

On the completion side, enetc_clean_tx_ring() stores next_to_clean only
after its whole cleaning loop has finished. It then tests the stopped
state with no barrier in between:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_clean_tx_ring() {
    ...
	tx_ring->next_to_clean = i;
	...
	if (unlikely(tx_frm_cnt && netif_carrier_ok(ndev) &&
		     __netif_subqueue_stopped(ndev, tx_ring->index) &&
		     !test_bit(ENETC_TX_DOWN, &priv->flags) &&
		     (enetc_bd_unused(tx_ring) >=
		      ENETC_TXBDS_MAX_NEEDED(priv->max_frags)))) {
		netif_wake_subqueue(ndev, tx_ring->index);
	}
    ...
}

Consider this interleaving:

CPU0 (ndo_start_xmit)                CPU1 (NAPI)
enetc_bd_unused() reads old
next_to_clean, ring looks full
                                     finishes reclaiming the last frames
                                     tx_ring->next_to_clean = i;
                                     __netif_subqueue_stopped() is false,
                                     so no netif_wake_subqueue()
netif_stop_subqueue()
return NETDEV_TX_BUSY

The ring is now empty, so no later TX completion will reach this check
with tx_frm_cnt > 0. Polls driven by RX clean 0 TX frames. The driver has
no ndo_tx_timeout, and the only other wake is netif_tx_start_all_queues()
in the open path.

Would the queue stay stopped until the interface is brought down and up
again?

enetc_bd_unused() also reads next_to_clean and next_to_use with plain
loads while both contexts write them, without READ_ONCE()/WRITE_ONCE().

With this patch, VLAN TSO skbs hit the NETDEV_TX_BUSY path more often,
because the estimate now includes the per-segment extension BDs. The
synchronization is unchanged.

Would netif_txq_maybe_stop() and netif_txq_completed_wake() from
include/net/netdev_queues.h work here? Another option is an open-coded
stop, smp_mb() and re-check, paired with a barrier after next_to_clean is
updated. The later patches in this series don't seem to address this.

[ ... ]

> @@ -1114,7 +1125,7 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
>  	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
>  		return features;
>  
> -	if (tso_count_descs(skb) >= priv->tx_bd_count)
> +	if (enetc_tso_count_descs(skb) >= priv->tx_bd_count)
>  		features &= ~NETIF_F_GSO_MASK;

[Severity: Low]
This isn't a bug, but should the commit message mention this second call
site? The body only covers the free-BD check in enetc_start_xmit():

  enetc_start_xmit() uses tso_count_descs() to check whether the TX ring
  has enough free BDs for a software TSO frame.

This hunk changes runtime behavior. VLAN-tagged software TSO skbs whose
adjusted estimate reaches priv->tx_bd_count now lose GSO, so the core
segments them before ndo_start_xmit().

The change is also required. Without it, a VLAN skb where
tso_count_descs() < tx_bd_count <= enetc_tso_count_descs() would still
pass as GSO. Since enetc_bd_unused() is at most bd_count - 1,
enetc_start_xmit() would then return NETDEV_TX_BUSY forever.

That is the stall fixed by the previous patch, "net: enetc: let core
segment GSO skb when TSO would not fit the TX ring". That patch also added
enetc_features_check() itself.

Right now only the changelog below the '---' mentions this ("old v5->v1:
also patch enetc_features_check()"), and that text won't be kept in git.

Could the body describe the enetc_features_check() change and the
dependency on the previous patch, for stable backports?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118235055.1225115-1-vladimir.oltean%40nxp.com
