Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9826F28D
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780966780; cv=none; b=uL4J9k4WA0YfeCnTzRj1HTyXXZZJrwSFaXr0YK6ZuN1YbnbKOFrKUuQFgAyTxI3qF8EoNe4ko4RFhNrOSOdimYbgVZ+VJu/tTqsHuggelR5MGFCfM8Ju2rE2X5d57SjhGfIWBKl0Pr0cRj3Nt7vksZIadXvQNTF0xIOF3NcJgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780966780; c=relaxed/simple;
	bh=anx4AAoWZVZzFtrE18EjwxwnUHLIEkCjX8iuPc+DcJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfoCp6ruTfu4/mCEgp8oBQghu5hdpGRDJ2lXkm3cYZnaz/ZQ0KMMoKVo66IztOuuKOKDt44AgPkv9X6V5Ajmaq2oDu7oNk+F4RCsa82K/i46ttP83ubFTovlD3nSOG/S8pCaDFiIf6x3XBv0Er4m6WsPBO5/MHa0nr+xagGSJM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiRd0c+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiRd0c+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1551F00893;
	Tue,  9 Jun 2026 00:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780966777;
	bh=qO0hRS/4nxlLza1xbbQ6KVHpklDwTYEspI7jUVPZE8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiRd0c+PW6Ft8IHslmAZ3fVoH084wQAzQ6EUgCAOqbumZWhbg7eUUKmCqUt4wbw9C
	 DZTj8ocwe86OQQRGxDN7zMem+g6Ijn7oXK+584TLs56RVF1kytl2F5M2OsbJPXQixf
	 cu14Ep7hKb8/cxULwT/Zx3Z0qBfYD7TYh0VelW3QPPrsUU6eZcbNOklB8ohMwp3t1E
	 Ecv9vpEQpYyO+SkpY7yuCM2X5sMU6+VRbat5zm6b9NpaDDGJoI7BjwNwQZ876WDDod
	 xYI/ISx/Xe+/gLch+YDeVKtNu2QOoJ39T/ggHYnnJe70Zg6OTZyInR4GbBX8jPV5PC
	 /aX3ZNDfgp7vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in
 syslog_show
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Jun" <lijun01@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260609004504.3402281-1-lijun01@kylinos.cn>
References: <20260609004504.3402281-1-lijun01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 00:59:36 +0000
Message-Id: <20260609005937.3F1551F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Iterator state mismanagement causes out-of-bounds read, kernel mem=
ory leak, and output truncation in syslog_show.
- [High] Global state mismanagement leads to a Use-After-Free vulnerability=
 and permanently broken probing.
- [High] Reusing a single `notifier_block` instance across multiple notific=
ation chains corrupts the linked lists.
- [High] Unvalidated SCMI firmware reset reason causes an array out-of-boun=
ds read.
- [High] Lack of validation of `st->num_returned` against the SCMI RX buffe=
r length allows an out-of-bounds read of the incoming SCMI message.
- [High] An integer underflow in `scmi_imx_misc_ctrl_get` allows a short fi=
rmware response to bypass bounds checking and leak stale RX buffer data.
--

commit 2dfb0ee488971a3d76d835d309316ae287807482
Author: Li Jun <lijun01@kylinos.cn>

firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show

Add a proper NULL check for the kmalloc() return value in syslog_show().
If memory allocation fails, syslog would be NULL and passing it to
misc_syslog() could lead to a NULL pointer dereference.

> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-mis=
c.c
> index ac9af824c2d40..fb8d7bdb5b084 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -79,6 +79,9 @@ static int syslog_show(struct seq_file *file, void *pri=
v)
>  	u16 size =3D SZ_4K / 4;
>  	int ret;
> =20
> +	if (!syslog)
> +		return -ENOMEM;
> +
>  	if (!ph)
>  		return -ENODEV;
> =20

[Severity: High]
This is a pre-existing issue, but does the size parameter get blindly
overwritten by the firmware response?

Looking at iter_misc_syslog_update_state():

iter_misc_syslog_update_state()
    *p->size =3D st->num_returned + st->num_remaining;

If the firmware returns an arbitrarily large num_remaining, it overwrites
the caller's size without bounds checking. Then, further down in
syslog_show(), this overwritten size is used for the hex dump:

syslog_show()
    seq_hex_dump(file, " ", DUMP_PREFIX_NONE, 16, sizeof(u32), syslog,
                 size * 4, false);

Since the buffer is strictly limited to 4KB via kmalloc(SZ_4K), could a
malicious or buggy firmware response set size up to 8190, causing an
out-of-bounds read of up to 12KB of uninitialized kernel heap memory and
leaking it to userspace?=20

In the case of a multi-part response, will the output also be silently
truncated because size is replaced with the size of the last chunk
instead of being accumulated?

[Severity: High]
This is a pre-existing issue, but does storing the dynamically managed
protocol handle into global variables without a cleanup action lead to a
use-after-free?

In scmi_imx_misc_ctrl_probe():

scmi_imx_misc_ctrl_probe()
    imx_misc_ctrl_ops =3D handle->devm_protocol_get(sdev,
                                        SCMI_PROTOCOL_IMX_MISC, &ph);

If the probe subsequently fails or the device is later unbound, devres
automatically releases the protocol handle, but the global pointers
imx_misc_ctrl_ops and ph are never cleared.

Could exported APIs like scmi_imx_misc_ctrl_get() then blindly dereference
the dangling ph pointer after the handle has been released?

scmi_imx_misc_ctrl_get()
    if (!ph)
        return -EPROBE_DEFER;

    return imx_misc_ctrl_ops->misc_ctrl_get(ph, id, num, val);

Furthermore, will the driver permanently fail to probe on subsequent
attempts because of a lingering if (imx_misc_ctrl_ops) check?

[Severity: High]
This is a pre-existing issue, but does reusing a single static
notifier_block across multiple notification chains corrupt the linked lists?

In scmi_imx_misc_ctrl_probe():

scmi_imx_misc_ctrl_probe()
    ret =3D handle->notify_ops->devm_event_notifier_register(sdev,
                                     SCMI_PROTOCOL_IMX_MISC,
                                     SCMI_EVENT_IMX_MISC_CONTROL,
                                     &src_id,
                                     &scmi_imx_misc_ctrl_nb);

This registers the exact same static scmi_imx_misc_ctrl_nb instance inside
a loop for different src_id values. Since SCMI maintains separate notifier
chains for different sources, does registering the same notifier_block into
multiple linked lists overwrite its internal next pointer?

Could traversing the corrupted list when an event fires cause kernel
panics or infinite loops?

[Severity: High]
This is a pre-existing issue, but does an unvalidated firmware value cause
an array out-of-bounds read here?

In scmi_imx_misc_get_reason():

scmi_imx_misc_get_reason()
    dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
             system ? "SYS" : "LM", rst[boot.reason], ...

The boot.reason value obtained from firmware is an 8-bit value (0-255),
but the rst array only contains 32 elements.

If a firmware response returns a reason code of 32 or higher, will this
trigger an out-of-bounds array read and dereference invalid memory as a
string pointer?

[Severity: High]
This is a pre-existing issue, but does a lack of validation of
st->num_returned allow an out-of-bounds read of the SCMI RX buffer?

In iter_misc_syslog_process_response():

iter_misc_syslog_process_response()
    p->array[st->desc_index + st->loop_idx] =3D
            le32_to_cpu(r->syslog[st->loop_idx]);

The SCMI core iterator framework does not validate that
num_returned * sizeof(u32) fits within the dynamically received transport
buffer size (t->rx.len).

Because st->num_returned is extracted from the firmware response and
trusted unconditionally, does this blindly read past the actual SCMI
response payload and leak adjacent transport memory?

[Severity: High]
This is a pre-existing issue, but is the payload bounds check vulnerable
to an integer underflow?

In scmi_imx_misc_ctrl_get():

scmi_imx_misc_ctrl_get()
    if (*num >=3D max_num ||
        *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
            ph->xops->xfer_put(ph, t);
            return -EINVAL;
    }

If the received firmware response is shorter than the size of the header
(i.e., t->rx.len < 4), the subtraction on the unsigned size type will
underflow to a massive positive value.

Could this allow a short firmware response to bypass the bounds check
and leak stale transport memory to the caller from the out-of-bounds
out->val array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609004504.3402=
281-1-lijun01@kylinos.cn?part=3D1
