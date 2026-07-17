Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11A63BBFDE;
	Fri, 17 Jul 2026 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286613; cv=none; b=upvknDQhdkXZ9hU7/wkdL6M9+uj2jTmSxK35Yfs2o27im2SZhrF+ndru0TUZT54dQxUGVNThrnwpvNPL4eOToB8rhUmBwPQuakIjH88Q/262HVqdqF3Oh53irgt4zh3+m60qUdmMVY0RlZQJi5kT6y3QkIWGui4RWhZRRYHaRsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286613; c=relaxed/simple;
	bh=kQrqPb3dia1zxHkgwVhMD9tyNhgz7cetDkzKfhFkCWQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xs+qBvzxeOL5wGm2kQJTmxYMzO2hLtCsm1osklLHqyz7Vq628qmxdLknLRdi4oyZ7WIBUjcq0B5u4GuEKTZSyKlyllrqNK6f+ekdSUxSxqLm7AudiU/+F+Ouw70/M9UjlBlbm3UMtP/ScDKgOv5PFY/73f31KtMcYCfQFh8p/pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAw5Dp9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAw5Dp9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55531F000E9;
	Fri, 17 Jul 2026 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286610;
	bh=PzyBYM3pYimTiftPT8RsrW2BySUZEK1Y7uXHZ/J24ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAw5Dp9wCxWfbjYvXQpXCB5Gb4g7S8/1PsFODH/YhuNSVZOnyj9X6tmcC1VfOHWte
	 ESRQ2PC4GjO8HMy+Vb3fPf5tgJeROZ6hg51QDH3Kf/4via4PHCJahAQx9jr8k5YHdM
	 drMWXptAPb+nc+RBylJFi0F/sbRN2etthrHOU5ggH6Nbfymj51Ba4mYfW5CYwmOiHq
	 ICI+qITYEA8Ax/wM+nrwLHmu5jyIQYwYP58bo2+ZZY7Hx8QxsoRW/tRUDO0kga4Ydo
	 2v8XqlSYj7oQM/L13yYRHT9508wqNustdZ2Cx137kF1n3yY07JfzaxZsg/3DIZXvzW
	 0LQm0dtTB8cRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717-imx-se-if-v28-3-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-3-0a9659c7e69d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:10:09 +0000
Message-Id: <20260717111009.B55531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The mailbox receive callback `se_if_rx_callback` dereferences `msg=
` without checking `IS_ERR()`, leading to a kernel panic if the mailbox con=
troller returns an error.
- [High] `ele_msg_rcv()` uses `MAX_SCHEDULE_TIMEOUT` causing an infinite un=
interruptible wait and subsystem deadlock if the firmware hangs.
- [Medium] Global state `var_se_info.soc_rev` prevents SoC device registrat=
ion and per-device IMEM state initialization on driver rebind or secondary =
device instances.
- [Medium] Casting a 1-byte aligned stack array to `struct ele_dev_info` an=
d `u32` pointers causes undefined behavior and potential unaligned memory a=
ccess faults.
- [Medium] The driver fails to expose the file descriptor interfaces claime=
d in the commit message and Kconfig.
- [Low] The SoC revision is incorrectly formatted as minor.major instead of=
 major.minor.
--

--- Patch [3]: [PATCH v28 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit a06a0c9a5464457c1ae77bb60350c41fff331ed9
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave.
The secure enclave FW communicates with Linux over single or multiple
dedicated messaging unit(MU) based interface(s).

Link: https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-bb7c45952f06@=
nxp.com?part=3D3

> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index 127ad752acf86..e3cb7f965e70e 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig

[ ... ]

> @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
>  	  core that could provide misc functions such as board control.
> =20
>  	  This driver can also be built as a module.
> +
> +config IMX_SEC_ENCLAVE
> +	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driv=
er."
> +	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
> +	select FW_LOADER
> +	default m if ARCH_MXC
> +
> +	help
> +	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
> +	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> +	    like base, HSM, V2X & SHE using the SAB protocol via the shared Mes=
saging
> +	    Unit. This driver exposes these interfaces via a set of file descri=
ptors
> +	    allowing to configure shared memory, send and receive messages.

[Severity: Medium]
Is this Kconfig description accurate? It mentions exposing interfaces via a
set of file descriptors allowing to configure shared memory, send and recei=
ve
messages. However, there is no character device registration or file
operations implemented in this patch.

> diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/e=
le_base_msg.h
> new file mode 100644
> index 0000000000000..4c3699543e879
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.h

[ ... ]

> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2025 NXP
> + *
> + * Header file for the EdgeLock Enclave Base API(s).
> + */

[ ... ]

> +#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
> +	const u32 *__x =3D (const u32 *)(x); \
> +	size_t __sz =3D (uid_word_sz); \
> +	((u64)__x[__sz - 1] << 32) | __x[0]; \
> +	})

