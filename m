Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27A30675C
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062081; cv=none; b=HfI5M9Q35idOfoy9wccO2JOMTcOv774PKkJ3a8o0gc9ICRGWb1srP07qbmSTDqx2VZGlOfvkht4KUsLgR3lgz47/VeMOjzcTe3+cR9MX5mEy8Tl91PMh9XxEntsvn19CWvJaCWQ4twDxPwLxoXvXZel/8a56IM8N2S3NlQVp3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062081; c=relaxed/simple;
	bh=6znvkpM2gDi3AGwMFVLYwYr024uEzdI2T4nzv7iGbZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PXJ/aABdGaXhvoLPwKbZtMSwNHu40z/8zyl06Sghb6Sm6m0vDu4XXC5MlmF/DUx0yjteAoTqu2eHMjv3JC19kg6dzuYdI+xY9IYpKbzEz/dqRSjD5Z7SbSmV2lExNqu9ig7E0cfLpDExBnrV6+huHzZNU3V08CJgL7AjqEyL/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyZUXZpI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyZUXZpI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508131F00899;
	Wed, 10 Jun 2026 03:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781062080;
	bh=OkOQUYuyoAAngZ967d8Ju5Tu95pPbP5DeaJAjZRXWOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KyZUXZpI4HRtkc0jce2DZMisLLYqIsdxIiKaO+p37FKHUFoL8M8ORd5mwsuxh94MG
	 BTqPD1PX2mQWBAyLuWPvXxJm5fqsZEKHMa6nLHMvQ9sijIWpxO1BlNxJm+XG4bmCEh
	 99MeDGWDwF68asNl8djqgX7txn9P446msV2MZFA0NkaAjGJNLCVw1KhBi6lDF2huhv
	 aBitKy7DZmeSwQLp/kJjtxLzzWFveSfv9JeoMUgRCHL66N1BZMwRPiKtleyzqYVq5E
	 MZ2GVjML7WKeYA9tytlBMoYvMYDAyRnbE9S8g4Qa4nxcmE7/o9tKO539SpDBCvPqkt
	 pa74/uKw4nTXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 7/9] net: dsa: netc: add VLAN filter table
 and egress treatment management
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260609032955.2066089-8-wei.fang@oss.nxp.com>
References: <20260609032955.2066089-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 03:27:59 +0000
Message-Id: <20260610032800.508131F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] netc_port_update_vlan_egress_rule() incorrectly checks ett_eid ins=
tead of ect_eid before issuing an Egress Counter Table update, causing a ha=
rdware fault when ECT entries are exhausted.
--

commit daf8e6338d85480e82a01b715bb6d429fae4862d
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add VLAN filter table and egress treatment management

Implement the DSA .port_vlan_add and .port_vlan_del operations to enable
VLAN-aware bridge offloading on the NETC switch.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1025,6 +1054,385 @@ static void netc_switch_get_ip_revision(struct ne=
tc_switch *priv)
> +static int netc_port_update_vlan_egress_rule(struct netc_port *np,
> +					     struct netc_vlan_entry *entry)
> +{
> +	bool untagged =3D !!(entry->untagged_port_bitmap & BIT(np->dp->index));
> +	u32 num_ports =3D netc_num_available_ports(np->switch_priv);
> +	u32 ett_eid =3D le32_to_cpu(entry->cfge.et_eid);
> +	struct netc_switch *priv =3D np->switch_priv;
> +	u32 ect_eid =3D NTMP_NULL_ENTRY_ID;
> +	int err;

[ ... ]

> +	if (entry->ect_gid !=3D NTMP_NULL_ENTRY_ID)
> +		/* Each ETT entry maps to an ECT entry if ect_gid is not NULL
> +		 * entry ID. The offset of the ECT entry corresponding to the
> +		 * port in the group is equal to ett_offset.
> +		 */
> +		ect_eid =3D entry->ect_gid * num_ports + np->ett_offset;
> +
> +	ett_eid +=3D np->ett_offset;
> +	err =3D netc_update_ett_entry(priv, untagged, ett_eid, ect_eid);
> +	if (err) {
> +		dev_err(priv->dev,
> +			"Failed to update VLAN %u egress rule on port %d\n",
> +			entry->vid, np->dp->index);
> +		return err;
> +	}
> +
> +	if (ett_eid !=3D NTMP_NULL_ENTRY_ID)
> +		ntmp_ect_update_entry(&priv->ntmp, ect_eid);

[Severity: High]
Should this check ect_eid instead of ett_eid before updating the counter
entry?

When Egress Counter Table (ECT) entries are exhausted, entry->ect_gid will
be NTMP_NULL_ENTRY_ID and ect_eid will keep its default value of
NTMP_NULL_ENTRY_ID. Because ett_eid was previously incremented by
np->ett_offset, it is guaranteed to be non-null here even if ECT entries
were exhausted.

As a result, ntmp_ect_update_entry() could be executed with
ect_eid =3D NTMP_NULL_ENTRY_ID, which would submit an out-of-bounds index
update to the switch hardware and cause a command bus error.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609032955.2066=
089-1-wei.fang@oss.nxp.com?part=3D7
