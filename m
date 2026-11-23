Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393738;
	b=sBJhxGuks82pymA8ZVztJxFOU0TNT4U0QOpPmXNZum7TaymUJUO0n6B8DXYMFtTDIWLf
	 npf/ufpaHMTMU5nWRg6UX9s9bDzT/ItfU/nfrri1aTiJWoK7U50egJuRG2qN7Q0GEhITb
	 OMguNo6sqiD23fYoNd1B6prC9WVBVZ7WBULjofurkHPAOw3DOHcMY5FgWgphTwMFonqqB
	 LTQTirt2G1sPAJRa1I0RQI/Zex0ethLwZYekotnNBo0sxEaKbdZSwjsAhx66CnfGzH4Yo
	 p84JGNCESg53c5Y61VVqcsaIH5IDO6BmatSqwofzEKk4TsiLyyaBTYblN/JNGqSN2mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393738;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PvZyFq1FELK1bfFHKWCx7YRvHf8V/OFifY6nZbW7s3c=;
	b=iGB9rwDicUK+0KfGnjYe8tp1sVwCvL0rYJTnk7z336scFPW3Htadub1yAJPqsmo2601y
	 ehH3xdMvngyOdHiy4wtLLLsPgEmJYgPgO/JQvR84LYy9arYGUVUqzjVh8cjjPQjprXKnc
	 6j8GumkHHqh7DkVZLfpzzMpehKJpZgXfYcWq+CwfY7pi9wyvGmeXD3Jnl2YTtSC+9u2ga
	 2a770VWM4LUjgcknIEivkj13EBLLlBqGTEF/1/cbbfJwwauD3Qrp7nMak+wFliPaD0CmN
	 aiCbvpTBHkCz/MBS7TP7lRpOKjHttxMcjzS/8frswYJzFghyxeF/cnCV9AKKLw+qHUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQV5qUjb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACF606A330;
	Mon, 23 Nov 2026 00:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQV5qUjb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62751F000D3;
	Mon, 23 Nov 2026 00:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393737;
	bh=PvZyFq1FELK1bfFHKWCx7YRvHf8V/OFifY6nZbW7s3c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NQV5qUjbk33dtvk82psm/YvnecirlnGdsOF/IhOEenfFIfEe6Q4MAvK5qdtyJEMID
	 os5kXTibrb0gjY9XGZJh9yWa3fUySSoUIl99Aw51oTPQYuTsuhVnWHiBMMqxmbmT+q
	 1PXruLDhO7nBKyzFDCjW/+NHwJMD0WnSuHweBph8ivG6grQFXl1o4VRbzqGTI0JPPB
	 RZKaKK0lVydefk5pY62Vwx+sXx4CxUF2KGqTyjw0z76C8jr6Wk0pnmCean5rHoDr5C
	 W9tnd7+bF6Kw+4toD2mLgyXj0K2t0v/uI0Xx3OubnHgHdVDA2kmUIAXe8AGpS9Uxm4
	 oHijgx1IIustA==
Subject: Re: [PATCH v2 net 3/4] net: enetc: fall back to software TX csum for
 too long L3 headers
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:28:56 +0000
Message-ID: <179539373648.3135.13870830196856644441@kernel.org>
In-Reply-To: <20261118235055.1225115-4-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-4-vladimir.oltean@nxp.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: enetc: L4 offset check in enetc_features_check() misses
  CHECKSUM_NONE GSO
- [Low] The commit "net: enetc: fall back to software TX csum for too
  long L3 headers" has no Fixes: tag, but it fixes a real bug.
- [Low] The macro's name says inclusive maximum, but its only user treats
  it as an exclusive bound.

--

net: enetc: fall back to software TX csum for too long L3 headers

