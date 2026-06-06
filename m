Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA5172622
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730685; cv=none; b=mNVdt1fMN1EuahEQnT+O+MbD0JrjOvvMkOrNSOCoMa6yFuXGNMlv4XHg3uaP+YvW+SSeJerJmNAXNrzctRZty7+36YD+TQJmGX+ax2gqo0MJ0YisHZG/pFcIX9t7dkOLSaOLnUYR9og0NUAIHp/RGAYozFOJsRWSHkZwGpm7j0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730685; c=relaxed/simple;
	bh=ENlrQmhnXR8Dc6MXepZJGkrbovYlcg+3XWCNOe8te1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iCWDEe3aJQGQdEcb3a2ie8mMjK+M+F8TLxtVa2VW+A/8jpgm5OmqZtJFgCwJjf5+qgPW9yiuYf4tGMoSxhp/kMwF4SGTvVVS65Lgud9ecjR8S1U/x/6UjKlSbnT5cfhFsgXgNa1MEib6ZgI/FxVl9zmR1PPN/fjG8GhgYAHKPKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyLTnEtC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyLTnEtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9351F00893;
	Sat,  6 Jun 2026 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730684;
	bh=DvPcTWWWiF8VvqRVNirW+fwCRUm0Ca9/z2YEfSjVLSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AyLTnEtCl6HERAdvt8gsZDV7JFIrb9rdwlEXb9LQA3XYDf+vkGDj3rDN2Lu8fXwIM
	 p3FF9A6HqAatY+p/CZ7GOav0e3UQpUuf9NjFD0s2uts3+ksKIqGz6LGDckEiYG4Mg0
	 HZq4onPIuPAcjgqcBw3Mn4B2/KoJ3Mdgx5a1+e8E/WR/kB+UBF2T215LI/QeANr/YO
	 oOpTQ9u/DOX2tkPOTLx3VRYvnukgluOxz9NTXMrwI2gCzQZ5CWde8LS+g1+KUOpsGY
	 CJr+7i/3vIRV/BkDPX+/6NHpIo+Q5EJ+bLoocz3Yi1eSW1GJNWiR08ZX5PFhs9PavF
	 ba0A9jWSW7Czw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 14/15] net: enetc: add PSI-to-VSI link status
 notification support for VF
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605065550.3038579-15-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:44 +0000
Message-Id: <20260606072444.6C9351F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect teardown sequence in device removal and probe error path=
s leads to Use-After-Free and hardware interrupt storms.
- [High] VF initialization fails completely on older host PF drivers due to=
 unsupported link status registration command.
- [Medium] Missing workqueue flush in `enetc_close()` allows asynchronous c=
arrier state modification on a down interface.
--

commit 24125d222c23303bc6d2d8db3f12047a510f7b92
Author: Wei Fang <wei.fang@nxp.com>

    net: enetc: add PSI-to-VSI link status notification support for VF
   =20
    Add infrastructure for ENETC v4 VFs to track PF link status changes via
    the PSI-to-VSI messaging channel. Two new ops,
    vf_reg_link_status_notifier and vf_unreg_link_status_notifier, are added
    to enetc_si_ops and wired into enetc_phylink_connect() and enetc_close()
    for the phy-less path.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index fdceaf36daa72..a1a8a1551cd8e 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -2892,11 +2892,15 @@ static void enetc_clear_interrupts(struct enetc_n=
dev_priv *priv)
>  static int enetc_phylink_connect(struct net_device *ndev)
>  {
>  	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
> +	struct enetc_si *si =3D priv->si;
>  	struct ethtool_keee edata;
>  	int err;
> =20
>  	if (!priv->phylink) {
>  		/* phy-less mode */
> +		if (si->ops->vf_reg_link_status_notifier)
> +			return si->ops->vf_reg_link_status_notifier(si);
> +

[Severity: High]
If an older PF driver rejects the ENETC_MSG_REGISTER_LINK_CHANGE_NOTIFIER
command and returns -EOPNOTSUPP, will propagating this error cause
enetc_open() to abort and completely break VF initialization on older host
kernels?

Would it be safer to intercept -EOPNOTSUPP and fall back to the legacy
netif_carrier_on() behavior?

>  		netif_carrier_on(ndev);
>  		return 0;
>  	}

[ ... ]

> @@ -3050,6 +3057,7 @@ EXPORT_SYMBOL_GPL(enetc_stop);
>  int enetc_close(struct net_device *ndev)
>  {
>  	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
> +	struct enetc_si *si =3D priv->si;
> =20
>  	enetc_stop(ndev);
> =20
> @@ -3057,6 +3065,9 @@ int enetc_close(struct net_device *ndev)
>  		phylink_stop(priv->phylink);
>  		phylink_disconnect_phy(priv->phylink);
>  	} else {
> +		if (si->ops->vf_unreg_link_status_notifier)
> +			si->ops->vf_unreg_link_status_notifier(si);
> +
>  		netif_carrier_off(ndev);
>  	}

[Severity: Medium]
Since si->msg_task isn't flushed or canceled here, could a pending link sta=
tus
interrupt execute asynchronously after the device is closed?

If enetc_vf_msg_task() runs after netif_carrier_off(), it might incorrectly
invoke netif_carrier_on() and turn the carrier state back on for a closed
interface. Does it make sense to add flush_work(&si->msg_task) here to ensu=
re
proper synchronization?

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 418ee98da17d6..9cace77110b8a 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c

[ ... ]

> @@ -524,7 +706,8 @@ static void enetc_vf_remove(struct pci_dev *pdev)
> =20
>  	priv =3D netdev_priv(si->ndev);
>  	unregister_netdev(si->ndev);
> -
> +	enetc_vf_free_msg_msix(si);
> +	enetc_vf_wq_task_destroy(si);
>  	enetc_free_msix(priv);
> =20
>  	enetc_free_si_resources(priv);

[Severity: High]
Could this teardown sequence result in an interrupt storm and a
use-after-free? This also appears to apply to the enetc_vf_probe() error
path.

During removal, enetc_vf_free_msg_msix() frees the OS-level IRQ handler. Th=
en
enetc_vf_wq_task_destroy() waits for the workqueue to drain. If
enetc_vf_msg_task() executes during this time, it unconditionally calls
enetc_vf_enable_mr_int() at the end, re-enabling the interrupt in the
hardware. Since the OS handler is gone, this leaves the device generating
unhandled MSI-X interrupts, which might lead to an IRQ storm or IOMMU fault.

Additionally, unregister_netdev() has already completed before the workqueue
is destroyed. If the work item executes and calls netif_carrier_on() for the
unregistered device, it adds the device to the global linkwatch list. When =
the
linkwatch worker later processes the list, it accesses the freed net_device
memory.

Should the teardown order be adjusted so the workqueue is destroyed before =
the
interrupt is freed, and should both happen before the netdev is unregistere=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D14
