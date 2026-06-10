Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11879335BA
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052487; cv=none; b=qr2jc8vzsq6qFBaInktmSmc8LR1WQty+tudzPlfoSvfastvkUo6SOOFVHwQglXxIMGhb4wUUfZFeI2ldmIlIvKrxt5OyOlkf26s7ruLVLP3HHgIEyHLSSRCUKQOROI2FUGuoigDgaQu92mPWc/lu2bpTciIxBUQA66VZN2HfWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052487; c=relaxed/simple;
	bh=bHjRdVNdgGrH5LDafJqjvWCGvJZd+x2Tj6S7bs6KbXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kq0lCTJkPbIwFcGGME8W8Awg5kww5UkFhgTQkDBw4Uj4NgS6dY4qXvWekl7ea1ONbOHqdOuL7slXU3ZEHHbF+nXQVsmYv6zR6KHAtfHhZBJafRfQdX8NF4s/wcmcYE4wjcrM3ZxuhEQAk3rTTXbtLdosPj2my788BAImHMh91JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLy57fB6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLy57fB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C8E1F00893;
	Wed, 10 Jun 2026 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781052486;
	bh=t+C+vk4sNY/yeBrr/4ren0M9Y0Nk0ba5y3KNBXbLgiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLy57fB6F9azFhUXuiqQ+eGkkvrVDnwId+n7PGzHrVmAatPKcd7mX28EGsLt/3Yyp
	 CmWwGES0HYTjtCV5lAQTtGX7T9+Hvr13qqfTCWTX9LoSfgxNNBSoQGCzzXrkE0nKd0
	 A0a4Q+0zs6osmjei1JsqS84B10mQW9yvJvPIOy1srP0pqL1YlbQuLSdrutYXuRSwFC
	 H8RKFEElvSD8eUO6w0uINvjIuZE6G8UV2E3mvhljEmlt1YSf8KcHOk+3BHeJ8JFhoo
	 UEtUGQ+WoinvYgPWTk3TwyttIII4OBWqmbgLCDEksJ4LqrM73+hbQNHL7H2HL1/lCU
	 bWJBlmu9nIrJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in
 syslog_show
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Jun" <lijun01@kylinos.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610003814.75493-1-lijun01@kylinos.cn>
References: <20260610003814.75493-1-lijun01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 00:48:05 +0000
Message-Id: <20260610004805.C2C8E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds read in `syslog_show()` due to unbounded firmware-co=
ntrolled `size` update.
- [High] Missing bounds check on firmware-provided reset reason indices lea=
ds to out-of-bounds array access in `scmi_imx_misc_get_reason()`.
- [High] Sharing a single static `notifier_block` across multiple notifier =
chains in `scmi_imx_misc_ctrl_probe()` corrupts the chains.
--

commit eb4ad394e97f562afeae71b9d50d159b32ab9818
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
This is a pre-existing issue, but could an out-of-bounds read occur if the
firmware returns a large size?

Looking at syslog_show(), the buffer is allocated with a fixed size of 4096
bytes:

drivers/firmware/imx/sm-misc.c:syslog_show() {
    ...
    void *syslog __free(kfree) =3D kmalloc(SZ_4K, GFP_KERNEL);
    u16 size =3D SZ_4K / 4;
    ...
    ret =3D imx_misc_ctrl_ops->misc_syslog(ph, &size, syslog);
    ...
    seq_hex_dump(file, " ", DUMP_PREFIX_NONE, 16, sizeof(u32), syslog,
                 size * 4, false);
}

If iter_misc_syslog_update_state() in the SCMI driver overwrites *p->size w=
ith
st->num_returned + st->num_remaining based on the firmware response, could a
buggy or malicious firmware return a large num_remaining (e.g., 2000),
causing size to be unbounded?

Would this cause seq_hex_dump() to read past the end of the kmalloc allocat=
ion
and leak adjacent kernel heap memory to userspace?

[Severity: High]
This is a pre-existing issue, but are we missing bounds checking on the
firmware-provided reset reason indices?

In scmi_imx_misc_get_reason(), the firmware provides boot.reason and
shutdown.reason as 8-bit masks:

drivers/firmware/imx/sm-misc.c:scmi_imx_misc_get_reason() {
    ...
    dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
             system ? "SYS" : "LM", rst[boot.reason],
    ...
}

If the firmware returns a reason code >=3D 32, will the array lookup
rst[boot.reason] or rst[shutdown.reason] read out-of-bounds and cause a ker=
nel
panic when dereferencing the pointer for the %s format specifier?

[Severity: High]
This is a pre-existing issue, but is it safe to share a single static
notifier_block across multiple notifier chains?

In scmi_imx_misc_ctrl_probe(), the driver calls devm_event_notifier_registe=
r()
in a loop, passing the same static scmi_imx_misc_ctrl_nb:

drivers/firmware/imx/sm-misc.c:scmi_imx_misc_ctrl_probe() {
    ...
    scmi_imx_misc_ctrl_nb.notifier_call =3D &scmi_imx_misc_ctrl_notifier;
    for (i =3D 0; i < num; i +=3D 2) {
        ...
        ret =3D handle->notify_ops->devm_event_notifier_register(sdev,
                                                SCMI_PROTOCOL_IMX_MISC,
                                                SCMI_EVENT_IMX_MISC_CONTROL,
                                                &src_id,
                                                &scmi_imx_misc_ctrl_nb);
        ...
    }
}

Since a struct notifier_block contains an intrusive linked list pointer (ne=
xt),
does registering the exact same instance on potentially multiple distinct
notifier chains silently overwrite the next pointer, corrupting the linked
lists and causing a kernel panic when the chains are traversed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610003814.7549=
3-1-lijun01@kylinos.cn?part=3D1
