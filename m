Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4052F8EBB
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730685; cv=none; b=XLz1pNvDWWLqiXKRoJ+2tJkKwciOztrCsTfO+wDIauxMB+GBRlgA3sWgATUSeQo/K70ptytDqxQZKyFhZZZyf+6gv37sP0pQGGbWLEiukF7BqU8Z3I4LmxWeYMTWQ74Yfs6EroS7QRqCrngwhQFh9qilIpfnyWl0g6SWz1hBTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730685; c=relaxed/simple;
	bh=4+L3yPP9sykdCn4S1PLOCAev+/VD4RE9pXbSKyU7uH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rw7W5JaBpQBD0bTK9NYKd8qzrdO7WqcVShCk07mEBvxUAijQLOmhF6gNN92CTZ4dexcyRw/U/QlvRD62AJWPaeiasxKbTNLKvo7HUuyv1AB3L9qPzCbQxDZ0I9+BhdmGHsDmtLYml5rtYAPAjP48w6+fCh5ESXlODFOLzZbvMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrFOjYxY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrFOjYxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83D31F00898;
	Sat,  6 Jun 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730683;
	bh=evS/pw5wGfeldPuhFO2mg4WXJFCsBmUR6l/7Otw5wo8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrFOjYxYYrDzWwKhHLS5LgOoCVInHAFkCI1Kzt01jXOCYSc/hIGc0afII/4Dd+er1
	 CNfAdcrnsQkUBkJsHb71Yg3/Q5UgUfVElnm+AQ1VV2o6o69fGJATGGbpH9vGYZuA5m
	 oKJqxP7w2G4vKeE++pSE5BwgZqVTkIhDBDTuH1LLhqRsE5l8vfvJxNKeysRylwqTwI
	 sqE02rtWTKZEhojjPlZk2qk/cUSHZVPAAMBRm+tEVD8wWOtW4pKZV23qjxE7hqF51m
	 tCk1oKdnA3O9QXz59Rqx7cHPw2vdjOsNMXn0csmkt/6Y2OUlr1YUT9IbANNjczW30E
	 GoIQ+owQQxX0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 13/15] net: enetc: implement
 ndo_set_rx_mode_async for ENETC v4 VF
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260605065550.3038579-14-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:43 +0000
Message-Id: <20260606072443.B83D31F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect conversion of the MAC hash table bitmap to `u64` and mis=
sing endianness conversions corrupt the hardware mailbox payload on 32-bit =
big-endian architectures.
--

commit 0c4f7b4fe1b39fb9114ce4bf92f78fdf7e89d32d
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: implement ndo_set_rx_mode_async for ENETC v4 VF

The ENETC VF communicates MAC filter changes to the PF driver via a VSI
mailbox interface. The message send path in enetc_msg_vsi_send() polls
for completion with a timeout up to 200ms, which requires a sleepable
context.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 9b16226602aa9..418ee98da17d6 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c

[ ... ]

> @@ -209,6 +209,122 @@ static int enetc_vf_setup_tc(struct net_device *nde=
v, enum tc_setup_type type,
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

[Severity: High]
Does this memcpy() and bitwise shift logic correctly handle the bitmap
conversion on 32-bit big-endian systems?

Since mac_hash_table is declared with DECLARE_BITMAP(mac_hash_table, 64), it
is an array of unsigned long. On 32-bit architectures, this is an array of
two 32-bit words.

On 32-bit big-endian systems, memcpy() will place the first 32-bit word
(mac_hash_table[0], containing bits 0-31) into the most significant 32 bits
of the u64 hash_val, and the second word (mac_hash_table[1], containing bits
32-63) into the least significant 32 bits.

Then, hash_val & GENMASK(31, 0) grabs the lower 32 bits (which is actually
bits 32-63 of the bitmap) and assigns them to msg->hash_tbl[0]. This swaps
the halves of the bitmap and corrupts the hardware mailbox payload.

Additionally, this code appears to lack explicit cpu_to_le32() conversions
for serialization into shared memory. Could a helper like bitmap_to_arr32()
be used here instead to avoid these issues?

> +	}
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

[Severity: High]
This block has the same 32-bit big-endian conversion and serialization issue
for the multicast bitmap as described above for the unicast bitmap.

> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D13
