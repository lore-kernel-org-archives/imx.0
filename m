Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526325;
	b=HGV360ZyTzX7mkCK5aMtt/fDDDicew1m11nWXo6tFNIP3a7+8SKzeX9S7DTTk9/vKR+x
	 KIcr085SzXrdsEubTHXUt0VWa5KLXG4mGcP2QrjlfzMn2tGcLXavpsfEYXW43pZZc1YEY
	 NvJz9eHuTasLRAl2VufnDW6Eb3h8fhOPY68YNARXLponvY6CZ+dznm0MFFW/X+Ss3BtZY
	 zzyzntjnvrF5CDi04N0R7qvqhSUfGxVawrRhpcSeq9kNpOZgU4eDirRhQCHvEK8D5IirB
	 0dbvwfxpDmLLO/L1ZuPR/v8X1DpFpghAkCHUO04To02q4Vd74X4UHEUEuVZmQT6U2Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YrRxJEZWlcgqAQb/dOoIBK6ZuDKxfFo30fgPNXYQ2BY=;
	b=mAc7Xr1Xr6/Z1KcUabzMmVpzpkBOrHMUs09a7WkrFmWfBsV0WlWBzj5YrO5ZWQYdtfuW
	 5Z+XstdXiwhcU2HKVNquVQ66MvpHZRPxye0srDPaPlQ3umCGrBfDy3JZ0KPUC8qJK2RF3
	 /UiJPMZYHS93wHAcHCDkQisZxm/w1wL7UysTNDUpmL4sK1ip3TdHqqvWAq8UzAgoAFIct
	 CxxIzgv9S0Z8wh68xL82hE4vdv4MEM3f9Qvt8evcfxziL8WSL1L9v7o+BJ5KEePUO96Ow
	 YqV6lrkZUdvddCOPPRJGVO/0TT1STg+ZKkXfPRerndzyt7Mm0bk3N+AlbrSbpc5rgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVrIVFEe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCCA606A321
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVrIVFEe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23D1F000CA;
	Thu, 12 Nov 2026 23:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794526325;
	bh=YrRxJEZWlcgqAQb/dOoIBK6ZuDKxfFo30fgPNXYQ2BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVrIVFEe/hfPN2P+Xdysj53VgCG9/p3oDBd0EyA3nT0rrRJRRgCijtB25I3Pljq2U
	 zaqK/mTDn+prYWwv0GuHjzgt0vIzBeunookQjbrjbjsJmEmTkscQzOgG/lLoQwMHEB
	 efOd3k7LLArH/YBQgGFiQ2O/lhjH/NWt06cr45R73Fn7ZpUtSc7Aq5ttS5don8rRS3
	 AZUkEDw8ofM8Ym+c6/AUagIXMAj83wITJF18I3hpouTPUnmjyYIcy5W2UN4GHyK3Ng
	 ucqTIXWtc8c0KvIzoQVBgRzZAyiRWhpv/A36YGnqAzEMaz0Ramh5zS1QEqyGYJIjBP
	 f/VzlrszmUQbQ==
Message-ID: <sashiko-outbox-211955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 3/3] net: enetc: let core segment GSO super-skb when
 headers exceed TSO_HEADER_SIZE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261111233149.479596-4-vladimir.oltean@nxp.com>
References: <20261111233149.479596-1-vladimir.oltean@nxp.com>
 <20261111233149.479596-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 23:32:05 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] net: enetc: VLAN tag push after enetc_features_check()
  overflows TSO header
- [Medium] net: enetc: u8 hdr_len truncation in enetc_lso_start() for
  256-byte headers
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] net: enetc: lockup in enetc_map_tx_tso_hdr() via undersized TSO
  descriptor [1]
--

commit b5eb34f7b5b23a1224c351b91a143ecbd34866d9
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

net: enetc: let core segment GSO super-skb when headers exceed TSO_HEADER_S=
IZE

This commit clears NETIF_F_GSO_MASK in enetc_features_check() when the GSO
packet headers exceed TSO_HEADER_SIZE so the networking core segments the
packet instead of overflowing the per-ring TSO header slot.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 7f089a84d9a65..3c5478238e356 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1122,7 +1122,15 @@ netdev_features_t enetc_features_check(struct sk_b=
uff *skb,
> =20
>  	features =3D vlan_features_check(skb, features);
> =20
> -	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
> +	if (!skb_is_gso(skb))
> +		return features;
> +
> +	if (enetc_lso_get_hdr_len(skb) > TSO_HEADER_SIZE) {
> +		features &=3D ~NETIF_F_GSO_MASK;
> +		return features;
> +	}

[Severity: High]
Can a non-offloaded VLAN tag push the header past TSO_HEADER_SIZE after
this check?

In validate_xmit_skb(), netif_skb_features() runs before
validate_xmit_vlan().  When a GSO skb carries an out-of-band VLAN tag that
is not offloaded in hardware (such as an 802.1ad S-TAG, or an 802.1Q C-TAG
when NETIF_F_HW_VLAN_CTAG_TX is disabled), a 253..256 byte header passes
enetc_features_check() and then grows by VLAN_HLEN (4 bytes) when
validate_xmit_vlan() calls __vlan_hwaccel_push_inside().  In
enetc_map_tx_tso_buffs(), tso_build_hdr() then copies 257..260 bytes into
a 256-byte slot in tx_ring->tso_headers, overflowing into the next slot or
past the end of the coherent DMA buffer.

[Severity: Medium]
Can a 256-byte header still break the hardware LSO path because
lso->hdr_len is a u8?

Because this check uses > TSO_HEADER_SIZE (256), a GSO packet whose headers
are 256 bytes passes through to enetc_lso_start():

drivers/net/ethernet/freescale/enetc/enetc.h:
struct enetc_lso_t {
	...
	u8	hdr_len; /* LSO header length */

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_lso_start() {
	...
	lso->hdr_len =3D enetc_lso_get_hdr_len(skb);
	lso->total_len =3D skb->len - lso->hdr_len;
}

Assigning 256 to lso->hdr_len truncates it to 0, so enetc_lso_map_hdr()
copies 0 header bytes and programs hdr_len =3D 0 in the LSO descriptor while
enetc_lso_map_data() maps the headers as payload.

[Severity: High]
This problem wasn't introduced by this patch, but in [1] can a GSO
packet with hdr_len < 16 lock up the controller in enetc_map_tx_tso_hdr()?

While this check bounds the maximum header length, a crafted GSO packet
(for example via AF_PACKET) with hdr_len < 16 still reaches
enetc_map_tx_tso_hdr(), which writes hdr_len directly into
txbd_tmp.buf_len.  An undersized first TSO descriptor below the hardware's
16-byte minimum stalls the ENETC transmitter.

[1] https://sashiko.dev/#/bug/linux-835a7475-1686-40c3-bf3a-572547fbf43f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111233149.4795=
96-1-vladimir.oltean@nxp.com?part=3D3
