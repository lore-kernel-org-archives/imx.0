Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B728363C6C
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195920; cv=none; b=sq1kyu2hMbY3C5dDgvH50RygbzKdiyxIbeSEopBHjfcj1XlcararbLodV4prHTpwAGmaIo2iphiAA1OLrkL0yXrwysGTmxM9ZlWepjQOfnvUYg+sPqic0MvKEHC9f7RRuI/scegz39c/qygyS8FQdWQazb17EsNuW5fBVatErHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195920; c=relaxed/simple;
	bh=VLehpKV+rsnSYwifcRrtuDdA9GuS3Z9HPyB37eNfUKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PelJuZ62twVdXXsFrXzByZ3+o0kWr+j398WgU3XHFilx8CHALKgMLKjtbLtF/XRC/QhaadmEK28Y1DU5MFzWcYGMXhigYCvN4ZtpI9bG0PD/iURXNOCZVEvyFpuwFg9OjEX4Qq2hPXmUGX8P4QixZf2hRYeT3ncxiOcWWuUu0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bh9WneyB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bh9WneyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7B81F000E9;
	Tue, 23 Jun 2026 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782195918;
	bh=YDi1HR/uAYilrE9a9WgNxd0pqwEH/nO/OHN6kj200OU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bh9WneyB8bvdlYTSdLQaHINeyz3zKd2KZ/1uzEnh7soClYM2FU4iQ4ep85LAOIZj5
	 8rLFESMuIB2X3YPaPv6BpP2Ik5jNBRGVkIihwUCHk2smOkQj6hX0KxBgGB2857jqFz
	 +zxitJ8TN9lJa7vwztvNbcVbjZ4cV0I8ZD31Sd0QYANPM52Y6EKtzy7Y4eIGZLi4TM
	 3ZjPsSTwK93tQbZ0FejXfrfl2LdjPRQzf1Kuyaa5fzD1GAlmPg2fZ4wrfxMZ/OvtzX
	 6+77fi4k7biIrOUvIzMXYwi085VjoY/2PQbRayFnBj70ld1HBaYQkldX+ts9oYK7tm
	 R7GlxEdjSiYYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-i3c@lists.infradead.org
In-Reply-To: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
References: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 06:25:18 +0000
Message-Id: <20260623062518.7B7B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing synchronization between IBI processing and device deta=
chment causes Use-After-Free.
- [Critical] Stack Buffer Overflow during Dynamic Address Assignment (DAA).
- [Critical] Heap Buffer Overflow in IBI payload reading loop.
- [High] Use of sleeping polling macro in atomic/hardirq context.
- [High] DDR write payload is written twice to the FIFO when SVC_I3C_QUIRK_=
FIFO_EMPTY is active.
- [High] Hard lockup (infinite loop) in hardirq handler if hardware reports=
 RX pending without bytes.
- [High] Endianness Portability Bug (Mixed I/O accessors on FIFO).
--

commit f5ce1c99dd938b33fc88fc935174301f58c2a87a
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

i3c: master: svc: report timeout waiting for STOP idle

The commit modifies svc_i3c_master_xfer() to capture the return value
of readl_poll_timeout() when waiting for the controller state to become
idle. It routes the error through the cleanup path to ensure the caller
observes the failed transfer.

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 93805df8a9406..ae38ceee5abf8 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1488,8 +1488,11 @@ static int svc_i3c_master_xfer(struct svc_i3c_mast=
er *master,
>  			svc_i3c_master_emit_force_exit(master);
> =20
>  		/* Wait idle if stop is sent. */
> -		readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> -				   SVC_I3C_MSTATUS_STATE_IDLE(reg), 0, 1000);
> +		ret =3D readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> +					 SVC_I3C_MSTATUS_STATE_IDLE(reg),
> +					 0, 1000);

[Severity: High]
This isn't a bug introduced by this patch, but does this code use a
sleeping polling macro in an atomic context?

The readl_poll_timeout macro uses ktime_get() for non-zero timeouts.
Calling this from an atomic context, such as while holding a spinlock
with interrupts disabled, can cause kernel deadlocks when
CONFIG_DEBUG_ATOMIC_SLEEP is enabled.

This also appears in svc_i3c_master_handle_ibi() where
readl_relaxed_poll_timeout() is used inside a hardirq handler.

> +		if (ret)
> +			goto cleanup;
>  	}
> =20
>  	return 0;
> @@ -1500,6 +1503,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_maste=
r *master,
>  	else
>  		svc_i3c_master_emit_force_exit(master);
> =20
> +cleanup:
>  	svc_i3c_master_clear_merrwarn(master);
>  	svc_i3c_master_flush_fifo(master);

