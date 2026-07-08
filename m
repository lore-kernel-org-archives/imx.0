Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934A137923
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500513; cv=none; b=TZdG4Q+BGSkZhaKx1XAa65RBe7yMsVj8fqLGu243Ae0oxGWQX2YLggWOT0+0kRMvEcq2vCd4Df9MWztzB66OQPdKtP+M2Swm1Z3+gCzvfJEaiywx7vU/PWMyHUuNz7cK/xi5eAWJ8ckfmZUmAfxpTOsJc/ajgiBqRUQuFcoJJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500513; c=relaxed/simple;
	bh=1UNVT+cA427/Rje3vUJ9pjWy+H9INMvEUyAzDOBxugo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XOxVfwaD1OlDE7cJfH70BKBl0MSvwde8buHwKBGELgLGrFfi8tP6EYpGfjea40x2se5SmtNptC0YvEGY+565mxdPCPALeeTzkqekE6VQOc0noK4xH33rqy3Rr5DVt8m9E5JLbpnIV13rAeXvHj0wOWaSOgplP+VMmqdB3VPxMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ0GzY6Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ0GzY6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ECC1F00A3A;
	Wed,  8 Jul 2026 08:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500512;
	bh=69E73cMVKsRgoa8H9AWO3okc62dj7DFVBADzAj1P1kg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJ0GzY6Y7jHi9zrAoIvRb1bWl1zPmPBxnWRmp2ZUuOvWhCpEh8RtzZuKRqJAQ06lU
	 kwFxNKh3THTKvVkwNqK7ttrjnv4f08QxcppyzHO04z/s0+8uidFJPD/dqVmm5axaoB
	 5KZqtMXvKNdIbo+vEqspV7rNjOKPtzDqvR0szCyB7tvxQ7DZFsFK18pIZ6t6DJoG4P
	 cWx9CdXOGli+3ffUztBZHrVJtCm5smAcEXDF4UgKRGF/SLY1Jpi/4LZad7uKgTODXG
	 /Aj/1i5AO6L4oKSlAcFSvf2+N/+j4nY5pLSk9kVaye6SrdLOALSz4+FdLrAgkrybXm
	 Qg41bbZSM4naQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 14/14] net: enetc: use kzalloc_flex() for
 enetc_psfp_gate allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260707081834.710730-15-wei.fang@oss.nxp.com>
References: <20260707081834.710730-1-wei.fang@oss.nxp.com>
 <20260707081834.710730-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:48:31 +0000
Message-Id: <20260708084832.33ECC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Inconsistent locking around the `epsfp` global state lists risks c=
oncurrent access issues, such as list corruption or use-after-free, particu=
larly during stats polling.
--

--- Patch [14]: [PATCH v4 net-next 14/14] net: enetc: use kzalloc_flex() fo=
r enetc_psfp_gate allocation ---
commit 1354b34382c1b22bf61c564f93df2dfb8dea78a7
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use kzalloc_flex() for enetc_psfp_gate allocation
   =20
Replace the open-coded struct_size() + kzalloc() pattern with the
kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
removes the intermediate entries_size local variable and makes the
allocation site more concise.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_qos.c
> index 7b17bca24f260..2aa0fcaafcd23 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c

[ ... ]

> @@ -1242,8 +1241,7 @@ static int enetc_psfp_parse_clsflower(struct enetc_=
ndev_priv *priv,
>  		goto free_filter;
>  	}
> =20
> -	entries_size =3D struct_size(sgi, entries, entryg->gate.num_entries);
> -	sgi =3D kzalloc(entries_size, GFP_KERNEL);
> +	sgi =3D kzalloc_flex(*sgi, entries, entryg->gate.num_entries);

[Severity: High]
This isn't a bug introduced by this patch, but is there a risk of list
corruption or a use-after-free due to inconsistent locking around the epsfp
global state lists?

Looking at enetc_psfp_destroy_clsflower(), it calls remove_one_chain()
without holding epsfp.psfp_lock:

enetc_qos.c:enetc_psfp_destroy_clsflower() {
    ...
	remove_one_chain(priv, filter);
    ...
}

Which then unlinks and frees the filter memory without list-protection
locks or RCU mechanisms:

enetc_qos.c:remove_one_chain() {
    ...
	hlist_del(&filter->node);
	kfree(filter);
    ...
}

If this destruction runs concurrently with stats polling, such as a user
executing tc filter show or the background stats timer, the reading path
can be actively iterating the list locklessly:

enetc_qos.c:enetc_get_stream_by_index() {
    ...
	hlist_for_each_entry(f, &epsfp.stream_list, node)
    ...
}

Could this concurrent hlist_del() and kfree() during a lockless
hlist_for_each_entry() traversal lead to a use-after-free or a kernel
panic?

>  	if (!sgi) {
>  		err =3D -ENOMEM;
>  		goto free_filter;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707081834.7107=
30-1-wei.fang@oss.nxp.com?part=3D14
