Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A83DA7E0
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399986; cv=none; b=GWQg/wphx5sXV3jQQ9/ljEAfd8S6XGtNKRh+1uZ0BjWCyMGWE0SRjcXNJdYMO3k7iXVxoiQQFAB3AS1h3pmWHdfRjUM5FZjxHzzn0MZFD1CUKg2Hzx4mJOoIi/mFYreCz+OuPbAvORaihaGIS3SK/HzmOUCsgIyGxxGSq/evX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399986; c=relaxed/simple;
	bh=k2co1jEjZ5XdrntDO662Rc6PblQq3uaZQkIG8+Gnwg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oh15/ohVYmPxt4mvWqmXFMjKxvHG+Dpfo8fSOnzmNiTgsQ7GlE29I+vxlsQ3kn9KsthspvPsKINCTHanmbUwOUv8BubuND4fnEs6ENIduSfENr44XHSnVX/bNvlVMy3UHQ+pxZYnj5CEEbMQL8t+GWTSxY5mLku11baal9BQ01U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXo7Hms3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXo7Hms3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E5B1F00898;
	Tue,  2 Jun 2026 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399979;
	bh=gRMEqR+ZPFne0gll0ApgRZQIL6wA6g2Y97tccXmWn5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXo7Hms3q3MoUY21whCc6U4+Corvvn0nsWomzEctE0i5ZhhAK7FxhAPhcFptz7ybF
	 c2RSh4oS9LRX0QuFjpZqK1XZRcplGkkjSgO+xJVmhQmtY26GlGoW3r6ZtSp1rMN/iX
	 ASALAvNsNkh6TQpJCizGEJVk1hhVvsV13n5P0/nfjDgK05MWoFKOgl+cdftmat29B8
	 LJDphkAiMrmO3heap8OY6bRQsF44vVcYBfL7F/IeFUTK6vqvVrvzNjg1l1LLJMOdFA
	 1XU17zdStz5Pv6EGzAyUmftpT42EksENckoUg+5r9wBHmIKHmkYTXF+l5mufveBvUV
	 BP/XjtQ9kNI5A==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 6/7] net: mtip: Extend the L2 switch driver with
 management operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260601112437.2216043-7-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-7-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:58 +0000
Message-Id: <20260602113258.F1E5B1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:

New issues:
- [High] Global steering register race with shared DMA transmission ring ca=
uses packets to be sent to the wrong port.
- [High] Bitwise OR operations on hardware registers without clearing field=
 masks cause invalid modes.
- [High] Disabling multicast reception on the CPU management port breaks IP=
v6 and essential protocols.
- [High] Off-by-one error in VLAN domain verification check allows out-of-b=
ounds register writes.
- [High] VLAN input processing helper unconditionally overwrites the `ESW_V=
RES` register, clobbering other ports' memberships.
- [High] Unsynchronized Read-Modify-Write (RMW) on shared hardware register=
s in management functions.
- [Medium] Per-port learning configuration incorrectly toggles a global int=
errupt mask and conflicts with NAPI polling.

Pre-existing issues:
- [High] Use-After-Free of SKB after transferring ownership to DMA hardware.
- [High] Double free and UAF of transmit SKBs due to lockless freeing in `m=
tip_switch_restart`.
- [High] Concurrent PHY adjustments trigger unsynchronized global switch re=
sets.
- [High] Out-of-bounds DMA Mapping of `skb->data`.
--

commit 18b1fc23ec60b0ca391ad794f056d1c911c2b51b
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>

net: mtip: Extend the L2 switch driver with management operations
   =20
This patch provides function necessary for managing the L2 switch.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/n=
et/ethernet/freescale/mtipsw/mtipl2sw.c
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -505,8 +505,35 @@ static void mtip_config_switch(struct switch_enet_pr=
ivate *fep)
> =20
>  	writel(0, fep->hwp + ESW_BKLR);

[ ... ]

> +	mtip_port_broadcast_config(fep, 2, 1);
> +
> +	/* Disable multicast receive on port 0 (MGNT) */
> +	mtip_port_multicast_config(fep, 0, 0);

[Severity: High]
Does disabling multicast receive on port 0 break IPv6 communication?

