Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15993DC4B7
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399979; cv=none; b=bXwQOaXYSk5aZfuvAQcXDM6sOMkj7e9liw1V9wzTMeMtcwoKr5Qeo5L82K5wPU5H2hPRasxovltVbWq/VVNV/fwEQTTVVENGJ24m3OofEIC7rihJL/B85bKymMbONJ5x39nXd69himjywkZdybofLsmFMbPg++fz5wgjlSpyJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399979; c=relaxed/simple;
	bh=WvA+YeD8Ufqn5AEIgEEXQf2Z9JB9SzxJWwWgmsr1y28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RPjSyGz92hkgAp8fzTB9L5hKA/b6hh2a30DBkMKiLyRg1OVtEuF7bq0NVdEfB7cOhfNzCZVV5Kc4hnfKGmUua3CT1eE24pnC2O8lfHTzfEI8l+5Dauf4Sba20THAqI49PTlXRzsc5Yu4Mfqi4yFg9HE4xExBs/E+7o9c0x1gBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCzGWHZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCzGWHZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765061F0089A;
	Tue,  2 Jun 2026 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399975;
	bh=2+BND3I/t2kyBMopJnPV6eoowYWwrw59C5ytsEUrf4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fCzGWHZU3rvgsc6N1idW9yAybjvZl2AsvaktTEdnOc0aMyWA6ED7Z7uyzYfz782n5
	 AiJNRNnaAeY6sAqBax4V7LgV5PY8S4Q8JuYHtXA6iYbWCi7YvTbEfQ+prRgsABiTAm
	 moG2H2cWqpQP7N4+WE1wltn74nVOYUM7mSC2dx8f3BGlF8ruOFTqq+Ea1Brdw44sUN
	 nA6fsMpybPts9Vr9tqcjPrz7AYtIKt/CqOa87rcrbsHIOHiot3S/OYCvUhvxoPFruP
	 RLE0iNHJQv6WfPRfcUXIIznVofdoY4fskDu6O0PswvZfgbJRv4XYqpToaXCOPM7uj8
	 gplZOVCxPa8XQ==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260601112437.2216043-5-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-5-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:55 +0000
Message-Id: <20260602113255.765061F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Unchecked memcpy into a fixed-size bounce buffer causes a heap=
 buffer overflow if the SKB exceeds the buffer size.
- [High] Accessing an SKB after handing it to the hardware transmission rin=
g causes a use-after-free.
- [High] The watchdog timeout work logic evaluates to true when the device =
is closed, leading to hardware access crashes.
- [High] Missing hardware lock during `mtip_switch_restart()` causes a data=
 race with concurrent transmissions.
- [High] Mapping a fixed maximum size instead of the actual SKB length caus=
es DMA out-of-bounds reads.
- [High] Incorrect teardown ordering in `mtip_ndev_cleanup` causes a Use-Af=
ter-Free race with the TX timeout work.
- [Medium] The TX path maps buffers for DMA but does not unmap them during =
a timeout restart, causing a DMA mapping leak.
--

commit 472dd23af31f2a6b37da050f58cdf8ed66693ebc
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>

net: mtip: Add net_device_ops functions to the L2 switch driver

This patch provides callbacks for struct net_device_ops for MTIP
L2 switch.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/n=
et/ethernet/freescale/mtipsw/mtipl2sw.c
> index 5b5229ee411df..7dfeda230e3fb 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
[ ... ]
> @@ -463,6 +472,120 @@ static void mtip_config_switch(struct switch_enet_p=
rivate *fep)
[ ... ]
> +	/* On some FEC implementations data must be aligned on
> +	 * 4-byte boundaries. Use bounce buffers to copy data
> +	 * and get it aligned.
> +	 */
> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT ||
> +	    fep->quirks & FEC_QUIRK_SWAP_FRAME) {
> +		memcpy(fep->tx_bounce[index], skb->data, skb->len);

[Severity: Critical]
Does this code overflow the bounce buffer? The bounce buffer has a fixed si=
ze,
but there appears to be no bounds check to ensure the skb length actually
fits. A maliciously constructed oversized packet could cause a heap buffer
overflow.

> +		bufaddr =3D fep->tx_bounce[index];
> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(bufaddr, skb->len);
> +	}
> +
> +	/* Push the data cache so the CPM does not get stale memory
> +	 * data.
> +	 */
> +	bdp->cbd_bufaddr =3D dma_map_single(&fep->pdev->dev, bufaddr,
> +					  MTIP_SWITCH_TX_FRSIZE,
> +					  DMA_TO_DEVICE);