[Severity: Medium]
Can this macro cause undefined behavior? When called from get_se_soc_info(),
the x parameter points into a 1-byte aligned stack array (u8 data). Casting
this to a u32 pointer and dereferencing it could trigger unaligned memory
access faults on architectures with strict alignment requirements.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> new file mode 100644
> index 0000000000000..ca8a32a82689b
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -0,0 +1,470 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */

[ ... ]

> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl)
> +{
> +	bool wait_uninterruptible =3D false;
> +	unsigned long remaining_jiffies;
> +	unsigned long flags;
> +	int ret;
> +
> +	remaining_jiffies =3D MAX_SCHEDULE_TIMEOUT;
> +	do {
> +		if (wait_uninterruptible)
> +			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
> +							  remaining_jiffies);

[Severity: High]
Can this loop cause a subsystem deadlock? Since remaining_jiffies is set to
MAX_SCHEDULE_TIMEOUT, wait_for_completion_timeout() blocks indefinitely. If
the firmware hangs and wait_uninterruptible is set to true after a signal,
the thread will enter an infinite uninterruptible sleep while holding the
se_if_cmd_lock mutex. The timeout fallback and circuit breaker logic become
unreachable.

> +		else
> +			ret =3D wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
> +									remaining_jiffies);

[ ... ]

> +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> +{
> +	struct se_clbk_handle *se_clbk_hdl;
> +	struct device *dev =3D mbox_cl->dev;
> +	struct se_msg_hdr *header;
> +	bool sz_mismatch =3D false;
> +	struct se_if_priv *priv;
> +	unsigned long flags;
> +	u32 rx_msg_sz;
> +
> +	priv =3D dev_get_drvdata(dev);
> +
> +	/* The function can be called with NULL msg */
> +	if (!msg) {
> +		dev_err(dev, "Message is invalid\n");
> +		return;
> +	}
> +
> +	header =3D msg;
> +	rx_msg_sz =3D header->size << 2;

[Severity: High]
Does this code safely handle mailbox errors? If the mailbox controller
returns an error (like a timeout), it typically passes ERR_PTR(err) to the
callback. The check for !msg allows ERR_PTR to bypass the check, which
would lead to a kernel panic when msg is cast to struct se_msg_hdr and
dereferenced here.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> new file mode 100644
> index 0000000000000..9bb59c200911b
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 NXP
> + */

[ ... ]

> +static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_=
info *se_info)
> +{
> +	struct se_fw_load_info *load_fw =3D get_load_fw_instance(priv);
> +	struct soc_device_attribute *attr;
> +	u8 data[MAX_SOC_INFO_DATA_SZ];
> +	struct ele_dev_info *s_info;
> +	struct soc_device *sdev;
> +	int err =3D 0;
> +
> +	/*
> +	 * This function should be called once.
> +	 * Check if the se_soc_rev is zero to continue.
> +	 */
> +	guard(mutex)(&var_se_info.se_var_info_lock);
> +	if (var_se_info.soc_rev)
> +		return err;

[Severity: Medium]
Will this early return prevent initialization on driver rebind? When the
driver is unbound, soc_device_unregister() removes the SoC device, but the
global var_se_info.soc_rev is never cleared. On a subsequent bind, a
non-zero soc_rev causes an early return, bypassing soc_device_register()
and leaving load_fw->imem.state uninitialized.

> +
> +	err =3D ele_fetch_soc_info(priv, &data);

[ ... ]

> +	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
> +		attr->revision =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
> +						FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
> +							  var_se_info.soc_rev),
> +						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
> +							  var_se_info.soc_rev));

[Severity: Low]
Is this string format correct? It prints MIN_VER_MASK before MAJ_VER_MASK,
resulting in minor.major instead of major.minor. This might break userspace
parsing expectations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx-se-if-=
v28-0-0a9659c7e69d@nxp.com?part=3D3
