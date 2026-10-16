Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09C3B8BDA
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148219; cv=none; b=ZTee/XUe3BLhnl/Du0yxu3ZI4eUc2nl9kxOF2nIAQcpx27qo8ixvy8OZX4EzbxB+0YFfvSgZDrMow2QcL+qsfymkiTnN1pSNf4mr7+L32S7GcApBBtwOtkXxuBW6qtm3yFujT2Mv7WfsthGn/fkZrRS779qBp8Q8QvmLyCLuXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148219; c=relaxed/simple;
	bh=75QFiBVxPMPg4DAegNpRJdDBebpqeOvlyURhnjQLw8k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UVw23md5wKod4pLDiaIDkzPtFNJ/yMPTV9OmRtOG2bNLqlDRxypondOauEAgKPgtX4IhompPSCNJKhSJHaL3BJfGIeBvx56aV9xFIvpZbNs7k0vfyz34xe3Gw22/OK9jIiJchNp0hu6pXaRCqhuSfTkvEVhcfoheJ/+lrOJ5epY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWVhn+q1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWVhn+q1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CB51F000C6;
	Fri, 16 Oct 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148217;
	bh=fE6vbvrt2A+dpxWQMLyYLpeLnqeR0Rm3mbOqe8Sr2eI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWVhn+q1NkGBGj/gqDvI0SUm11MZbyb6coEladmYXee7dUwvvjp042kIKZ7fnNAQE
	 RaWTO57zTpF/1KUq0KWzoWlirLbTAyFVLXIRbJYv9DNF8hLOmZttnYMyyQX24rHpBe
	 su+8eoDcMEZt3OP9E+Qqzf1URXSq+BIAn4jEDbuTt7Fp+ZsTrxGWeYwcmXq/cVWawJ
	 zZuOATMWBexU5XH+IghaNbZE1AWkbfocrJoduRf/6SDKDXzIdtftyoenot2IYRqL45
	 hL1b5XnELAqCxxKEKbZhKcsxgPpedJ0YrlXuw7n4MDj3IvwIvd7rJoFCTOvnVJPPNr
	 cFb21q+6kWeSQ==
Message-ID: <sashiko-outbox-174213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net 4/8] net: enetc: do not rely on mEMAC hardware
 frame padding
Reply-To: sashiko-reviews@lists.linux.dev
To: vladimir.oltean@nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261015105536.1692348-5-vladimir.oltean@nxp.com>
References: <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-5-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:56:57 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: enetc: HW LSO bypasses software padding defense causing info =
leak
- [High] net: enetc: under-reserved TX ring capacity for VLAN TSO packets
- [High] net/enetc: TX BD hardware limit violation from pad BD
- [High] net: enetc: tx_swbd state corruption after DMA map failure unwind
--

commit 3dad676559c79da08025ef8636033dd30717a901
Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>

net: enetc: do not rely on mEMAC hardware frame padding

