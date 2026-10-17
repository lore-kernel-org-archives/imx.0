Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D33603D3;
	Sat, 17 Oct 2026 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792265656; cv=none; b=BF3FljSAtjkQlErzIb3rnVJhOA/mzbXmEmhOmtj1nz9J8pSgHQx/vBm4L4GVoA1yVY/2KmfgwPFVWAPd9Qt7d527Lg3TjwArcQAixvBX/eRF/L34mmAyGG54MaiLc9N9+B373FDR+dTnU1izpe13uoGfODWzd9RJDLKqNeIuT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792265656; c=relaxed/simple;
	bh=/K+3a1OL3gzh2Z0TyY1hczg1YM0bpfYgAX5Hac+jzrI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mSrOgyPMiT7zJxw5eMt6kLQPCQeM9SqHa94SIepwERh19HzGBi+LUUwrOOY6/mKsjwcDxnSqTnKB0AOxpp3rpclKGrzWaV8CKn2rmiSjyZ8f05HFgdE+48o5us2jv/PIuglTj+xNHbRWi2Cp5FoFIcTODm5se5IfQqNsIZ9h0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agRW1Nh6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agRW1Nh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFEC1F000C4;
	Sat, 17 Oct 2026 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792265652;
	bh=cqKJc8Dn42oaH9s2Flfh+rSmqmVJjealRFxS/ydXdg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agRW1Nh6l+s7rdZXuEAwYJXB5WcT2p5E1qUZipS11Mnv8Q+S1qx7vT4fPQYRrcTuf
	 rezmFZ78NFB2NtNRVuLyN993xdVvdrWkBRYiOwLo8VK7VDhKz6ujXZX1RTUEyy9tEC
	 cnQFYix27rOKNcspRNr9OG02MLTnwU88saLyRsjymVpcMnB3tuGBvOnq427N7Mi8UY
	 luG4y+jD6bPYIGsH/pFPfDsRPTl5axqYm2TPhOh4DtcrqbEzV4ESKzaKkLd8bhlV0X
	 oln3ROWUuSx9ZErH8DKDYzJtFbgx6neM1hSIUJuL6U+Yg8cK0fWoUrCt2ISb/sZPQN
	 SPdZESEFyOZow==
Message-ID: <sashiko-outbox-175787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [net-next,PATCH 2/2] enetc: Make eMDIO MDC rate configurable
 from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261016193344.115518-2-marex@nabladev.com>
References: <20261016193344.115518-1-marex@nabladev.com>
 <20261016193344.115518-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 19:34:11 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: dsa: netc: uninitialized mdc_div in netc_port_create_emdio_bu=
s()
- [High] net: enetc: enetc_mdio_update_mdc_div() queries bus->parent instea=
d of MDIO node
- [Medium] enetc: mii_bus and pci_iomap() leaks on enetc_mdio_update_mdc_di=
v() error
- [Medium] net: enetc: MDIO_CFG_CLKDIV() drops LSB of 9-bit MDC divider
--

commit f237be9574cf74fc03c82f92befcff8d462ed078
Author: Marek Vasut <marex@nabladev.com>

enetc: Make eMDIO MDC rate configurable from DT

This commit adds an mdc_div field to struct enetc_mdio_priv and introduces
enetc_mdio_update_mdc_div() to calculate the MDC clock divider from an
optional upstream clock and clock-frequency DT property.

> diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/oce=
lot/felix_vsc9959.c
> index 8387dd208adb9..dbeec1b229325 100644
> --- a/drivers/net/dsa/ocelot/felix_vsc9959.c
> +++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
> @@ -1008,8 +1008,13 @@ static int vsc9959_mdio_bus_alloc(struct ocelot *o=
celot)
>  	 * starting with the proper offset.
>  	 */
>  	mdio_priv->mdio_base =3D 0;
> +	mdio_priv->mdc_div =3D ENETC_MDIO_DEFAULT_DIVIDER;
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-imdio", dev_name(dev));
> =20
> +	rc =3D enetc_mdio_update_mdc_div(bus);
> +	if (rc)
> +		return rc;

[Severity: Medium]
Does this error path leak bus?

In vsc9959_mdio_bus_alloc(), bus is allocated earlier with non-devm
mdiobus_alloc_size():

	bus =3D mdiobus_alloc_size(sizeof(*mdio_priv));
	if (!bus)
		return -ENOMEM;

If enetc_mdio_update_mdc_div(bus) fails (for example, when devm_clk_get()
defers or fails, or when the calculated divider is out of range), returning
rc directly skips calling mdiobus_free(bus), unlike the mdiobus_register()
error path right below.

