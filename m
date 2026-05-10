Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1A373BEB;
	Sun, 10 May 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410119; cv=none; b=szrzrM5pBNxNr6DPIrnAQGwfV/FTryk8f9i+7io2ckoI9nN52/eUhPHTt99jhQyJ7nrfPliKj99ScYhqpwZVgc8yVVBo7eVVUnKOXnhG2jeR5M4njSzXSsaI03UV2dhQoITRM18ZFggviRuRGDqyPXT+5FEdntjpK/mtftPc4EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410119; c=relaxed/simple;
	bh=uNF61VfB1rCmTP4U3gxo5/xc7VrXiL/31ORL+ldm5uw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ggz0bAT3fEE+XP3wSTCvtKzsgM0j69C25vNFv3e57HXPGD3Kb4/U4jdhN287el9WH5yGXmhTQyJSqUjpQ6hC4wtyVyI4S5Hd72osXy2LSt0z6aAr6q9Y9+k5pSyqBpZhqhhT/VE3JNmia3r4lLEpOcHdRexHgBlKp+L7iiyJeA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErbFYcp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErbFYcp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8514DC2BCB8;
	Sun, 10 May 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410118;
	bh=uNF61VfB1rCmTP4U3gxo5/xc7VrXiL/31ORL+ldm5uw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ErbFYcp4i5spSGjF+Bdi/qOqiv9Qm2gXAFkaSle5mtiCiYrOHjp1By3SiTrxVOTKt
	 cd1dSbBPkTfeN9ts9CMS2Q6r8InwBP7AxMTBUvOyzkkb/ajDaenPcYEw6gwmO5QIJS
	 P5tSCUGmYeVJHqVssqFINEmYL1OmyOkwWFXl6tqug/dGpmUWbjv5Baibut+dvaQ2tB
	 CJgBqUGALoiSZxwg0QXUDuU49xtD9fXgAvYX2z+/2LTNSi0l8HlWwHoyVrdCZNPtNv
	 CXGC6juwtNhSkKr+MqxTjNG+0X3FvGpnGmFyzGJZPonlnIS7lRIj8lNfOkNrIaVgUI
	 ysOmefOrkOG4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 12/15] net: dsa: netc: add FDB, STP, MTU,
 port setup and host flooding support
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260509102954.4116624-13-wei.fang@nxp.com>
References: <20260509102954.4116624-13-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:38 +0000
Message-Id: <20260510104838.8514DC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect FDB port bitmap update causes roaming unicast entries to=
 be flooded to multiple ports.
- [High] Local `u8` arrays `bcast` and `dmac_mask` are passed to `ether_add=
r_copy` without ensuring 16-bit alignment.
- [Medium] The driver silently fails to delete dynamically learned FDB entr=
ies.
--

commit 5ef406cd4ab0e5005f26e470e33265be68b4fe54
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add FDB, STP, MTU, port setup and host flooding support
   =20
Expand the NETC switch driver with foundational features including FDB
management, STP, MTU configuration, and host flooding support. The driver
operates in standalone port mode.

diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_m=
ain.c
--- a/drivers/net/dsa/netc/netc_main.c
+++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -363,6 +418,206 @@ static void netc_port_default_config(struct netc_po=
rt *np)
[ ... ]
> +static int netc_port_set_fdb_entry(struct netc_port *np,
> +				   const unsigned char *addr, u16 vid)
> +{
[ ... ]
> +	cfge =3D &entry->cfge;
> +	/* If the entry already exists on the port, return 0 directly */
> +	if (unlikely(cfge->port_bitmap & cpu_to_le32(BIT(port))))
> +		goto unlock_fdbt;
> +
> +	/* If the entry already exists, but not on this port, we need to
> +	 * update the port bitmap. In general, it should only be valid
> +	 * for multicast or broadcast address.
> +	 */
> +	cfge->port_bitmap |=3D cpu_to_le32(BIT(port));

Does this correctly handle roaming unicast MAC addresses?

When a unicast MAC address roams from one port to another, or when a user
replaces a static unicast FDB entry using bridge fdb replace, the bridge co=
re
requests adding the entry on the new port.

Because this unconditionally ORs the port into the bitmap, the unicast addr=
ess
becomes associated with both the old and new ports simultaneously. This will
cause the switch hardware to duplicate and flood unicast frames to multiple
ports.=20

Should this check is_multicast_ether_addr() and replace the port_bitmap
instead of ORing it for unicast addresses?

> +	err =3D ntmp_fdbt_update_entry(&priv->ntmp, entry->entry_id, cfge);
[ ... ]
> +static int netc_port_del_fdb_entry(struct netc_port *np,
> +				   const unsigned char *addr, u16 vid)
> +{
> +	struct netc_switch *priv =3D np->switch_priv;
> +	struct ntmp_user *ntmp =3D &priv->ntmp;
> +	struct netc_fdb_entry *entry;
> +	struct fdbt_cfge_data *cfge;
> +	int port =3D np->dp->index;
> +	int err =3D 0;
> +
> +	mutex_lock(&priv->fdbt_lock);
> +
> +	entry =3D netc_lookup_fdb_entry(priv, addr, vid);
> +	if (unlikely(!entry))
> +		goto unlock_fdbt;

Can this silently fail to delete dynamically learned FDB entries?

The netc_lookup_fdb_entry() function searches priv->fdb_list, which only
tracks static entries explicitly added by software.=20

If the bridge core or user attempts to delete a hardware-learned dynamic MAC
address, the lookup will return NULL. The function will then jump to
unlock_fdbt and silently return 0 (success) without actually issuing a dele=
te
command to the hardware FDB.

> +
> +	cfge =3D &entry->cfge;
[ ... ]
> +static int netc_add_standalone_fdb_bcast_entry(struct netc_switch *priv)
> +{
> +	const u8 bcast[ETH_ALEN] =3D {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

Are local byte arrays guaranteed to be 16-bit aligned?

The ether_addr_equal() macro (used inside netc_lookup_fdb_entry which is
subsequently called by netc_port_set_fdb_entry) expects its pointer argumen=
ts
to be 16-bit aligned.=20

Because bcast is declared as a simple u8 array on the stack, the compiler
only guarantees a 1-byte alignment by default. On architectures with strict
alignment requirements, this could trigger an unaligned access exception.

> +	struct dsa_port *dp, *cpu_dp =3D NULL;
> +
> +	dsa_switch_for_each_cpu_port(dp, priv->ds) {
> +		cpu_dp =3D dp;
> +		break;
> +	}
> +
> +	if (!cpu_dp)
> +		return -ENODEV;
> +
> +	/* If the user port acts as a standalone port, then its PVID is 0,
> +	 * MLO is set to "disable MAC learning" and MFO is set to "discard
> +	 * frames if no matching entry found in FDB table". Therefore, we
> +	 * need to add a broadcast FDB entry on the CPU port so that the
> +	 * broadcast frames received on the user port can be forwarded to
> +	 * the CPU port.
> +	 */
> +	return netc_port_set_fdb_entry(NETC_PORT(priv->ds, cpu_dp->index),
> +				       bcast, NETC_STANDALONE_PVID);
> +}
[ ... ]
> +static int netc_port_add_host_flood_rule(struct netc_port *np,
> +					 bool uc, bool mc)
> +{
> +	const u8 dmac_mask[ETH_ALEN] =3D {0x1, 0, 0, 0, 0, 0};

This has the same alignment concern as the bcast array above.

The ether_addr_copy() macro expects its pointer arguments to be 16-bit
aligned. Passing a stack-allocated u8 array without explicit alignment could
cause unaligned access faults on certain architectures.

> +	struct netc_switch *priv =3D np->switch_priv;
> +	struct ipft_entry_data *host_flood;
> +	struct ipft_keye_data *keye;
[ ... ]
> +	if (uc && !mc)
> +		ether_addr_copy(keye->dmac_mask, dmac_mask);
> +
> +	if (!uc && mc) {
> +		ether_addr_copy(keye->dmac, dmac_mask);
> +		ether_addr_copy(keye->dmac_mask, dmac_mask);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D12
