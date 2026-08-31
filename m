Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901043E078
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 17:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198022; cv=none; b=qzFLpFLAgd6sljojhQYU754b8VXRvbRdC/edGoI/Y/rrSY3W4jSninzWlwHkrn/fxsJH9T+dpioqYkvOyR15pd8J5X/kzTkB5sbrO+my9ZTOQX+HmXgFqlvPTh/sMjtuRU7LPqbpBMSdNRirSqONH9WzrV1a55u159a9m5SjvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198022; c=relaxed/simple;
	bh=fzsCro2SzG9Css9lgQU8VkWMgjaGPYqwNSUoC8dC5Ck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Da0WlqwjV5DGbkeNiKuL4KB8Q3rsamlKys273ggdoGyH3T2zj/3FXIKkvCopkP39Coys7/oT3h7xzDEWoN/p7byt9g8/Y6iwj6kMOmtI7tb2hIBOwox/lYJXz+JAHpcSbTzTtYzY10ZhMestvxDQ4ecHWSzAqNbCzxCOWqKrt1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiEszkvc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiEszkvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6033B1F000E9;
	Mon, 31 Aug 2026 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198020;
	bh=26BF7/QGqh5Yc3HSL4QwvYiIw/xmbbyhjQI8a5/gRFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NiEszkvczRW95ILt+5FqPNAXNjkBkoK0rMehGADLlmFsyr8itBcvt7WmCHAv3fI6/
	 6TM/5hnvezO6JZy2yORK/OAraubV8JBOJs0wB2FHCopseLeLuB0zPdPTn/kFumOYpF
	 zQRkQxN4FWZu1zgq8jQjVX5SkVFCcWaEdzMkWVxg5DJ/6T1koXBlqfsTNXdJJVHliT
	 MmM0gkj9oXFBpKlvl7nKA0rYxQggHVrwLxM3dKoaxtX+5hvLzv01vtby+rp3dvx1eL
	 RITUcdPJeQe3gZqJRC5Pl3ywR9BIGOUYucMOYt2DZYYmCUao6e2UsWBYvT4WMQVQxS
	 ihzWOJryK7Brg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] i3c: master: svc: Prevent IRQ storm from
 false SLVSTART on NPCM845
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260831133314.4125787-647-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-647-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:40:19 +0000
Message-Id: <20260831174020.6033B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Inconsistent use of I/O accessors for FIFO accesses, mixing stream=
 and register accessors, which causes data corruption on big-endian systems.
--

commit c282e92f4b93fba4c854d5e9c34c1ac10212811f
Author: Stanley Chu <yschu@nuvoton.com>

    i3c: master: svc: Prevent IRQ storm from false SLVSTART on NPCM845

This commit adds a hardware quirk workaround for the NPCM845 controller.
It explicitly clears the SLVSTART status bit after emitting a STOP
condition in the Master Request IBI handler to prevent an IRQ storm caused
by a spurious SLVSTART.

Link: https://patch.msgid.link/20260413005040.1211107-3-yschu@nuvoton.com

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 9641e66a4e5f2..e74b22c6f808c 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing
issue in this file regarding I/O accessors for FIFO registers.

In svc_i3c_master_xfer(), does this code mix a stream accessor (writesb)
for bulk data with a register accessor (writel) for the final byte on the
same FIFO?

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_xfer() {
    ...
    writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
    /* Mark END bit if this is the last byte */
    writel(out[len - 1] | end, master->regs + SVC_I3C_MWDATAB);
    ...
}

Using writel() for the remainder byte performs unwanted byte-swapping on
big-endian platforms, which can corrupt the data sent on the I3C bus.

[Severity: High]
This is also a pre-existing issue, but do the readl() calls in
svc_i3c_master_read() and svc_i3c_master_readb() perform incorrect
byteswapping when reading from the MRDATAB FIFO?

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_handle_ibi() {
    ...
    readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
    ...
}

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_read() {
    ...
    in[offset + i] =3D readl(master->regs + SVC_I3C_MRDATAB);
    ...
}

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_readb() {
    ...
    dst[i] =3D readl(master->regs + SVC_I3C_MRDATAB);
    ...
}

Since readsb() is used in svc_i3c_master_handle_ibi() for the same
MRDATAB FIFO, using readl() to read individual bytes into a u8 buffer in
other functions could result in corrupted data on big-endian systems.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-647-sashal@kernel.org?part=3D1
