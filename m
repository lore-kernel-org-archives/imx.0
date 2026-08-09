Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504917083C
	for <imx@lists.linux.dev>; Sun,  9 Aug 2026 03:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786245546; cv=none; b=egJlQd35lpcjIAtxMAdovbAO9WP0wtp6urlumhMl9nP30s4XtKHeSNjreROQIW1fQvZil7JOVV1X7HDmSUDKDu+AnWR/t4EJqmXO1NMZT5rLOrB3abd9evs9v8DBxd8JtCuzLIHdlisM5OLhusLWePCEwKgpBiDsglXZt2Ddgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786245546; c=relaxed/simple;
	bh=yLxycZe8KDJoq77aVsWxea3KStPhk9c0hDBlR6RQNS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EnK53RCqV4RpF0T0pYR9Qt6lITZGYaPlVOXhUvROCksahcJlzKpfIJDMdxf7P5UW367vLmvz3QHfj8JGAdZdDOQg7RbbmSWbSCANp52d15f7/n3g6hx6OiG6UMttjmDqMRNnJvVFhhbLpmyxVGr1gZQnGCIdQLDOPXMm1fiBbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Enfc5fxs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Enfc5fxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B581F000E9;
	Sun,  9 Aug 2026 03:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786245544;
	bh=D7w3I5b3xoraXutig+Iso4ZOFrS+UzvAgdTt1l6+CHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Enfc5fxs/TiAcQ/+GEbHaTi8ZGrY5M+IhQmuk/H12OCaB6+YhmZrkhOkoOSwQbxJF
	 cign0YIwQCuEADUPVemXqmrhKws6gJFOhONmvF6huU+9VSxEuvltoKzdsFx0fk3PzE
	 f9W7dfNoUybZHqyUmGLZ8LEvNQ+s0m9+ml06GTuqBLHTnXANHECQyoMzn7mVoEoRhU
	 VL6a03DfqqPBKAxa+K19jEW8M3CEKmBxRjJklMXZYsApcEQpNizjt2zC2TodSktnDW
	 4u6JUoXz+iNllVrRbakL2MG85mXBV8KjtxRg1RbR01yLlwxJPrss7oQ/iyw9pVltYP
	 pei2SZjFyA2SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 3/7] ptp: netc: export
 netc_timer_get_current_time() for cross-driver use
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260808032146.2335723-5-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
 <20260808032146.2335723-5-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 03:19:04 +0000
Message-Id: <20260809031904.90B581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The exported function `netc_timer_get_current_time()` assumes any =
non-NULL driver data belongs to the `ptp_netc` driver, leading to type conf=
usion and memory corruption if a different driver is bound to the device.
--

--- Patch [3]: [PATCH v2 net-next 3/7] ptp: netc: export netc_timer_get_cur=
rent_time() for cross-driver use ---
commit fe6f3ab81e37c2bfadc0b000bbb64a980c0130de
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: export netc_timer_get_current_time() for cross-driver use

This commit exports netc_timer_get_current_time() so the NETC Switch driver
can obtain the PTP time from its associated NETC Timer PCIe function. It us=
es
device_lock() to serialize against unbinds while reading the timer registers
via the timer driver's private data.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index d33c49c86ac44..27f85818d6a8a 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c

[ ... ]

> @@ -165,6 +165,47 @@ static u64 netc_timer_cur_time_read(struct netc_time=
r *priv)
>  	return netc_timer_rd64(priv, NETC_TMR_CUR_TIME_L);
>  }
> =20
> +/**
> + * netc_timer_get_current_time - read the current PTP time from the NETC=
 Timer
> + * @pdev: PCI device of the NETC Timer
> + *
> + * Reads the 64-bit current time register (TMR_CUR_TIME) from the NETC T=
imer
> + * device associated with @pdev. Returns 0 if the Timer driver has not y=
et
> + * probed or has already been removed.
> + *
> + * Context: Process context only. Acquires the device mutex via device_l=
ock(),
> + *          which may sleep. Must not be called from atomic context, sof=
tirq,
> + *          BH, or while holding a spinlock.
> + *
> + * Return: Current PTP time in nanoseconds, or 0 if the timer is unavail=
able.
> + */
> +u64 netc_timer_get_current_time(struct pci_dev *pdev)
> +{
> +	struct netc_timer *priv;
> +	unsigned long flags;
> +	u64 cur_time =3D 0;
> +
> +	/* Serialize against driver unbind: the remove() callback runs under
> +	 * the device lock, so holding it here ensures that priv remains valid
> +	 * for the entire duration of the register read.
> +	 */
> +	device_lock(&pdev->dev);
> +
> +	priv =3D pci_get_drvdata(pdev);
> +	if (!priv)
> +		goto unlock_device;
> +
> +	spin_lock_irqsave(&priv->lock, flags);

[Severity: High]
If a privileged user unbinds the ptp_netc driver from this PCI device via
sysfs and binds a different driver (like vfio-pci), won't pci_get_drvdata()
return the new driver's private data structure instead of struct netc_timer?

Could this cause type confusion and memory corruption when subsequently
accessing priv->lock and priv->base during the register read?

Would it be safer to verify that pdev->driver is actually the netc_timer_dr=
iver
before dereferencing the driver data?

> +	cur_time =3D netc_timer_cur_time_read(priv);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +unlock_device:
> +	device_unlock(&pdev->dev);
> +
> +	return cur_time;
> +}
> +EXPORT_SYMBOL_GPL(netc_timer_get_current_time);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808032146.2335=
723-1-wei.fang@oss.nxp.com?part=3D3
