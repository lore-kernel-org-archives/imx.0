Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3637199385
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780710387; cv=none; b=m7bS1bhZdMqo/j2QirdKVv2hY0W8BHePtiwpZ1ruW9lEuwtE8dBLQz7H8lwajWwM6gnGzwSYixCuyevg+8pKaGcZByvtr3nu/VoU4Fdf+ihuMvRQQWsusNK1G0J1GZaj2JBErQtHyQhUrN73Ypb2O27jC7l0fgJzjqb0D2obbvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780710387; c=relaxed/simple;
	bh=+ALvsYQ8V33Cdss6z5a98EoH/Dz+epQ11Dde/jkPvFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uf2+JlEmBfnPti0XyX/HK2BrvHaI8Hzd6gwQgRBz+H9wRf8+1VDEPfyeRMHeFt1qL9Tfp+vtCITa7/dcG3/9vGVWt53/sRzvMhmEmHqVDG6u0j6v8uF1orM96667n9hTqcBbyiuc6Z0mRX37U84ZQM97mggUXjHWCqG7+5Yj38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUaaBf04; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUaaBf04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266211F00893;
	Sat,  6 Jun 2026 01:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780710386;
	bh=YrNz5Vxx40fqruA8Rr6EG742jvEzDy6YmsJP2+WEW+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUaaBf047PsR9SSOrty05nMF1H9IXw6V6ufrz364BfUMKcTATPMt19Lhcm8/A8p2/
	 Wp7OX42Eq18aaCDmMjVn0Mx4cXDsCBoxqsGIPLp+Vlf4zZBjT66q83wBqDazUB2llW
	 jOlcoSATikWxs5aAc/XDTl1kjYIlg95aVgjacCH1LbBf8RjZpGDt3rL0n+IgGvAN49
	 IJzft2KKU3uhYIHEeXVyxFnlUdD/iNoLn8dWHhvLTJ8JzCRCOJTWr1owQ9gIXvx3l8
	 KcAqRsAF7yoHlVtOHPv2lmhsXVLBlHEDBnhlHlvQ0+w0uuUvDkgoKHEuCShWWtyHyL
	 e65pvq6kgI/9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 7/9] net: dsa: netc: add VLAN filter table
 and egress treatment management
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260605014808.686024-8-wei.fang@oss.nxp.com>
References: <20260605014808.686024-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 01:46:25 +0000
Message-Id: <20260606014626.266211F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Updating a port's VLAN egress rule silently detaches its egress =
hardware counter, disabling frame statistics for that VLAN.
--

commit 4056013f517b3e78e014631a8d3dc63d5fcc0d56
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add VLAN filter table and egress treatment management

This commit implements the DSA .port_vlan_add and .port_vlan_del operations
to enable VLAN-aware bridge offloading on the NETC switch. It maintains
VLAN membership in the VLAN Filter Table (VFT) and handles egress tagging
through the Egress Treatment Table (ETT). Egress counters are updated
when egress rules change.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1025,6 +1054,384 @@ static void netc_switch_get_ip_revision(struct ne=
tc_switch *priv)
[ ... ]
> +static int netc_port_update_vlan_egress_rule(struct netc_port *np,
> +					     struct netc_vlan_entry *entry)
> +{
> +	bool untagged =3D !!(entry->untagged_port_bitmap & BIT(np->dp->index));
> +	u32 num_ports =3D netc_num_available_ports(np->switch_priv);
> +	u32 ett_eid =3D le32_to_cpu(entry->cfge.et_eid);
> +	struct netc_switch *priv =3D np->switch_priv;
> +	u32 ect_eid =3D NTMP_NULL_ENTRY_ID;
> +	int err;
> +
> +	if (ett_eid =3D=3D NTMP_NULL_ENTRY_ID)
> +		return 0;
> +
> +	ett_eid +=3D np->ett_offset;
> +	err =3D netc_update_ett_entry(priv, untagged, ett_eid, ect_eid);

[Severity: Medium]
Does this silently detach the egress hardware counter when a port's VLAN
egress rule is dynamically updated?

It appears ect_eid is initialized to NTMP_NULL_ENTRY_ID and passed directly
into netc_update_ett_entry() before the correct value is calculated.

Because ect_eid is NULL during this call, it looks like netc_init_ett_cfge()
will clear the ETT_ECA_INC flag and drop the ec_eid mapping for the Egress
Treatment Table (ETT) entry.=20

> +	if (err) {
> +		dev_err(priv->dev,
> +			"Failed to update VLAN %u egress rule on port %d\n",
> +			entry->vid, np->dp->index);
> +		return err;
> +	}
> +
> +	if (entry->ect_gid !=3D NTMP_NULL_ENTRY_ID) {
> +		/* Each ETT entry maps to an ECT entry if ect_gid is not NULL
> +		 * entry ID. The offset of the ECT entry corresponding to the
> +		 * port in the group is equal to ett_offset.
> +		 */
> +		ect_eid =3D entry->ect_gid * num_ports + np->ett_offset;

The actual ect_eid isn't calculated until here, at which point the ETT entry
has already been updated without the counter reference, which would stop
hardware frame counting for this VLAN. Could the calculation of ect_eid be
moved before the netc_update_ett_entry() call?

> +		ntmp_ect_update_entry(&priv->ntmp, ect_eid);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605014808.6860=
24-1-wei.fang@oss.nxp.com?part=3D7
