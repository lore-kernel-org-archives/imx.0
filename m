Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5D36F417;
	Sun, 10 May 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410117; cv=none; b=VjaHj3WAzJn8V8zNNeZWqxu+UVnyBzoB1UvzobESr201m5+vnjwAZgyucBJ0pvmjeDBIpqAlNHTP/5qekNE9EV6imOt/hUgiVNn6UGyiCUhGSj2RsJLfWiZrdrL4atT/uJDacUU3sApuxOJORx07ysPqyg2wNQNIu767Q0ejsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410117; c=relaxed/simple;
	bh=LjrAObcK49dsqAJ7LOd2AD64ol/yPPp5Gp2jENsaRs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCSf8ytlNfZhgYJS7+r6KQb1gmelDTaYrffsf/bFCU1dud9g3E+8d649EEvoU+H3R+rh4RwPBAVnqhzuGuwSDzLqar/uGdEZb4L59fNqDcc9S+0EvJ9YJeLqQyOEsyt8ziJDqAifUXIIvi3aklaSjIg4YCD+pJk2qUZgfAIt1kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ7/q2pf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ7/q2pf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD50C2BCB8;
	Sun, 10 May 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410117;
	bh=LjrAObcK49dsqAJ7LOd2AD64ol/yPPp5Gp2jENsaRs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JQ7/q2pfak9JGCkKJIizyEJRlwGMWDA9NNYJ/vhZuOEyXOSmR7kMi9yW1xE8WqT8K
	 +7Oo4d+MvzC5OGVQHuRqcZvopsVkHFvDrPo6Ep7I8mjtkc6fEnufHPZ3/y8BXGgG7I
	 5fxcQOq//HsmiOZPEDts3uMFw8xntvBQDHpOTbni6nJ0H6asmkLFG6wQwTxwdNx6/2
	 6kof5qMjZ2KzpLsFAuFYp51W9S5RH7nYwa9u9EKIE7l+hU23ZW/3NuqmSvWGDkDmsH
	 d6FQqMlxS10gCpcKg7sGJ7igpU80XsFtID+T+j3XJsEewTw10L3v4/U80L0AcwAVpb
	 ZsfK71xhHfb+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 10/15] net: dsa: netc: introduce NXP NETC
 switch driver for i.MX94
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260509102954.4116624-11-wei.fang@nxp.com>
References: <20260509102954.4116624-11-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:36 +0000
Message-Id: <20260510104836.BDD50C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] devres-managed functions are incorrectly used inside the DSA `.set=
up` callback, leading to memory leaks and MDIO bus registration failures if=
 the DSA tree is unbound and rebound.
- [High] The driver's PCI shutdown callback fails to stop hardware DMA ring=
s and leaves PCI bus mastering enabled.
- [Low] Clearing the PCI driver data via pci_set_drvdata(pdev, NULL) in the=
 shutdown callback breaks potential subsequent unbind operations.
--

commit bee0164d1f3476eab41d58efbe3baf540bb03cda
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: introduce NXP NETC switch driver for i.MX94

This commit introduces the initial NXP NETC Ethernet switch driver for
the i.MX94 series. It provides basic probe and remove functionality, as
well as port capabilities and basic network setup.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 0000000000000..8e3a3230226c3 100644
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> +static int netc_port_create_emdio_bus(struct netc_port *np,
> +				      struct device_node *node)
> +{
> +	struct netc_switch *priv =3D np->switch_priv;
> +	struct enetc_mdio_priv *mdio_priv;
> +	struct device *dev =3D priv->dev;
> +	struct enetc_hw *hw;
> +	struct mii_bus *bus;
> +	int err;
> +
> +	hw =3D enetc_hw_alloc(dev, np->iobase);
> +	if (IS_ERR(hw))
> +		return dev_err_probe(dev, PTR_ERR(hw),
> +				     "Failed to allocate enetc_hw\n");
> +
> +	bus =3D devm_mdiobus_alloc_size(dev, sizeof(*mdio_priv));

[ ... ]

> +	err =3D devm_of_mdiobus_register(dev, bus, node);

[ ... ]

> +static int netc_init_all_ports(struct netc_switch *priv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct netc_port *np;
> +	struct dsa_port *dp;
> +	int err;
> +
> +	priv->ports =3D devm_kcalloc(dev, priv->info->num_ports,
> +				   sizeof(struct netc_port *),
> +				   GFP_KERNEL);

[ ... ]

> +	for (int i =3D 0; i < priv->info->num_ports; i++) {
> +		np =3D devm_kzalloc(dev, sizeof(*np), GFP_KERNEL);

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

[ ... ]

> +static int netc_setup(struct dsa_switch *ds)
> +{
> +	struct netc_switch *priv =3D ds->priv;
> +	struct dsa_port *dp;
> +	int err;
> +
> +	err =3D netc_init_switch_id(priv);
> +	if (err)
> +		return err;
> +
> +	err =3D netc_init_all_ports(priv);
> +	if (err)
> +		return err;
> +
> +	err =3D netc_init_ntmp_user(priv);

Can these devres-managed allocations and registrations cause issues when the
DSA tree unbinds and rebounds?

In the DSA subsystem, the .setup callback is invoked when the conduit
interface becomes available. If the conduit interface is unbound and reboun=
d,
the DSA tree goes through a teardown and setup cycle, meaning netc_setup()
can be called multiple times during the lifetime of the underlying PCI devi=
ce.

Because netc_init_all_ports() and netc_init_ntmp_user() use devres functions
(devm_kzalloc(), devm_kcalloc(), and devm_of_mdiobus_register()) tied to the
PCI device, their resources will not be freed when .teardown is called. When
the tree binds again, netc_setup() will execute anew, leaking the previously
allocated memory. Also, devm_of_mdiobus_register() will attempt to register=
 an
MDIO bus with an ID that is already in use by the previous unfreed
registration, potentially causing .setup to fail.

Would it be better to either move these allocations to probe(), or manage t=
hem
without devm_ helpers and explicitly clean them up in .teardown()?

[ ... ]

> +static void netc_switch_shutdown(struct pci_dev *pdev)
> +{
> +	struct netc_switch *priv =3D pci_get_drvdata(pdev);
> +
> +	if (!priv)
> +		return;
> +
> +	dsa_switch_shutdown(priv->ds);

Does the hardware continue to perform DMA after this shutdown callback runs?

The netc_switch_pci_init() function enables PCI bus mastering and sets up a
64-bit DMA mask, and netc_init_all_cbdrs() initializes the Control BD rings.
However, dsa_switch_shutdown() only closes the logical network ports without
invoking the DSA teardown callback, meaning the hardware BD rings are never
disabled.

Leaving the hardware rings active with bus mastering enabled during a system
reboot or a transition to a kexec/kdump kernel might allow the device to
continue performing DMA into memory that may have been reassigned, potentia=
lly
leading to silent memory corruption or IOMMU faults. Should the shutdown
callback explicitly disable the rings or call pci_clear_master() here?

> +	pci_set_drvdata(pdev, NULL);

Could clearing the driver data here break subsequent unbind operations?

If a user manually unbinds the driver via sysfs shortly after a shutdown
event, netc_switch_remove() will read a NULL priv pointer and return early,
skipping dsa_unregister_switch() and leaking the DSA state. Is it necessary=
 to
clear the driver data in the shutdown path?
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D10
