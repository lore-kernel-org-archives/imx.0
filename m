Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED820010A
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780710388; cv=none; b=Bc+c9Ev04kqvw/atGsoArejdUJkpZdZVspqb/TpPiHL59sNby26NXsY7YaC2a6ZZ3XbsPC/PZps4df5h+EfCagu9kAEw/kfaa9nMcEvKpT9SRJr7p78i8Ve0Oc8ew2/Yo8w9kPl2H+kq03ajnlnx2272csYVKd+H/1t6Z7tfOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780710388; c=relaxed/simple;
	bh=TXOh6Kjk8a69ogYL2xoRe5roGZiuLpG0aFuZHTD42Tw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsNuKbyOsdURJb0SPB0UyEoEFGEUKl5d0rbfDDJFIKeLe9RfzijIN+E8JpIdhd7vRY/DjsX/ka/T70sk4CvULqlXJAlIihgkeRvmtFCAZU0cYGkLooWRBGrWKqhsqnnbItvDWYnkDUYDVvm2YsJ25L3lYK0BCjrOuaEdngv3OVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOC6DllL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOC6DllL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E3A1F00898;
	Sat,  6 Jun 2026 01:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780710386;
	bh=pyIHRT1xC2/k28tgBtgIPnljr68D8ZRiUoFAIfPRRbw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SOC6DllLBjZV8o7WCKHn9ELirsBDLCXSRKS5UdcuqXdhjl+vo0FSBEetYucFG/U4H
	 joI3f/GURqNzpIYZJCsKQLg4mz5RabIaBkl7wsJZd/a+ZOul4G/Qc5RiQb7tOtZBk8
	 h7EivtSpTo1A9rKCcQQNaMZIGalpzpZx/pPXOwOF7j35QV/XybpxO5VyyT4ubiCeS3
	 ZfuvlZAheUf175m9iGYAA/9IWaAa/yPW6brXANuxuiv8x7l5oGyxFC8VbA1JXhqFcp
	 H+G/bbezWoEMw0n1XyEAsGagwK31AfUg6EQamnxzEZ0vQX9Xq7mMb72Io+TkZXcg0G
	 w107Bwhso9/eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 8/9] net: dsa: netc: add bridge mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605014808.686024-9-wei.fang@oss.nxp.com>
References: <20260605014808.686024-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 01:46:26 +0000
Message-Id: <20260606014626.B0E3A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The single VLAN-aware bridge hardware constraint check is flawed a=
nd can be bypassed.
- [High] Bridge local FDB entries for the CPU port are programmed with an i=
ncorrect VID, breaking isolation and causing flooding.
- [High] Leaving a VLAN-aware bridge leaks the internal `vlan_unaware_pvid`=
 VFT entry on the port.
- [Medium] netc_port_vlan_del() allows userspace to delete reserved interna=
l VLAN-unaware PVIDs.
--

commit 56631fc478ea7d8a7fc4058458dbf43145fd56c5
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: add bridge mode support

