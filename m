Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393740;
	b=ClOMvm6SW4abfviY7FuZTBtoP94VoZ7ArekikrntSca5DETFM/riW0KZHkpF10O18iLz
	 KzUqgON3nQbG6RQQ30KZlZi81wLG+ntBVlrdD81opdUqSW6PqDUJVZszL5/bwYV4JhP0d
	 628daJ5H3XE+LTGyFACQbMqqCzgH0GW6TYG16v1SLA0k5FoxEPt+KZiUtNJZJwT4WvtVv
	 aGDqyllt9akbxnKaj7skVpF74SCN0LqPXQVMd1u0Wzi6cdg0TkcchBDlqoaABGaOPc6wc
	 yij0OdaPsef0SLLP2bPyuT1C4EkN75gZbgX6liddX+Ki7+vP1hmJV5hjnyxOgDUFmNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393740;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=S4w0oOIqRRFhwLmmeq+5wIFtejIyyqqRZ+I+DxVaI3I=;
	b=3Ao/lp1S50qpuNl1CuylAvm5Bf3pFA4qOyhcdNGTkTr/TE+ElbZRqcQWFiWrJG0EPL8C
	 JnE+KmF0clN7/Je5tPh5J8mOygsnaHY9A48vIZ+LLy3o/VEt0DdrfzMKe1x3BPd4rJ4nm
	 z3yp8ei7YT5YJaT/CBlELThgho3yn8EtMmilPcrw/G69W+wouZymNU19xV23UqSmcuhih
	 Tvm783ruoGQqzkpUn2IE0mv9az3/+OSxOswEOinG879BBaeR7bPdKuMDsbVnZtw7isl1B
	 dnr4uYRpigIrJzmLocs+sZmQE38eNJG+BteCaYJfR4g9SvH7TNWeFn0jjpSkCgahkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsR3abNA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFA606A32E;
	Mon, 23 Nov 2026 00:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsR3abNA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10601F000D4;
	Mon, 23 Nov 2026 00:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393739;
	bh=S4w0oOIqRRFhwLmmeq+5wIFtejIyyqqRZ+I+DxVaI3I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IsR3abNAGs6/7pKTWllt/Fa/96S079HUvjJ/T01SY6v0hMGcZ9pLKBYRtFyTSr7TJ
	 DpqZfLNiLM5xHipFmzEpZNjqxpQpM/syYis3ewCPb3AQQ9B3sOGy2BBq4erhAzVdps
	 uIHX4SsarmrVOmvOLogdR/rypnpoMmZL7oEl1hc7SQ6YhBsJkgAHJxdZDwjAuJ8xCv
	 4+lPr088FjVKZm6RO6kQBexExjPc2aIIPBDUEsYwM4DU/ojI58HGVVnp+bQNQ+kxsj
	 g7oNSXeee5sp/DZGzc/8Zx8D9LVGC+CbLuDSra/ErLCYMH8k3ZVc7XR4B3CskLBsGL
	 uFemgxA5oqW8Q==
Subject: Re: [PATCH v2 net 4/4] net: enetc: let core segment GSO skb when
 headers exceed TSO_HEADER_SIZE
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:28:58 +0000
Message-ID: <179539373837.3135.4065744412888442454@kernel.org>
In-Reply-To: <20261118235055.1225115-5-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-5-vladimir.oltean@nxp.com>
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

- [Low] The comment added in enetc_features_check()
  (drivers/net/ethernet/freescale/enetc/enetc.c) explains the VLAN_HLEN…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch sits
  right on top of it and only partly addresses it.

--

net: enetc: let core segment GSO skb when headers exceed TSO_HEADER_SIZE

This patch changes enetc_features_check() so that it clears
NETIF_F_GSO_MASK when the L2+L3+L4 header length of a GSO skb exceeds
TSO_HEADER_SIZE - VLAN_HLEN. The stack then segments those skbs.
Otherwise enetc_map_tx_tso_buffs() would copy oversized headers into the
fixed 256-byte tso_headers slot. The example given is a large IPv6
Segment Routing Header set through setsockopt(IPV6_RTHDR).

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index 6cc519eea5bd3..2bc65cf6f5087 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1138,7 +1138,19 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
>  		return features;
>  	}
>  
> -	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
> +	if (!skb_is_gso(skb))
> +		return features;
> +
> +	/* In case NETIF_F_HW_VLAN_CTAG_TX is disabled, validate_xmit_vlan()
> +	 * has not yet run and a VLAN may still be in the hwaccel area, so we
> +	 * need to be one step ahead
> +	 */

