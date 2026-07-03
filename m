Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CF3B8124
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076801; cv=none; b=F4Zn7yMT53n1IyL4Mj/njqYpNL2mOq9n1Ey1DypdQO4xEE3Qun4bvtaxOhWHmXstx2Hp1Z7gwrDwmRcX79qZEGI2wfJCuJvoEj6NddYNXCtYdT7m/pHbKUue92LEGCkChy9pkF4EjIuCP1id5Jqt2t1gMDElG9yZkf2PyS6Ze5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076801; c=relaxed/simple;
	bh=S1QhCSUz6Qo/MWP4sxF64RizscYS7Vl3rRqlFFZ15y8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sZgLG9t0AEHWLn0IEDKkWWQoLZpeuD5mbMdNqF6J8f+1DxDrguCe9kF5vkEgRNlDfR67wgIHA4GUxIopleTX3nTF8/Nc+I20TjxX9fP+WxOVkw/BgSndRyTP9kulRsrLT4FbKzTjyuhfCFQnKzxGtAoIIyPWhb2mYkYNCp4q2qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UouzQ2/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UouzQ2/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748421F000E9;
	Fri,  3 Jul 2026 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076799;
	bh=DSI1frzYQEZ9/cAbNsXxD+2xVyGDPTz5LWKgW9a8/4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UouzQ2/fRHsHtPOZKD/xEgYaQv6albt8qqj+vI+MYy9pFAAzlM9yf06OYxEa7rL2T
	 dgRQHAwWdOUdNOWkAhtulb/8NARhzwY6wEAGuVPxR7r6WRcb2/vTXAcVp07IYhzEwL
	 rEgk8R30bac5JfT2uU7OdlWIjox5cFai9oXh8aosClIY3lyR0epli7LzKZi7J9wmme
	 CsZZoAO4m2nFyb319YhEvE3zsez8LVYEJIeZT8p/D0qsi/PX2DjxkrY8aY5RvYDgz8
	 Q5hvWGOIQdgLUpoLNwgREk2ZKi/I5TI8+lZh1uDu00peOIZLeZng2dZVE142H2W0ga
	 0v6muiACjtnag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] i3c: master: Report actual GET CCC payload
 length on success
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <b5899827bdcf3f3097ef4cf5dae221cc5305337c.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
 <b5899827bdcf3f3097ef4cf5dae221cc5305337c.1783074850.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:06:38 +0000
Message-Id: <20260703110639.748421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ADI and Cadence I3C master drivers spoof actual_len, hiding short =
reads and bypassing core validation.
- [High] Renesas I3C master driver leaves rx_count at 0 for small transfers=
, breaking device enumeration.
--

commit bc63836138deed26f2a332a0c5e19f4ac088d4ab
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: Report actual GET CCC payload length on success
   =20
Set dests[].payload.actual_len on successful GET CCC transfers in I3C
master drivers so the core can distinguish requested and received
buffer lengths. Switch core GET helpers to use actual_len instead of
len when interpreting GET CCC results.

[ ... ]

> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi=
-i3c-master.c
> index 047081c9f0643..64735b4887261 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
[ ... ]
> @@ -360,6 +360,8 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_mas=
ter_controller *m,
>  		adi_i3c_master_unqueue_xfer(master, xfer);
> =20
>  	cmd->err =3D adi_i3c_cmd_get_err(&xfer->cmds[0]);
> +	if (!xfer->ret && cmd->rnw)
> +		cmd->dests[0].payload.actual_len =3D cmd->dests[0].payload.len;

[Severity: High]
Does this unconditionally set actual_len to the requested length, discarding
the true hardware transfer size?

By blindly copying the requested length here, it seems this defeats the new=
 GET
CCC validation logic. If a device returns 0 bytes or a short read, the core
validation could falsely pass, potentially causing the kernel to parse
uninitialized or zero-padded memory as valid device capabilities.

> =20
>  	return xfer->ret;
>  }
[ ... ]
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3=
c-master-cdns.c
> index 6d221596ea357..36998ee4073d7 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
[ ... ]
> @@ -714,6 +714,8 @@ static int cdns_i3c_master_send_ccc_cmd(struct i3c_ma=
ster_controller *m,
> =20
>  	ret =3D xfer->ret;
>  	cmd->err =3D cdns_i3c_cmd_get_err(&xfer->cmds[0]);
> +	if (!ret && cmd->rnw)
> +		cmd->dests[0].payload.actual_len =3D cmd->dests[0].payload.len;

[Severity: High]
Similar to the ADI driver, does this bypass the core validation by
unconditionally copying the requested length?

If a short read occurs, the driver will incorrectly report a full read inst=
ead
of the actual hardware byte count.

>  	cdns_i3c_master_free_xfer(xfer);
> =20
>  	return ret;
[ ... ]
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesa=
s-i3c.c
> index f39c449922ca2..fec614700843f 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
[ ... ]
> @@ -805,6 +805,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master=
_controller *m,
>  	ret =3D xfer->ret;
>  	if (ret)
>  		ccc->err =3D I3C_ERROR_M2;
> +	else if (ccc->rnw)
> +		ccc->dests[0].payload.actual_len =3D cmd->rx_count;

[Severity: High]
Does this leave actual_len at 0 for small transfers, breaking device
enumeration?

For small GET CCC reads, if the read buffer full interrupt doesn't
trigger, the transfer completes in renesas_i3c_resp_isr() where it drains t=
he
remaining bytes from the FIFO but doesn't accumulate bytes_remaining into
cmd->rx_count:

drivers/i3c/master/renesas-i3c.c:renesas_i3c_resp_isr() {
    ...
    bytes_remaining =3D data_len - cmd->rx_count;
    i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
    ...
}

Since cmd->rx_count remains 0, won't this propagate an actual_len of 0 to t=
he
core, causing the core validation to reject the transfer with -EIO?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783074850.gi=
t.tze.yee.ng@altera.com?part=3D2