The Linux network stack strictly requires multicast reception to function,
particularly for IPv6 (Neighbor Discovery, Router Advertisements, MLD) and
IPv4 protocols like mDNS. Dropping all multicast traffic in hardware for the
CPU management port might disrupt these protocols.

> +	mtip_port_multicast_config(fep, 1, 1);
> +	mtip_port_multicast_config(fep, 2, 1);
> +
> +	/* Setup VLANs to provide port separation */
> +	if (!fep->br_offload)
> +		mtip_switch_en_port_separation(fep);
>  }

[ ... ]

> @@ -592,6 +619,10 @@ static netdev_tx_t mtip_start_xmit_port(struct sk_bu=
ff *skb,
> =20
>  	skb_tx_timestamp(skb);

[Severity: High]
This is a pre-existing issue, but does accessing the skb fields here cause a
use-after-free?

Ownership of the SKB is transferred to the hardware by setting
bdp->cbd_sc =3D status just above this. The hardware can immediately transm=
it
the packet and issue a completion interrupt which frees the SKB before
skb_tx_timestamp() or skb->len are evaluated.

> +	/* For port separation - force sending via specified port */
> +	if (!fep->br_offload && port !=3D 0)
> +		mtip_forced_forward(fep, port, 1);

[Severity: High]
Is there a race condition here with the shared DMA transmission ring?

The driver steers individual packets to a specific port by updating the glo=
bal
hardware register ESW_P0FFEN via mtip_forced_forward() immediately before
triggering the DMA transmission. Since the hardware processes the DMA ring
asynchronously, modifying this global register dynamically might forcefully
redirect previously enqueued but not-yet-transmitted packets to the new por=
t.

Also, since forced forwarding is never disabled (a call with enable=3D0 is
missing), will all subsequent bridge or broadcast traffic originating from =
the
CPU be misrouted to the last specified port?

>  	dev->stats.tx_bytes +=3D skb->len;

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c b/driv=
ers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
> @@ -0,0 +1,442 @@

[ ... ]

> +int mtip_vlan_input_process(struct switch_enet_private *fep,
> +			    int port, int mode, unsigned short port_vlanid,
> +			    int vlan_verify_en, int vlan_domain_num,
> +			    int vlan_domain_port)
> +{

[ ... ]

> +	if (vlan_verify_en =3D=3D 1 &&
> +	    (vlan_domain_num < 0 || vlan_domain_num > 32)) {

[Severity: High]
Does this bounds check permit the index to be exactly 32?

Since the VLAN resolution table consists of 32 entries (indexed 0 to 31),
calculating the offset for index 32 might overwrite the adjacent ESW_DISCN
register and cause memory corruption.

> +		dev_err(&fep->pdev->dev, "%s: Domain out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	writel(FIELD_PREP(MCF_ESW_PID_VLANID_MASK, port_vlanid),
> +	       fep->hwp + ESW_PID(port));
> +	if (port =3D=3D 0) {
> +		if (vlan_verify_en =3D=3D 1)
> +			writel(FIELD_PREP(MCF_ESW_VRES_VLANID_MASK,
> +					  port_vlanid) | MCF_ESW_VRES_P0,
> +			       fep->hwp + ESW_VRES(vlan_domain_num));

[Severity: High]
Does writing directly to ESW_VRES(vlan_domain_num) using an absolute writel=
()
clobber other ports' memberships?

Because ESW_VRES is a bitmap representing all ports in the domain, this mig=
ht
destroy the membership of any other port previously assigned to that same
VLAN domain.

> +		writel(readl(fep->hwp + ESW_VIMEN) | MCF_ESW_VIMEN_EN0,
> +		       fep->hwp + ESW_VIMEN);
> +		writel(readl(fep->hwp + ESW_VIMSEL) |
> +		       FIELD_PREP(MCF_ESW_VIMSEL_IM0_MASK, mode),
> +		       fep->hwp + ESW_VIMSEL);

[Severity: High]
Does this read-modify-write pattern clear the previous bits in the target
mask before the new mode is applied?

If the register previously held a mode with conflicting bits, the logical OR
will combine them (e.g., updating mode 3 to mode 1 leaves the register at 3=
),
placing the hardware in an invalid configuration state.

[ ... ]

> +int mtip_vlan_output_process(struct switch_enet_private *fep, int port,
> +			     int mode)
> +{

[ ... ]

> +	if (port =3D=3D 0) {
> +		writel(readl(fep->hwp + ESW_VOMSEL) |
> +		       FIELD_PREP(MCF_ESW_VOMSEL_OM0_MASK, mode),
> +		       fep->hwp + ESW_VOMSEL);

[Severity: High]
Does this read-modify-write pattern clear the previous bits in the target
mask before the new mode is applied?

If the register previously held a mode with conflicting bits, the logical OR
will combine them, placing the hardware in an invalid configuration state.

[ ... ]

> +int mtip_port_enable_config(struct switch_enet_private *fep, int port,
> +			    bool tx_en, bool rx_en)
> +{
> +	u32 reg =3D 0;

[ ... ]

> +	reg =3D readl(fep->hwp + ESW_PER);

[Severity: High]
Are these read-modify-write operations on shared global hardware registers
synchronized?

Since these functions do not acquire fep->hw_lock to serialize access,
concurrent calls from ethtool, sysfs, or NAPI might overlap, tearing the
state and corrupting the hardware registers.

[ ... ]

> +int mtip_port_learning_config(struct switch_enet_private *fep, int port,
> +			      bool disable, bool irq_adj)
> +{
> +	u32 reg =3D 0;

[ ... ]

> +	reg =3D readl(fep->hwp + ESW_BKLR);
> +	if (disable) {
> +		if (irq_adj)
> +			writel(readl(fep->hwp + ESW_IMR) & ~MCF_ESW_IMR_LRN,
> +			       fep->hwp + ESW_IMR);

[Severity: Medium]
Does disabling learning on a single port clear MCF_ESW_IMR_LRN in the global
ESW_IMR register?

This might suppress learning interrupts for all other ports. Also, the
pre-existing NAPI poll routine mtip_rx_napi() unconditionally overwrites
ESW_IMR with hardcoded values, meaning this configuration might be
immediately discarded upon the next packet reception.


Additional pre-existing issues found in the codebase:

[Severity: High]
This is a pre-existing issue, but does lockless freeing of SKBs cause a
double free and use-after-free here?

drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:mtip_switch_restart() {
...
    for (i =3D 0; i <=3D TX_RING_MOD_MASK; i++) {
        if (fep->tx_skbuff[i]) {
            dev_kfree_skb_any(fep->tx_skbuff[i]);
            fep->tx_skbuff[i] =3D NULL;
        }
    }
...
}

The phylib state machine triggers mtip_adjust_link() from process context,
which unconditionally calls mtip_switch_restart() and locklessly frees all
tx_skbuff entries. If the NAPI softirq mtip_switch_tx() is concurrently
processing TX completions, both threads can simultaneously retrieve and free
the same SKB pointers.


[Severity: High]
This is a pre-existing issue, but do concurrent PHY adjustments trigger
unsynchronized global switch resets?

drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:mtip_adjust_link() {
...
}

The phylib core triggers mtip_adjust_link() for each port's PHY
independently. Because mtip_adjust_link() invokes mtip_switch_restart()
without holding a global lock spanning all ports, simultaneous link state
changes on multiple ports will trigger concurrent MCF_ESW_MODE_SW_RST resets
and overlapping re-initialization of the shared hardware rings.


[Severity: High]
This is a pre-existing issue, but does this mapping read out-of-bounds?

drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:mtip_start_xmit_port() {
...
    bdp->cbd_bufaddr =3D dma_map_single(&fep->pdev->dev, bufaddr,
                                      MTIP_SWITCH_TX_FRSIZE,
                                      DMA_TO_DEVICE);
...
}

When preparing a transmission descriptor without a bounce buffer,
dma_map_single() is called with a fixed length of MTIP_SWITCH_TX_FRSIZE
instead of the packet's actual length skb->len. Since networking packets are
generally much smaller than the maximum frame size, this causes the DMA
mapping to read well beyond the end of the allocated SKB buffer, potentially
triggering IOMMU faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D6
