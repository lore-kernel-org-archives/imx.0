Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22D395AD5;
	Thu, 14 May 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746884; cv=none; b=DTWyYNcRv1ZxQvIiKQpu0pZk7S7LhOLYh+ThIBQ47igCuEUT1EroWbSjKdL4IR3OHurEitz6PybfHNNjYw/ZxKBigjgyO3LbBe5Au78t5jXqkSTEjNl0ofyN7Ge6gMWWv7ra8DUzM8L2fukBvzPNeWBhgh+oijT+tfpowGiJapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746884; c=relaxed/simple;
	bh=LVT8vmF4wdf2KNP0VVYG49J/KyWyvFo+q4Wy9efmW44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IApSfK8KN9qQKb5C0Tj24Jq3gzoZTBO9PGGibiTBiEAUn2QaPj4sWqpYoDhSn63h8tSbsG64BC7VxcyZfaXZRdQDlL+VVYj36Wx8Csc5uNuAuVPfQd84/EDBguu2RdfKxwgtVICCsn2hM5gk3+PAkJOMd1SF1fQ5jZbZTqprxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CADb0RfL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CADb0RfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9B2C2BCB7;
	Thu, 14 May 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746883;
	bh=LVT8vmF4wdf2KNP0VVYG49J/KyWyvFo+q4Wy9efmW44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CADb0RfLxhChXp1G6SNJ9ZZkvG0lOSgCnWPfmEUdYZ9PrFDJ7VNXkQcjzDn8Rhr9q
	 85MLDa7IEyxyg5XbTwOSchrwUQ9gwSrfYsuaT0VF9Vh+ryogOw7y6kb78/i7H1PxY9
	 +SCGQVSvVS8sM5NtSjH2olsfYZCn5vuv+HSM2OCvbgPabYPL3xpjZzwxQlmpsOF6oT
	 ZkK8H1Mi0xrdg5l5Mc8/8Psj8L9vGLu+FgZdYrgB7dF67bAEBiYRpv3U+nppQpgnuA
	 C1TECzkJWukile6aWuVDnYUL9BYg9+K001NzHjQlGWDY8KJXYlgeKf5bPTYX+cO6Lu
	 nPwBX1cBNxZqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 net-next 12/15] net: dsa: netc: add FDB, STP, MTU,
 port setup and host flooding support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, krzk+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513030454.1666570-13-wei.fang@nxp.com>
References: <20260513030454.1666570-13-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:21:22 +0000
Message-Id: <20260514082123.5C9B2C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Standalone port isolation is completely broken due to shared VLAN =
and ignored dsa_db in FDB operations.
--

commit 31eef54688ed02b9e54753924a74c9b8e24c10a6
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add FDB, STP, MTU, port setup and host flooding support

This commit expands the NETC switch driver with foundational features
including FDB/MDB management, STP state handling, MTU configuration, and
host flooding support. It initially supports standalone port mode, using
VLAN 0 as the PVID for ingress frames.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -531,6 +848,278 @@ static void netc_switch_get_ip_revision(struct netc=
_switch *priv)
[ ... ]
> +static int netc_port_fdb_add(struct dsa_switch *ds, int port,
> +			     const unsigned char *addr, u16 vid,
> +			     struct dsa_db db)
> +{
> +	struct netc_port *np =3D NETC_PORT(ds, port);
> +
> +	/* Currently, only support standalone port mode, so only
> +	 * NETC_STANDALONE_PVID (=3D 0) is supported here.
> +	 */
> +	if (vid !=3D NETC_STANDALONE_PVID)
> +		return -EOPNOTSUPP;
> +
> +	return netc_port_set_fdb_entry(np, addr, vid);
> +}

Does this allow cross-talk between standalone ports, bypassing the host
networking stack?

Since all active ports are mapped to a single shared VLAN
(NETC_STANDALONE_PVID =3D 0), they rely on disabled MAC learning and droppi=
ng
unknown frames to maintain isolation.

However, because the dsa_db argument is ignored here, a static FDB entry
added to one port (e.g., via bridge fdb add) is forced into the shared VID =
0,
making it globally visible.

If a packet arrives on a different port destined for this MAC address, will
the hardware switch match the FDB entry and forward it directly between the
ports?

[ ... ]
> @@ -796,6 +1396,7 @@ static int netc_switch_probe(struct pci_dev *pdev,
>  	ds->num_tx_queues =3D NETC_TC_NUM;
>  	ds->ops =3D &netc_switch_ops;
>  	ds->phylink_mac_ops =3D &netc_phylink_mac_ops;
> +	ds->fdb_isolation =3D true;
>  	ds->priv =3D priv;
>  	priv->ds =3D ds;

How does the ignored dsa_db argument in the FDB callbacks interact with this
fdb_isolation declaration? Drivers that set fdb_isolation to true usually
receive the bridge database through the dsa_db argument to isolate FDBs of
multiple bridges or standalone ports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513030454.1666=
570-1-wei.fang@nxp.com?part=3D12
