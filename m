Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393734;
	b=jYqelRX6Do3UTpXPZEWYFnnHNnXQJ+nQ4JL5qOJ388AD5Pv+tCLOsl5eF/nl9qbywPbb
	 9WpL0psIv2LEAXC4vuGRyG9Hb1St9MJopu5j+ScDzyPsvfxt2crS8B17uW+Io0fz7pKfD
	 kRlVw2zE15buSsUE4gENam5I4t8g28pU0Hp2cYgiib4UaScY60Qgr43YIDyVeo39olEnI
	 aL/cf2/5EIMDIKGEds3/RG7GHq6ED4Dj56MAj3bWcmOO7ztzg8/JjnBir47wib2+vs+jo
	 uX/tay4JkIAoG/mYOqAb4eAATpxexQWFJ38aTfK6e8SUA7ji5ZNoyL17lJ9k7NHu0Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393734;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=U+HLN1k8lco5bdQT0KCTCsJjmlrsMySjcezfIG6VGqg=;
	b=YXYbXCu8yJe837wmJ73cQMaHwnDxCjNk/p6MvJKKBZciaDBH2xDQJC+iXD3aPq87/C+F
	 tMlQu2YgyIHjjMsoF+5N1zDPNG6Hjf0f3Sctg6o65o9OAkbCTABXzeiqov77iowdny595
	 LG1HeWLlni10mNsK58M66F5CnEkYXnjA01UK0c5Ne+hrYHoeE7Rdo6CHXwQMeM/XMfIWm
	 n+5uH7t5ptr7+2eH9LbxJigoWps1DTPxJdNu5rgGSUcpnRYUZdgeVklCfLeDGp670zASG
	 9UbydaJyhicXUvkDygaf4pRtiRj2ZKhQbM2GlasOmome9C5NHINoISY+jrxLq1Rt8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meQNc0ro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC4606A31A;
	Mon, 23 Nov 2026 00:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meQNc0ro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7471F000CF;
	Mon, 23 Nov 2026 00:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393734;
	bh=U+HLN1k8lco5bdQT0KCTCsJjmlrsMySjcezfIG6VGqg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=meQNc0roy9IBNOVc+GZSaqQzt10PHUrvXHSjkaBJymAAglslM1DJrxqgzHLW1alQR
	 rbNygEMoXeb/uLZ8q6dEv8aQiraCbrjByuqaxJWbuWXbreVOHXaXVeULMjg5ooYmqF
	 dFdblTBt61n3VAeAaH7scPVqZqZOtEGvVbrMTz/cGEaUMMNLUsV/0XvaZDax+k9++B
	 pvBHYc1Nmy7/mUPvmhhr0ld5IodXbsHslKTCO+xkqrgoWEFzp4vwnogo7bi4UQwZy/
	 IRy4OfBSwH9m3Kc4nRFOSQ26yFDTxyVKy08sw0V52i9StM/zs5+DJ5VuoYUt3mXaaU
	 jtLgEi80DtAJw==
Subject: Re: [PATCH v2 net 1/4] net: enetc: let core segment GSO skb when TSO
 would not fit the TX ring
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:28:52 +0000
Message-ID: <179539373276.3135.4544992671951430926@kernel.org>
In-Reply-To: <20261118235055.1225115-2-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-2-vladimir.oltean@nxp.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] enetc_features_check()
  (drivers/net/ethernet/freescale/enetc/enetc.c:1106-1122) decides…

--

net: enetc: let core segment GSO skb when TSO would not fit the TX ring

This patch adds an ndo_features_check() to enetc. For skbs that take the
software TSO path, it clears the GSO features when the descriptor estimate
is at least the TX ring size, so the core segments those skbs before
ndo_start_xmit(). The goal is to stop the TX queue from stalling on skbs
that could never fit in the ring.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index c6571b5cc8425..1606ac57016f3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c

[ ... ]

