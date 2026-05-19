Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66D3E717D;
	Tue, 19 May 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179136; cv=none; b=hqGvJX4qP0P5DXFOZygC0T0o4b2vQDnij5Mzzjijw4AaNMdjPqU9cAagI6PmGHvq6hY0GImRUbggaoAIAWanzDaa2//Iv0f8FxsFOE2/sROnrR9MOBVumGAo7DVk8PeEMJfmornyFs7ez6IBLpJP/atbK/X7iGiDxKqU/1Id/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179136; c=relaxed/simple;
	bh=3uqWbG8cOP/swZ717M7Z3NfWutbwVdO6ogtjzEWqFPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r3Ww6ntQi99/0XXh8oLSKaEuBZh/5rVhp+gE643msRuEiHnvMUEuNW13FlHnwFA0b4Lykg5RCurAgmy7Na4Zv9t1HEhKsb1SFbUhTAzhj8lkBuQ8VnFcnUtBqEntjvrleDDHJ+1NH1s5RKJPo5zk+I2rskJGZGJ3hf2CyUtmsGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0GzMSbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0GzMSbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A77EC2BCC9;
	Tue, 19 May 2026 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179136;
	bh=3uqWbG8cOP/swZ717M7Z3NfWutbwVdO6ogtjzEWqFPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I0GzMSbMw5Q4+rAKTXTWiYkzP5UTuA0T1by8XBm/lggFukjJp1BLbIpXwXf2w/g9K
	 38rOhfvHuLPGXley9m2EuSljc/Ug3kOIUKpKKOgzk5kpPvXMvLj5uaGJPl1IWzbVsy
	 opIsPTI2GxQ5+DNIUj3zL455h/Ct3fbrLkhwuwQCqQoFa9CK21XtQUXSFUG/k8OlNp
	 w9uEqGb2II3AmTkf/nFriSpspwnGXafpC5JiFPF8/EkWEkMfCi7HAlPsZloBGdiAf3
	 bU6N9jc0p++sSY9PiTjSXKGN36zpZeCvK/HGxQGcAbk39cp4wn94abtGnT5MiXBIhC
	 UqgiWDYPuYFdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 10/15] net: dsa: netc: introduce NXP NETC
 switch driver for i.MX94
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260518082506.1318236-11-wei.fang@nxp.com>
References: <20260518082506.1318236-11-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:35 +0000
Message-Id: <20260519082536.4A77EC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using device-managed memory allocations (`devm_`) and registration=
s inside the DSA `setup` callback causes memory leaks and re-registration f=
ailures.
- [High] The `netc_switch_shutdown` handler does not disable device DMA, wh=
ich can lead to memory corruption during kexec.
--

commit 9bab65d8563212abf27d7fd39b5e794000f38524
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: introduce NXP NETC switch driver for i.MX94

This commit introduces the NXP NETC switch driver for the i.MX94 series,
integrating an 802.1Q Ethernet switch with the internal ENETC via a pseudo
MAC. It provides basic probe and remove functionality.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> +static int netc_port_create_emdio_bus(struct netc_port *np,
> +				      struct device_node *node)
> +{
[ ... ]
> +	bus =3D devm_mdiobus_alloc_size(dev, sizeof(*mdio_priv));
> +	if (!bus)
> +		return -ENOMEM;
[ ... ]
> +	err =3D devm_of_mdiobus_register(dev, bus, node);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot register EMDIO bus\n");
> +
> +	np->emdio =3D bus;
> +
> +	return 0;
> +}
[ ... ]
> +static int netc_init_all_ports(struct netc_switch *priv)
> +{
[ ... ]
> +	priv->ports =3D devm_kcalloc(dev, priv->info->num_ports,
> +				   sizeof(struct netc_port *),
> +				   GFP_KERNEL);
> +	if (!priv->ports)
> +		return -ENOMEM;
> +
> +	/* Some DSA interfaces may set the port even it is disabled, such
> +	 * as .port_disable(), .port_stp_state_set() and so on. To avoid
> +	 * crash caused by accessing NULL port pointer, each port is
> +	 * allocated its own memory. Otherwise, we need to check whether
> +	 * the port pointer is NULL in these interfaces. The latter is
> +	 * difficult for us to cover.
> +	 */
> +	for (int i =3D 0; i < priv->info->num_ports; i++) {
> +		np =3D devm_kzalloc(dev, sizeof(*np), GFP_KERNEL);
> +		if (!np)
> +			return -ENOMEM;
> +
> +		np->switch_priv =3D priv;
> +		np->iobase =3D priv->regs.port + PORT_IOBASE(i);
> +		netc_port_get_capability(np);
> +		priv->ports[i] =3D np;
> +	}

Are these device-managed allocations safe inside the DSA setup path?

The DSA subsystem allows the switch tree to be torn down and set up multiple
times during the device's lifetime, such as when the conduit network interf=
ace
is unbound and re-bound.

Because devm_ resources are tied to the PCI device's lifecycle rather than
the DSA switch tree lifecycle, they are not freed during teardown().

Will subsequent calls to setup() leak memory and fail to register the MDIO
bus due to naming collisions?

[ ... ]
> +static int netc_init_all_cbdrs(struct netc_switch *priv)
> +{
> +	struct netc_switch_regs *regs =3D &priv->regs;
> +	struct ntmp_user *ntmp =3D &priv->ntmp;
> +	int i, err;
> +
> +	ntmp->cbdr_num =3D NETC_CBDR_NUM;
> +	ntmp->dev =3D priv->dev;
> +	ntmp->ring =3D devm_kcalloc(ntmp->dev, ntmp->cbdr_num,
> +				  sizeof(struct netc_cbdr),
> +				  GFP_KERNEL);

Similarly, will this device-managed allocation leak memory when the switch
is repeatedly set up?

[ ... ]
> +static void netc_switch_shutdown(struct pci_dev *pdev)
> +{
> +	struct netc_switch *priv =3D pci_get_drvdata(pdev);
> +
> +	if (!priv)
> +		return;
> +
> +	dsa_switch_shutdown(priv->ds);
> +	pci_set_drvdata(pdev, NULL);
> +}

Does this shutdown handler leave DMA active?

The driver enables Bus Master DMA in netc_switch_pci_init() via
pci_set_master(), but this function only brings down the network interfaces
without clearing the Bus Master Enable bit (e.g., via pci_clear_master()).

Could this cause silent memory corruption during a kexec, if the active PCI
hardware continues transferring data into memory regions that are now owned
by the new kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D10
