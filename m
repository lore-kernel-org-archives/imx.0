Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF22372064
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399986; cv=none; b=ZDEe2L+fAwHIMklBY/HO+87O23X6H2TTRXRr6vf4NBO2Kz3Fz/bnBfv0paX8rlzO6JSI2BAOlcTjHf4UtWF1/XvNeAhDqfpuNzSWMpcU1oJfs9HLS2OWtmTaQlQ4l+SGJfLFljP/bkEJCIP9/5DQ0gjXxV6ZSb27UErOaV1s4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399986; c=relaxed/simple;
	bh=WfP7BNNNsVOsy+d14ofdZPRWCaGJ0/awbO8fdD1Xc94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hWeeGLUACamN5Iuqc225GORqUUtxmlgzBNQ+Z9OBSIPfDYD9+hZjbvSJjIkq2DCngPNaTjfdhi4YubT91j+Cui8ykjAJR4mLQDhkGDK+x6UEtrx/zLw+8vKjs+4WDUulFPoM8NjBW3eHmV/LkHK5XA8Vo2CEUw8cnVpER2kYfAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRiw1mqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRiw1mqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D781F0089B;
	Tue,  2 Jun 2026 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399978;
	bh=19eR01632u1ZUV1tZhQ7+4rc8nYfqeczyPfzcR45JPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gRiw1mqWkEfLnChMvuN+cbTXlyxSZ+lGFPJ/Cbgld7i9L/9/1i46U5dOPGw3HDS8y
	 9eI98d3aED4t40ufnzq363FJB5jhnZLTGzOALU865J7M3gQ4r/OpQpl+0Ao6D+rGHf
	 SzJwpi1a7vZ4ymbC2kqN+27NVzGHw7n8DMptMt+gT6tXjcd2WEQ/nyBuCSki+/5lCt
	 yW+p6vo2H/wkwOjXphl90L6vqpF4ahN4hi94vlzpi0Sn0jzTHD2LSTO1nALiNmzCnJ
	 FQ9UKcvxiHyYP3Mr1lLNXR8qRECufsojpdUUGyNYZyoE1PKgwUljpwKwOKdkRuduIK
	 oZ1IU/eFToFAQ==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 5/7] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260601112437.2216043-6-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-6-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:56 +0000
Message-Id: <20260602113256.E0D781F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Flawed error handling for multi-descriptor packets causes frag=
mented packet injection.
- [High] NULL pointer dereference in mtip_switch_tx() when queues are stopp=
ed and ring is empty.
- [High] Missing dma_sync_single_for_device() on RX error path causes data =
corruption for subsequent packets.
- [High] `swap_buffer()` corrupts the tail of packets whose length is not a=
 multiple of 4 bytes.
- [High] Missing dma_rmb() after reading RX descriptor ownership allows spe=
culative execution to read stale data.
- [High] The TX completion path unmaps DMA buffers using a hardcoded frame =
size instead of the original mapped length.
- [Medium] The Ethernet FCS is incorrectly included in the SKB payload, bre=
aking bridging applications.
- [Low] Unreachable code: The TX completion check for `BD_ENET_TX_READY` is=
 mathematically impossible.
- [Low] Received SKBs are built with zero headroom, leading to inefficient =
processing.
--

commit be1b7f747ef200958ab836f16e9cf7ce2caf1583
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>

net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver
   =20
