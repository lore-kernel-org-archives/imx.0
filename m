Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDED3C4B91
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171255; cv=none; b=sneN82fmoGykR+Z4hySnPvi7/EYxb52x/ZRdRoRkbkBEQr0kuoiDkubm4snpX0QYkM2bx27gBSJ4sqQWpP9l8gFe602H1xNIlQ7pCXRRN39bHmoefU3XlBddsUybzlTeii3soDRYWWyfvAhgca/2n5eJHNkgNV/biJYvuL81WRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171255; c=relaxed/simple;
	bh=VF53OBCymZ44p778YjTdazY0FbqknEb+B5ufrwkgca0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dABjo8Uh8Nao2bn8RLqGSIWd09DdH9cqI/PBavWRy7bolp6pea/8z/u4xgNv9/IJMc/Yn7kpvWrDun6IXPLa0k46BR2VnmEChj6BxTlpPxaB4LTtYQvKD1ijXra2xfm/LU1afe+iEBLXbufBOBNmky1gWcBg6g2CTL7TMxJmg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2genpEo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2genpEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903971F00893;
	Thu, 11 Jun 2026 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171253;
	bh=Gj2DuqFL/4NzRX2bTiaPxPLSKMQHLnbVCqzcU/rzAxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2genpEo+8AJMPhSO/OOGam5+vFsy55aYQnBqOC64L90CSVYtPphr+0KtQOXP9N90
	 3RD7MvNDlNYZnHijN/rh77+3N+CWnRjyJkZhgOciD2i+UzXkSM0BhyI2t7hR9o6hzX
	 3iDHXIzcg+CYLe1MLKZefla/i7O/kp6daEKhbIcnh73xvYuPGsfFSq+DTDGf/FOEif
	 r92WOQS7ffA7Dj+MWhN4P/gSc0vSmonIQVRQvl6O40KAv3aJYch+z2cQN/8CNFqA51
	 g+r83zIIJkl3CgijBNVRrzhB77J7TtHe/W0L7fe1Nl7f7be/tKu0pFIoowQSfWqXZg
	 EKFxN5Kbk/5wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 08/15] net: enetc: move mac_filter from
 struct enetc_pf to struct enetc_si
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-9-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:33 +0000
Message-Id: <20260611094733.903971F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent 32-bit truncation of 64-bit MAC hash table bitmap
--

commit d6f9f9bacee81eb61d86d4e3d383dcddb4c66cbb
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: move mac_filter from struct enetc_pf to struct enetc_si

The mac_filter array currently resides in struct enetc_pf and is used to
track unicast and multicast MAC address filters for the PF. Since struct
enetc_si is the common structure shared between the PF and VF drivers,
move mac_filter into struct enetc_si to prepare for MAC filter support
in the VF driver.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -225,11 +225,12 @@ static void enetc4_pf_set_mac_hash_filter(struct en=
etc_pf *pf, int type)
>  	struct net_device *ndev =3D pf->si->ndev;
>  	struct enetc_mac_filter *mac_filter;
>  	struct enetc_hw *hw =3D &pf->si->hw;
> +	struct enetc_si *si =3D pf->si;
>  	struct netdev_hw_addr *ha;
> =20
>  	netif_addr_lock_bh(ndev);
>  	if (type & ENETC_MAC_FILTER_TYPE_UC) {
> -		mac_filter =3D &pf->mac_filter[UC];
> +		mac_filter =3D &si->mac_filter[UC];
>  		enetc_reset_mac_addr_filter(mac_filter);
>  		netdev_for_each_uc_addr(ha, ndev)
>  			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to dereference
the mac_hash_table bitmap directly?

The mac_hash_table is declared as a 64-bit bitmap. On 32-bit architectures,
an unsigned long is 32 bits, making the bitmap an array of two unsigned
longs.

When the code dereferences this bitmap in enetc4_pf_set_mac_hash_filter():

    enetc4_pf_set_si_uc_hash_filter(hw, 0, *mac_filter->mac_hash_table);

It reads only the first unsigned long, capturing just the lower 32 bits.
When this is implicitly promoted to u64 for enetc4_pf_set_si_uc_hash_filter=
(),
the upper 32 bits will always be zero.

This same truncation also happens in enetc4_pf_set_uc_exact_filter() and
in enetc_sync_mac_filters() when it passes *f->mac_hash_table to
enetc_set_mac_ht_flt().

Furthermore, the enetc_set_mac_ht_flt() function itself takes an unsigned
long:

    static void enetc_set_mac_ht_flt(struct enetc_si *si, int si_idx, int t=
ype,
                                     unsigned long hash)

Because hash is truncated to 32 bits on 32-bit systems, upper_32_bits(hash)
will always evaluate to 0, leaving the upper MAC hash hardware registers
unprogrammed.

Could this lead to incorrect multicast and unicast MAC filtering on 32-bit
systems?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D8
