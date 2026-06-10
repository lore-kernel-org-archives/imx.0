Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C12F619D
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062080; cv=none; b=Hz8Yn5MwdGbdYabrXjPjHG+R2/HWJKrxZy/FGVWrsclmDtf6QmJv7+w6+aUuDYziDmYu6cKqox5iQLjRpgaWg56g2qu67Cy45M5QT49l+ymbt9jqJ4dhGYdKBDcpvHXmiCvify9nbgpJg2RTDCYsSCVNikTv7xEvmu6fAMWH8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062080; c=relaxed/simple;
	bh=lhT7iwYwtXJKc+IhukipMS6fRnPyrAWeXo3/GaCdKHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QvOLCbEblhsG4XXzsCISCGZeWnEoKTm94iF30Qw1Ou+UeL3aTzCa+OPFvdZEFuqE9RwmUMmbqjcHUf7hJKA+fLO+BVmtrR+tb4dCjsUniBnOEc8h/IxGMCfv+obsJCSwKdxY8S8KroUYZEYgci2lnQ9EklLRMZYfYsDE0pxeI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDifjVHO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDifjVHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA0C1F00893;
	Wed, 10 Jun 2026 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781062079;
	bh=+/Dzg9MquWj2Fc8a+YhPKPJK1xS5qhCKq11ipKf1dGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDifjVHOAyT+Y77M6U/viloSRYXGoLjswIDMylFeZu/HgMmkPowW72UF9leav9JiF
	 1I+95bk5Z9PFEJwnlQzdyk8C8LdI/FFSHfG0E9osI4PW4RAG16/K8t9k9gRU8hmcaC
	 V5gez5iQtBdgeDx8A5l7KJPFhUeY9JMLH8CLPWqzpKrptrRvL5KsG+tlFOKPe0bsYg
	 bfctvZfpzVJ1i1oSjlFEm3vCsrqaiB8CSxHGnWQ8qXMpZ1RAp+CE8zUTz2DECM/exN
	 MiRyJTNkf6mr6DMiSNfP3bEcg7IslXH0+z0wSnoczifdfblMvcV4E4ZGHmS3Dxz5we
	 Z31nCAGvpBqhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 6/9] net: enetc: add helpers to set/clear
 table bitmap
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260609032955.2066089-7-wei.fang@oss.nxp.com>
References: <20260609032955.2066089-7-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 03:27:58 +0000
Message-Id: <20260610032758.DDA0C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The custom ID allocation helpers deceptively use atomic bit operati=
ons and needlessly reinvent the kernel's IDA framework.
--

commit f37b0be8d3c2fcb9018ffa7dc02a01123fbb4e22
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add helpers to set/clear table bitmap

This commit introduces ntmp_lookup_free_eid() and ntmp_clear_eid_bitmap()
to help allocate and manage entry IDs for NTMP index tables. It uses standa=
rd
bitmap operations to track which IDs are free and which are in use.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/et=
hernet/freescale/enetc/ntmp.c
> index 601435966ed1a..9f38f885ebb52 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> @@ -47,6 +47,30 @@
>  #define RSST_STSE_DATA_SIZE(n)		((n) * 8)
>  #define RSST_CFGE_DATA_SIZE(n)		(n)
> =20
> +u32 ntmp_lookup_free_eid(unsigned long *bitmap, u32 size)
> +{
> +	u32 entry_id;
> +
> +	entry_id =3D find_first_zero_bit(bitmap, size);
> +	if (entry_id =3D=3D size)
> +		return NTMP_NULL_ENTRY_ID;
> +
> +	/* Set the bit once we found it */
> +	set_bit(entry_id, bitmap);

[Severity: Low]
Does this mix of non-atomic find_first_zero_bit() followed by an atomic
set_bit() present a misleading concurrency guarantee in ntmp_lookup_free_ei=
d()?

If this allocation happens under an external lock, would it be more efficie=
nt
to use the non-atomic __set_bit() here?

Since this implements dynamic integer ID allocation, would the standard ker=
nel
IDA framework (ida_alloc() and ida_free()) be a better fit than managing
custom raw bitmaps?

> +
> +	return entry_id;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_lookup_free_eid);
> +
> +void ntmp_clear_eid_bitmap(unsigned long *bitmap, u32 entry_id)
> +{
> +	if (entry_id =3D=3D NTMP_NULL_ENTRY_ID)
> +		return;
> +
> +	clear_bit(entry_id, bitmap);

[Severity: Low]
If external locking is guaranteed for these ID management functions, should
ntmp_clear_eid_bitmap() use the non-atomic __clear_bit() instead of clear_b=
it()?

> +}
> +EXPORT_SYMBOL_GPL(ntmp_clear_eid_bitmap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609032955.2066=
089-1-wei.fang@oss.nxp.com?part=3D6
