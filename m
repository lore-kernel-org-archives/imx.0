Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1F3C4B79
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171263; cv=none; b=kVWlnIDyPx195rJ71zGULEZqZm9937EYQzwPDTdU69wiV/yIVusRcTMfakrI3cmUkY8bXifiWrlzWnZu/+P/QQ2M602Odl5szMA4TUHAOu4csj80jKUEh+OnKZMKdnGlEnxvUDqklT/Pqgwbu6K4vK1t2CvQ6aj9i6LuQbKlrOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171263; c=relaxed/simple;
	bh=3DbCDJqqrTV0ycKC1cR1Ndp7XMqn0z4lwGQZOLPT5E0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JLk1X2av4ZnJDKqfk3sevPbPpkyvWxxEHAuO/Ch6gjGzIYqVA0g3rLPDmSl3D/gRbHZOAVGhGJaEzD2vzzOYxWmWD6RYJeaOUSgOPO2uB79LSiwwTIc2SsKrm8D2j9U0iBnWXtro3LWC2SRG+169AKRJxdTTnGpu/3W55De2IXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXzDB67+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXzDB67+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA56B1F00893;
	Thu, 11 Jun 2026 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171262;
	bh=27DJm384uNBHWAbswURRMfKn+RFtEV/AUIe+I4a5ITU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VXzDB67+xa0INS4PavHgc5zWho/BT3mYylr883ilT8mY8hjObDiOBLwu0kxMKFXUs
	 cHVUYfyt8CYp2oWsLpkcyx6DzUKGduXb4Y7CEbhCZiety3aWOCuqWaeiqjG1Cn+CxP
	 LaN5+/eHNd7jeXWSDkPEufSpAYXYUgoPC8S2fFgSBsl9g9kvtlmRrqq5pXTwndSS+A
	 EUsbSejkYtfaofR/5CCRT97bI80t81klOwA9awAph+y6kz43DE8f2kN4MxBSy/f71w
	 ER493Wo0Dhjw8BaixJEmAySq9yxzjt4jGrygKxzvYS0R8GTZKFJXeSy/BVcnrsaM3v
	 Q9zVy3Z9z+chQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 13/15] net: enetc: implement
 ndo_set_rx_mode_async for ENETC v4 VF
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260610091844.3423693-14-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:41 +0000
Message-Id: <20260611094741.EA56B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Function signature mismatch for ndo_set_rx_mode_async causing CFI =
panics and silently dropping errors
- [Medium] Endianness logic bug in MAC hash filter conversion
--

commit 7154dd069b56705c2fb84b8fb83bdfde897299bf
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: implement ndo_set_rx_mode_async for ENETC v4 VF

