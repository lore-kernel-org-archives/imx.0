Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39DD137923
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500510; cv=none; b=eI7tmJSbXlFOACN7KTeXb7GlcjPztUOtnG5qvi1iK1KYLWbhK1KJQxBAN8dRXxa0bOQPNwue0T+R/TqzKiIlmdnwEwcXo1HW2gJWY4/yWhS/+XwdRDkp0UMfStkqfUvCtJjEY4A0yQXk8xVUL636GIE0+ukugz7bd9VSKrQcMgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500510; c=relaxed/simple;
	bh=Akv6z1NwGO6FDnBOZC5wpPuz+cFrZ1F/819gwubOGWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DHAR9ZUYkQx0LqYG8SwzXDkgeUTS2d0/To1JPagnflQi8Av3/eRjUy4YHVNa3/9EuSyyF4ESte0W+HZa+o1K/eG3OnMhF3/S3QHPNCmmhc7teJmhds4z3/f75xTwq81AurCNw10MvW3g35EHowjxrMG4RKtLVpyqgX7I84ueQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNfswxGN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNfswxGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260E11F000E9;
	Wed,  8 Jul 2026 08:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500509;
	bh=1yq+e5zF7wYt3cyxRj/Dm1tjScrw3lSmdUcb7orjYl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNfswxGNb9lzEsjoNnF1TKhaW9pyMEueldsks8y1/Mi2iM3JBqHcBWLoGWcSKtBLg
	 7gXRlrIB+J96/HXvxdLh8Qclkst+MRDwYi8IIkoH7z96tTBy1LnWyMBEKQf3Y+W/MW
	 2NXTpLZ/bobo0HU9+HECgamjzb4C18F517JhZLcKX1L7br/vJiruLsCtnhohM5atzL
	 XhFARy0FvBoC3ur6PrcwdK6vNwoJK6k/uzCiZMSBMKTqlwSRCgViEz7E9mdDEX1GEp
	 8Z3JUiRycTJgWpXkdds+TNsD90c3qSS0A9p2G1tF05MnKq9quhBOEN965wlxBa4uHf
	 vd4zjBQdyBD1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 02/14] net: enetc: extract common helpers
 for MAC hash filter configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707081834.710730-3-wei.fang@oss.nxp.com>
References: <20260707081834.710730-1-wei.fang@oss.nxp.com>
 <20260707081834.710730-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:48:28 +0000
Message-Id: <20260708084829.260E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Fallback from exact match to hash table filter programs raw MAC ad=
dress bytes as the hash bitmap due to a union overlay.
--

--- Patch [2]: [PATCH v4 net-next 02/14] net: enetc: extract common helpers=
 for MAC hash filter configuration ---
commit b257fa43e9724b5d1d7798562be99893baa1b8d9
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: extract common helpers for MAC hash filter configuration
   =20
This commit extracts MAC hash filter configuration code into common
helper functions to share the implementation between the ENETC v1 and v4
drivers.

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

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in this
fallback path when an exact match filter fails.

In struct enetc_mac_filter, mac_addr and mac_hash_table share a union:

struct enetc_mac_filter {
    union {
        char mac_addr[ETH_ALEN];
        DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
    };
    int mac_addr_cnt;
};

If enetc_set_mac_flt_entry() above fails to program the exact match filter
(where f->mac_addr is currently populated), the code logs a warning and fal=
ls
back to using the hash table filter.

Because of the union overlay, doesn't bitmap_to_arr64() end up reading the
raw MAC address bytes from the exact match attempt and incorrectly programm=
ing
them as the hardware's 64-bit hash filter?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707081834.7107=
30-1-wei.fang@oss.nxp.com?part=3D2
