Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C2DDC5
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161829; cv=none; b=tyj4Ag7uTgHWC8FKab3X5tCnfJfddBaU/38m8WnvUHw5wZ9L9/Qf0obLUi5Z+WVzpyWpjAYEb3sW/PCR+uWcZKz08o6Mp3fNG1FTNpbsvkzBGkseFpgBDO1Up+2b/9qPkCzJ9EHsuDvGFZIyJybYFAbijorUBfdbdND28lMQUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161829; c=relaxed/simple;
	bh=6a1uVsj3orgv75/FN9LP/a08pRuzo/YQeYF0AQYPNAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/H2a2tE+Pzun8L+kxuT+2BVrcfO3RA73BFmLa9PWz7TpoEBpG+K6plziMNM3WZZlV5YR51tzpkdmZTBzBiWEdI1GnxXQ8SZXCP6MW3nn3XJu+VbLz7JPdAxab0u8d4tA8RhGO8vaR+2qzWv8lCOtuqjDlLGUuh0TX1r7pqIbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqLPh0E9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqLPh0E9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5374F1F000E9;
	Sat,  4 Jul 2026 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161828;
	bh=5AM5tq5tiLlxHrAEDBlds3ZkLRmbIQx7BOnzlZIvjtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dqLPh0E9FsXIsdzTiOJ05NDLPiUkYYr09i/WDw6JzaICLHUHAWOX11Zw8glv5CXSP
	 z6mqIzfQGmTr4sckRIUaWX2qG9GmBcSq8MoOYqQ73MkzKPvSqP2aGWqu2v275dwlTm
	 73l6WnMvSDwYnxonmyQzurY+fKiU4nw9If0dqG018YArOol6nXeBzpjJbxbG+FI9jZ
	 2TeRb0YdSc1J640n6gCbMIfTt0NxzmxF6yUR93bRofZP017RZdYkWEWWtkShF7MwN6
	 jlKKeSAFec+HzB7juHyZ/grwPnkzU0/+8JByFzd4zZi7/BvIjXlaQX1KmEc1qOa69l
	 38CfbJOObPZ4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 14/14] net: enetc: use kzalloc_flex() for
 enetc_psfp_gate allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703101328.550714-15-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 10:43:47 +0000
Message-Id: <20260704104348.5374F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the error rollba=
ck path in `enetc_psfp_hw_set()` breaks existing hardware state by uncondit=
ionally reverting shared resources.
--

commit 6d57d48e343452bcc08a00c11bfae2b630b9f68a
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use kzalloc_flex() for enetc_psfp_gate allocation

This patch replaces the open-coded struct_size() + kzalloc() pattern with
the kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
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
>  	if (!sgi) {
>  		err =3D -ENOMEM;
>  		goto free_filter;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this code I
noticed an issue with the error rollback path in enetc_psfp_hw_set() which =
is
called shortly after this allocation.

When enetc_psfp_hw_set() fails, it unconditionally disables the stream gate=
 in
hardware:

drivers/net/ethernet/freescale/enetc/enetc_qos.c:enetc_psfp_hw_set() {
    ...
    if (fmi) {
        err =3D enetc_flowmeter_hw_set(priv, fmi, true);
        if (err)
            goto revert_sgi;
    }
    ...
revert_sgi:
    enetc_streamgate_hw_set(priv, sgi, false);
    ...
}

Because enetc_psfp_parse_clsflower() allows stream gates to be shared and
reused across multiple filters (via enetc_get_gate_by_index()), could this
rollback path break existing hardware state?

If a user adds a new tc-flower filter that reuses an existing stream gate
index, and a subsequent hardware setup step fails, the error handling path
blindly calls enetc_streamgate_hw_set(..., false). Will this disable the
already active stream gate and break all other filters relying on it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703101328.5507=
14-1-wei.fang@oss.nxp.com?part=3D14
