Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BF308F03;
	Thu, 14 May 2026 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738236; cv=none; b=HgC1KtjTM/Q3R20wl18WwyS1Uz4n6FkGbmghdV7BLKFRH5YmCtRBNkPZUBNA52mBDRsPsrutrml+g0Z7x/MlAeGsUoAl8zAyPNIW7mbTXvqXhHuEWisXySJQ2VkuwWoGir2FSsYcdTPrHpBwMkuWwUTUj9FgS1a3m3FiQnh352s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738236; c=relaxed/simple;
	bh=rVS3Kj24bL/F+mbmo0ct9/KHSi4hXBrf7Yz3g+2Q8w8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=akRVXfZLNUyA3lYAXwDtScWtGfqUEfYa5m+6ziUYfv7ZSsPeP6a3ZxDLinc4UWeJ6Eb3Ic0YHWWwuknVFGejdBqmghoRgqz3cjMO+oEjd11ypls8lvoJgtUYnBF5/WbWqhbI8TBNgfrNH70zZtgtqt1XVGaX1ujx3qy0osqSoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo9klVfA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo9klVfA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004FC2BCB7;
	Thu, 14 May 2026 05:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778738236;
	bh=rVS3Kj24bL/F+mbmo0ct9/KHSi4hXBrf7Yz3g+2Q8w8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Bo9klVfAtT9Nn8bo3pdAbuWyVTyldoP0tiquuDNVoTkKPlZQIX3ry3FGMQUJVVEjE
	 EBGjvzc9bV41pXg62a5V0LjDJk+OhFfJtPVfy1NIs1lIiz/3OaCite/tARJlLonBwG
	 vkBArGt0CIQD0Gz1jXrx4shQO/QeYVhk/z8+2fBBMxBsEjCSdJKPpIbeibEkWx9ixK
	 k8u50E0+OmQG0vE5fGxHeao1Tm+dKcyCt3xswxV9nvQJ8Q2Jfr0m6z3lzbO4cQX51g
	 +648MH+K++q+HGIcmCSDt4lSvi7db83yk75XDfkwwJMSHRGWz4PVY0aL1NjFM1ZTx2
	 sP+S8c5cCPeCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 net-next 10/15] net: dsa: netc: introduce NXP NETC
 switch driver for i.MX94
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260513030454.1666570-11-wei.fang@nxp.com>
References: <20260513030454.1666570-11-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:57:15 +0000
Message-Id: <20260514055715.A004FC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Resource leaks and sysfs duplication upon DSA master interface unb=
ind/rebind due to misuse of `devm_*` APIs in the `.setup` callback.
- [Medium] Missing `pci_clear_master()` in the `.shutdown` callback risks m=
emory corruption during kexec.
--

commit 61a3ea3e0b6e78c0e019f8c93113e82986d40e5e
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: introduce NXP NETC switch driver for i.MX94

This commit introduces the initial NXP NETC switch driver for the i.MX94
series, providing basic probe and remove functionality. The NETC IP provides
integrated 802.1Q Ethernet switch functionality and internal ENETC
connectivity via a pseudo MAC.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 0000000000000..8e3a3230226c3
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
> +	if (!priv->ports)
> +		return -ENOMEM;
[ ... ]
> +	for (int i =3D 0; i < priv->info->num_ports; i++) {
> +		np =3D devm_kzalloc(dev, sizeof(*np), GFP_KERNEL);
> +		if (!np)
> +			return -ENOMEM;
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

The DSA subsystem can invoke the switch driver's .setup and .teardown
callbacks multiple times over the device's lifetime, such as when the
master netdevice is unbound and rebound.

Because devm_kcalloc(), devm_kzalloc(), and devm_of_mdiobus_register()
are tied to the PCI device's lifetime rather than the DSA switch tree,
these resources won't be freed when netc_teardown() is executed.

If the master interface is rebound and netc_setup() runs again, could
this cause memory leaks and a duplicate sysfs name collision when trying
to register the same MDIO bus?

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

While dsa_switch_shutdown() brings the network interfaces down, does it
guarantee that all hardware DMA engines (such as the switch-wide NTMP
Command BD rings) are immediately halted?

If not, should this function call pci_clear_master() to prevent
the device from continuing pending DMA operations and potentially
corrupting memory during a kexec boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513030454.1666=
570-1-wei.fang@nxp.com?part=3D10
