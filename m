Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238773EBF04;
	Thu, 13 Aug 2026 22:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660027; cv=none; b=nyV77d/etjlR8r9d2wogAQEVhW0dVYAu/Ph4nkNWyyjIIh7DBL08a+iEyMScDcvdHDqnv52141aBgwArZwdOUI2P9P7cdrYGVYhnu0kPyiT7M4ed1TBOqYDVaV9fDH4a8pcXC0/wwym2dTZGazJdp02Ud4vDiTrLE/E7kizzo4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660027; c=relaxed/simple;
	bh=u/WGYSeKtF4yo9eGNBKKX2gHq3GM7Gyu3ZtSHoPv1mc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t2rwIOvAhvppzSqFZAPK9SxIl1/Wrrmkg8Ufv7RIBEPG76H57gPctL7KvwrLa8h5k3TY5Ftgl7F7SyH/kfvRWmp5uBk0AYzyE9icn0xtv8t5oIUVxgEpdCP/7gA0il5d2fFEYMHiMuweQejkYLSTgOw0eQ/XN+FDsoRKFNbPOtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIihG9zA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIihG9zA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074211F000E9;
	Thu, 13 Aug 2026 22:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786660025;
	bh=BWVW1cwzxQxQwgomPqm2Gd4ncZj12iJyHYqy4Y91msg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LIihG9zAqiPkoQ/e4nWZqMNQwyVHL8232yBTZlAvgkcvhA8YP8uCCQapqrR7GSH7n
	 rH2B4jVrY8zt/T37vFhDCJcTaKyDm3EmOQj1RWJDgKR2L2mFAi26qYDKLKghgkANPR
	 NdZ221nKqpY4cIi2/ZtVizKMl3xVDmKuyGfBYicwyTR8yBOEjgAWBcSaiZkZfSlYoG
	 Vn4KIQK9w4DY0OXrIbHBrXSiK6spi5Tp3iQClxu/+HC3Bfes47VL81hJtihFwtf54C
	 ELBH7TnjviDgP2Cgo7vi+tb2hWw/qe89NzAQh734aXPEN3BEFuqWT6NsK4tG3GjO4+
	 L5ye9Dj9uiwnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 12/14] net: dsa: netc: add more basic
 functions support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260323060752.1157031-13-wei.fang@nxp.com>
References: <20260323060752.1157031-13-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 22:27:04 +0000
Message-Id: <20260813222705.074211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Hardware state (FDB, IPFT, and VLAN entries) is not cleared during=
 `netc_teardown()`, leading to stale configuration and state leaks.
- [Medium] Inconsistent MTU limits cause the TC policer to drop legitimate =
CPU port jumbo frames.
- [Medium] FDB and MDB operations silently ignore the VLAN ID (vid), leadin=
g to cross-VLAN corruption and API violations.
- [Medium] Unicast MAC mobility creates unintended multicast floods due to =
XOR-ing the port bitmap.

Pre-existing issues:
- [High] Missing pskb_may_pull() in netc_rcv() before accessing tag fields =
and pulling data.
- [High] Division by zero in netc_ipv_to_buffer_pool_mapping() if the hardw=
are reports fewer buffer pools than the number of ports.
- [High] Device-managed allocations (`devm_*`) in `netc_setup()` cause memo=
ry and resource leaks across DSA setup/teardown cycles.
--

--- Patch [12]: [PATCH v2 net-next 12/14] net: dsa: netc: add more basic fu=
nctions support ---
commit ac2553a1ce247dcd666d98e8376bbe7442e21002
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: add more basic functions support

This patch expands the NETC switch driver with several foundational
features, including FDB and MDB management, STP state handling, MTU
configuration, port setup/teardown, and host flooding support.

Before getting into the diff, there are two pre-existing issues observed in
the broader NETC driver code that might be worth addressing:

[Severity: High]
This is a pre-existing issue, but does netc_rcv() in net/dsa/tag_netc.c
safely handle packet headers that cross page boundaries?

Looking at netc_rcv(), the tag is dereferenced and pulled from the SKB
without first calling pskb_may_pull(skb, tag_len):

struct netc_tag_cmn *tag_cmn =3D dsa_etype_header_pos_rx(skb);
int tag_len =3D netc_get_rx_tag_len(tag_cmn->type);
...
skb_pull_rcsum(skb, tag_len);

If the driver receives a packet where the DSA tag crosses a page boundary
or isn't fully in the linear skb->data region, could calling
skb_pull_rcsum() trigger a BUG_ON() inside __skb_pull()?

[Severity: High]
This is a pre-existing issue, but can netc_ipv_to_buffer_pool_mapping()
in drivers/net/dsa/netc/netc_main.c trigger a divide-by-zero panic?

The function reads the buffer pool count from hardware and uses it as a
divisor:

int num_port_bp =3D priv->num_bp / priv->info->num_ports;
int q =3D NETC_IPV_NUM / num_port_bp;

If the NETC_BPCAPR register reports 0 buffer pools, or a value smaller
than the number of ports (due to a firmware glitch or hardware quirk),
num_port_bp will evaluate to 0, causing a panic on the next line.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index e2d88496f5f34..4b331971dd8c9 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
> @@ -7,11 +7,36 @@

[ ... ]

> +static void netc_destroy_fdb_list(struct netc_switch *priv)
> +{
> +	struct netc_fdb_entry *entry;
> +	struct hlist_node *tmp;
> +
> +	hlist_for_each_entry_safe(entry, tmp, &priv->fdb_list, node)
> +		netc_del_fdb_entry(entry);
> +}

[Severity: High]
Does this clear the hardware FDB entries?

