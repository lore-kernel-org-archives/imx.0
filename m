Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0D23DB62A
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399979; cv=none; b=cebLKXpe4CauIy870L07/WqKRpuz0rx8td1OdDH2OW1f9iay6rdveKoPCpewV+DWGTwM5lzNsFQLgMBTWNOaqmWoE0upjZbuOYgAmzMGBqELbgl6IGik+Yz0XeSekb7jPF9P46GotKU0nHQZscNpuaIgEs83dVMJnpZ2xbWIuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399979; c=relaxed/simple;
	bh=6cwKrAUUlOInPXvq34f5zEEWAuot1GPauBNzaJPA/Jg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJuSL/JtIxgoiJzD/VYVnvrYlNpuFB89/ycMK0dl0yrj/B0RsC02Mm8YwI2QQVzYubAEzspyyFsXFfNiozTnfarIp1SebAQbCff5S3iBstvw/zaKZYkAMlqfvvs5uVxu5NdbdXGrcsb6v3uAvTvFq/zvBTC8pthKtADELoUEfpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cq64uxIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cq64uxIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6423A1F00893;
	Tue,  2 Jun 2026 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399973;
	bh=Qa77/KFzwwI/eBXyczwywFy8Y8M905UFTYs3iSmhY4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cq64uxIvtUvQfp8N/C7sZIPCiuIX8J4kHAWaUgUFtRSnmEVvZdlDViIpbhOgMHdbB
	 /yyzLFYmTzZWq1sDMRxpK47cdI9yY6Nqr7+2nOYIUnF7QPTFzthH8qFJ/LEnhpk00I
	 ZHc4zYYg2jnbbr4OlqHDHgYhM4s6iiJXOSMy4ImdOKZuMOIs+RyFFLwY1fSRgkl5Sm
	 ZooSxu7hptaCfTDypiqRCdRl5Uf/YP0xvF4VgEGG4iaEhl6tTSAmA5fD2Mi6sHCkZ7
	 n3Jc4S5rym3C9e6Og/qAPr+qzICjkVo4fvRJIbhnxuHi/lq/MUbHdc2c53VtnKoGHL
	 haa3ji1PhF28Q==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 2/7] net: mtip: The L2 switch driver for imx287
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260601112437.2216043-3-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-3-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:53 +0000
Message-Id: <20260602113253.6423A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Premature cleanup of PHY device nodes leading to Use-After-Free an=
d Double Free.
- [High] Missing mandatory `ndo_start_xmit` callback in `net_device_ops`.
- [High] Incorrect teardown of a self-rearming timer causes Use-After-Free.
- [High] Unaligned memory access and strict aliasing violation when reading=
 MAC address.
- [High] Out-of-bounds access and NULL pointer dereference if device tree d=
efines fewer than 2 ports.
- [High] Shared NAPI instance lifecycle is incorrectly tied to independent =
network devices, leading to Use-After-Free.
- [High] Hardware IRQ is requested before NAPI initialization is completed.
- [High] Hardware DMA and interrupts are not halted during device teardown,=
 causing memory corruption.
- [High] Data race and double-frees during asynchronous hardware reset in `=
mtip_adjust_link()`.
- [High] TOCTOU race condition on the interrupt mask register causes interr=
upt storms.
- [High] Incorrect base address used during MII initialization corrupts the=
 switch Multicast Control Register.
- [High] DMA descriptor rings are not reinitialized during hardware reset, =
causing UAF and double transmissions.
--

commit 9013be10c1b09f8737ae605cb41647830304da99
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>

net: mtip: The L2 switch driver for imx287
   =20
This commit introduces support for the More Than IP L2 switch embedded in t=
he
imx287 SoC. It allows offloading network traffic between the internal uDMA =
and
MAC-NET blocks.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/n=
et/ethernet/freescale/mtipsw/mtipl2sw.c
> new file mode 100644
> index 0000000000000..1d1005a42306d
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -0,0 +1,1363 @@

[ ... ]

