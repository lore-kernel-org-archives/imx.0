Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464E42AA6
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892281; cv=none; b=eymU45hyByy4HrK5HkdgMsJMW90rSdfoMGr4DndsUp0uLy87+qYHulJIfg1cP1ZWOrQdwbRTNCBIiRS+8pj/4vU5Gq4nhybDTGnabravN1EB2QYKHLA1Fye08SxjZeVdxIzLGJMYYSdVVlgRrIefhcqiF4vm46pAGG+sG8diu5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892281; c=relaxed/simple;
	bh=S7bSNIQeCviJumcH0CuHN90WNOjMUIFkm4aIlQ+9UUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jtZLZhTK09XXXtzVXS3nvBpT5XdZxOsZ5w6L/BBn2XlFPX/Av7aTlNcsiLhRInrHuR6p90zjlon5KBitBTZcKp36TvH9q4HVsbwbfCA9oCm5zuaUsj+cEVSvWlFRi/CJmT7d175F2JIpovY+rFbjfbfC/9U3bOHw989Ny5FuBgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5mQUdcb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5mQUdcb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269AD1F000E9;
	Wed,  1 Jul 2026 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892278;
	bh=TSjz99DzanwwkHAy4iv7MD+mJ3P/W//Ip6VOzvziJdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j5mQUdcbq/ZquFdGmrPYroDTvdUmRz7s2kcnz2n/TzMe275XiqqJHilDuNR6UfoWG
	 dxw7veRRvjVLn5gRsjwpazircLKM2ZwAhC5zJ1YmfJAv9/HGvybMDT8pIIJV2hbNuZ
	 1a2PTXrPAdWvyA3ydAf/0LFAwhntj4Jgm0Zz75ucgHg22FWKlHAb8sRm3GumW7wUA7
	 SE/Qj64tSo8NpqkX8cUY0fpEk5vIp9fqxWCiZmBYBl9YRzZUwxTaZCFJa5oSROEazV
	 lotvb5i6EA9wF8IlBovOOYez4hEWxNgigwTVbvRs6vebqH+odWfyYuSQjBzCOEUZTG
	 3nWY/wSocL/cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 14/14] net: enetc: use kzalloc_flex() for
 enetc_psfp_gate allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260630072036.382761-15-wei.fang@oss.nxp.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
 <20260630072036.382761-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:51:17 +0000
Message-Id: <20260701075118.269AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing spinlock acquisition in enetc_psfp_destroy_clsflower leadi=
ng to list corruption and Use-After-Free.
- [High] Hardware State Machine Race: Stream ID rules are enabled before St=
ream Gate and Filter actions.
- [High] Dead code in enetc_check_flow_actions completely breaks ACL offloa=
ding for ACCEPT and DROP actions.
--

commit 243d77ea6e389b1f53433a14aee743de29920c42
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use kzalloc_flex() for enetc_psfp_gate allocation

Replace the open-coded struct_size() + kzalloc() pattern with the
kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
removes the intermediate entries_size local variable and makes the
allocation site more concise.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_qos.c
> index 7b17bca24f260..2aa0fcaafcd23 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> @@ -1135,7 +1135,6 @@ static int enetc_psfp_parse_clsflower(struct enetc_=
ndev_priv *priv,
>  	struct flow_action_entry *entry;
>  	struct action_gate_entry *e;
>  	u8 sfi_overwrite =3D 0;
> -	int entries_size;
>  	int i, err;
> =20
>  	if (f->common.chain_index >=3D priv->psfp_cap.max_streamid) {
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

While reviewing this patch, I noticed a few pre-existing issues in the same
file.

> static int enetc_psfp_destroy_clsflower(struct enetc_ndev_priv *priv,
> 					struct flow_cls_offload *f)
> {
[ ... ]
> 	err =3D enetc_streamid_hw_set(priv, &filter->sid, false);
> 	if (err)
> 		return err;
>=20
> 	remove_one_chain(priv, filter);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but is it safe to modify the global lists and=
 free
the filter here without acquiring epsfp.psfp_lock?

enetc_psfp_get_stats() can be called concurrently and it accesses the strea=
m list
without the lock:

drivers/net/ethernet/freescale/enetc/enetc_qos.c:enetc_psfp_get_stats() {
    ...
	filter =3D enetc_get_stream_by_index(f->common.chain_index);
	if (!filter)
		return -EINVAL;
    ...
}

Does this race lead to list corruption or a use-after-free when the stats
function dereferences the concurrently freed filter?

> static int enetc_psfp_hw_set(struct enetc_ndev_priv *priv,
> 			     struct enetc_streamid *sid,
> 			     struct enetc_psfp_filter *sfi,
> 			     struct enetc_psfp_gate *sgi,
> 			     struct enetc_psfp_meter *fmi)
> {
> 	int err;
>=20
> 	err =3D enetc_streamid_hw_set(priv, sid, true);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but does this create a hardware =
state
machine race?

The frontend stream identification rule is enabled here, before the backend
components are configured.

[ ... ]
> 	err =3D enetc_streamgate_hw_set(priv, sgi, true);

Since the backend stream gate is enabled later, is there a window where pac=
kets
could hit uninitialized gate hardware, causing dropped packets or misapplied
policies?

> static struct actions_fwd *
> enetc_check_flow_actions(u64 acts, unsigned long long inputkeys)
> {
> 	int i;
>=20
> 	for (i =3D 0; i < ARRAY_SIZE(enetc_act_fwd); i++)
> 		if (acts =3D=3D enetc_act_fwd[i].actions &&
> 		    inputkeys & enetc_act_fwd[i].keys)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but does this condition completely break ACL
offloading for ACCEPT and DROP actions?

In the enetc_act_fwd table, ACCEPT and DROP actions define their required k=
eys
as 0.

drivers/net/ethernet/freescale/enetc/enetc_qos.c:enetc_act_fwd[] =3D {
    ...
	/* example for ACL actions */
	{
		BIT(FLOW_ACTION_DROP),
		0,
		FILTER_ACTION_TYPE_ACL
	}
};

This means inputkeys & 0 will always evaluate to 0 (false), preventing them
from ever being matched.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630072036.3827=
61-1-wei.fang@oss.nxp.com?part=3D14
