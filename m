Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333D3FFF82
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 02:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600014; cv=none; b=ixncLeNdAxYIKfefIxcJyXRCM/E7EU4JVSf6NCRAQ4MH7CKe9UdMTPu2FxjPPeATkVUuTfh0zml5Gsmn7phIViL61koEDTEI8VdK2Uc3yZD4RdvwsCfCjfVRaXEfAjFIRTlYqcqk/hKlcEHNv4KZicFWvLV/zL+8IIx3o9gwZeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600014; c=relaxed/simple;
	bh=7sabCLkcd8HaRLxtwabuh/UC5GNs1dCJKVRlklVnUkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ov3BtpgJTXNHr/VL1aF09GAxI/iCLiL9Mr9PNT890ZEaCo9uNtXXy4Zy8F9hVSqQpsW0u6iL2lVCJJIQfl/kJRRGD10qNt3F2jRcMMV5qQqZDUNwzv8R4C9qe2MkCyZWGQSvt9ML3Fc/w4Zyc84fmRd9sxJUKRzGVb+JFQipYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl3OWgRN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl3OWgRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621631F00A3A;
	Tue, 21 Jul 2026 02:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784600013;
	bh=xDpqq11fYbS566xDF9Vy2fDi3OR04WyJrliQHSGdAQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dl3OWgRNRPdrcBhdb9pwRhmv2qIpBPd0AjC5jy788Qxnj0fAjuJ+PdQY/B3thTEiX
	 abPyK56u93ODRxzJpvWwpQjwyhW4M8PQrbOdOr7IgqD+oV4IGhreFvjR5KlCCPTV4X
	 WiURJ+i8xteNe5QCYpj7lGls21KZbHUKdwB87ha7FlgPlyzH+ZSB7l4euWJZF8NjuZ
	 hYpoxEU4Bjp1AGxTgjU68XlY4ZimGC/n3JZRwKY9rRMtiKqxMdjk38LWcbR7mjscTQ
	 NrFPbwJrKB9XBLiv+8V8mpqcs4inJreLISr33xJSa13k3kUBlYIpM53ZAzhPaizOnI
	 8phpB1vgeGbyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 net-next 14/14] net: enetc: use kzalloc_flex()
 for enetc_psfp_gate allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260720014317.1059359-15-wei.fang@oss.nxp.com>
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:13:33 +0000
Message-Id: <20260721021333.621631F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] List modifications in enetc_psfp_destroy_clsflower lack spinlock p=
rotection, leading to race conditions and potential Use-After-Free.
--

--- Patch [14]: [PATCH RESEND v4 net-next 14/14] net: enetc: use kzalloc_fl=
ex() for enetc_psfp_gate allocation ---
commit ac1613be27ea215665e4d0f49e1b480f054aa27f
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use kzalloc_flex() for enetc_psfp_gate allocation

This commit replaces the open-coded struct_size() + kzalloc() pattern with
the kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
removes the intermediate entries_size local variable.

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
This is a pre-existing issue, but is it possible for concurrent TC commands
to cause a use-after-free with the shared epsfp lists?

In enetc_psfp_destroy_clsflower(), remove_one_chain() is called:

    remove_one_chain(priv, filter);

This executes hlist_del(&filter->node) and kfree(filter) on the globally
shared epsfp.stream_list without acquiring epsfp.psfp_lock.

Concurrently, enetc_psfp_get_stats() iterates this list locklessly:

    filter =3D enetc_get_stream_by_index(f->common.chain_index);

If a user issues "tc -s filter show" concurrently with "tc filter del",
could the lockless iteration in enetc_psfp_get_stats() access the filter
freed by remove_one_chain(), leading to memory corruption?

Additionally, does the unlocked deletion race with locked insertions in
enetc_psfp_parse_clsflower() causing list corruption?

>  	if (!sgi) {
>  		err =3D -ENOMEM;
>  		goto free_filter;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720014317.1059=
359-1-wei.fang@oss.nxp.com?part=3D14
