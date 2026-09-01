Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97C3822A5
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250827; cv=none; b=dST6Rt8mt0xlD2W6yVKfZ6fxDsUBYKVQOj+tTGrCwJd4n5tp957hewIn44xMMtxIMKT2l47A/O2VHWGiqS9I1MegYonDPMbtZJfU+/QeO3ClvWVsYaCY5s4reom42DqjJHrGtjAMJW8efblcJLLmB39U/6CVUBbq1u2Yw8Xkh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250827; c=relaxed/simple;
	bh=20Lmat+I0VX4Q9KoSGz9C/bF6DWwsjOYhYLX5T9WenQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YpMNNlAwpVU27ydjPuFtgXbCX4kkI9DQ9VVOrdh5DpyWU76aa9wMTclJPBrhz2o9u6zjNu6FnaqZ/NNwSmO8EWYU3aDMrmNcKmBGKbL42ZoLZeQST5ebFbRzv9kecmc7YT3mw5ggEdt8MBm/TpMoRgaWVk/0/UQdcnOdlfOh7D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LthKGHAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LthKGHAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF94B1F00A3D;
	Tue,  1 Sep 2026 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250825;
	bh=fe/cv5R6YWKQJ1QZPEjYXJpUeRAPj45jMG+g4hRCVtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LthKGHAwoDNOX6uGSD8TP+1ZlZL+fvUuqVNodh534TkONr5iMfggfPbCTUQhQq8/Z
	 s2MlTXlA5IBMyxSfID1lVSs43ekbjEUblDi8/b583ofopRYE+hxoR/L28BkrrrtZuG
	 VPqPzU8gSg6I6sXpG7OyhOJVj68HasmOwwbK1obboAUWHKRWEzAinwpDbX5mKRhJeL
	 1eVJaxJfk6djS4LkMy4oNllbqKSm0VrGLjHPJt1en2lB1mfV8/xHtkRmrRUzC8TRZK
	 JSTvN1Tvjgwd1BpLteVNNlmEetUiyAIJtPkOkgTf5TfV+ECrS+PSWDcPOccBenHxEW
	 rnbfihKXqpMXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 3/8] ptp: netc: export
 netc_timer_get_current_time() for cross-driver use
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831082335.1184605-4-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
 <20260831082335.1184605-4-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:20:25 +0000
Message-Id: <20260901082025.AF94B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using device_lock() in an exported API to protect against driver u=
nbind is an architectural anti-pattern that creates a circular lock depende=
ncy (lockdep warning) and limits caller contexts.
--

commit 9efea393693780854f3e912aa851d7d32115845a
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: export netc_timer_get_current_time() for cross-driver use

The NETC Switch does not have its own time registers and must obtain
the current PTP time from the NETC Timer bound to it. Since the two
are separate PCIe functions with independent drivers, add
netc_timer_get_current_time() to the Timer driver and export it via
EXPORT_SYMBOL_GPL().

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index aa9be8e2a6304..854a206b6c5bc 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
[ ... ]
> @@ -1021,5 +1021,55 @@ static struct pci_driver netc_timer_driver =3D {
>  };
>  module_pci_driver(netc_timer_driver);
> =20
> +/**
> + * netc_timer_get_current_time - read the current PTP time from the NETC=
 Timer
> + * @pdev: PCI device of the NETC Timer
> + * @ns: The current PTP clock time in nanoseconds, returned to the caller
> + *
> + * Reads the 64-bit current time register (TMR_CUR_TIME) from the NETC T=
imer
> + * device associated with @pdev. Returns an error if the Timer driver ha=
s not
> + * yet probed or has already been removed.
> + *
> + * Context: Process context only. Acquires the device mutex via device_l=
ock(),
> + *          which may sleep. Must not be called from atomic context, sof=
tirq,
> + *          BH, or while holding a spinlock.
> + *
> + * Return: 0 on success, otherwise a negative error code.
> + */
> +int netc_timer_get_current_time(struct pci_dev *pdev, u64 *ns)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct netc_timer *priv;
> +	unsigned long flags;
> +	int err =3D 0;
> +
> +	/* Serialize against driver unbind: the remove() callback runs under
> +	 * the device lock, so holding it here ensures that priv remains valid
> +	 * for the entire duration of the register read.
> +	 */
> +	device_lock(dev);

[Severity: High]
Does acquiring the timer's device lock here create a circular lock dependen=
cy
with the switch's remove path?

When the switch driver unbinds, it acquires the switch device's dev->mutex,
then rtnl_lock() via dsa_unregister_switch(), and then onestep->work_lock
via netc_port_disable().

In the datapath workqueue, netc_onestep_work() acquires onestep->work_lock,
and calls this function, which acquires the timer's dev->mutex.

Because lockdep tracks all dev->mutex locks initialized by device_initializ=
e()
as a single lock class, wouldn't this form a dev->mutex -> work_lock ->
dev->mutex circular dependency?

Could we prevent the timer from unbinding while the switch is active by
creating a device link with device_link_add() instead, which would allow
lock-free reads?

> +
> +	if (pci_dev_driver(pdev) !=3D &netc_timer_driver) {
> +		err =3D -EINVAL;
> +		goto unlock_device;
> +	}
> +
> +	priv =3D pci_get_drvdata(pdev);
> +	if (!priv) {
> +		err =3D -ENOMEM;
> +		goto unlock_device;
> +	}
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	*ns =3D netc_timer_cur_time_read(priv);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +unlock_device:
> +	device_unlock(dev);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(netc_timer_get_current_time);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082335.1184=
605-1-wei.fang@oss.nxp.com?part=3D3
