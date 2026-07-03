Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85C270552
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 03:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049228; cv=none; b=kTe2ykol9HiZrXaKX0x52LZFh+jpTE/8iFX1hRUTCd+tF+5qshvDO5/tR+PbC6gY23kz3uedNaE/4hQa8OH9Idsr84dkiBUyAnCC8vd3QPlkznULHRkX/DluYvGaGmr9iYiqg5kg3PoK6oHzD8zL25VEohCAZFoZoVD1mwlZrlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049228; c=relaxed/simple;
	bh=I4SXTljAZcckNukx/LPvK6u8S2UtZwl+csCmJVWt6AM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PxYMhdpfUq+DMl5YznKY28+/rc7Unvo8eE5LQ6j+3iInkKmhDcYuYJCrN9tZ6m9uKBUyhRsF/bkOvm2oU56m4n9tcOqou7xb+sZnNYZ9TIw8KyA7EkUZB+YJAGMWGqAz2fwbkFj0Ydj6IPjmDx0CPnFsB0A7bB671V7UA03mZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSC02cq6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSC02cq6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231E51F000E9;
	Fri,  3 Jul 2026 03:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049222;
	bh=F74FbMOnwADdlnjPJjntZ9gzD6J6B0/KVKIl3x3qbdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSC02cq6U7f7Ys94fThQeGBfWJK28/XJMYJRKVfY7FZqn9qZIpBlpfqKXncZKKNfD
	 /K38Lm+jieLlJL2ineHz76im284fCGm6Je1Pd+py7FwgaEe+TQV4wnDjI7Nj40B8I8
	 +KwUm2d1yyYsGWBLqZO05grf+kdWQx7vv0tN0LtEOCnD1MzkZnX0LZ9ct9daGnMXab
	 IYeY6vGEcBloHJSmQpj0YlwEVr0sQ60zlBjMnu+eZpfq0o1iC/D7zOejkAAsFOfTeO
	 FczY0CG+NvO5d93RubJ/p+Q6kGliAIwVbuDdkIlR6FTICKF4ZQ2IcAwTTDuNfuS+tn
	 HyslFVD8GWYIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 02/14] net: enetc: extract common helpers
 for MAC hash filter configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260702025714.456233-3-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 03:27:01 +0000
Message-Id: <20260703032702.231E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing logic bug: Fallback to hash-based filtering fails for=
 exact match (EM) MAC addresses because the hash table is not populated.
--

commit 0373b31ab4e7a0beb8461d5ceb05e09d7d5b61ab
Author: Wei Fang <wei.fang@nxp.com>
Date:   Thu Jul 2 02:57:02 2026 +0000

net: enetc: extract common helpers for MAC hash filter configuration

The patch extracts enetc_set_si_uc_hash_filter() and=20
enetc_set_si_mc_hash_filter() into enetc_pf_common.c. This allows sharing=20
the MAC hash filter configuration between ENETC v1 and v4 drivers, and=20
removes redundant hardware-specific functions.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index a97d2e2dd07b7..db2a800a7aaf0 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
[ ... ]
> @@ -135,7 +108,7 @@ static void enetc_sync_mac_filters(struct enetc_pf *p=
f)
>  		if (em) {
>  			int err;
> =20
> -			enetc_clear_mac_ht_flt(si, 0, UC);
> +			enetc_set_si_uc_hash_filter(si, 0, 0);
> =20
>  			err =3D enetc_set_mac_flt_entry(si, pos, f->mac_addr,
>  						      BIT(0));
> @@ -147,11 +120,15 @@ static void enetc_sync_mac_filters(struct enetc_pf =
*pf)
>  				 err);
>  		}
> =20
> +		bitmap_to_arr64(&hash, f->mac_hash_table,
> +				ENETC_MADDR_HASH_TBL_SZ);
>  		/* hash table filter, clear EM filter for UC entries */
> -		if (i =3D=3D UC)
> +		if (i =3D=3D UC) {
>  			enetc_clear_mac_flt_entry(si, pos);
> -
> -		enetc_set_mac_ht_flt(si, 0, i, *f->mac_hash_table);
> +			enetc_set_si_uc_hash_filter(si, 0, hash);

[Severity: High]
This is a pre-existing issue, but does this fallback path actually work for
exact match MAC addresses?

In enetc_pf_set_rx_mode(), when configuring a single unicast MAC address,
enetc_add_mac_addr_em_filter() is called, but the hash table population is
explicitly skipped:

enetc_pf_set_rx_mode() {
	...
	em =3D (netdev_uc_count(ndev) =3D=3D 1);
	netdev_for_each_uc_addr(ha, ndev) {
		if (em) {
			enetc_add_mac_addr_em_filter(filter, ha->addr);
			break;
		}
		enetc_add_mac_addr_ht_filter(filter, ha->addr);
	}
	...
}

Because of this, mac_hash_table remains empty for the EM filter.

If enetc_set_mac_flt_entry() fails in enetc_sync_mac_filters(), the driver
warns "fallback to HT filt" and falls through to this block. However, since
the hash table was never populated, the derived hash is 0.

Doesn't this result in programming an empty hash filter, which will silently
drop all packets for this intended MAC address instead of falling back to
hash-based filtering?

> +		} else {
> +			enetc_set_si_mc_hash_filter(si, 0, hash);
> +		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702025714.4562=
33-1-wei.fang@oss.nxp.com?part=3D2
