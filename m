Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED22422F388
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730682; cv=none; b=JnDM1Fyldb/cIDjLPfWqutPnzRpdQ0GZiKWONi7YWLPcr1x/fN0hO88OaZoL+dYdIiYTimOiXwLggSyIjkq7ziNlul/pimXOSSLLCb39w7UekgcM4UJNbmX7+D37fg5H5q4tTuUc80K/V27vXL7L5l23VejHfMdcOas4PnD1yh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730682; c=relaxed/simple;
	bh=5nCMUV7jTqFeJMkocEmLa7QZe4uaHhGIHtq1qsIPSA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JucG5J0rpQ93ev1KICGx6pmNrcnXqTSTIF4sPnkdr123IimhdxXO8a2TqBvJrwc+5J5dEkvtlHhAXlxfEgAgh3UuNMrIhE7wzRRsg6Ha3T9WECmbfYbk4iUbK68/4Wqg9f/Y+uYGWX6GNysI34Puyx5i5cPlyJZQOiPJ8NUQ0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVlzZW6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVlzZW6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3851F00893;
	Sat,  6 Jun 2026 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730680;
	bh=uCqzdEPguHChtmUbNEgWcXpsEGjdXn/Q5tKJR0C4eVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVlzZW6Np64YjKKwwURIjsOz+WSAgVuONtEmOc51tDPjbrU8o0FrsHjE7U1eslTyJ
	 TM0V3e/yJ4T0zJuS1NIaiEtkDRUG/DLybGovMWdbR5loOfP9r6buA192xYbxgRns1z
	 ITiOXlrdtLfBtDkahZ1By+vDYFjv1nDJYp9UlTh4QqEwzR5K9bP+p6tF+ilkuCPkWn
	 UDQpI4f7cxKxuOs7HcdM/kGpZIoSjh5GDpbN6qJKGjXYex5sUIBUQeWGIbiGmHt3pu
	 AlshssD+P+an1pCTrbxsU0D6bWPc+9tJICIy4wL6so8cXqG5ExOraBA2kdmFy3yrx1
	 PpLnEPxgA6rAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 08/15] net: enetc: move mac_filter from struct
 enetc_pf to struct enetc_si
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260605065550.3038579-9-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:40 +0000
Message-Id: <20260606072440.9E3851F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] On 32-bit platforms, the 64-bit MAC hash table is truncated to 32 =
bits when programming the hardware, causing MAC addresses that hash to the =
upper 32 bits of the table to be silently dropped.
--

commit 3178ee41440e498f50696b0d334e000fdca4eaa7
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: move mac_filter from struct enetc_pf to struct enetc_si
   =20
The mac_filter array currently resides in struct enetc_pf and is used to
track unicast and multicast MAC address filters for the PF. Since struct
enetc_si is the common structure shared between the PF and VF drivers,
move mac_filter into struct enetc_si to prepare for MAC filter support
in the VF driver.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 4cff2f1237f18..f6920ded9f7ef 100644
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

[Severity: High]
This isn't a bug introduced by this patch, but on 32-bit platforms, does
dereferencing mac_hash_table truncate the 64-bit filter down to 32 bits?

The mac_hash_table is declared as DECLARE_BITMAP(mac_hash_table, 64),
which evaluates to an array of two unsigned long elements on 32-bit systems.
When configuring the hardware later in this function:

enetc4_pf_set_mac_hash_filter() {
        ...
        enetc4_pf_set_si_uc_hash_filter(hw, 0, *mac_filter->mac_hash_table);
}

Dereferencing mac_hash_table directly like this only passes the first
unsigned long. Since enetc4_pf_set_si_uc_hash_filter() takes a u64
parameter, the 32-bit value will be zero-extended, effectively losing the
upper 32 bits of the MAC hash.

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index 38fcc7b5fc6da..209a3503609f5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -111,10 +111,9 @@ static void enetc_set_mac_ht_flt(struct enetc_si *si=
, int si_idx, int type,
>  	}
>  }
> =20
> -static void enetc_sync_mac_filters(struct enetc_pf *pf)
> +static void enetc_sync_mac_filters(struct enetc_si *si)
>  {
> -	struct enetc_mac_filter *f =3D pf->mac_filter;
> -	struct enetc_si *si =3D pf->si;
> +	struct enetc_mac_filter *f =3D si->mac_filter;
>  	int i, pos;

[Severity: High]
This is a pre-existing issue, but does enetc_sync_mac_filters() also trunca=
te
the hash table on 32-bit architectures?

enetc_sync_mac_filters() {
        ...
        enetc_set_mac_ht_flt(si, 0, i, *f->mac_hash_table);
}

Like in enetc4_pf_set_mac_hash_filter(), passing *f->mac_hash_table only
provides the first 32 bits on 32-bit platforms. Furthermore,
enetc_set_mac_ht_flt() accepts an unsigned long for the hash:

static void enetc_set_mac_ht_flt(struct enetc_si *si, int si_idx, int type,
                                 unsigned long hash)
{
        ...
        enetc_port_wr(&si->hw, ENETC_PSIUMHFR1(si_idx),
                      upper_32_bits(hash));
}

Since hash is an unsigned long, upper_32_bits(hash) will always evaluate to=
 0
on 32-bit platforms. Is there a risk that any unicast or multicast MAC
addresses that hash to bits 32-63 will be silently dropped by the hardware
filter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D8