[Severity: Low]
This isn't a bug, but does this comment cover every case? enetc never
advertises NETIF_F_HW_VLAN_STAG_TX. enetc_pf_netdev_setup() (and
enetc_vf.c in the same way) only sets the CTAG variants:

	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM |
			    NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX |
			    NETIF_F_HW_VLAN_CTAG_FILTER |
			    NETIF_F_HW_CSUM | NETIF_F_TSO | NETIF_F_TSO6 |
			    NETIF_F_GSO_UDP_L4;

Take an skb whose hwaccel tag is ETH_P_8021AD, for example from an
802.1ad VLAN upper, a tc vlan push with protocol 802.1ad, or an 802.1ad
bridge. For that skb, validate_xmit_vlan() always pushes the tag into
the packet after ndo_features_check has run, even when CTAG TX offload
is enabled:

net/core/dev.c:validate_xmit_vlan() {
	...
	if (skb_vlan_tag_present(skb) &&
	    !vlan_hw_offload_capable(features, skb->vlan_proto))
		skb = __vlan_hwaccel_push_inside(skb);
	...
}

The VLAN_HLEN subtraction is unconditional, so the code already handles
this. Suppose a later change follows the comment and applies the margin
only when NETIF_F_HW_VLAN_CTAG_TX is off. Couldn't an 802.1ad-tagged GSO
skb then write 4 bytes past the tso_headers slot again?

Could the comment mention the 802.1ad case as well?

> +	if (enetc_lso_get_hdr_len(skb) > TSO_HEADER_SIZE - VLAN_HLEN) {
> +		features &= ~NETIF_F_GSO_MASK;
> +		return features;
> +	}

[Severity: High]
This is a pre-existing issue, not introduced by this patch. It goes back
to fb8629e2cbfc ("net: enetc: add support for software TSO"), and it sits
right next to this check.

The new check only looks at header length. What happens to IPv6 GSO skbs
that carry extension headers but whose headers still fit in 252 bytes?
Examples are a Segment Routing Header with 1-10 segments, or any routing,
hop-by-hop or destination options header.

On hardware without ENETC_SI_F_LSO, such as LS1028A, these still go
through enetc_start_xmit()->enetc_map_tx_tso_buffs(). The software TSO
path does not seem able to build valid segments for them.

tso_build_hdr() in net/core/tso.c does not count the extension header
bytes in the IPv6 payload length:

	iph->payload_len = htons(size + tso->tlen);

enetc_tso_complete_csum() builds the pseudo-header from the outer IPv6
header:

	csum_final = csum_ipv6_magic(&ipv6_hdr(skb)->saddr,
				     &ipv6_hdr(skb)->daddr,
				     len, ipv6_hdr(skb)->nexthdr, sum);

Here nexthdr is the extension header type (0, 43 or 60), not
IPPROTO_TCP or IPPROTO_UDP. With a routing header, daddr is the first
hop rather than the final destination.

Wouldn't every segment then leave with a short payload_len and a wrong
TCP/UDP checksum, so the receiver drops it?

An unprivileged user can reach this with setsockopt(IPV6_RTHDR). It can
also be triggered remotely when forwarding, because
ipv6_gro_receive()->ipv6_gro_pull_exthdrs() aggregates packets with
routing or destination options headers into GSO skbs that may egress on
enetc.

As the commit message notes, enetc does not benefit from the core guard
in gso_features_check(), because it only advertises NETIF_F_HW_CSUM:

	if (features & NETIF_F_IPV6_CSUM &&
	    skb_has_ipv6_extension_hdr(skb))
		features &= ~(NETIF_F_IPV6_CSUM | NETIF_F_TSO6 | NETIF_F_GSO_UDP_L4);

Would it make sense to clear NETIF_F_GSO_MASK in enetc_features_check()
for any IPv6 GSO skb with extension headers? The stack would then
segment these correctly. The remaining header lengths would be bounded
at roughly 14 + 4 + 60 + 60 bytes, which would also close the overflow
this patch targets.

skb_has_ipv6_extension_hdr() is static in net/core/dev.c, so this would
need a local check. One option is vlan_get_protocol(skb) ==
htons(ETH_P_IPV6) && skb_network_header_len(skb) != sizeof(struct
ipv6hdr).

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118235055.1225115-1-vladimir.oltean%40nxp.com
