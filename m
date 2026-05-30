Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15F2D0603
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102201; cv=none; b=Ey1Xp8GITLzNVwt4CxyHBSb0WFFqRFj2eQ7hBKuO5GKXbnqqEqBYWEoyrg/8H4yq4OHmkogsU3DsSbIki1KRt30QqVg0o90a2jyW6NJmwugsuBCxssBMzWjLG0qU8NXcqXfhyZNdtEtrCnklfDK3Btx904d6kXpx8Eyaz5xa6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102201; c=relaxed/simple;
	bh=bInsAsL5jQN4Ckh7MUXfWb30d+NadYnesYMEA0JoQDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSUkT4Gct0lrxwOMpPX/M7moCWgNx+Z783RoML4ciyHwRu3NH6Z7sf5JIAPmO5G/eu5HZ6uBIdmwymgLkZwxLY/87xyggmoog8sfs12Wymhjl5vzqfxXM2++B9jE0LoTYU2FaPs6Z208TGmo0znZwphss43OU2Ahg6p4OWYhzwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+FyNYAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+FyNYAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45D91F00893;
	Sat, 30 May 2026 00:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102200;
	bh=alw7AMfWEVi+JdnryQkOezYjiQnxoGH1Fg0djqizxO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+FyNYAff8TDTomNkdHrdn2y9awTisRmd8NpitrlKvQNzLuZSGPORO169rUNkvqGc
	 73e/bkemQvhQW7dYUzQffFihR77EC2X8XNSi2BeUqVxilGK+wITpeLJHmJQwiUkZjv
	 4VdmVxPNAyAfMFOdanKpyFFev3tESefpc9V6Vg3fUrOo3w4ZVvR8r0oCxGP6dapve/
	 jkRy6Yt0I4HESZMjEysv+p5TCelNUgGFhWWGsIdgjvdNBCDncyqGd2q+3mIs/jUAn/
	 LsyWgYQB+Me7GyZVuaF+lik4cxExi6Zy7jEfi6kjvrTqL7WCULJkssVvy655MxipvA
	 DgRXy6nXimmdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/9] net: enetc: add interfaces to manage FDB
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260527100217.794987-2-wei.fang@oss.nxp.com>
References: <20260527100217.794987-2-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:59 +0000
Message-Id: <20260530004959.E45D91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ntmp_fdbt_update_activity_element() fails to filter for dynamic =
FDB entries, causing it to incorrectly match and update the activity elemen=
ts of all entries (including static ones).
--

commit 871b9a0ec7e03bf7ca6a2b118e3fd29a9b0a249e
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: enetc: add interfaces to manage FDB entries

This commit adds four interfaces to manage entries in the FDB table. It
includes functions for deleting entries by key element, updating activity
elements of dynamic entries, deleting aging entries, and deleting port
dynamic entries.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/et=
hernet/freescale/enetc/ntmp.c
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
[ ... ]
> +/**
> + * ntmp_fdbt_update_activity_element - update the aging time of all the
> + * dynamic entries in the FDB table.
[ ... ]
> +int ntmp_fdbt_update_activity_element(struct ntmp_user *user)
> +{
> +	struct fdbt_req_ua *req;
> +	struct netc_swcbd swcbd;
> +	struct netc_cbdr *cbdr;
> +	union netc_cbd cbd;
> +	u32 len;
> +	int err;
> +
> +	swcbd.size =3D sizeof(*req);
> +	err =3D ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	/* Request data */
> +	ntmp_fill_crd(&req->crd, user->tbl.fdbt_ver, 0, FDBT_UA_ACTEU);
> +	req->ak.search.resume_eid =3D cpu_to_le32(NTMP_NULL_ENTRY_ID);
> +

[Severity: Medium]
Does this function accidentally update static FDB entries as well as dynamic
ones?

The function's description states it should update the aging time of all the
dynamic entries. However, since ntmp_alloc_data_mem() uses
dma_alloc_coherent(), the request structure is zero-initialized.

Because the search key configuration match fields (req->ak.search.cfge_mc
and req->ak.search.cfge.cfg) are left as 0, this appears to instruct the
hardware to match all FDB entries rather than restricting the operation to
dynamic entries.

For comparison, ntmp_fdbt_delete_aging_entries() explicitly sets these
fields to enforce the dynamic entry filter:

ntmp_fdbt_delete_aging_entries() {
    ...
    req->ak.search.cfge.cfg =3D cpu_to_le32(cfg);
    req->ak.search.cfge_mc =3D FDBT_CFGE_MC_DYNAMIC;
    ...
}

Could similar filter initialization be missing here?

> +	/* Request header */
> +	len =3D NTMP_LEN(swcbd.size, NTMP_STATUS_RESP_LEN);
> +	/* For activity update, the access method must be search */
> +	ntmp_fill_request_hdr(&cbd, swcbd.dma, len, NTMP_FDBT_ID,
> +			      NTMP_CMD_UPDATE, NTMP_AM_SEARCH);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527100217.7949=
87-1-wei.fang@oss.nxp.com?part=3D1
