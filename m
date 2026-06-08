Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38C2BE63F
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885038; cv=none; b=Lt27aOpJoufM3PNt0O4P9V2BltN9csyAcw1yNvMILU0mKJlEwANTn/RPq5WTLL0Gr+k83+bHjTodzeasm0MHWMEMJAF60fWkJ6yAL4lnlU6ghBz37eTT1NuaHjGQNd9p9NNd9hvyv93/rA5WFx4IER3skya95mwXp/9yPeUumNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885038; c=relaxed/simple;
	bh=QPvyOj3mY4VI//ojOOjzkT3RKqKsTztHzxxX/t9jXLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZtQgo7sfYeysY08nm3FpmISCncgatxyc9omX2s5z6nk2U/zFt80hxXfdPsoi7qbNdap2hDVUXlx/TiXZfbndrjF19M7jEuDQ4fQQEdVrJmWuYPRnwTulav2BQuOXtUzd+vqgIQDsXhAO8CuhadSTktsllAEQ+4doPDlkeCX0Iv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE5YnkSN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE5YnkSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6601F00893;
	Mon,  8 Jun 2026 02:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780885037;
	bh=VaiesRkKIgWQbAKzWJvSt+W/p50uBdbrqRx6HQjUrL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mE5YnkSNg6xxeWmv0haodFWtIJtK3zmsdVFkCDU5C0pS3DS71Bdn6tDR+6J5sXqko
	 ocNPycyRsqmVORXnOfIxYQuiXNI0rmgcMDRW189cC0gsvF8XGw+yyyaY9YXA6+MfZm
	 SgTrRCQiHy0M9u61xQKQSniUixSQwReHisnJYqL9O5r60HNuAISxmuMKt2KKnKn8c2
	 hNWwUEg87ugMH4c5zpDa8wCKogBp5oIaOfhcNEpiGtbquzzwnOLRNzW/ia2f1r9gjo
	 itmL7W611n2sggNO7FwzD5GnCMzMsDm/RNzrUNsMKCyQDgLTUk0UUQmJG7ozOFbK8Y
	 x6hoDu0a0uT8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in
 syslog_show
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Jun" <lijun01@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260608020345.247101-1-lijun01@kylinos.cn>
References: <20260608020345.247101-1-lijun01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:17:16 +0000
Message-Id: <20260608021717.1F6601F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The single global `notifier_block` instance `scmi_imx_misc_ctr=
l_nb` is registered multiple times into different notification chains, caus=
ing linked list corruption.
- [High] Missing `rx_len` validation allows an out-of-bounds read from the =
SCMI RX buffer.
- [High] Firmware-controlled `size` overwrite causes an out-of-bounds read =
in `syslog_show` and silent log truncation.
- [High] `scmi_imx_misc_ctrl_get()` overflows the caller's buffer by comple=
tely ignoring its original capacity limit.
- [High] `scmi_imx_misc_get_reason` accesses the `rst` string array without=
 bounds checking `boot.reason` or `shutdown.reason`.
- [High] Global state (`ph` and `imx_misc_ctrl_ops`) is permanently corrupt=
ed on probe failure or device unbind, breaking deferred probing and causing=
 Use-After-Free.
- [High] A TOCTOU race condition during global variable initialization can =
lead to a NULL pointer dereference in exported functions.
- [High] The `syslog` buffer is allocated via `kmalloc()` without `__GFP_ZE=
RO`. Uninitialized kernel heap memory may be leaked to userspace.
--

commit 56e1cfdbed4d1640cd1f28d670f1d36502723eb1
Author: Li Jun <lijun01@kylinos.cn>
Subject: firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show

This commit adds a proper NULL check for the kmalloc() return value in=20
syslog_show() to prevent a potential NULL pointer dereference.

> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-mis=
c.c
> index ac9af824c2d40..fb8d7bdb5b084 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -74,9 +74,12 @@ static int syslog_show(struct seq_file *file, void *pr=
iv)
>  {
>  	/* 4KB is large enough for syslog */
>  	void *syslog __free(kfree) =3D kmalloc(SZ_4K, GFP_KERNEL);

[Severity: High]
This isn't a bug introduced by this patch, but does this allocation need=20
to use __GFP_ZERO?

If the firmware returns success but populates fewer words than expected,=20
the uninitialized kernel heap memory in the syslog buffer could be dumped=20
and leaked to userspace via seq_hex_dump(). Replacing kmalloc with kzalloc=
=20
would prevent this.

>  	/* syslog API use num words, not num bytes */
>  	u16 size =3D SZ_4K / 4;
>  	int ret;
> =20
> +	if (!syslog)
> +		return -ENOMEM;
> +
>  	if (!ph)
>  		return -ENODEV;
> =20
>  	ret =3D imx_misc_ctrl_ops->misc_syslog(ph, &size, syslog);
>  	if (ret)
>  		return ret;
> =20
>  	seq_hex_dump(file, " ", DUMP_PREFIX_NONE, 16, sizeof(u32), syslog, size=
 * 4, false);

[Severity: High]
This is a pre-existing issue, but can this seq_hex_dump() read out of bound=
s?

In iter_misc_syslog_update_state(), *p->size is overwritten with=20
st->num_returned + st->num_remaining. If the firmware returns=20
num_returned =3D 0 and a large num_remaining (e.g., 4095), the size here=20
would be inflated to 4095. This causes seq_hex_dump() to read past the=20
4KB buffer bounds, potentially leaking kernel memory.

I also noticed a few other pre-existing issues in this driver:

In drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c:

> iter_misc_syslog_process_response() {
> ...
> 	p->array[st->desc_index + st->loop_idx] =3D le32_to_cpu(r->syslog[st->lo=
op_idx]);

[Severity: High]
This isn't a bug introduced by this patch, but does this loop lack bounds=20
checking against the actual received message length?

If st->num_returned is larger than the received SCMI payload length=20
(st->rx_len), iterating up to st->num_returned could read past the end of=20
the SCMI RX buffer.

> scmi_imx_misc_ctrl_get() {
> ...
> 	*num =3D le32_to_cpu(out->num);
>=20
> 	if (*num >=3D max_num ||
> 	    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> 		ph->xops->xfer_put(ph, t);
> 		return -EINVAL;
> 	}
>=20
> 	for (i =3D 0; i < *num; i++)
> 		val[i] =3D le32_to_cpu(out->val[i]);

[Severity: High]
This is a pre-existing issue, but does this function overflow the caller's=
=20
val array?

The function overwrites the caller's *num parameter with out->num without=20
checking if it exceeds the caller's original capacity limit. If a caller=20
passes a small stack buffer (like in fsl_mqs_sm_read) and out->num is=20
larger than expected, this copy will write past the buffer bounds.

In drivers/firmware/imx/sm-misc.c:

> scmi_imx_misc_get_reason() {
> ...
> 	dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> 		 system ? "SYS" : "LM", rst[boot.reason],
> 		 boot.orig_valid ? boot.origin : -1,
> 		 boot.err_valid ? boot.errid : -1);

[Severity: High]
This isn't a bug introduced by this patch, but could this trigger an=20
out-of-bounds read?

The rst string arrays contain 32 elements, but boot.reason is extracted=20
using an 8-bit mask (0-255). If the firmware returns a reason code of 32=20
or greater, accessing rst[boot.reason] will read out of bounds.

> scmi_imx_misc_ctrl_probe() {
> ...
> 	imx_misc_ctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_=
MISC, &ph);
> 	if (IS_ERR(imx_misc_ctrl_ops))
> 		return PTR_ERR(imx_misc_ctrl_ops);

[Severity: High]
This is a pre-existing issue, but does this leave dangling global pointers=
=20
if the driver unbinds or probe fails?

If devm_protocol_get returns an error, imx_misc_ctrl_ops retains an error=20
pointer, failing subsequent probes. If the driver unbinds, devres frees=20
the protocol, but imx_misc_ctrl_ops and ph are never cleared. Exported=20
functions will dereference these dangling pointers, causing a use-after-fre=
e.

> scmi_imx_misc_ctrl_probe() {
> ...
> 		ret =3D handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PRO=
TOCOL_IMX_MISC,
> 							       SCMI_EVENT_IMX_MISC_CONTROL,
> 							       &src_id,
> 							       &scmi_imx_misc_ctrl_nb);

[Severity: Critical]
This isn't a bug introduced by this patch, but doesn't this corrupt the=20
blocking_notifier_head lists?

The loop registers the exact same global scmi_imx_misc_ctrl_nb instance=20
for multiple different event sources. Registering a single notifier_block=20
instance into multiple chains overwrites its next pointer, which corrupts=20
the linked lists.

> scmi_imx_misc_ctrl_set() {
> 	if (!ph)
> 		return -EPROBE_DEFER;
>=20
> 	return imx_misc_ctrl_ops->misc_ctrl_set(ph, id, 1, &val);

[Severity: High]
This is a pre-existing issue, but could this race with driver initializatio=
n?

During probe, handle->devm_protocol_get() assigns *ph before returning the=
=20
operations assigned to imx_misc_ctrl_ops. If an external caller executes=20
scmi_imx_misc_ctrl_set() after ph is assigned but before imx_misc_ctrl_ops=
=20
is set, this will result in a NULL pointer dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608020345.2471=
01-1-lijun01@kylinos.cn?part=3D1