> @@ -1098,6 +1103,24 @@ netdev_tx_t enetc_xmit(struct sk_buff *skb, struct net_device *ndev)
>  }
>  EXPORT_SYMBOL_GPL(enetc_xmit);
>  
> +netdev_features_t enetc_features_check(struct sk_buff *skb,
> +				       struct net_device *ndev,
> +				       netdev_features_t features)
> +{
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> +
> +	features = vlan_features_check(skb, features);
> +
> +	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
> +		return features;
> +
> +	if (tso_count_descs(skb) >= priv->tx_bd_count)
> +		features &= ~NETIF_F_GSO_MASK;

[Severity: High]
Can SKB_GSO_DODGY skbs get past this check, given that their gso_segs is
still 0 when enetc_features_check() runs?

tso_count_descs() is computed from skb_shinfo(skb)->gso_segs.
virtio_net_hdr_to_skb() clears that field for untrusted skbs, for example
those sent by af_packet with PACKET_VNET_HDR:

include/linux/virtio_net.h:virtio_net_hdr_to_skb() {
    ...
			shinfo->gso_type |= SKB_GSO_DODGY;
			shinfo->gso_segs = 0;
    ...
}

With PACKET_QDISC_BYPASS, nothing recomputes gso_segs before the features
check. qdisc_pkt_len_segs_init() is only called from __dev_queue_xmit():

packet_xmit()
  dev_direct_xmit()
    __dev_direct_xmit()
      validate_xmit_skb_list()
        validate_xmit_skb()
          enetc_features_check()   <- gso_segs == 0, GSO features kept

The estimate is therefore just nr_frags, and NETIF_F_GSO_MASK stays set.
enetc does not advertise NETIF_F_GSO_ROBUST, so the skb goes through
__skb_gso_segment(), and tcp_gso_segment() takes this branch:

net/ipv4/tcp_offload.c:tcp_gso_segment() {
    ...
	if (skb_gso_ok(skb, features | NETIF_F_GSO_ROBUST)) {
		/* Packet is from an untrusted source, reset gso_segs. */

		skb_shinfo(skb)->gso_segs = DIV_ROUND_UP(skb->len, mss);
    ...
}

This returns NULL, so the original unsegmented skb is passed on, now with
its real gso_segs. With gso_size as small as 8 and a ~64KB payload, that
is roughly 8000 segments, or about 16000 BDs for a 2048-entry ring.

enetc_bd_unused() is at most bd_count - 1, so this check in
enetc_start_xmit() can never become false:

		} else {
			if (enetc_bd_unused(tx_ring) < tso_count_descs(skb)) {
				netif_stop_subqueue(ndev, tx_ring->index);
				return NETDEV_TX_BUSY;
			}

dev_direct_xmit() frees the skb, but the subqueue stays stopped. The only
place that wakes it is enetc_clean_tx_ring(), and that needs completed
frames:

	if (unlikely(tx_frm_cnt && netif_carrier_ok(ndev) &&
		     __netif_subqueue_stopped(ndev, tx_ring->index) &&
		     ...
		netif_wake_subqueue(ndev, tx_ring->index);

If the ring is idle when this happens, and with no ndo_tx_timeout, does
that TX queue stay stopped until the interface is bounced? That would be
the same stall the commit message describes as triggerable "from any
source that can craft gso_segs".

A tc egress BPF program can probably reach the same state as well.
bpf_skb_adjust_room() and similar helpers set gso_segs = 0 together with
SKB_GSO_DODGY, and sch_handle_egress() runs after
qdisc_pkt_len_segs_init().

The af_packet UDP_L4 case does not seem to trigger this, because
virtio_net_hdr_to_skb() caps it at UDP_MAX_SEGMENTS. The TCP case does
trigger it.

Later patches in the series do not appear to change this. At the end of
the series, enetc_features_check() still goes through
enetc_tso_count_descs(), which reads skb_shinfo(skb)->gso_segs.

Would it work to derive the segment count from skb->len, the header length
and gso_size here, at least for SKB_GSO_DODGY skbs? Another option would be
for enetc_start_xmit() to drop, instead of returning NETDEV_TX_BUSY for,
any skb whose estimate is >= tx_ring->bd_count.

> +
> +	return features;
> +}
> +EXPORT_SYMBOL_GPL(enetc_features_check);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118235055.1225115-1-vladimir.oltean%40nxp.com