This commit changes the driver to pad all short frames to ETH_ZLEN in
software instead of relying on the hardware MAC to pad them, avoiding
potential information leaks of uninitialized SoC memory. For GSO packets,
it appends a zero-padding BD to segments that are shorter than ETH_ZLEN.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index e464eca482f78..707c17fe4a4c5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
[ ... ]
> @@ -958,8 +981,10 @@ static int enetc_map_tx_tso_buffs(struct enetc_bdr *=
tx_ring, struct sk_buff *skb
>  			csum =3D csum_block_add(csum, csum2, pos);
>  			pos +=3D size;
> =20
> +			/* When padding, the pad BD is the last one, not this */
>  			err =3D enetc_map_tx_tso_data(tx_ring, skb, tx_swbd, txbd,
>  						    tso.data, size,
> +						    !pad_len &&
>  						    size =3D=3D data_len);

[Severity: High]
Can a DMA map failure here cause state corruption on subsequent
transmissions?

When enetc_map_tx_tso_data() fails, the error path unwinds the mapped
buffers via enetc_unwind_tx_frame(). However, enetc_unwind_tx_frame() does
not clear the tx_swbd state:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_unwind_tx_frame() {
    while (count--) {
        struct enetc_tx_swbd *tx_swbd =3D &tx_ring->tx_swbd[i];
        enetc_free_tx_frame(tx_ring, tx_swbd);
        ...
    }
}

When these slots are subsequently reused, enetc_map_tx_tso_data() populates
the dma and len fields but does not explicitly clear bitfields like
is_dma_page and is_eof from the unwound frame. Will premature observation
of the leftover is_eof =3D=3D 1 flag corrupt the transmit ring cleanup proc=
ess?

>  			if (err) {
>  				if (i =3D=3D 0)
> @@ -980,6 +1005,13 @@ static int enetc_map_tx_tso_buffs(struct enetc_bdr =
*tx_ring, struct sk_buff *skb
> =20
>  		enetc_tso_complete_csum(tx_ring, &tso, skb, hdr, pos, csum);
> =20
> +		if (pad_len) {
> +			enetc_bdr_idx_inc(tx_ring, &i);
> +			enetc_map_tx_pad(tx_ring, i, pad_len);
> +			tx_swbd =3D &tx_ring->tx_swbd[i];
> +			count++;
> +		}

[Severity: High]
Can this unconditional padding BD cause the frame to violate the 15-BD
hardware limit?

The LS1028A hardware restricts chained TX BDs to a maximum of 15 per frame.
The driver enforces a max_frags limit of 13 data fragments. In
enetc_map_tx_tso_buffs(), the fragment processing loop terminates normally
if the segment reaches exactly 13 fragments and data_len drops to 0:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_map_tx_tso_buffs() {
    ...
    if (unlikely(bd_data_num >=3D priv->max_frags && data_len))
        goto err_chained_bd;
}

After the loop, the padding BD is unconditionally appended. If a VLAN tag
is present, the frame will consist of 1 header BD + 1 VLAN extension BD +
13 data BDs + 1 padding BD =3D 16 BDs. Will this violate the 15-BD limit
and cause a MAC stall or DMA error?

> +
>  		if (total_len =3D=3D 0)
>  			tx_swbd->skb =3D skb;
> =20
> @@ -1032,7 +1064,9 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff =
*skb,
> =20
>  			count =3D enetc_lso_hw_offload(tx_ring, skb);

[Severity: High]
Does this code still allow hardware LSO to bypass the software padding
defense?

The patch introduces software padding to prevent the MAC from inserting
uninitialized SoC memory into short frames. However, for GSO packets, if
hardware LSO is enabled:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_start_xmit() {
    if (priv->active_offloads & ENETC_F_LSO && ...) {
        count =3D enetc_lso_hw_offload(tx_ring, skb);
    }
}

If the hardware LSO engine produces short segments (e.g., small gso_size
or a short final remainder segment), the LSO engine emits frames shorter
than ETH_ZLEN. Since ENETC_PM0_CMD_TXP remains set in the MAC, won't the
MAC automatically pad these short LSO segments with uninitialized memory,
continuing to leak SoC memory?

>  		} else {
> -			if (enetc_bd_unused(tx_ring) < tso_count_descs(skb)) {
> +			/* +gso_segs to cover one pad BD per segment */
> +			if (enetc_bd_unused(tx_ring) < tso_count_descs(skb) +
> +			    skb_shinfo(skb)->gso_segs) {

[Severity: High]
Does this capacity check under-reserve descriptors for VLAN TSO packets?

The generic tso_count_descs() calculates gso_segs * 2 + nr_frags. The
updated check adds skb_shinfo(skb)->gso_segs to account for the new padding
BD, resulting in a total reservation of 3 * gso_segs + nr_frags.=20

However, if a VLAN tag is present, enetc_map_tx_tso_hdr() allocates an
additional hardware-specific Extension BD for every segment:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_map_tx_tso_hdr() {
    if (flags & ENETC_TXBD_FLAGS_EX) {
        enetc_bdr_idx_inc(tx_ring, i);
        ...
        count++;
    }
}

This means the actual worst-case BD consumption is 4 * gso_segs + nr_frags.
Could transmitting a highly segmented software TSO packet with a VLAN tag
overflow the TX ring buffer when the ring is nearly full, silently
overwriting active descriptors?

>  				netif_stop_subqueue(ndev, tx_ring->index);
>  				return NETDEV_TX_BUSY;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015105536.1692=
348-1-vladimir.oltean@nxp.com?part=3D4