This commit implements ndo_set_rx_mode_async for the ENETC VF driver, allow=
ing
MAC filter changes to be communicated to the PF over a VSI mailbox interfac=
e.
It manages promiscuous modes and Bloom filter hash tables for unicast and
multicast traffic.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 4bc48a5f6869c..dc9a0f74a2e34 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
[ ... ]
> +static int enetc_vf_set_mac_hash_filter(struct enetc_ndev_priv *priv,
> +					struct netdev_hw_addr_list *uc,
> +					struct netdev_hw_addr_list *mc)
> +{
[ ... ]
> +	if (mac_filter_type & ENETC_MAC_FILTER_TYPE_UC) {
> +		mac_filter =3D &si->mac_filter[UC];
> +		enetc_reset_mac_addr_filter(mac_filter);
> +		netdev_hw_addr_list_for_each(ha, uc)
> +			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
> +
> +		memcpy(&hash_val, mac_filter->mac_hash_table,
> +		       sizeof(hash_val));
> +		msg->hash_tbl[i++] =3D hash_val & GENMASK(31, 0);
> +		msg->hash_tbl[i++] =3D hash_val >> 32;
> +	}

[Severity: Medium]
Will this memcpy() correctly handle bitmaps on 32-bit big-endian
architectures?

A DECLARE_BITMAP is an array of 32-bit words, where word 0 (bits 0-31) is
stored at lower addresses and word 1 (bits 32-63) is at higher addresses.

When memcpy() copies these 8 bytes into a u64 variable on a big-endian
system, word 0 becomes the most significant 32 bits and word 1 becomes the
least significant 32 bits. The subsequent bitwise operations
(hash_val & GENMASK(31, 0) and hash_val >> 32) then extract the halves in
reverse order compared to 64-bit or little-endian systems, which silently
swaps the hardware filter configuration.

Should this use bitmap_to_arr32() instead to safely convert the bitmap to
a u32 array across all architectures?

> +
> +	if (mac_filter_type & ENETC_MAC_FILTER_TYPE_MC) {
> +		mac_filter =3D &si->mac_filter[MC];
> +		enetc_reset_mac_addr_filter(mac_filter);
> +		netdev_hw_addr_list_for_each(ha, mc)
> +			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
> +
> +		memcpy(&hash_val, mac_filter->mac_hash_table,
> +		       sizeof(hash_val));
> +		msg->hash_tbl[i++] =3D hash_val & GENMASK(31, 0);
> +		msg->hash_tbl[i++] =3D hash_val >> 32;
> +	}
> +
> +	enetc_msg_fill_common_hdr(&msg_swbd, ENETC_MSG_CLASS_ID_MAC_FILTER,
> +				  ENETC_MSG_SET_MAC_HASH_TABLE, 0, 0);
> +
> +	return enetc_msg_vsi_send(si, &msg_swbd);
> +}
> +
> +static void enetc_vf_set_rx_mode(struct net_device *ndev,
> +				 struct netdev_hw_addr_list *uc,
> +				 struct netdev_hw_addr_list *mc)
> +{

[Severity: High]
Does this function signature cause a Control Flow Integrity (CFI) panic?

The ndo_set_rx_mode_async callback expects a function returning an int,
but enetc_vf_set_rx_mode() is defined with a void return type. This
mismatch will trigger a CFI kernel panic on architectures with CFI enabled.

Additionally, because it returns void, the caller __dev_set_rx_mode_async()
will read uninitialized garbage from the return register. If that garbage is
non-zero, could it cause continuous polling retries in the network stack?

[ ... ]
> +	if (ndev->flags & IFF_PROMISC) {
> +		enetc_vf_set_mac_promisc(priv, ENETC_MAC_FILTER_TYPE_ALL, true);
> +	} else if (ndev->flags & IFF_ALLMULTI) {
> +		enetc_vf_set_mac_promisc(priv, ENETC_MAC_FILTER_TYPE_MC, true);
> +		enetc_vf_set_mac_promisc(priv, ENETC_MAC_FILTER_TYPE_UC, false);
> +	} else {
> +		enetc_vf_set_mac_promisc(priv, ENETC_MAC_FILTER_TYPE_ALL, false);
> +	}
> +
> +	enetc_vf_set_mac_hash_filter(priv, uc, mc);
> +}

[Severity: High]
Are the error codes from these mailbox commands inadvertently being dropped?

Because this function is defined as void and doesn't return the results of
enetc_vf_set_mac_promisc() or enetc_vf_set_mac_hash_filter(), any hardware
configuration errors are discarded instead of propagated to the network
stack, which breaks the framework's retry mechanism.

[ ... ]
> @@ -225,6 +341,7 @@ static const struct net_device_ops enetc_ndev_ops =3D=
 {
>  	.ndo_setup_tc		=3D enetc_vf_setup_tc,
>  	.ndo_hwtstamp_get	=3D enetc_hwtstamp_get,
>  	.ndo_hwtstamp_set	=3D enetc_hwtstamp_set,
> +	.ndo_set_rx_mode_async	=3D enetc_vf_set_rx_mode,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D13
