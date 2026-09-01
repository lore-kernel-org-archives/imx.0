Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF553A83B1
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788233042; cv=none; b=CagGk3egkwbdBZUU8MEadD3rg/cyPRUWnQrydWUsoWPE+I3/nKiQTaAYnWMhd0o0UFy7PPUHwkADw2wvYNpkkB343aJdnr0bDiNrVo75oKmOAU8uUEhYglQf4647Q7ZthxNtnVAa944mY3p3f8zfHgM/7hKkaYUHDjyFB5YtGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788233042; c=relaxed/simple;
	bh=pIXjnf3GgCh3tHVSjesSyinm+SZuuiASbY19rZ4CKAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u48eEkNKK3ytNTvz+60eT7QrTKKRWprfOzZ+M/dtIXiJu+TPB5kfBgho38+kgCb7Vm9EVRCRxc+3dY2ALoqgeBV6Ov6Z80TNyfJRmD7liKLhe+Pgzt6W7eHADIqf+EBjsC1KP8i/jBCyGXiQmY5gsuQL5Rdy5/S+ITDg2KOvR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxcFeHy+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxcFeHy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E611F000E9;
	Tue,  1 Sep 2026 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788233040;
	bh=vLnl2FNVvjvh0prFj9KnR8y7s4i74Iz69IojgL4Q53s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxcFeHy+6tL9FRt065mBhUyy8JyfYbrBJbK4KgpiIzWyq8naa7Bxio3dboM7Y/0/K
	 gDIPzgHhMEtRJzHOeA2ND8Fe0Y86WkSGt6yJTEhac6udS7Aprb1GnFWM0FLZhycFwB
	 IT35BMiWDEpsoeSXggx+4ikN2vj7tM9X30a3BqQ4T9KZ5VVrpxE5CsYfINF+/C+83/
	 eNxDt1NHFSRNZ+B8ADcN8qI2/LSwfUcZ8j2VJ7hOGMy0g0zDAk4+1ZWyJNllUSG7gz
	 W5HRtTxmu6RtVT2Hw1akGprAt3lR047jEpkpZkwnEEebKTfjsSVjCMv8F07Lx/LhGC
	 yG598DNz6EzDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 14/15] net: enetc: add PSI-to-VSI link
 status notification support for VF
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260831025441.635045-15-wei.fang@oss.nxp.com>
References: <20260831025441.635045-1-wei.fang@oss.nxp.com>
 <20260831025441.635045-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 03:23:59 +0000
Message-Id: <20260901032400.59E611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition in `enetc_vf_probe` causes permanent loss of carrie=
r state if the interface is brought UP immediately by userspace.
--

commit 14cc725fe4ebcb6942ed2c3904878d85a508f30f
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add PSI-to-VSI link status notification support for VF

This commit adds infrastructure for ENETC v4 VFs to track PF link
status changes via the PSI-to-VSI messaging channel. It implements
a dedicated MSI-X vector and workqueue to parse notifications and
update the carrier state accordingly.

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c

[ ... ]

> @@ -520,15 +718,33 @@ static int enetc_vf_probe(struct pci_dev *pdev,
>  		goto err_alloc_msix;
>  	}
> =20
> +	err =3D enetc_vf_wq_task_init(si);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to init workqueue\n");
> +		goto err_wq_init;
> +	}
> +
> +	err =3D enetc_vf_register_msg_msix(si);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to register msg irq\n");
> +		goto err_register_msg_msix;
> +	}
> +
>  	err =3D register_netdev(ndev);
>  	if (err)
>  		goto err_reg_netdev;
> =20
> +	/* Enable message received interrupt */
> +	enetc_vf_enable_mr_int(si);
>  	netif_carrier_off(ndev);

[Severity: High]
This isn't a bug introduced by this patch, but this is a pre-existing=20
issue that appears to be exacerbated by the new asynchronous message=20
handling.

Could this sequence in enetc_vf_probe() cause a permanent loss of the
carrier state if the interface is brought up immediately by userspace?

Once register_netdev() exposes the device to userspace, the rtnl_lock
is dropped. If userspace reacts to the registration and brings the
interface up immediately, enetc_open() will run and successfully register
the link status notifier.

The PF then replies with the initial link status, queuing the msg_task
workqueue which calls netif_carrier_on().

Concurrently, enetc_vf_probe() resumes and unconditionally calls
netif_carrier_off(). If the workqueue wins the race, netif_carrier_off()
will overwrite the valid on state with off, severing the link without any
notification until the next physical link flap or a manual restart.

Should netif_carrier_off() be called before register_netdev() to prevent
this condition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831025441.6350=
45-1-wei.fang@oss.nxp.com?part=3D14
