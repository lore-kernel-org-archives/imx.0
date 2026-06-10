Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562943093C1
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 03:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062082; cv=none; b=gkHpL3dHECAWd1hX/XtHTl9B9CsrP4XHXJcBNM4/Kqc+PR0WAtV4XtuAEo+ZknsblzQfzi41w6IYZKsWrXZdRJ7sBCWTAuk9dALTGB2KzsBDdnakDCHQj72Sh4wK3xJco7aDOndEqqQpzKqH4sNGUn/Fod+HUzKd53PVIxb0FJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062082; c=relaxed/simple;
	bh=9oOJQcOE7PbQgwc4C5Ew5V8ljGXEj1WmkXNkNsiPe4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lpx3ei/53xEvhdUGRLJZt0DDmH1t4RZQEwDX8QUdQ1tcIcIuZldR+agcCdGcII4mZ240128Fd3zl2CiQmnAs91wCzuuETwH0UHDNm1dDXQRjsobdkHyTDewOsMcuSGJej1Ir0sewF2ktPnDLVxcA8jvehGAbkF62+Q5uFM33FX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MF8ihmJD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MF8ihmJD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C8C1F00893;
	Wed, 10 Jun 2026 03:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781062081;
	bh=EtRQWrCE03iFU52KHe8J11N9ehm8KcRpDaJtLpI+IUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MF8ihmJDG64efsWRZ3MOqBo8BMqudeguI7sY98AB98dDlq1oqG8W30nZkKp85rMx2
	 xD4bUnkyr+LFolXINIxQCnyCNglfwQMBhzXnwZ3IoBc2QOFKGy9HK6IHDIrgTxYhoV
	 gkp01U2Zwb8ATccnq3uBnS3QAEEGBr9AeMM7JBCgyzG7eZqdrk5iwteOdqZauzcRZe
	 kMW7JzjviD+mnfHkvHXRZUM+wH7yQent1Ub2cetrVA6ISK7qFyqVjZ9sDTvYZEoL+a
	 OHiIiNAJEeh5jz4ewUofywP73SZnwTE4sj60go5A5NzRO5HFo1ha9mN5cQ7tbv1RZZ
	 Pr8JQ7MUZwNHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 8/9] net: dsa: netc: add bridge mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260609032955.2066089-9-wei.fang@oss.nxp.com>
References: <20260609032955.2066089-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 03:28:00 +0000
Message-Id: <20260610032801.07C8C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Static FDB entries with VID 0 on a VLAN-aware bridge are incorrect=
ly mapped to the bridge's internal VLAN-unaware PVID, breaking forwarding f=
or unspecified VLANs.
--

commit 2c77a1dbe137ce8f6001205692208e4092133f9f
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add bridge mode support

This commit wires up the port_bridge_join, port_bridge_leave, and
port_vlan_filtering DSA callbacks to support both VLAN-unaware and
VLAN-aware bridge modes. It introduces a dedicated internal PVID for
VLAN-unaware bridges and manages dynamic FDB entry flushing.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index fcca22da08d87..299a9e76b9aa9 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -1510,17 +1554,50 @@ static int netc_port_max_mtu(struct dsa_switch *d=
s, int port)
[ ... ]
>  static int netc_port_fdb_add(struct dsa_switch *ds, int port,
>  			     const unsigned char *addr, u16 vid,
>  			     struct dsa_db db)
>  {
> +	struct net_device *br_ndev =3D netc_classify_db(db);
>  	struct netc_port *np =3D NETC_PORT(ds, port);
> =20
> -	/* Currently, only support standalone port mode, so only
> -	 * NETC_STANDALONE_PVID (=3D 0) is supported here.
> -	 */
> -	if (vid !=3D NETC_STANDALONE_PVID)
> -		return -EOPNOTSUPP;
> +	if (IS_ERR(br_ndev))
> +		return PTR_ERR(br_ndev);
> +
> +	if (!vid)
> +		vid =3D netc_vlan_unaware_pvid(br_ndev ? &db.bridge : NULL);

[Severity: High]
Will this unconditionally map VID 0 entries to the bridge's internal
VLAN-unaware PVID, even if the bridge has VLAN filtering enabled?

When an FDB entry is added without a specific VLAN (VID 0) - such as local
port MAC addresses automatically added by the bridge core - it appears this
code translates it to the unaware PVID (e.g., 4095). However, if the bridge
is VLAN-aware, the port's ingress traffic uses the user-configured PVID or
explicitly tagged VLANs, not the unaware PVID.

Since this patch also removes the host flood rule when a port joins a bridg=
e,
traffic destined to the local machine would miss the FDB lookup and be trea=
ted
as unknown unicast. Could this result in local traffic being leaked to other
ports via flooding, or dropped entirely if unknown unicast flooding is
disabled?

> =20
>  	return netc_port_set_fdb_entry(np, addr, vid);
>  }
> @@ -1529,10 +1606,14 @@ static int netc_port_fdb_del(struct dsa_switch *d=
s, int port,
>  			     const unsigned char *addr, u16 vid,
>  			     struct dsa_db db)
>  {
> +	struct net_device *br_ndev =3D netc_classify_db(db);
>  	struct netc_port *np =3D NETC_PORT(ds, port);
> =20
> -	if (vid !=3D NETC_STANDALONE_PVID)
> -		return -EOPNOTSUPP;
> +	if (IS_ERR(br_ndev))
> +		return PTR_ERR(br_ndev);
> +
> +	if (!vid)
> +		vid =3D netc_vlan_unaware_pvid(br_ndev ? &db.bridge : NULL);

[Severity: High]
Does the same unconditional translation happen here during FDB entry deleti=
on,
potentially preventing VID 0 entries from being removed from the hardware if
the bridge is VLAN-aware?

> =20
>  	return netc_port_del_fdb_entry(np, addr, vid);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609032955.2066=
089-1-wei.fang@oss.nxp.com?part=3D8
