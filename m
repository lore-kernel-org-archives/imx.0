Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E62D73B5
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102204; cv=none; b=JAOr+JUVhLlElhzpebUSwl/U7u4SEagLk6JcRd/drQqa6lE5j5vLjJ1I/D3qqb93XLlsGjDBL+UwzL3uqlLBQ4U6abQG0cWJXHxMo2Gh1QNNLJ6N+TAunDRED/x+/wG2Pp1ZM3zlft28xw2bry+7m2XngA6ybEqSICNBlENj6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102204; c=relaxed/simple;
	bh=UMycd3qgXxrJfgprw8DzG2ePscHTs9Ad19FP/oI/rrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iz2Xd2Oz7HmpndfXGiUE7xKxEDFLnVqJ/U9Qz+qLnXAhny4l5nsvmgujRafF7KNb3glNkymjfeViOhEzVs8Bp51Qch7SXdYVEsXeuntkn1aSX4A3C4ZfaJEgONJi+OKIfur3nWtKlCOxZhf5mIg+1ekGB5v7eTgD0fa/0zIn0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/+0CejU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/+0CejU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4651F00893;
	Sat, 30 May 2026 00:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102203;
	bh=VIbX9AmQ+ecTdgIfan9YSz5lkcGRXhKPnq6vf1BAPvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/+0CejUqfABZKgzIMHn2Tc2Rlfnf4LypXrpinDC+rPoKlMfNSvfzYV2KGi4ukyBh
	 b8s0UGICsB4DJZ367Gpa8WKVp2yAdcshmo3nvg2A5I7Tacd9FK4FNH8MLVZmjVv/hN
	 dG6LZLjn7dueD2J3YB735PQPfhY/aCZ5vOWb5w2FjFlr5nrduLzTqi2vZcXV9t3XKT
	 gQt9a443GixaCMtsC2z/2NrQj8RLYNJXU1plrM2tH1fsKKpM5mRuj/ksggEqTrbxCU
	 Q2SmE18Sb+u2t4BHSwrrr4iwYFrr5iQREaTWXQ74jQ4X0Q3u4bz44WCqfLYYO7d3ha
	 PXEoBQ1wIYRdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 8/9] net: dsa: netc: add bridge mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260527100217.794987-9-wei.fang@oss.nxp.com>
References: <20260527100217.794987-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:01 +0000
Message-Id: <20260530005003.4F4651F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] netc_single_vlan_aware_bridge() fails to enforce the single VLAN-a=
ware bridge constraint due to checking stale state
- [High] The driver incorrectly assumes DSA bridge numbers start at 1, caus=
ing the first bridge to use an out-of-bounds VLAN ID (4096) and breaking po=
rt isolation
- [High] FDB entry deletion by key blindly deletes dynamically learned entr=
ies belonging to other ports
- [High] Removing the PVID from a VLAN-aware bridge port assigns it VID 0, =
leaking untagged frames to the standalone broadcast domain
- [High] Returning -EOPNOTSUPP for unsupported configurations causes the br=
idge core to silently ignore the errors
--

commit 7827b368f25c80b95ec098de8651a6d572a40bbf
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: add bridge mode support

Wire up the port_bridge_join, port_bridge_leave and port_vlan_filtering
DSA callbacks to support both VLAN-unaware and VLAN-aware bridge modes.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 4db42c888470c..1fe3b43e04598 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
> @@ -694,13 +694,18 @@ static int netc_port_del_fdb_entry(struct netc_port=
 *np,
>  	mutex_lock(&priv->fdbt_lock);
> =20
>  	entry =3D netc_lookup_fdb_entry(priv, addr, vid);
> -	if (unlikely(!entry))
> -		/* Currently only single port mode is supported, MAC learning
> -		 * is disabled, so there is no dynamically learned FDB entry.
> -		 * We need to support deleting dynamically FDB entry when the
> -		 * bridge mode is supported.
> -		 */
> +	/* If the entry is NULL, the specified FDB entry might be a dynamic
> +	 * entry, so try to delete it through the key element data.
> +	 */
> +	if (!entry) {
> +		struct fdbt_keye_data keye =3D {};
> +
> +		ether_addr_copy(keye.mac_addr, addr);
> +		keye.fid =3D cpu_to_le16(vid);
> +		err =3D ntmp_fdbt_delete_entry_by_keye(ntmp, &keye);
> +

[Severity: High]
Could this inadvertently delete dynamically learned entries belonging to ot=
her
ports?

When user-space attempts to delete a non-existent FDB entry on one port,
this fallback uses only the MAC address and VID as the key. Since the target
port number is ignored, it seems this could silently delete a valid dynamic
entry from the hardware that was learned on a completely different port in
the same VLAN.

>  		goto unlock_fdbt;
> +	}
> =20
>  	cfge =3D &entry->cfge;

[ ... ]

> @@ -1494,17 +1526,53 @@ static int netc_port_max_mtu(struct dsa_switch *d=
s, int port)
>  	return NETC_MAX_FRAME_LEN - VLAN_ETH_HLEN - ETH_FCS_LEN;
>  }
> =20
> +static struct net_device *netc_classify_db(struct dsa_db db)
> +{
> +	switch (db.type) {
> +	case DSA_DB_PORT:
> +		return NULL;
> +	case DSA_DB_BRIDGE:
> +		return db.bridge.dev;
> +	default:
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}
> +}
> +
> +static u16 netc_vlan_unaware_pvid(struct dsa_switch *ds,
> +				  const struct net_device *br_ndev)
> +{
> +	struct dsa_port *dp;
> +	int br_num =3D -1;
> +
> +	if (!br_ndev)
> +		return NETC_STANDALONE_PVID;
> +
> +	dsa_switch_for_each_available_port(dp, ds) {
> +		if (dsa_port_bridge_dev_get(dp) =3D=3D br_ndev) {
> +			br_num =3D dp->bridge->num;
> +			break;
> +		}
> +	}
> +
> +	/* The br_num is supposed to be 1 ~ ds->max_num_bridges */
> +	if (WARN_ON(br_num <=3D 0))
> +		return NETC_STANDALONE_PVID;
> +

[Severity: High]
Are DSA bridge numbers guaranteed to start at 1?

DSA assigns bridge numbers via bridge.num starting at 0. For the first brid=
ge
created, the WARN_ON will continually trigger.

Additionally, NETC_VLAN_UNAWARE_PVID(0) evaluates to 4096, which exceeds the
12-bit VLAN ID limit. When written to the hardware PVID register, it will be
truncated to 0 (NETC_STANDALONE_PVID), causing the first bridge to share the
same broadcast domain as standalone ports.

> +	return NETC_VLAN_UNAWARE_PVID(br_num);
> +}
> +