This commit wires up the port_bridge_join, port_bridge_leave, and
port_vlan_filtering DSA callbacks to support both VLAN-unaware and
VLAN-aware bridges. It manages PVIDs dynamically and uses the hardware
VLAN Filter Table to enforce isolation. Only one VLAN-aware bridge is
supported by the hardware at a time.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 1e1873528ccc0..b61152c16e7be 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -1509,17 +1553,50 @@ static int netc_port_max_mtu(struct dsa_switch *d=
s, int port)
[ ... ]
> +static int netc_port_fdb_add(struct dsa_switch *ds, int port,
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
> +		vid =3D netc_vlan_unaware_pvid(np->dp);

[Severity: High]
Does this cause bridge local FDB entries for the CPU port to be programmed
with the wrong VID?

When the DSA core offloads a bridge's local MAC address, it calls
netc_port_fdb_add() on the CPU port with db.type =3D=3D DSA_DB_BRIDGE. Since
the CPU port is never a direct member of any bridge, resolving the target
VID by inspecting the port's bridge membership with
netc_vlan_unaware_pvid(np->dp) will return NETC_STANDALONE_PVID (0).

This would cause the CPU port FDB entry to be programmed in VID 0 instead
of the bridge's internal PVID, leading to Unknown Unicast flooding across
user ports for incoming traffic directed to the bridge IP.

[ ... ]
> @@ -1528,10 +1605,14 @@ static int netc_port_fdb_del(struct dsa_switch *d=
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
> +		vid =3D netc_vlan_unaware_pvid(np->dp);

[Severity: High]
Could the same erroneous VID resolution exist in the deletion path here,
causing FDB cleanup to fail or target the wrong VID?

[ ... ]
> @@ -1704,12 +1809,85 @@ static void netc_port_set_host_flood(struct dsa_s=
witch *ds, int port,
[ ... ]
> +static int netc_single_vlan_aware_bridge(struct dsa_switch *ds,
> +					 struct netlink_ext_ack *extack)
> +{
> +	struct net_device *br_ndev =3D NULL;
> +	struct dsa_port *dp;
> +
> +	dsa_switch_for_each_available_port(dp, ds) {
> +		struct net_device *port_br =3D dsa_port_bridge_dev_get(dp);
> +
> +		if (!port_br || !br_vlan_enabled(port_br))
> +			continue;

[Severity: High]
Does this check rely on the outdated software state of the bridge rather
than the target state of the ongoing switchdev operation?

When transitioning to VLAN-aware, br_vlan_enabled(port_br) might still
evaluate to false because the bridge core hasn't updated its state yet.

[ ... ]
> +static int netc_port_vlan_filtering(struct dsa_switch *ds,
> +				    int port, bool vlan_aware,
> +				    struct netlink_ext_ack *extack)
> +{
> +	struct netc_port *np =3D NETC_PORT(ds, port);
> +	u16 pvid;
> +	int err;
> +
> +	err =3D netc_single_vlan_aware_bridge(ds, extack);

[Severity: High]
Since netc_single_vlan_aware_bridge() doesn't use the vlan_aware argument
provided here, could this allow a second VLAN-aware bridge to be enabled?
This would bypass the hardware constraint of only supporting one VLAN-aware
bridge at a time and break port isolation.

[ ... ]
> @@ -1717,20 +1895,157 @@ static int netc_port_vlan_add(struct dsa_switch =
*ds, int port,
[ ... ]
>  static int netc_port_vlan_del(struct dsa_switch *ds, int port,
>  			      const struct switchdev_obj_port_vlan *vlan)
>  {
>  	struct netc_port *np =3D NETC_PORT(ds, port);
> +	int err;
> =20
>  	if (vlan->vid =3D=3D NETC_STANDALONE_PVID)
>  		return 0;
> =20
> -	return netc_port_del_vlan_entry(np, vlan->vid);
> +	err =3D netc_port_del_vlan_entry(np, vlan->vid);

[Severity: Medium]
Is it possible for userspace to delete reserved internal VLAN-unaware PVIDs
here?

netc_port_vlan_add() explicitly rejects user attempts to add these VIDs
with a check for vlan->vid >=3D NETC_VLAN_UNAWARE_PVID(ds->max_num_bridges),
but netc_port_vlan_del() lacks a similar bounds check.

If a user issues a command to delete the internal PVID, could this break
the forwarding plane for that port in the VLAN-unaware bridge?

[ ... ]
> +static void netc_port_bridge_leave(struct dsa_switch *ds, int port,
> +				   struct dsa_bridge bridge)
> +{
[ ... ]
> +	if (br_vlan_enabled(bridge.dev))
> +		return;
> +
> +	vlan_unaware_pvid =3D NETC_VLAN_UNAWARE_PVID(bridge.num);
> +	/* There is no need to check the return value even if it fails.
> +	 * Because the PVID has been set to NETC_STANDALONE_PVID, the
> +	 * frames will not match this VLAN entry.
> +	 */
> +	netc_port_del_vlan_entry(np, vlan_unaware_pvid);
> +}

[Severity: High]
Could this return early for VLAN-aware bridges and leak the internal
vlan_unaware_pvid VFT entry on the port?

When a port leaves a VLAN-aware bridge, the DSA core first restores VLAN
filtering to false by calling netc_port_vlan_filtering(..., false). Because
dp->bridge is still set at this point, netc_port_vlan_filtering() will
inject the bridge's internal unaware PVID into the hardware VFT.

Immediately after, netc_port_bridge_leave() is called. If it returns early
here, it skips the cleanup of vlan_unaware_pvid. The now-standalone port
would permanently retain hardware membership in the bridge's internal VFT,
which breaks port isolation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605014808.6860=
24-1-wei.fang@oss.nxp.com?part=3D8
