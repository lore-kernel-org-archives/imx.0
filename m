Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741563DB316
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399985; cv=none; b=f7SdkK8FZVrQTL8xaQyd7BROE9a63zuGuhgPVmMfDfvp395ADjMBtS9393Qhjs+tAP6jdOQpqlHapCoZh8VYqo0C8QdJRLu56SEiSZQY+qMJOH8QWwXEIvo8X/CcBPdz6tf0fxIzHl2rOOospIM4fdvCZlWp0NkeiMTFk9cZ0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399985; c=relaxed/simple;
	bh=KbIF8Ss47aCNG76Y1ocu5N1GURatvVYoxcam7r9AcU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JsgSWemfwRAZoNHJRMTJ0s7gJ+/nO7JILQ79B4/VlTmq4VyOSkxZ15uxPHFdAjkd8jJ2WOwyuflX4ahTbjttGpELSuUmT249M5ATquSMdY9j4g3pcVA11fHYOx9u/INj6JlsnJiqrpJ9Fjxk15zmhgwpp2A8bimKieSJoSNkk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaVsFgeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaVsFgeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096771F0089A;
	Tue,  2 Jun 2026 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399980;
	bh=J0Wh0qItHgSsw24n1MgR0CI+ZQg0qiaUNvsV8Asy3L0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iaVsFgeUn9McAXd9EiO8n3B50PXGFgLA3s6v8wGkLkeW9mjwmk8NhVtCrSy5Sg4ir
	 kBo/mzLkpWfcdWK2zm5WLmTIkeP+ok6WYqh2k7bdHpoq18BkkPCHE/MXBODXCXQOz9
	 j/IANNfuT53IZa66hI59yQv9R13SXhUSgR6/+ukXmQbpvC1Pl7vWvDtKUwjpvtTamF
	 /VrhSrhlkAlTsIoCyNa6xIDkaWSyjn0pDY7ik4vYuxNg6R6rN9RBCXDuRinjTdlvp6
	 PhFeyKDknaUqaUki7Wh4Ib53wGzUU6hCveLpHl8TGzuhZL47T/bDlz+1PPSdM5tCbu
	 WyXvRr1/t3FWA==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 7/7] net: mtip: Extend the L2 switch driver for
 imx287 with bridge operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260601112437.2216043-8-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-8-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:59 +0000
Message-Id: <20260602113300.096771F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Global static netdevice notifier block registration breaks multi-i=
nstance support.
- [High] Returning -EOPNOTSUPP on bridge mismatch aborts software bridging =
entirely.
- [Medium] Missing switchdev unoffload due to premature notifier unregistra=
tion in remove path.

Pre-existing issues:
- [High] Use-After-Free / NULL pointer dereference risk due to devm_request=
_irq outliving netdev destruction.
- [High] Lockless switch restart triggered by PHY state machine causes doub=
le-frees and hardware races.
--

commit 11e801c2e83fa88f60f9277fdccfb7c571bbd65f
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>

net: mtip: Extend the L2 switch driver for imx287 with bridge operations

This commit extends the MTIP L2 switch driver to support bridge operations.
It allows configuring the switch as an offloading device for packet switchi=
ng
when a bridge is created on its interfaces.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/n=
et/ethernet/freescale/mtipsw/mtipl2sw.c
> index 76e503e128ddb..0a12d115b78b2 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> @@ -2009,6 +2015,7 @@ static void mtip_sw_remove(struct platform_device *=
pdev)
> =20
>  	timer_delete_sync(&fep->timer_mgnt);
> =20
> +	mtip_unregister_notifiers(fep);
>  	mtip_ndev_cleanup(fep);

[Severity: Medium]
Will calling mtip_unregister_notifiers() before mtip_ndev_cleanup() miss
the automatic switchdev unoffload?

When mtip_ndev_cleanup() unregisters the netdevices, the network stack will
automatically detach them from their upper bridges and generate
NETDEV_CHANGEUPPER unlink events. Since the notifier is already unregistered
at this point, won't the driver miss these events and fail to call
switchdev_bridge_port_unoffload()? This appears to leave the bridge's
offload_count for the port never decremented and leaks the switchdev hardwa=
re
domain object.

[Severity: High]
This isn't a bug introduced by this patch, but does the devm_request_irq()
allocation outlive the netdevice destruction here?

The driver allocates its hardware interrupt using devm_request_irq(), which
means it will only be freed after mtip_sw_remove() returns. However,
mtip_ndev_cleanup() unregisters and frees the fep->ndev structures before
the interrupt is masked or freed. If an interrupt fires during or after this
cleanup, won't mtip_interrupt() execute, schedule NAPI, and cause the NAPI
poll routine to dereference the freed fep->ndev pointers?

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c b/driver=
s/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
> new file mode 100644
> index 0000000000000..c9d9151b0e81d
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c

[ ... ]

> +static int mtip_ndev_port_link(struct net_device *ndev,
> +			       struct net_device *br_ndev,
> +			       struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	if (fep->br_members && !fep->br_offload) {
> +		/* Get the second bridge ndev */
> +		other_ndev =3D fep->ndev[fep->br_members - 1];
> +		other_priv =3D netdev_priv(other_ndev);
> +		if (other_priv->master_dev !=3D br_ndev) {
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "L2 offloading only possible for the same bridge!");
> +			return -EOPNOTSUPP;
> +		}

[Severity: High]
Does returning -EOPNOTSUPP here prevent the kernel from falling back to
software bridging?

When hardware offloading is not possible because the ports belong to differ=
ent
bridges, returning -EOPNOTSUPP directly from the NETDEV_CHANGEUPPER notifier
callback translates to NOTIFY_STOP_MASK. Doesn't this cause
__netdev_upper_dev_link() to completely abort adding the interface to the
bridge? Should this return NOTIFY_DONE or 0 instead to allow graceful
fallback to software bridging?

[ ... ]

> +static struct notifier_block mtip_netdevice_nb __read_mostly =3D {
> +	.notifier_call =3D mtip_netdevice_event,
> +};
> +
> +int mtip_register_notifiers(struct switch_enet_private *fep)
> +{
> +	int ret =3D register_netdevice_notifier(&mtip_netdevice_nb);

[Severity: High]
Does registering a single global static notifier block break multiple device
instances?

If a second device instance is probed, calling register_netdevice_notifier()
with the same mtip_netdevice_nb block will return -EEXIST and trigger a
kernel warning. Furthermore, if any instance is unbound, calling
unregister_netdevice_notifier() will remove the global block, silently
breaking switchdev bridge offloading for all remaining active instances.
Should the notifier_block be embedded within the per-device private
structure instead?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does mtip_adjust_link() race with the TX
hotpath?

The phylib state machine calls mtip_adjust_link() from a workqueue without
holding fep->hw_lock or rtnl_lock. In response to link changes, it calls
mtip_switch_restart(), which resets the switch and calls
dev_kfree_skb_any() on fep->tx_skbuff entries locklessly:

mtip_switch_restart() {
    ...
    dev_kfree_skb_any(fep->tx_skbuff[i]);
    ...
}

Because this runs concurrently with mtip_start_xmit_port() and
mtip_switch_tx(), which modify the same buffers and rings under hw_lock,
won't this cause SKB double-frees, ring descriptor corruption, and hardware
state inconsistencies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D7