It appears to only delete the software tracking entries without issuing a
hardware delete command. If DSA setup/teardown occurs without a full PCI
driver unbind, could stale hardware FDB rules persist and corrupt future
switch configurations?

> @@ -386,6 +411,212 @@ static void netc_port_default_config(struct netc_po=
rt *np)

[ ... ]

> +static int netc_port_set_fdb_entry(struct netc_port *np,
> +				   const unsigned char *addr, u16 vid)
> +{

[ ... ]

> +	port_bitmap =3D le32_to_cpu(entry->cfge.port_bitmap);
> +	/* If the entry already exists on the port, return 0 directly */
> +	if (unlikely(port_bitmap & BIT(port)))
> +		goto unlock_fdbt;
> +
> +	/* If the entry already exists, but not on this port, we need to
> +	 * update the port bitmap. In general, it should only be valid
> +	 * for multicast or broadcast address.
> +	 */
> +	port_bitmap ^=3D BIT(port);
> +	entry->cfge.port_bitmap =3D cpu_to_le32(port_bitmap);

[Severity: Medium]
Does this XOR logic correctly handle unicast MAC mobility?

If a unicast MAC moves from one port to another, it seems this logic would
add the new port to the bitmap instead of replacing the old one. Could
this cause packets for a unicast MAC to be unintentionally duplicated and
flooded to multiple ports?

> @@ -404,19 +635,61 @@ static int netc_setup(struct dsa_switch *ds)
>  	if (err)
>  		return err;
> =20
> +	INIT_HLIST_HEAD(&priv->fdb_list);
> +	mutex_init(&priv->fdbt_lock);
> +
>  	netc_switch_fixed_config(priv);

[Severity: High]
This is a pre-existing issue, but does netc_setup() leak memory and
resources if the DSA switch is torn down and set up repeatedly?

Looking at netc_init_all_ports() and netc_port_create_emdio_bus() which
run during setup, they use devm_kcalloc() and devm_of_mdiobus_register()
attached to the PCI device.

Since DSA's setup/teardown lifecycle is independent of the PCI lifecycle
(for instance, when bringing the DSA master netdev down and up), could
repeated setups leak these allocations and result in -EEXIST errors during
MDIO bus registration?

>  	/* default setting for ports */
>  	dsa_switch_for_each_available_port(dp, ds)
>  		netc_port_default_config(priv->ports[dp->index]);

[ ... ]

> +static void netc_free_host_flood_rules(struct netc_switch *priv)
> +{
> +	struct dsa_port *dp;
> +
> +	dsa_switch_for_each_user_port(dp, priv->ds) {
> +		struct netc_port *np =3D priv->ports[dp->index];
> +
> +		/* No need to clear the hardware IPFT entry. Because PCIe
> +		 * FLR will be performed when the switch is re-registered,
> +		 * it will reset hardware state. So only need to free the
> +		 * memory to avoid memory leak.
> +		 */
> +		kfree(np->host_flood);
> +		np->host_flood =3D NULL;
> +	}
>  }

[Severity: High]
Is the assumption about the PCIe FLR correct during a standard DSA
setup/teardown cycle?

DSA setup and teardown can occur without unbinding the PCI driver (meaning
no PCIe FLR occurs). Could this leave stale IPFT hardware entries active
across administrative actions like restarting the master netdev?

> @@ -569,6 +842,261 @@ static void netc_switch_get_ip_revision(struct netc=
_switch *priv)

[ ... ]

> +static int netc_port_change_mtu(struct dsa_switch *ds,
> +				int port, int mtu)
> +{
> +	u32 max_frame_size =3D mtu + VLAN_ETH_HLEN + ETH_FCS_LEN;
> +	struct netc_port *np =3D NETC_PORT(ds, port);
> +
> +	if (dsa_is_cpu_port(ds, port))
> +		max_frame_size +=3D NETC_TAG_MAX_LEN;
> +
> +	netc_port_set_max_frame_size(np, max_frame_size);
> +
> +	return 0;
> +}

[Severity: Medium]
Can legitimate jumbo frames destined for the CPU be silently dropped by the
traffic class policer?

The maximum MTU for user ports is derived from NETC_MAX_FRAME_LEN (9600),
but here the CPU port adds NETC_TAG_MAX_LEN (14) for a max size of 9614.
Looking at netc_port_set_all_tc_msdu(), the traffic class max SDU is
hardcoded to 9600 bytes.

If frames larger than 9600 bytes are forwarded to the CPU port, won't the
TC policer drop them because its limit wasn't scaled to account for the
DSA tag overhead?

> +static int netc_port_fdb_add(struct dsa_switch *ds, int port,
> +			     const unsigned char *addr, u16 vid,
> +			     struct dsa_db db)
> +{
> +	struct netc_port *np =3D NETC_PORT(ds, port);
> +
> +	/* Currently, we only support standalone port mode, so all VLANs
> +	 * should be converted to NETC_STANDALONE_PVID.
> +	 */
> +	return netc_port_set_fdb_entry(np, addr, NETC_STANDALONE_PVID);
> +}

[Severity: Medium]
Does substituting the user-provided 'vid' with NETC_STANDALONE_PVID cause
unintended cross-VLAN behavior?

If a user attempts to add an FDB or MDB entry for a specific non-zero VLAN,
it is silently applied to VLAN 0 here, which could cause collisions or
incorrect deletions. If the driver does not support VLAN-specific entries
yet, would it be safer to return -EOPNOTSUPP rather than silently redirecti=
ng
the entry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260323060752.1157=
031-1-wei.fang@nxp.com?part=3D12