> +
>  	/* Needed in order to initialize the bus mutex lock */
>  	rc =3D mdiobus_register(bus);
>  	if (rc < 0) {
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/=
net/ethernet/freescale/enetc/enetc_mdio.c
> index 998aaa394e9c4..93d61c2f1464f 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c

[ ... ]

> @@ -22,9 +23,9 @@
>   /* external MDIO only - driven on neg MDC edge */
>  #define MDIO_CFG_NEG		BIT(23)
> =20
> -#define ENETC_EMDIO_CFG \
> +#define ENETC_EMDIO_CFG(mdc_div) \
>  	(MDIO_CFG_HOLD(2) | \
> -	 MDIO_CFG_CLKDIV(258) | \
> +	 MDIO_CFG_CLKDIV(mdc_div) | \
>  	 MDIO_CFG_NEG)

[Severity: High]
What happens to netc_port_create_emdio_bus() in
drivers/net/dsa/netc/netc_main.c when ENETC_EMDIO_CFG uses
mdio_priv->mdc_div?

In drivers/net/dsa/netc/netc_main.c:netc_port_create_emdio_bus(), the
driver allocates struct enetc_mdio_priv via devm_mdiobus_alloc_size() and
wires up the shared enetc_mdio callbacks without initializing
mdio_priv->mdc_div:

	bus->name =3D "NXP NETC switch external MDIO Bus";
	bus->read =3D enetc_mdio_read_c22;
	bus->write =3D enetc_mdio_write_c22;
	bus->read_c45 =3D enetc_mdio_read_c45;
	bus->write_c45 =3D enetc_mdio_write_c45;
	bus->parent =3D dev;
	mdio_priv =3D bus->priv;
	mdio_priv->hw =3D hw;
	mdio_priv->mdio_base =3D NETC_EMDIO_BASE;

Because devm_mdiobus_alloc_size() zero-initializes bus->priv,
mdio_priv->mdc_div remains 0. Every subsequent C22 or C45 MDIO read or
write on a NETC switch port external MDIO bus will program
MDIO_CFG_CLKDIV(0) into ENETC_MDIO_CFG instead of
ENETC_MDIO_DEFAULT_DIVIDER (258), violating the hardware minimum divider
requirement of 5.

Should netc_port_create_emdio_bus() also initialize mdio_priv->mdc_div?

[ ... ]

> @@ -231,6 +232,32 @@ struct enetc_hw *enetc_hw_alloc(struct device *dev, =
void __iomem *port_regs)
>  }
>  EXPORT_SYMBOL_GPL(enetc_hw_alloc);
> =20
> +int enetc_mdio_update_mdc_div(struct mii_bus *bus)
> +{
> +	struct enetc_mdio_priv *mdio_priv =3D bus->priv;
> +	struct device *dev =3D bus->parent;
> +	struct clk *enet_clk;
> +	u32 div, mdc_freq;
> +
> +	if (device_property_read_u32(dev, "clock-frequency", &mdc_freq))
> +		return 0;
> +
> +	enet_clk =3D devm_clk_get(dev, NULL);

[Severity: High]
Is bus->parent the right device to query for the clock-frequency property
and input clock across all callers of enetc_mdio_update_mdc_div()?

1. When called from enetc_mdiobus_create() -> enetc_mdio_probe() in
drivers/net/ethernet/freescale/enetc/enetc_pf_common.c, bus->parent is
&pf->si->pdev->dev (the parent ENETC PF PCI device), while the external
MDIO bus is represented by the child DT node np (the mdio subnode passed to
of_mdiobus_register(bus, np)). Any clock-frequency property placed in the
mdio child node is ignored because device_property_read_u32() inspects the
parent PF device instead.

2. Furthermore, on ENETC4 PF nodes (such as pci1131,e101 in
Documentation/devicetree/bindings/net/fsl,enetc.yaml and
arch/arm64/boot/dts/freescale/imx95.dtsi), the parent PF node's clocks
property is the MAC RGMII/RMII ref clock (IMX95_CLK_ENETREF), rather than
the NETC system clock that drives MDC.

3. When called from enetc_imdio_create() and vsc9959_mdio_bus_alloc(), the
bus is an internal on-chip PCS MDIO bus (imdio) with no DT node of its own,
so querying bus->parent inspects the parent PF or switch PCI device node.

4. Also, since enet_clk is only used here to read clk_get_rate(enet_clk),
does devm_clk_get() unnecessarily hold a managed clock reference on
bus->parent for the lifetime of the device?

> +	if (IS_ERR(enet_clk))
> +		return dev_err_probe(dev, PTR_ERR(enet_clk),
> +				     "Input clock unknown, not changing MDC frequency\n");
> +
> +	div =3D ((clk_get_rate(enet_clk) / mdc_freq) - 1) / 4;
> +	if (div < 5 || div > 0x1ff)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Requested MDC frequency is out of range, ignoring\n");
> +
> +	mdio_priv->mdc_div =3D div;

[Severity: Medium]
Does MDIO_CFG_CLKDIV() drop the least-significant bit of odd 9-bit dividers
calculated here?

In drivers/net/ethernet/freescale/enetc/enetc_mdio.c, MDIO_CFG_CLKDIV is
defined just above MDIO_CFG_ENC45:

	#define MDIO_CFG_CLKDIV(x)	((((x) >> 1) & 0xff) << 8)
	#define MDIO_CFG_HOLD(x)	(((x) << 2) & GENMASK(4, 2))
	#define MDIO_CFG_ENC45		BIT(6)

Shifting x right by 1 before shifting left by 8 is equivalent to
(((x) & 0x1fe) << 7), which clears bit 7 (the LSB of the 9-bit
MDIO_CLK_DIV[8:0] field at bits [15:7]) and turns any odd divider in
[5, 0x1ff] into div - 1. In particular, when div =3D=3D 5, it passes the
div < 5 check above but programs 4 into the hardware register.

When commit dd8f467eda72 ("net/fsl: xgmac_mdio: Support setting the MDC
frequency") added xgmac_mdio_set_mdc_freq(), it updated the corresponding
macro from (((x>>1) & 0xff) << 8) to (((x) & 0x1ff) << 7). Should
MDIO_CFG_CLKDIV(x) be updated the same way here?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(enetc_mdio_update_mdc_div);
> +
>  /* Lock for MDIO access errata on LS1028A */
>  DEFINE_RWLOCK(enetc_mdio_lock);
>  EXPORT_SYMBOL_GPL(enetc_mdio_lock);
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c b/driv=
ers/net/ethernet/freescale/enetc/enetc_pci_mdio.c
> index e108cac8288d3..4ff182d7d21ec 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c
> @@ -71,8 +71,13 @@ static int enetc_pci_mdio_probe(struct pci_dev *pdev,
>  	mdio_priv =3D bus->priv;
>  	mdio_priv->hw =3D hw;
>  	mdio_priv->mdio_base =3D ENETC_EMDIO_BASE;
> +	mdio_priv->mdc_div =3D ENETC_MDIO_DEFAULT_DIVIDER;
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
> =20
> +	err =3D enetc_mdio_update_mdc_div(bus);
> +	if (err)
> +		return err;

[Severity: Medium]
Does returning err directly here leak the port_regs mapping?

In enetc_pci_mdio_probe(), port_regs is mapped with non-devm pci_iomap():

	port_regs =3D pci_iomap(pdev, 0, 0);

When enetc_mdio_update_mdc_div(bus) fails, returning directly bypasses the
err_pci_enable / err_mdiobus_alloc / err_hw_alloc cleanup path that calls
iounmap(port_regs).

> +
>  	pcie_flr(pdev);
>  	err =3D pci_enable_device_mem(pdev);
>  	if (err) {
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index d32a195a04c97..6b519871856eb 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c

[ ... ]

> @@ -332,6 +337,7 @@ static int enetc_imdio_create(struct enetc_pf *pf)
>  	bus->phy_mask =3D ~0;
>  	mdio_priv =3D bus->priv;
>  	mdio_priv->hw =3D &pf->si->hw;
> +	mdio_priv->mdc_div =3D ENETC_MDIO_DEFAULT_DIVIDER;
> =20
>  	if (is_enetc_rev1(pf->si))
>  		mdio_priv->mdio_base =3D ENETC_PM_IMDIO_BASE;
> @@ -340,6 +346,10 @@ static int enetc_imdio_create(struct enetc_pf *pf)
> =20
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-imdio", dev_name(dev));
> =20
> +	err =3D enetc_mdio_update_mdc_div(bus);
> +	if (err)
> +		return err;

[Severity: Medium]
Does this error path also leak bus in enetc_imdio_create()?

Here bus is allocated with non-devm mdiobus_alloc_size():

	bus =3D mdiobus_alloc_size(sizeof(*mdio_priv));
	if (!bus)
		return -ENOMEM;

Returning err directly when enetc_mdio_update_mdc_div(bus) fails skips the
free_mdio_bus label that calls mdiobus_free(bus).

> +
>  	err =3D mdiobus_register(bus);
>  	if (err) {
>  		dev_err(dev, "cannot register internal MDIO bus (%d)\n", err);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016193344.1155=
18-1-marex@nabladev.com?part=3D2
