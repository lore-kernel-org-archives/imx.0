Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95093AEB5D;
	Fri, 21 Aug 2026 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318473; cv=none; b=dfJCY4ik8oZzlWYQhnrRxBoZnVu2321CSz6GF75lfxPZxVxoUIYViT+IA0HsAyVMcIl+kU7tDvBJlFFLnHXSNKiKpSL4tfMKE+qRbH8WREdxnZ5pcDA9nEf28LJDkdJ8DqaVw2h+VYmWtet9ea2KEqX1WHTV3Bre6VPGmWy+N0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318473; c=relaxed/simple;
	bh=1FTQltPdI0gfZA8MR9dq8ONp3ZEiX/qlC340ghbMeoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m+Fnsm8bE6mGV/xnhiK+qzl8N1AS7oI+gMUxR9TvWZc3Tr/ADecxKGYINxk1ShifrlKO0hZuVY/v4OMwtZ7nRdV/3F/iNkQ5G/clVlZqSiGtnwP26XTPkPHLWHkxbxzTISRXxig/E07oLqbT0zLKrA19NiQvYDGn0B83BPJILxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrGcs3cV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrGcs3cV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EDC1F000E9;
	Fri, 21 Aug 2026 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787318466;
	bh=UO83Pge5EoyvyzIjtqufsB2ywalS8y7AnvapdpLfoTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hrGcs3cVoyqAxXXsG+C7lfpG0EMRbcbCMUMfT7jqy5xPHoLozL3DhEFi3Sd+FmhGB
	 JuBRjhE0QPt2MaA9DI8c3QRjLzvtjTPhe2jXW9Az/QHDCkc5dkTRVQFPRTVH5lljzv
	 tOxWvP4CEc1A9sWRZ5zuAYBn4hn1kbJSs+/RingIBkwYUNEatkmKC262y1zmiGyQhS
	 JHYfcZS0VKyKXQ1s/wctyAvwHTINfYSjN72yEwhOKBnvqm4cEvjhAotAB2Vwo46Elz
	 r3yxDnyyIkeaUQMr29gj5v5drcCFoD7i1T4EM5c8pFBinVpdMgkZ+6mkSzFnYDgXKF
	 3AUttEHY6MpJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v40 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260822-imx-se-if-v40-3-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
 <20260822-imx-se-if-v40-3-74fbce2f2f95@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:21:06 +0000
Message-Id: <20260821132106.82EDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Per-instance IMEM state is gated behind a global static variable, =
silently breaking boot firmware loading on subsequent probes or module relo=
ad.
- [High] Overriding a successful, completed firmware transaction with `-ERE=
STARTSYS` due to an earlier signal causes hazardous double-execution of non=
-idempotent operations.
--

--- Patch [3]: [PATCH v40 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 20968ef12d731efd276f3bd73d0897a236c63074
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave.
Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 0000000000000..04ee5112d3463 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> +		 * On success report -ERESTARTSYS for the interrupted wait; the
> +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;

[Severity: High]
Does overriding a successful hardware response (`err > 0`) with
`-ERESTARTSYS` cause hazardous double-execution of non-idempotent hardware
operations (e.g., key generation, counter increments)?

If a transaction completes successfully in hardware, but userspace receives
`-EINTR` (from `-ERESTARTSYS`), it may reissue the system call, causing the
hardware to execute the same state-changing operation a second time. Should
returning success take precedence over the pending signal to keep the hardw=
are
state consistent with the userspace view?

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}
> +
> +	ele_msg_send_rcv_cleanup(priv);
> +
> +	return err;
> +}
[ ... ]
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0000000000000..df3d1da28a759 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +	s_info =3D (struct ele_dev_info *)data;
> +
> +	if (!var_se_info.soc_rev) {
> +		var_se_info.soc_rev =3D s_info->d_info.soc_rev;
> +
> +		/*
> +		 * Only update IMEM state when the load_fw path is active;
> +		 * on SoCs without IMEM management (e.g. i.MX93) the field
> +		 * is not meaningful.
> +		 */
> +		if (load_fw->imem_mgmt)
> +			load_fw->imem.state =3D s_info->d_addn_info.imem_state;
> +	}

[Severity: High]
Will gating the per-instance `priv->load_fw.imem.state` initialization insi=
de
`if (!var_se_info.soc_rev)` silently break boot firmware loading on subsequ=
ent
probes or module reload?

Since `var_se_info` is a global static variable whose `soc_rev` field is ne=
ver
cleared across driver unbinds, any subsequent interface probe (or re-probe
after unbind via sysfs) will find `var_se_info.soc_rev` already populated.

This causes the driver to skip updating `load_fw->imem.state`, leaving it at
`0`. Later, `se_load_firmware()` checks `if (load_fw->imem.state =3D=3D
ELE_IMEM_STATE_BAD)` to decide whether to load the primary boot firmware.
Since the state is 0 instead of `0xfe`, does it silently skip the load and
break firmware initialization for that instance?

> +
> +	if (se_info->soc_name && !var_se_info.soc_dev_regn.soc_dev_registered) {
> +		err =3D se_soc_dev_register(priv, var_se_info.soc_rev,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-imx-se-if-=
v40-0-74fbce2f2f95@nxp.com?part=3D3