[Severity: High]
Is it safe to map a fixed maximum size instead of the actual packet length?
Since the underlying memory allocated for the packet may be smaller than
MTIP_SWITCH_TX_FRSIZE, this can force the DMA API to flush memory beyond the
bounds of the allocation, potentially triggering an out-of-bounds read or
IOMMU faults.

> +	if (unlikely(dma_mapping_error(&fep->pdev->dev, bdp->cbd_bufaddr))) {
[ ... ]
> +	/* Send it on its way.  Tell FEC it's ready, interrupt when done,
> +	 * it's the last BD of the frame, and to put the CRC on the end.
> +	 */
> +
> +	status |=3D (BD_ENET_TX_READY | BD_ENET_TX_INTR | BD_ENET_TX_LAST |
> +		   BD_ENET_TX_TC);
> +
> +	/* Synchronize all descriptor writes */
> +	wmb();
> +	bdp->cbd_sc =3D status;
> +
> +	skb_tx_timestamp(skb);
> +
> +	dev->stats.tx_bytes +=3D skb->len;

[Severity: High]
Can this sequence cause a use-after-free? Once the descriptor status is
updated and the memory barrier is issued, ownership of the buffer is
transferred to the hardware. The transmission completion interrupt could fr=
ee
the packet before the timestamp and length are accessed here.

[ ... ]
> +static void mtip_timeout_work(struct work_struct *work)
> +{
> +	struct mtip_ndev_priv *priv =3D
> +		container_of(work, struct mtip_ndev_priv, tx_timeout_work);
> +	struct switch_enet_private *fep =3D priv->fep;
> +	struct net_device *dev =3D priv->dev;
> +
> +	rtnl_lock();
> +	if (netif_device_present(dev) || netif_running(dev)) {

[Severity: High]
Is this logical condition correct? The netif_device_present check evaluates=
 to
true as long as the device is registered, even if it is administratively do=
wn.
Writing to the hardware registers via mtip_switch_restart while the device =
is
closed and the IPG clock is disabled could trigger an imprecise external ab=
ort
and crash the system.

> +		napi_disable(&fep->napi);
> +		netif_tx_lock_bh(dev);
> +		mtip_switch_restart(dev, fep->full_duplex[0],
> +				    fep->full_duplex[1]);

[Severity: High]
Does this restart logic cause a data race with concurrent transmissions on =
the
other port? The driver manages two network ports sharing a single hardware
ring. mtip_switch_restart resets the shared transmission ring state, but on=
ly
the tx lock for the specific port that timed out is acquired here, rather t=
han
the shared hardware lock.

[Severity: Medium]
Does mtip_switch_restart leak DMA mappings during a timeout recovery? The
transmission path maps buffers for DMA, but the restart routine appears to
simply free the transmit socket buffers without calling the corresponding u=
nmap
function, potentially leaking IOVA space or bounce buffers on every timeout.

> +		netif_tx_wake_all_queues(dev);
> +		netif_tx_unlock_bh(dev);
> +		napi_enable(&fep->napi);
> +	}
> +	rtnl_unlock();
> +}
[ ... ]
> @@ -1158,10 +1448,14 @@ static int mtip_switch_dma_init(struct switch_ene=
t_private *fep)
> =20
>  static void mtip_ndev_cleanup(struct switch_enet_private *fep)
>  {
> +	struct mtip_ndev_priv *priv;
>  	int i;
> =20
>  	for (i =3D 0; i < SWITCH_EPORT_NUMBER; i++) {
>  		if (fep->ndev[i]) {
> +			priv =3D netdev_priv(fep->ndev[i]);
> +			cancel_work_sync(&priv->tx_timeout_work);
> +
>  			unregister_netdev(fep->ndev[i]);

[Severity: High]
Can this result in a use-after-free race with the timeout work? Calling
unregister_netdev after cancel_work_sync means the networking watchdog is
still active and could fire immediately after cancel_work_sync returns. If =
the
watchdog queues the work item again, the work could execute after the device
structures have been freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D4