> +static void mtip_setup_mac(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> +	struct switch_enet_private *fep =3D priv->fep;
> +	unsigned char *iap, mac_addr[ETH_ALEN];
> +
> +	/* Use MAC address from DTS */
> +	iap =3D &fep->mac[priv->portnum - 1][0];
> +
> +	/* Use MAC address set by bootloader */
> +	if (!is_valid_ether_addr(iap)) {
> +		*((__be32 *)&mac_addr[0]) =3D
> +			cpu_to_be32(readl(fep->enet_addr + MCF_FEC_PALR));
> +		*((__be16 *)&mac_addr[4]) =3D
> +			cpu_to_be16(readl(fep->enet_addr +
> +					  MCF_FEC_PAUR) >> 16);
> +		iap =3D &mac_addr[0];
> +	}

[Severity: High]
Does this direct casting of a byte array to a 32-bit and 16-bit pointer vio=
late
strict aliasing and cause unaligned access faults on architectures that do =
not
support unaligned 32-bit stores? Using put_unaligned_be32() and
put_unaligned_be16() might be safer here.

[ ... ]

> +static void mtip_mgnt_timer(struct timer_list *t)
> +{
> +	struct switch_enet_private *fep =3D
> +		container_of(t, struct switch_enet_private, timer_mgnt);
> +
> +	mtip_atable_dynamicms_learn_migration(fep, mtip_get_time(),
> +					      NULL, NULL);
> +	mod_timer(&fep->timer_mgnt,
> +		  jiffies + msecs_to_jiffies(LEARNING_AGING_INTERVAL));
> +}

[Severity: High]
Since the management timer callback unconditionally re-arms itself here, do=
es
calling timer_delete_sync() in mtip_sw_remove() fail to permanently disarm
the timer? Should this be using timer_shutdown_sync() in the teardown path
to prevent a use-after-free if the callback fires after the structures are
freed?

[ ... ]

> +static void mtip_switch_restart(struct net_device *dev, int duplex0,
> +				int duplex1)
> +{

[ ... ]

> +	fep->cur_tx =3D fep->tx_bd_base;
> +	fep->cur_rx =3D fep->rx_bd_base;
> +	fep->dirty_tx =3D fep->cur_tx;
> +
> +	/* Reset SKB transmit buffers */
> +	for (i =3D 0; i <=3D TX_RING_MOD_MASK; i++) {
> +		if (fep->tx_skbuff[i]) {
> +			dev_kfree_skb_any(fep->tx_skbuff[i]);
> +			fep->tx_skbuff[i] =3D NULL;
> +		}
> +	}

[Severity: High]
When freeing the software tracking structures here, the hardware descriptor
status fields (cbd_sc) are left unmodified. Could the hardware immediately
re-transmit stale, previously READY descriptors upon reset, and subsequently
dereference the NULL tx_skbuff pointer upon completion?

[ ... ]

> +static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
> +{
> +	struct switch_enet_private *fep =3D ptr_fep;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u32 int_events, int_imask;
> +
> +	/* Get the interrupt events that caused us to be here */
> +	int_events =3D readl(fep->hwp + ESW_ISR);
> +	writel(int_events, fep->hwp + ESW_ISR);
> +
> +	if (int_events & (MCF_ESW_ISR_RXF | MCF_ESW_ISR_TXF)) {
> +		ret =3D IRQ_HANDLED;
> +		/* Disable the RX interrupt */
> +		if (napi_schedule_prep(&fep->napi)) {
> +			int_imask =3D readl(fep->hwp + ESW_IMR);
> +			int_imask &=3D ~MCF_ESW_IMR_RXF;
> +			writel(int_imask, fep->hwp + ESW_IMR);
> +			__napi_schedule(&fep->napi);
> +		}
> +	}
> +
> +	return ret;
> +}

[Severity: High]
Is there a TOCTOU race condition here if mtip_rx_napi() concurrently writes
MCF_ESW_IMR_RXF | MCF_ESW_IMR_TXF to re-enable interrupts? If mtip_rx_napi()
writes immediately after this readl(), could this read-modify-write clobber
that update and leave the RXF interrupt enabled, causing an interrupt storm
while NAPI is actively running?

[ ... ]

> +static void mtip_adjust_link(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> +	struct switch_enet_private *fep =3D priv->fep;
> +	struct phy_device *phy_dev;
> +	int status_change =3D 0, idx;
> +
> +	idx =3D priv->portnum - 1;
> +	phy_dev =3D fep->phy_dev[idx];
> +
> +	/* Duplex link change */
> +	if (phy_dev->link && fep->full_duplex[idx] !=3D phy_dev->duplex) {
> +		mtip_netif_stop_queues(fep);
> +		if (idx =3D=3D 0)
> +			mtip_switch_restart(dev, phy_dev->duplex,
> +					    fep->full_duplex[!idx]);

[Severity: High]
Does initiating a full hardware reset here race asynchronously with NAPI
softirqs or active transmit paths? Without disabling NAPI via napi_disable()
or holding hardware locks, could this lead to SKB double-frees and ring
descriptor desynchronization?

[ ... ]

> +static int mtip_mii_init(struct switch_enet_private *fep,
> +			 struct platform_device *pdev)
> +{
> +	struct device_node *node;
> +	int err =3D -ENXIO;
> +
> +	/* Clear MMFR to avoid to generate MII event by writing MSCR.
> +	 * MII event generation condition:
> +	 * - writing MSCR:
> +	 *      - mmfr[31:0]_not_zero & mscr[7:0]_is_zero &
> +	 *        mscr_reg_data_in[7:0] !=3D 0
> +	 * - writing MMFR:
> +	 *      - mscr[7:0]_not_zero
> +	 */
> +	writel(0, fep->hwp + MCF_FEC_MII_DATA);

[Severity: High]
Is the switch base address fep->hwp intentionally used here instead of the
MAC base address fep->enet_addr? Offset 0x040 in the switch block is the
Multicast Control Register (ESW_MCR). Could this corrupt the switch multica=
st
configuration while leaving the MAC's register uninitialized?

[ ... ]

> +static int mtip_close(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> +	struct switch_enet_private *fep =3D priv->fep;
> +	int idx =3D priv->portnum - 1;
> +
> +	fep->link[idx] =3D 0;
> +
> +	if (fep->phy_dev[idx]) {
> +		phy_stop(fep->phy_dev[idx]);
> +		netif_stop_queue(dev);
> +		phy_disconnect(fep->phy_dev[idx]);
> +		fep->phy_dev[idx] =3D NULL;
> +	}
> +
> +	if (fep->usage_count =3D=3D 1) {
> +		napi_disable(&fep->napi);
> +		netif_napi_del(&fep->napi);
> +		mtip_free_buffers(dev);
> +		clk_disable(fep->clk_ipg);
> +	}

[Severity: High]
If ndev[0] is unregistered and freed first, usage_count will drop to 1 and =
NAPI
teardown will be skipped. Because fep->napi is shared and was registered
against the first device, does this leave the active NAPI instance with a
dangling pointer to the freed ndev[0], resulting in a use-after-free when
ndev[1] triggers an interrupt?

[ ... ]

> +static const struct net_device_ops mtip_netdev_ops =3D {
> +	.ndo_open		=3D mtip_open,
> +	.ndo_stop		=3D mtip_close,
> +};

[Severity: High]
The mandatory ndo_start_xmit callback is missing from this definition. Will=
 any
attempt to transmit packets cause an unconditional kernel panic in the core
networking stack? (Note: Although this might be fixed in a later patch in t=
he
series, introducing it here breaks bisectability.)

[ ... ]

> +static int mtip_ndev_init(struct switch_enet_private *fep,
> +			  struct platform_device *pdev)
> +{
> +	struct mtip_ndev_priv *priv;
> +	int i, ret =3D 0;
> +
> +	for (i =3D 0; i < SWITCH_EPORT_NUMBER; i++) {
> +		fep->ndev[i] =3D alloc_netdev(sizeof(struct mtip_ndev_priv),
> +					    fep->ndev_name[i], NET_NAME_USER,
> +					    ether_setup);

[Severity: High]
If the device tree specifies fewer than 2 ethernet ports, fep->ndev_name[1]
could remain NULL. Because the loop unconditionally runs SWITCH_EPORT_NUMBER
times, will passing a NULL name string to alloc_netdev() cause a NULL point=
er
dereference in strscpy()?

[ ... ]

> +static int mtip_parse_of(struct switch_enet_private *fep,
> +			 struct device_node *np)
> +{
> +	struct device_node *p;
> +	unsigned int port_num;
> +	int ret =3D 0;

[ ... ]

> +		fep->phy_np[port_num - 1] =3D of_parse_phandle(port,
> +							     "phy-handle", 0);
> +		if (!fep->phy_np[port_num - 1]) {
> +			dev_err(&fep->pdev->dev,
> +				"%s: PHY handle not defined!\n", __func__);
> +			ret =3D -ENODEV;
> +			goto of_get_err;
> +		}
> +	}
> +
> + of_get_err:
> +	mtip_parse_of_cleanup(fep);
> +	of_node_put(p);
> +
> +	return ret;
> +}

[Severity: High]
Is there a missing return 0; before the of_get_err label? It appears the
successful path falls through into mtip_parse_of_cleanup(), which decrements
the reference count of the PHY device nodes without clearing the pointers,
ultimately leading to a use-after-free during PHY probe.

[ ... ]

> +static int mtip_sw_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D devm_request_irq(&pdev->dev, fep->irq, mtip_interrupt, 0,
> +			       dev_name(&pdev->dev), fep);
> +	if (ret) {
> +		mtip_parse_of_cleanup(fep);
> +		return dev_err_probe(&pdev->dev, ret, "Could not alloc IRQ\n");
> +	}

[Severity: High]
Is it safe to request the IRQ here before fep->napi is fully initialized in
mtip_open()? If an interrupt is pending or fires immediately, could
mtip_interrupt() trigger napi_schedule_prep() on uninitialized memory and
crash the system?

[ ... ]

> +static void mtip_sw_remove(struct platform_device *pdev)
> +{
> +	struct switch_enet_private *fep =3D platform_get_drvdata(pdev);
> +
> +	timer_delete_sync(&fep->timer_mgnt);
> +
> +	mtip_ndev_cleanup(fep);
> +
> +	mtip_parse_of_cleanup(fep);
> +	mtip_mii_remove(fep);
> +
> +	dma_free_coherent(&fep->pdev->dev, PAGE_SIZE, fep->rx_bd_base,
> +			  fep->bd_dma);

[Severity: High]
Are the hardware DMA engine and interrupts halted before the DMA rings are
freed here? Because the switch hardware remains active, could incoming
packets cause the DMA engine to write into these freed pages, corrupting
kernel memory?

> +	fep->rx_bd_base =3D NULL;
> +	fep->tx_bd_base =3D NULL;
> +
> +	platform_set_drvdata(pdev, NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D2