This patch makes enetc_features_check() strip the checksum and GSO
features from CHECKSUM_PARTIAL skbs when the hardware TX checksum engine
is in use and the L4 offset (plus any hwaccel VLAN tag) reaches 127 bytes.
The i.MX95 hardware rejects such frames as a programming error, but the
driver still counts them as sent.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index 7f089a84d9a65..6cc519eea5bd3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1114,6 +1114,16 @@ netdev_tx_t enetc_xmit(struct sk_buff *skb, struct net_device *ndev)
>  }
>  EXPORT_SYMBOL_GPL(enetc_xmit);
>  
> +static bool enetc_skb_l4_too_deep(const struct sk_buff *skb)
> +{
> +	unsigned int l4_offset = skb_checksum_start_offset(skb);
> +
> +	if (skb_vlan_tag_present(skb))
> +		l4_offset += VLAN_HLEN;
> +
> +	return l4_offset >= ENETC_TX_CSUM_MAX_L4_OFFSET;

[Severity: Low]
This isn't a bug, but is the name ENETC_TX_CSUM_MAX_L4_OFFSET a bit
misleading? enetc.h defines it as:

#define ENETC_TX_CSUM_MAX_L4_OFFSET	127

This comparison treats it as an exclusive bound, so the largest L4 offset
actually allowed is 126. The ">=" matches the RM text ("must be smaller
than 127 bytes"). The "MAX" in the name, though, suggests that 127 itself
is allowed.

Someone reusing the macro could reasonably write
"> ENETC_TX_CSUM_MAX_L4_OFFSET" and let a 127 byte offset through, which
the hardware would reject. Would a name like
ENETC_TX_CSUM_L4_OFFSET_LIMIT, or a value of 126 compared with ">", make
the definition and its use agree?

The mismatch is still there at the end of the series. The later patch
"net: enetc: let core segment GSO skb when headers exceed TSO_HEADER_SIZE"
also cites this macro in its commit message.

> +}
> +
>  netdev_features_t enetc_features_check(struct sk_buff *skb,
>  				       struct net_device *ndev,
>  				       netdev_features_t features)
> @@ -1122,6 +1132,12 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
>  
>  	features = vlan_features_check(skb, features);
>  
> +	if (priv->active_offloads & ENETC_F_TXCSUM &&
> +	    skb->ip_summed == CHECKSUM_PARTIAL && enetc_skb_l4_too_deep(skb)) {
> +		features &= ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
> +		return features;
> +	}
> +

[Severity: Medium]
Does this check catch GSO skbs that reach enetc_features_check() with
skb->ip_summed set to something other than CHECKSUM_PARTIAL?

There are at least two ways to get such an skb here:

- validate_xmit_skb() changes a non-fraglist GSO skb marked
  CHECKSUM_UNNECESSARY into CHECKSUM_NONE before it calls
  netif_skb_features(). One example is a TCPv6 skb with an SRH that
  GRO coalesced and that is then forwarded or bridged out of the
  ENETC port.
- __virtio_net_hdr_to_skb() builds CHECKSUM_NONE GSO skbs when
  VIRTIO_NET_HDR_F_NEEDS_CSUM is not set. Local users of tun/tap,
  macvtap, vhost-net or AF_PACKET can trigger this.

For those skbs the ip_summed test fails and enetc_skb_l4_too_deep() is
never called. NETIF_F_TSO6 and NETIF_F_HW_CSUM stay set in features.

netif_needs_gso() is then true because the skb is not
CHECKSUM_PARTIAL. validate_xmit_skb() goes through __skb_gso_segment()
into tcp6_gso_segment(), which switches the skb to CHECKSUM_PARTIAL
via __tcp_v6_send_check(). tcp_gso_segment() then returns NULL without
segmenting, because skb_gso_ok() still sees NETIF_F_TSO6 in features.

The skb reaches enetc_start_xmit() and enetc_lso_hw_offload() whole.
enetc_lso_map_hdr() then sets ENETC_TXBD_FLAGS_CSUM_LSO,
ENETC_TXBD_FLAGS_LSO and ENETC_TXBD_FLAGS_L4CS with an L4 offset of
127 bytes or more. Wouldn't the hardware reject that with the same
programming error described in the commit message? The frame would be
dropped while tx_ring->stats still counts it as sent.

At this point in the series nothing bounds the GSO header length
either. Headers of 256 bytes or more on this path also wrap the u8
lso->hdr_len and lso->l3_hdr_len fields that enetc_lso_start() fills
in.

The TSO_HEADER_SIZE - VLAN_HLEN check added later by "net: enetc: let
core segment GSO skb when headers exceed TSO_HEADER_SIZE" removes the
wrap. It does not close this hole, though. A GSO skb with an L4 offset
between 127 and 232 bytes and no more than 252 bytes of headers still
keeps NETIF_F_TSO6 at the end of the series.

csum_start is only meaningful for CHECKSUM_PARTIAL, so the ip_summed
test is needed as long as enetc_skb_l4_too_deep() uses
skb_checksum_start_offset(). Would it work to use
skb_transport_offset() for GSO skbs regardless of ip_summed, and keep
the csum_start based check for non-GSO CHECKSUM_PARTIAL skbs?

[Severity: Low]
Should this patch have a Fixes: tag? The other three patches in the
series each carry "Fixes: fb8629e2cbfc", but this one has none.

The L3_START/L3_HDR_LEN programming in enetc_map_tx_buffs() that this
check guards came from commit d9a093d2d12a ("net: enetc: add Tx checksum
offload for i.MX95 ENETC"):

	temp_bd.l3_aux0 = FIELD_PREP(ENETC_TX_BD_L3_START,
				     skb_network_offset(skb));
	temp_bd.l3_aux1 = FIELD_PREP(ENETC_TX_BD_L3_HDR_LEN,
				     skb_network_header_len(skb) / 4);

enetc_lso_map_hdr() has the same unbounded programming. It came from
commit 69797ff888d3 ("net: enetc: add LSO support for i.MX95 ENETC PF"),
and LSO depends on the same checksum engine:

	txbd_tmp.l3_aux0 = FIELD_PREP(ENETC_TX_BD_L3_START, lso->l3_start);
	/* l3_hdr_size in 32-bits (4 bytes) */
	txbd_tmp.l3_aux1 = FIELD_PREP(ENETC_TX_BD_L3_HDR_LEN,
				      lso->l3_hdr_len / 4);

Without a tag, stable trees that contain d9a093d2d12a (December 2024 and
later) may not get this fix. Frames such as IPv6 with a 5 SID SRH would
then still be dropped silently by the hardware while being counted as
sent.

Would something like this be appropriate?

Fixes: d9a093d2d12a ("net: enetc: add Tx checksum offload for i.MX95 ENETC")

>  	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
>  		return features;
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118235055.1225115-1-vladimir.oltean%40nxp.com