While reviewing this file, I noticed a few other pre-existing issues:

[Severity: High]
This is a pre-existing issue, but does this code write the DDR payload to
the FIFO twice when the SVC_I3C_QUIRK_FIFO_EMPTY quirk is active?

In svc_i3c_master_xfer(), if the transfer is SVC_I3C_MCTRL_TYPE_DDR and
is a write, the full payload is pushed into the FIFO:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_xfer() {
    ...
    if (xfer_type =3D=3D SVC_I3C_MCTRL_TYPE_DDR) {
        writel(rnw_cmd, master->regs + SVC_I3C_MWDATAB);
        if (!rnw) {
            ret =3D svc_i3c_master_write(master, out, xfer_len);
    ...
}

However, xfer_len is not modified. Later, the quirk workaround triggers
and pushes the same payload bytes into the FIFO again:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_xfer() {
    ...
        if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer=
_len) {
            ...
            writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
    ...
}

[Severity: High]
This is a pre-existing issue, but does this code mix stream and register
I/O accessors on the same FIFO, potentially causing data corruption on
big-endian architectures?

The subsystem architecture guidelines explicitly forbid mixing accessors
like writesb() and writel() on the same FIFO address because register
accessors perform implicit byte-swapping while stream accessors do not.

In svc_i3c_master_xfer(), both are mixed for bulk and remainder writes:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_xfer() {
    ...
            writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
            /* Mark END bit if this is the last byte */
            writel(out[len - 1] | end, master->regs + SVC_I3C_MWDATAB);
    ...
}

Similarly, readsb() is used in svc_i3c_master_handle_ibi() on the RX FIFO,
whereas svc_i3c_master_read() uses readl() on the same FIFO.

[Severity: Critical]
This is a pre-existing issue, but is there missing synchronization between
IBI processing and device detachment that could cause a use-after-free?

In svc_i3c_master_ibi_isr(), the device descriptor is fetched under
master->ibi.lock, but the lock is dropped before handling the IBI:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_ibi_isr() {
    ...
    spin_lock(&master->ibi.lock);
    dev =3D master->ibi.slots[ibiaddr];
    spin_unlock(&master->ibi.lock);
    ...
    svc_i3c_master_handle_ibi(master, dev);
    ...
}

If the I3C core detaches the device concurrently,
svc_i3c_master_detach_i3c_dev() can free the device data without
synchronizing against the IRQ handler:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_detach_i3c_dev() {
    ...
    kfree(data);
    ...
}

[Severity: Critical]
This is a pre-existing issue, but does this code lack bounds checking on
dev_nb, potentially causing a stack buffer overflow?

The svc_i3c_master_do_daa_locked() function defines fixed-size arrays on
the stack for up to SVC_I3C_MAX_DEVS (32) devices:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_do_daa_locked() {
    u64 prov_id[SVC_I3C_MAX_DEVS] =3D {}, nacking_prov_id =3D 0;
    unsigned int dev_nb =3D 0, last_addr =3D 0, dyn_addr =3D 0;
    ...
}

The loop assigns addresses to responding devices and writes to these arrays
using dev_nb without verifying it hasn't exceeded the array bounds:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_do_daa_locked() {
    ...
    addrs[dev_nb] =3D dyn_addr;
    ...
    dev_nb++;
    ...
}

[Severity: Critical]
This is a pre-existing issue, but does the loop draining the hardware
RX FIFO use a hardcoded bound that could exceed the dynamically allocated
buffer size?

The slot->data buffer is allocated based on the device's max_payload_len,
which can be small. However, the loop condition checks against
SVC_I3C_FIFO_SIZE (16 bytes):

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_handle_ibi() {
    ...
    while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS)) &&
           slot->len < SVC_I3C_FIFO_SIZE) {
        ...
        count =3D SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
        readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
        slot->len +=3D count;
        ...
}

Because the check evaluates slot->len < 16 before adding count (which
can also be up to 16 bytes), up to 31 bytes could be written to a buffer
that might only be 1 or 2 bytes long.

[Severity: High]
This is a pre-existing issue, but could this loop cause a hard lockup in
the hardirq handler if the hardware reports RXPEND is true but RXCOUNT
is 0?

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_handle_ibi() {
    ...
    while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS)) &&
           slot->len < SVC_I3C_FIFO_SIZE) {
        ...
        count =3D SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
        readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
        slot->len +=3D count;
        buf +=3D count;
    }
    ...
}

The loop relies entirely on the hardware state to terminate. If RXCOUNT
is 0, count will be 0, slot->len will not increase, and the loop will
spin indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623060821.2323=
8-1-pengpeng@iscas.ac.cn?part=3D1
