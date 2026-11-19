Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132289;
	b=Hfy+B0JZr3V5XLABptCWwCplpB0VVjq02pvG0IY2E0GQNFu04+B6MGKnAUMRDn0EAEfM
	 P2GZwSDjsS0UhLiyuPkJIRy2pAMPS/NeRES+uLWko+Zd8dCutx+L5jo1LJ8kVnjAYMQT7
	 oF2iFwHBa/iy0M2K0Y+E2+CkXKl7eCktqdy4os2IQ/9gcpSZeWNLFL5DRMw9wwbRC0FSz
	 jTfDYyg4DjS9irkJ5h5Sz0FTku1e0mzqGPQzbYi9eqCzLBOh9mir73Cx/FZh1xCS44Dho
	 v9X3knFb+1owPoVyVBloUlcneYgk8AHd35eanXz22L/6pmiME9IQyky56PKwdSPMTtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132289;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5sWnjlrrIhlPNv/ta1l1/VawiCESLfhqg4frCbmuzTA=;
	b=0Q8BsxNObyczNo1FRuzh2j6rJs+QQlFIIiizgi/l0J+GUcgbvSqfrY8zv2VmnUvh/9u+
	 4EAiMyqDy5UL8m7vxQ/n/vdnhOe1gj5u5EudqpZi/8zMjuBaAUJKVjYnHsAE8BrIoqpib
	 Pdm+sYHZQ5UWyHFIHxiwonLf91aF26Lz4CKB3VljT8oXXyBdCVuTJOANa0K562Le3UWWm
	 xpWZleQMh9nxdwnbD5JLkJGPN2r6TUdtRbeJ9wLjjUyKGpSjwbF2KTT+RSoubBXdYtSVL
	 sQpURDZijFjD/wqP5oHgqrmsD4hvF1xCgF9/zUbXB8fgTgN0KtnLfgkv5S8w4kfpMPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=as9MQz2p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60134606A339
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 23:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=as9MQz2p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43E91F000C4;
	Thu, 19 Nov 2026 23:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132288;
	bh=5sWnjlrrIhlPNv/ta1l1/VawiCESLfhqg4frCbmuzTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=as9MQz2pNibaHyyMRpVfeXcmkP10pj9031AwylciKI39kSj20sgHYITQ7k/faFmy2
	 Va23E0fmJUSXNa1OfVJzjyLpqJsJV/cd1hVQ76mYs/jYAE9mdIIxiW8+aJsE5slLVy
	 MwFY1zPxbQSvUfwhiGq+qaCCwsgctrT9wmvpaQjEFpXmQPCALQEi/ykfxVv1XDs5JY
	 QxMP8d5xoSTagg4c1AblJYNJqHxhfi9z7XiRo40v890IdSY+gP+0ibz8GYxlI9/GJx
	 uhclTlPIX2RpNDIROTDAZS1Rj3HamjfHQk7VWIpPh4PX55dPNA6gP9/TiWCATQTJFP
	 L8ydezMcDoyVw==
Message-ID: <sashiko-outbox-224217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 3/4] net: enetc: fall back to software TX csum
 for too long L3 headers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261118235055.1225115-4-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
 <20261118235055.1225115-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:51:28 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: enetc: L4 offset check in enetc_features_check() misses
  CHECKSUM_NONE GSO
--

commit fa5d065143358009cbf7f50513adc4fbbbf2eadd
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

net: enetc: fall back to software TX csum for too long L3 headers

This commit clears NETIF_F_CSUM_MASK and NETIF_F_GSO_MASK in
enetc_features_check() when hardware TX checksum offload is enabled and
the L4 header offset reaches 127 bytes.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 7f089a84d9a65..6cc519eea5bd3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1114,6 +1114,16 @@ netdev_tx_t enetc_xmit(struct sk_buff *skb, struct=
 net_device *ndev)
>  }
>  EXPORT_SYMBOL_GPL(enetc_xmit);
> =20
> +static bool enetc_skb_l4_too_deep(const struct sk_buff *skb)
> +{
> +	unsigned int l4_offset =3D skb_checksum_start_offset(skb);
> +
> +	if (skb_vlan_tag_present(skb))
> +		l4_offset +=3D VLAN_HLEN;
> +
> +	return l4_offset >=3D ENETC_TX_CSUM_MAX_L4_OFFSET;
> +}
> +
>  netdev_features_t enetc_features_check(struct sk_buff *skb,
>  				       struct net_device *ndev,
>  				       netdev_features_t features)
> @@ -1122,6 +1132,12 @@ netdev_features_t enetc_features_check(struct sk_b=
uff *skb,
> =20
>  	features =3D vlan_features_check(skb, features);
> =20
> +	if (priv->active_offloads & ENETC_F_TXCSUM &&
> +	    skb->ip_summed =3D=3D CHECKSUM_PARTIAL && enetc_skb_l4_too_deep(skb=
)) {
> +		features &=3D ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
> +		return features;
> +	}

[Severity: Medium]
Does gating enetc_skb_l4_too_deep() on skb->ip_summed =3D=3D CHECKSUM_PARTI=
AL
miss GSO packets that enter validate_xmit_skb() with CHECKSUM_NONE?

When GRO-coalesced TCPv6 packets carrying extension headers are forwarded,
validate_xmit_skb() converts skb->ip_summed from CHECKSUM_UNNECESSARY to
CHECKSUM_NONE right before calling netif_skb_features().  Because
skb->ip_summed is not CHECKSUM_PARTIAL (and skb->csum_start is not yet
initialized), enetc_features_check() leaves NETIF_F_TSO6 set.
tcp6_gso_segment() then promotes skb->ip_summed to CHECKSUM_PARTIAL, sees
that skb_gso_ok() succeeds, and passes the unsegmented skb to
enetc_lso_hw_offload() with an L4 offset >=3D 127 bytes, where the hardware
drops the frame with a TX BD programming error.

Also check skb_is_gso(skb) in enetc_features_check(), using
skb_transport_offset(skb) in enetc_skb_l4_too_deep() when skb->ip_summed
is not CHECKSUM_PARTIAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118235055.1225=
115-1-vladimir.oltean@nxp.com?part=3D3
