Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202092D77F7
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826913; cv=none; b=adehWY6Voksz4hhz5ltoPrcuA0demLexBAKVke5i/N6Vo/06tcT17f3XuVmVcW7TKCNLdQzJPLHyMgc7ZDyAs/u60X5z3Wj2Yd4/Fc8Rogs6SqNyJXoSmVSyiNsIC6SKHM+kydJ3nzj/pLjLb1KJI0WnqJl7IapbnnYdUboVlE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826913; c=relaxed/simple;
	bh=PBdx3sj5SkW7uWPqajrIGFWXTaQpm008M5XXujVLFpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MQbQ5E9A197JQWkB5E/25zZUmQAfua4giFg7jXVysT0KMpK1+phGdde0PWQeNfiatlANDGd9YxTx40JG79WwLgP58rSNip8W4ACBnCKLrh5ybsXF0ybjcKcIjf4QxSuKhKDKBnhCjdOE1wsu7QQEB4CGpV9Y7qJbpmMlv+6Gjh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXsjGdOS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXsjGdOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C281F1F000E9;
	Tue, 30 Jun 2026 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826909;
	bh=Palvpsq54orTOkoIHQNXkOYPIU/0IL5CFdgkcfHTJmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HXsjGdOSuq3k0gCQf8hVzEQtKJhBWdRP0UvtFDYg/6JTW/Mnzt7NwmfxINUb9fO8H
	 u4U8bl/ZwqjUK4CI0r6p9MB+Nh0BheSicvfMmtgx+caHzJXolwNjAwoG8Frm2SJe0o
	 TZUrWi3Oftn7YjLBa10Eo50KA5koi8CgwcmHjL5lAMisQPicxjgzu7D2zjVrvP9kUw
	 V9ww/7P6rbB1HoyYkgRD+YgIRDUWVzbwFuYv5eaEJ+2r7AlZJTUXP6TwvxEuSbL5bC
	 URXPPlWQBRKfYZeeVSQn1IJzbR6Y4MdyoAFeZx/jLTB0hB/DZavCB23N2Q55fbmYBS
	 3crCaE3SiNYCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:41:48 +0000
Message-Id: <20260630134148.C281F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The Renesas I3C driver fails to set `rx_count` on completion, forc=
ing `actual_len` to 0 and failing all GET CCC validations
- [Low] Dead code in `i3c_master_getstatus_locked()` due to missed update f=
rom `len` to `actual_len`
- [Low] The payload validation function evaluates a mathematically impossib=
le and redundant condition
--

commit 3c7b45c2572b29be23202a83e0e0241b82a602bb
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: Validate GET CCC payload length and retry Direct GET once

This commit adds optional_bytes to struct i3c_ccc_cmd_payload to describe
variable-length GET CCC responses and validates payload lengths in
i3c_master_send_ccc_cmd_locked(). It also retries failed Direct GET CCCs
and updates I3C master drivers to set actual_len on successful GET transfer=
s.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..5741c3f80ed58 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> +static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
> +{
> +	unsigned int i;
> +
> +	if (!cmd->rnw)
> +		return 0;
> +
> +	for (i =3D 0; i < cmd->ndests; i++) {
> +		struct i3c_ccc_cmd_payload *p =3D &cmd->dests[i].payload;
> +		u16 min_len;
> +
> +		if (p->optional_bytes > p->len)
> +			return -EINVAL;
> +
> +		if (p->actual_len > p->len)
> +			return -EIO;
> +
> +		if (!p->len)
> +			continue;
> +
> +		min_len =3D p->len - p->optional_bytes;
> +		if (p->actual_len < min_len ||
> +		    (!p->optional_bytes && p->actual_len !=3D p->len))
> +			return -EIO;
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
Does this evaluate a redundant condition? Since p->actual_len > p->len is
already caught above, when !p->optional_bytes is true, min_len equals
p->len. The left side of the OR captures all cases where actual_len < len.
The right side is only evaluated if actual_len =3D=3D len, making
actual_len !=3D p->len always false.

> @@ -1409,7 +1473,7 @@ static int i3c_master_getmwl_locked(struct i3c_mast=
er_controller *master,
>  	if (ret)
>  		goto out;
> =20
> -	if (dest.payload.len !=3D sizeof(*mwl)) {
> +	if (dest.payload.actual_len !=3D sizeof(*mwl)) {
>  		ret =3D -EIO;
>  		goto out;
>  	}

[Severity: Low]
Was i3c_master_getstatus_locked() missed in these updates?

This patch changes drivers to write the received payload length to
actual_len instead of modifying len, but i3c_master_getstatus_locked()
still checks the unmodified length:

drivers/i3c/master.c:i3c_master_getstatus_locked() {
    ...
    if (dest.payload.len !=3D sizeof(*getstatus)) {
        ret =3D -EIO;
        goto out;
    }
    ...
}

Since len is initialized to sizeof(*getstatus) and is no longer modified
by the drivers, does this make the error path unreachable dead code?

> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesa=
s-i3c.c
> index f39c449922ca2..fec614700843f 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -805,6 +805,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master=
_controller *m,
>  	ret =3D xfer->ret;
>  	if (ret)
>  		ccc->err =3D I3C_ERROR_M2;
> +	else if (ccc->rnw)
> +		ccc->dests[0].payload.actual_len =3D cmd->rx_count;
> =20
>  	return ret;
>  }

[Severity: High]
Can this cause all GET CCC operations to fail on this hardware?

This code assigns cmd->rx_count to actual_len, but it appears
cmd->rx_count is never incremented during
I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ.

Looking at renesas_i3c_resp_isr():

    if (NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) && !cmd->err)
        bytes_remaining =3D data_len - cmd->rx_count;
   =20
    i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);

If rx_count remains 0, actual_len will always be 0. Will the new
i3c_ccc_validate_payload_len() logic then unconditionally reject the
payload with -EIO due to a short read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782824628.gi=
t.tze.yee.ng@altera.com?part=3D3
