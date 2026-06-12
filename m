Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43EB3612F1
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230395; cv=none; b=F/MSuQjSQLASadhLf93rf40UDI0ffEfvHWM+u+Li7ycrbpA4CRdmm8p1rRcF2XZjal+XwwYxKQTfaF6XhLUf7yCb6b/MS5QuhrXtAUUFVBwvVWTHmRkSNksXvdxXJzBlOxopcocnQ13zzxedrJ8GryzLpelXhn1ZYZn+GR3Cvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230395; c=relaxed/simple;
	bh=WIO/JxZqbRQ+KENTw2KmKgPiBxN+Ebgu7TA18SwBTcQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uVUVFesGW0KUCRujz1mDK8ufIDTvEkok/Ejl64QhvcYqWakaEvsihxIAVzeAfGP1qXSFA4DASJsiRBXBs6oaFO4BgDek1E9ht1WMHatcSq2FMpyX3hygDoG2SXON3CYHhyPaDZDCZprD/WJfyyAE6X4LEphh7hlv7hQV2M6TSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FX3qWgZb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FX3qWgZb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1001F000E9;
	Fri, 12 Jun 2026 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781230394;
	bh=VDMyQPzidSTFMcY89ToHRpjr9AovfAP/w0pqgCSraww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FX3qWgZbx17Z8OWXeqHqpxCxLeJN2SXgPviZqLiNNltGM1OEmaidJ4f6qHxM6c10n
	 AMcvR9udCaSsuXzZ5TjYubWN8snHeCRZL/9ggVx4NXgMFulj8aKGG/0jLkHYPM3lkN
	 JZ0M2fNOKvCh4O30Yex9p9LgkUpAtvJOBUQM4UigptBsILRXrsXCioF5MHdBRDP4X8
	 /XTDZIO8I9WinQ8WpvGiVU6qY+uoMqF90S6uDHd2MaCv7ZNCHMgzkEmxxd1JHC1+4m
	 /HuCw+iSF6QyNmywXBCPAdak5QR95+gJPsAtsf0cmTz8I/Gwc6tlwqGL/oQ48zaize
	 +KaSdUK8wgx5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net-next 7/9] net: dsa: netc: add VLAN filter table
 and egress treatment management
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611021458.2629145-8-wei.fang@oss.nxp.com>
References: <20260611021458.2629145-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 02:13:13 +0000
Message-Id: <20260612021314.7C1001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional ETT/ECT allocation wastes hardware entries and may c=
ause VLAN-unaware bridge traffic to egress with internal VLAN tags.
--

commit a87e1b42fde58831d28f51077ba31586a3d890f7
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add VLAN filter table and egress treatment management

This commit implements the DSA .port_vlan_add and .port_vlan_del operations
to enable VLAN-aware bridge offloading on the NETC switch. It maintains
VLAN membership in the VLAN Filter Table and egress tagging through the
Egress Treatment Table.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index d4475ad7ed6c2..9382e7b68e652 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1025,6 +1054,385 @@ static void netc_switch_get_ip_revision(struct ne=
tc_switch *priv)

[ ... ]

> +static int netc_port_add_vlan_entry(struct netc_port *np, u16 vid,
> +				    bool untagged)
> +{
> +	struct netc_switch *priv =3D np->switch_priv;
> +	struct netc_vlan_entry *entry;
> +	struct vft_cfge_data *cfge;
> +	u32 index =3D np->dp->index;
> +	u32 bitmap_stg;
> +	int err;
> +	u16 cfg;

[ ... ]

> +	cfge =3D &entry->cfge;
> +	cfge->et_eid =3D cpu_to_le32(NTMP_NULL_ENTRY_ID);
> +	cfge->bitmap_stg =3D cpu_to_le32(bitmap_stg);
> +	cfge->fid =3D cpu_to_le16(vid);
> +	cfge->cfg =3D cpu_to_le16(cfg);
> +	cfge->eta_port_bitmap =3D cpu_to_le32(priv->port_bitmap);
> +
> +	if (untagged)
> +		entry->untagged_port_bitmap =3D BIT(index);
> +
> +	err =3D netc_add_vlan_egress_rule(priv, entry);
> +	if (err)
> +		goto free_vlan_entry;

[Severity: High]
Should this egress rule allocation be skipped for VLAN-unaware PVIDs?

In netc_port_vlan_egress_rule_changed(), there is a check noting that
VLAN-unaware VIDs have no egress rules. However, netc_port_add_vlan_entry()
unconditionally calls netc_add_vlan_egress_rule() for all VIDs.

When a port joins a VLAN-unaware bridge, netc_port_bridge_join() sets up
the internal PVID by calling netc_port_set_vlan_entry() with
untagged=3Dfalse. Because ETT allocation is unconditional here, it appears
a limited Egress Treatment Table (ETT) and Egress Counter Table (ECT)
group is unnecessarily consumed for each VLAN-unaware bridge instance.

Since untagged=3Dfalse is passed, does this incorrectly configure the ETT
entry to preserve the outer VLAN tag on egress (lacking the
FMTEID_VUDA_DEL_OTAG action)? This could result in hardware transmitting
untagged bridge traffic with the switch's internal PVID (e.g., 4095)
attached, potentially leaking internal configurations.

> +
> +	err =3D ntmp_vft_add_entry(&priv->ntmp, vid, cfge);
> +	if (err) {
> +		dev_err(priv->dev,
> +			"Failed to add VLAN %u entry on port %d\n",
> +			vid, index);
> +		goto delete_vlan_egress_rule;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611021458.2629=
145-1-wei.fang@oss.nxp.com?part=3D7