This patch provides mtip_switch_tx and mtip_switch_rx functions
code for MTIP L2 switch.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/n=
et/ethernet/freescale/mtipsw/mtipl2sw.c
> index 7dfeda230e3fb..212207861e13e 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
[ ... ]
> @@ -836,11 +873,233 @@ static irqreturn_t mtip_interrupt(int irq, void *p=
tr_fep)
> =20
>  static void mtip_switch_tx(struct switch_enet_private *fep)
>  {
> +	struct net_device *dev;
> +	unsigned short status;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	int index;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +	bdp =3D fep->dirty_tx;
> +
> +	while (((status =3D bdp->cbd_sc) & BD_ENET_TX_READY) =3D=3D 0) {
> +		if (bdp =3D=3D fep->cur_tx &&
> +		    !mtip_netif_queues_stopped(fep))
> +			break;

[Severity: High]
What happens if the queues are stopped and the ring is empty?

If the ring is empty (bdp =3D=3D fep->cur_tx) but the queues are stopped
(e.g. link down), this break condition evaluates to false. Would this
cause the loop to process an empty, unsubmitted descriptor, leading to a
NULL pointer dereference when accessing fep->tx_skbuff[index] and
skb->dev below?

> +
> +		index =3D bdp - fep->tx_bd_base;
> +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> +				 MTIP_SWITCH_TX_FRSIZE, DMA_TO_DEVICE);

[Severity: High]
Does this unmap call violate the DMA API by using a hardcoded length?

The DMA API mandates that the unmap size must exactly match the length
passed to dma_map_single(). Since outgoing network packets have variable
lengths, could using the hardcoded MTIP_SWITCH_TX_FRSIZE maximum size
cause DMA API warnings, IOMMU faults, or memory corruption?

> +		bdp->cbd_bufaddr =3D 0;
> +		skb =3D fep->tx_skbuff[index];
> +		dev =3D skb->dev;
> +		/* Check for errors */
> +		if (status & (BD_ENET_TX_HB | BD_ENET_TX_LC |
> +				   BD_ENET_TX_RL | BD_ENET_TX_UN |
> +				   BD_ENET_TX_CSL)) {
[ ... ]
> +		} else {
> +			dev->stats.tx_packets++;
> +		}
> +
> +		if (status & BD_ENET_TX_READY)
> +			dev_err_ratelimited(&fep->pdev->dev,
> +					    "xmit interrupt and TX_READY.\n");

[Severity: Low]
Is it mathematically possible to reach this condition?

The while loop entry condition guarantees that BD_ENET_TX_READY is zero:
while (((status =3D bdp->cbd_sc) & BD_ENET_TX_READY) =3D=3D 0)

Could this check be unreachable dead code, indicating a potential logic
flaw in the state handling?

[ ... ]
> +static int mtip_switch_rx(struct net_device *dev, int budget)
>  {
> -	return -ENOMEM;
> +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> +	u8 *data, rx_port =3D MTIP_PORT_FORWARDING_INIT;
> +	struct switch_enet_private *fep =3D priv->fep;
> +	unsigned short status, pkt_len;
> +	struct net_device *pndev;
> +	struct ethhdr *eth_hdr;
> +	int pkt_received =3D 0;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	struct page *page;
> +	int index;
> +
> +	/* First, grab all of the stats for the incoming packet.
> +	 * These get messed up if we get called due to a busy condition.
> +	 */
> +	bdp =3D fep->cur_rx;
> +
> +	while (!((status =3D bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {

[Severity: High]
Is a read memory barrier needed here?

The loop reads the descriptor status to verify that the hardware has
yielded ownership. Without a dma_rmb() executed after this check, could
the CPU speculatively reorder subsequent reads of bdp->cbd_datlen and
the packet payload to occur before the ownership status change is
globally visible, leading to stale data being processed?

> +		if (pkt_received >=3D budget)
> +			break;
> +
> +		pkt_received++;
> +
> +		writel(MCF_ESW_IMR_RXF, fep->hwp + ESW_ISR);
> +		if (!fep->usage_count)
> +			goto rx_processing_done;
> +
> +		status ^=3D BD_ENET_RX_LAST;
> +		/* Check for errors. */
> +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
> +			      BD_ENET_RX_CR | BD_ENET_RX_OV | BD_ENET_RX_LAST |
> +			      BD_ENET_RX_CL)) {

[Severity: Critical]
Does this logic safely handle multi-descriptor packets?

The XOR logic (status ^=3D BD_ENET_RX_LAST) treats any descriptor without
the last-fragment bit as an error. The error handling path then yields the
descriptor back to the hardware but does not drain the remaining descriptors
of the packet.

When the final descriptor of the fragmented packet is received, it will
pass the error check, and the driver might incorrectly parse the middle or
end of the fragmented packet as a brand new Ethernet frame.

[ ... ]
> +		/* Get correct RX page */
> +		index =3D bdp - fep->rx_bd_base;
> +		page =3D fep->page[index];
> +		/* Process the incoming frame */
> +		pkt_len =3D bdp->cbd_datlen;
> +
> +		dma_sync_single_for_cpu(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					pkt_len, DMA_FROM_DEVICE);
> +		net_prefetch(page_address(page));
> +		data =3D page_address(page);
> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(data, pkt_len);

[Severity: High]
Does swap_buffer() safely handle packet lengths that are not a multiple of =
4?

Looking at the implementation:

static void swap_buffer(void *bufaddr, int len)
{
        unsigned int *buf =3D bufaddr;
        int i;

        for (i =3D 0; i < len; i +=3D 4, buf++)
                swab32s(buf);
}

It appears the loop condition iterates strictly by 4. If the packet length
is not an exact multiple of 4 bytes, could the final iteration overshoot
the valid packet data, pulling uninitialized garbage bytes into the tail
of the packet?

> +
> +		eth_hdr =3D (struct ethhdr *)data;
> +		mtip_atable_get_entry_port_number(fep, eth_hdr->h_source,
> +						  &rx_port);
[ ... ]
> +		if (mtip_update_cbd(fep, bdp, index)) {
> +			pndev->stats.rx_dropped++;
> +			goto rx_processing_done;
> +		}

[Severity: High]
If this allocation fails, does the driver return a dirty buffer back to the
hardware?

When swap_buffer() modifies the buffer in-place, the CPU cache is dirtied.
If we take this error path, the buffer is yielded back to the hardware
(via rx_processing_done) without calling dma_sync_single_for_device() to
transfer ownership. Could the dirty CPU cache lines later be asynchronously
evicted to RAM, overwriting new packet data being DMA'd by the hardware?

> +
> +		/* The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb =3D build_skb(page_address(page), PAGE_SIZE);

[Severity: Low]
Does this allocation leave zero headroom for the SKB?

Incoming packets are DMA'd to offset 0 of the allocated page. By building
the SKB directly at page_address(page), the SKB is created with
skb->head =3D=3D skb->data. While the networking core will safely reallocate
headers if necessary, failing to reserve standard headroom (like NET_SKB_PA=
D)
can cause unnecessary performance degradation.

> +		if (unlikely(!skb)) {
> +			page_pool_recycle_direct(fep->page_pool, page);
> +			pndev->stats.rx_dropped++;
> +
> +			netdev_err_once(pndev, "build_skb failed!\n");
> +			goto rx_processing_done;
> +		}
> +
> +		skb_put(skb, pkt_len);      /* Make room */

[Severity: Medium]
Does this skb_put() call incorrectly include the FCS in the SKB payload?

The comment immediately above states the intention to exclude the FCS
because it messes up bridging applications. However, this calls
skb_put() using the full pkt_len without subtracting ETH_FCS_LEN (4 bytes).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D5
