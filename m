Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12D3B4EBF
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892277; cv=none; b=YPaB7N4SmlWpuqYH/+/RuZIgIxUvTXV5klGOdvLYiVTbhV8kiXh2y+IiiFB6/FXxFuDxrHWbwPFrplufL1P9TF3WZfY83OU/4hJscrDWwdudkg3z95uJIk8FgNESViI+gdz5VGXlOE3fQ7Cx7Cqb1x80V+DnnpiGnBcOrQq5OC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892277; c=relaxed/simple;
	bh=AkXF21vXmkXWNjFjh9cBLAlA7aqvj6S02DBxrDeg8Jo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rm8WHsJfgIrSZch7hAZ1kHZ7NILT0d6FR6W63KjWsqiRVMBZNS99WM/1hvEDHsPsc3eR+gKkUinLwSSVEpwfL0E8ud7Mqp0h8wg2/aCKXmYWIZ2eTATQTsbLbjt3t+m8sOzThIztqaiI0nsni6hJTCSqW5nIFbl/Dm7Ll3luq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H91Fm+mY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H91Fm+mY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0321D1F000E9;
	Wed,  1 Jul 2026 07:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892276;
	bh=OyiCwapzV279yn8tXWGnn1DofUyDNYgiQUw2UdidWqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H91Fm+mYadzsfVndWgl9kCkajY9G5x42i4Tk4fTuFEDYl+9H8/mGp+LIlQOHJBW/4
	 mC2Mpq2vouhZ0in/GvjE3LslBk8OWfq2cIDlVtU9q9/64r0Zdqb9LZ2eaYp9o7WVUz
	 tqWoRiVvxnVW+atPlAl4ASJOY6KuLu3rp3vxb64csxZxiKRZqxai0oxOiH4Ulatx18
	 b7RCi2kc4na6SvLRwbZDYoJNWSzJQR+bNUTGqrh69XdeW4Y6zdVkkwt1f87UpbXFOV
	 llPuK5H/3aZWS0u4bdioNPGRSx8kGieFIESNTQkNTQSvQRq80KngiCuz8uNYmsr+1G
	 XWc0HGoR+ZEhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 02/14] net: enetc: extract common helpers for
 MAC hash filter configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260630072036.382761-3-wei.fang@oss.nxp.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
 <20260630072036.382761-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:51:15 +0000
Message-Id: <20260701075116.0321D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting 32-bit truncation bug in VLAN hash filter configuratio=
n identical to the one fixed for MAC hash filters.
--

commit 2d2b1381169047a47aed6dfbbe75eac22a3d3710
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: extract common helpers for MAC hash filter configuration

This patch extracts the MAC hash filter configuration code, which is
identical between ENETC v1 and v4 hardware, into common helper functions
in enetc_pf_common.c. It also replaces direct bitmap dereferences with
bitmap_to_arr64() to ensure correct 64-bit conversion on 32-bit systems.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index a97d2e2dd07b7..db2a800a7aaf0 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c

[ ... ]

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
This is a pre-existing issue, but I noticed this patch correctly uses
bitmap_to_arr64() to handle 32-bit architectures when passing the 64-bit MAC
hash table to enetc_set_si_uc_hash_filter().

Does the same 32-bit truncation issue happen with the VLAN hash filter
configuration? Looking at enetc_vlan_rx_add_vid() and enetc_vlan_rx_del_vid=
()
in drivers/net/ethernet/freescale/enetc/enetc_pf_common.c, it appears they
pass the bitmap directly:

enetc_set_si_vlan_ht_filter(pf->si, 0, *pf->vlan_ht_filter);

Since pf->vlan_ht_filter is also defined as a DECLARE_BITMAP of size 64,
wouldn't dereferencing it as *pf->vlan_ht_filter evaluate to a 32-bit
unsigned long on 32-bit architectures?

If so, this would zero-extend the value when passed to the u64 hash paramet=
er,
clearing the upper 32 bits of the hardware VLAN hash filter register and
breaking VLAN filtering for any VID that hashes to bits 32-63.

Should a similar bitmap_to_arr64() fix be applied for the VLAN hash filter?

> +		} else {
> +			enetc_set_si_mc_hash_filter(si, 0, hash);
> +		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630072036.3827=
61-1-wei.fang@oss.nxp.com?part=3D2
