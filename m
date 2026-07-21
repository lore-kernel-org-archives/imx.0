Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC513FF8B9
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600012; cv=none; b=B4xyGqtQ+C5/PR5j82ISNzbfjzC/D+JgjMhp1e/aqTtAy1F6kFWmHjXLnCCycbgjqHqcISFAvsGyQuoCx720pvLJvw5FXJgXzTcQndGuk8TnAH/MixmhTy06q9iuPBiUfBRfVghbpVI0Ql1KoWr4W87l5r0Qzdwy/zgc6Jqm91Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600012; c=relaxed/simple;
	bh=4E0fo2nwjPUQq2xmfcXFFBR5CjaZu+Lub1yXL2hNvbc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXFJ2zHU+UTVun6h7bBgNuQ6Z4Dlyd7s802Avh1H/NjmimVsrTS2AGExMtbuotSZCVDyi5lHKU2KE47RmRELZMdUQ+Xxl0XsDhk4sP5H+L026CWDfdWcB/tuwvlXVi1Nj6muvvHw5H3rEh8lYuFaUnHHDHTUX0aQICdt9H8iepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTq4OqTD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTq4OqTD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D011F000E9;
	Tue, 21 Jul 2026 02:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784600011;
	bh=4YOxQnILzJoV91491FZ7Lt0ln1fFdSMY56jVlo1/w1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nTq4OqTDrFNLaTBkPKWJcgI1X/chC10msSg+0dsptC0VfqynjsXJiTCMj2N8K3+Yi
	 HYj7U4m5znY2OvyaYbAzSELj54VQi675kqUC9wFR7KwSaWvZlF3PDl720fMtazDVv4
	 evY2WrtGx+EXO+gGZGT4asdZH8RBRvdva+HCwhjMPeScqUFKYZEayUuxa+7tuTVvSG
	 FChK3rf+x0GbsPqTpEP5gOeBKeGFZS2OHvIk61vz1BFVLkKSGAAyJD9BkcMspDt6C8
	 goz4fyFNiPC3KgxLgkvtMzPXXDjX7Z9ZFTcTIQwAtEPwliuBZ1KElyw5NKbP/vCn5A
	 uQAPE1UW0x+ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 net-next 02/14] net: enetc: extract common
 helpers for MAC hash filter configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260720014317.1059359-3-wei.fang@oss.nxp.com>
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:13:30 +0000
Message-Id: <20260721021330.C2D011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `enetc_sync_mac_filters`, falling back to hash table (HT) filte=
ring after a failed exact match (EM) filter insertion reads corrupted data =
from a union, configuring an invalid hardware filter.
--

--- Patch [2]: [PATCH RESEND v4 net-next 02/14] net: enetc: extract common =
helpers for MAC hash filter configuration ---
commit 9f93708413c38f9e209ca579bcb44ec6059cbebf
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: extract common helpers for MAC hash filter configuration

This commit extracts MAC hash filter configuration helpers to share code
between the ENETC v1 and v4 drivers. It introduces enetc_set_si_uc_hash_fil=
ter
and enetc_set_si_mc_hash_filter to replace duplicated hardware revision
specific implementations.

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
This is a pre-existing issue, but does the fallback to hash table filtering
here read corrupted data?

In struct enetc_mac_filter, mac_addr and mac_hash_table share the same
memory space inside a union. When configuring an exact match filter, only
mac_addr is populated.

If enetc_set_mac_flt_entry() fails, the code continues to this fallback path
and reads from f->mac_hash_table. Since it is a union, wouldn't this just
read the raw bytes of the MAC address (along with uninitialized padding)
and interpret it as a hash bitmask?

Could this misconfigure the hardware MAC hash filter and lead to incorrect
functional behavior and silent packet drops for unicast filtering?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720014317.1059=
359-1-wei.fang@oss.nxp.com?part=3D2
