Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1BDDC5
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161825; cv=none; b=n+ZOkzz2R/ZpzCGK5I6bJtvBXsSM+eVAh9QIFBiOn/WM3k2SHHoMUkD1wG+iQrxndE6j9IdPWvp0ZTBqug8p83LUIf+zntJhik6/6fMxq9N9cb2DGmDxkVtlhXSpSmGEHjFFN/bKoEwQdCSFvVfk2Kdq2SMAIPQmJn+cKGxbMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161825; c=relaxed/simple;
	bh=U+CfRG1uaFzzoDOeWvG4LQRPB5HVGGRCbBeLHomEbAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzZPFoNseygcisfJL25FfhkNiBbUZG0hPrVUK64OpZcmZvfQnJ5AngcZUo/9UIU9+M5ONjTKinoaFeIpxGtl3xHGAPtTHBWpDMn2i+DJ1qVQTjZOjUQAO/Osq/B0nBmD9pxQDpPSB88QII7ylmZk57rZQT/BC7dCjOnRlWvj8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZ/VKtca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZ/VKtca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE861F000E9;
	Sat,  4 Jul 2026 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161824;
	bh=Ui0UfFqqyI7E/FJxPc1DOsGmwvA7D+I22uT6T6K2704=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZ/VKtcanMXG05jc2aEqS8yF7Ky2lt5iAY7GUma8DS9NyPtRmLnJBgfAxUq4wmhKm
	 dh2CCy1v8xXQHZnW2yXeSN85WKZdzj08r+oqbVICXueI67JvYMJkwQUZvZWXAVgrhR
	 m08oMGJGJwnK/+aaopYhYdOZLHl3Rkt+U9iqes6So3Bmy/YehRijKikE+PmKTtAJVV
	 Thu/03U+thz7bOqBbaa2XVWRxGTzQPCndq9NGXAnfWac1gfNwuJ5pmw/wtqRAoIZNJ
	 m5+z8Hjkfg+LE/sALHrGUN7pIa0a8ti9+ETndXDSuPZkjcu563owz/cbquToGEiIaU
	 LesdWdprqU3Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 02/14] net: enetc: extract common helpers
 for MAC hash filter configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703101328.550714-3-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 10:43:43 +0000
Message-Id: <20260704104344.1AE861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but when the exact m=
atch MAC filter fails to be programmed, the fallback to hash table (HT) fil=
tering configures the hardware with a corrupted hash bitmask.
--

commit 7a34e5eaa6513d77933432617ababa625bd03ac3
Author: Wei Fang <wei.fang@nxp.com>

    net: enetc: extract common helpers for MAC hash filter configuration
   =20
    The PSIUMHFR and PSIMMHFR registers in ENETC v4 have the same bit layout
    as in ENETC v1. The only difference between the two hardware generations
    is the register address offsets.
   =20
    Since the register functionality is identical, the MAC hash filter
    configuration code can be shared between the ENETC v1 and v4 drivers.
    Extract two new common helper functions, enetc_set_si_uc_hash_filter()
    and enetc_set_si_mc_hash_filter(), into enetc_pf_common.c.

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
> +		} else {
> +			enetc_set_si_mc_hash_filter(si, 0, hash);
> +		}
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but when the exact match (EM) MAC
filter fails to be programmed, the fallback to hash table (HT) filtering
appears to configure the hardware with a corrupted hash bitmask.

Because mac_addr and mac_hash_table share a union in struct enetc_mac_filte=
r:

	union {
		char mac_addr[ETH_ALEN];
		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
	};

and the exact match path populated mac_addr, doesn't f->mac_hash_table now
just contain the raw bytes of the MAC address?

If so, won't bitmap_to_arr64() (and the prior enetc_set_mac_ht_flt() code)
read the raw MAC address bytes as if they were a bitmap of hash indices?
This seems like it would result in the hardware being programmed with a
corrupted MAC hash filter, leading to silently dropping incoming packets for
the correct MAC address.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703101328.5507=
14-1-wei.fang@oss.nxp.com?part=3D2