[ ... ]

> @@ -1689,12 +1776,81 @@ static void netc_port_set_host_flood(struct dsa_s=
witch *ds, int port,
>  	netc_port_remove_host_flood(np, old_host_flood);
>  }
> =20
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
Is br_vlan_enabled() evaluating the correct state during the
port_vlan_filtering callback?

When the driver checks the state of the bridges, the bridge core has not yet
updated the br->vlan_enabled flag (it gets updated after the switchdev
notifier returns).=20

If a second bridge is being made VLAN-aware, this function will see its old
state (false) and falsely conclude there is still only one VLAN-aware bridg=
e,
bypassing the hardware constraint.

> +
> +		if (!br_ndev) {
> +			br_ndev =3D port_br;
> +			continue;
> +		}
> +
> +		if (br_ndev =3D=3D port_br)
> +			continue;
> +
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Only one VLAN-aware bridge is supported");
> +
> +		return -EOPNOTSUPP;

[Severity: High]
Does returning -EOPNOTSUPP cause the software bridge to silently ignore this
hardware constraint?

The switchdev and bridge cores explicitly ignore -EOPNOTSUPP errors because
that return code typically indicates hardware offload is unsupported, rather
than indicating an invalid configuration.=20

Should this return -EINVAL or -EBUSY to properly abort the operation and
prevent state desynchronization?

> +	}
> +
> +	return 0;
> +}
> +

[ ... ]

> @@ -1702,20 +1858,123 @@ static int netc_port_vlan_add(struct dsa_switch =
*ds, int port,
>  	if (vlan->vid =3D=3D NETC_STANDALONE_PVID)
>  		return 0;
> =20
> +	if (vlan->vid >=3D NETC_VLAN_UNAWARE_PVID(ds->max_num_bridges)) {
> +		NL_SET_ERR_MSG_FMT_MOD(extack,
> +				       "VID %d~4095 reserved for VLAN-unaware bridge",
> +				       NETC_VLAN_UNAWARE_PVID(ds->max_num_bridges));
> +		return -EOPNOTSUPP;

[Severity: High]
Will returning -EOPNOTSUPP here cause the software bridge to silently accept
the reserved VID?

Similar to the single VLAN-aware bridge check above, the bridge core ignores
-EOPNOTSUPP. Does this need to return -EINVAL to ensure the operation is
properly aborted?

> +	}
> +
>  	untagged =3D !!(vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED);
> +	err =3D netc_port_set_vlan_entry(np, vlan->vid, untagged);
> +	if (err)
> +		return err;

[ ... ]

> +static int netc_port_vlan_del(struct dsa_switch *ds, int port,
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
> +	if (err)
> +		return err;
> +
> +	if (np->pvid =3D=3D vlan->vid) {
> +		np->pvid =3D 0;
> +
> +		if (dsa_port_is_vlan_filtering(np->dp))
> +			netc_port_set_pvid(np, 0);

[Severity: High]
If the PVID is reset to 0, will untagged frames on the bridge port leak into
the standalone broadcast domain?

VID 0 is used as NETC_STANDALONE_PVID for all standalone ports. Setting a
bridged port's PVID to 0 means any untagged frames arriving on that port
will be classified to VID 0, potentially forwarding them to standalone ports
and breaking isolation.=20

Should the hardware be configured to drop untagged frames instead if no PVID
is configured on a VLAN-aware port?

> +	}
> +
> +	return 0;
> +}
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527100217.7949=
87-1-wei.fang@oss.nxp.com?part=3D8
