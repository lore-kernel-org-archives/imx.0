Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDD5381AE7
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504903; cv=none; b=FVdrDJkhCsh/S+9VtGdpI5LmzhXHuUp9zlmGidCteM93SPO2GKNh8UkTKGMsojqfuPjawP67IIQUr/zeT3+KwhvMh4zn6WRjXmFx15SYJsyj8uSVdh+P/iMK13CXe6zAY95aIXngyVim2oF2C4gOJmEppXRytQF4FSy/2ax0A4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504903; c=relaxed/simple;
	bh=0ERaa/ZBjyf8h3ASw7hkEi6/QZJHrLMB4iaMUJ6gyT0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lIx6RpY4xU/FURf/RLSkrZfQLppL3zYfMCbsS6MJ11Nw0RXuthXIsvfl13vqZM6ENqzWy/xjB9yKFLQ3XnjDNG7wBE2F9SA/SEzMy9AyJPlU/92QTy7Eq/g+aTts2rO54xFaKNOHmq78odvTE1TIMU5mE3MqlKrRrSro+C82Izs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhLcH25z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhLcH25z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE5D1F000E9;
	Wed,  8 Jul 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504902;
	bh=iSprvyttNvNmqZg1xRP8ohu+XuLS77DYVR+xjfpcbXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hhLcH25zBEeFZnu62oWWEwWX3SBL12AvHTTzrBe7cArKFt60oCM3UOaDhEm2LyQuw
	 7Zsxa0NwlXfO4UYtl45Ek3QApoSaqFgNpvg+rYmv64mCbCHLTs8itApI8U8xPvmnmb
	 ju7L77iWuVd5Mll+moPFg8NR5TsBUcAneSnVLNxWiN7dThxljeUDvPkXsV2etwYbtH
	 lfAm/R7RcIankZar4/BS9DF+JVhJlFrYp1mF7XhKypeFs9ISuiqA4MHkSfCy9v30lo
	 AJgkjaTU3SsF0vvAXuzk/32a/yqGgIKGg4c+Ju1X8bHiJd4ZTXvubrzsR0EoT9BLe+
	 upVUh6+mo7I7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:01:41 +0000
Message-Id: <20260708100141.EAE5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Indiscriminate retries of internal kernel software errors during=
 I3C CCC GET commands.

Pre-existing issues:
- [High] renesas_i3c_rx_isr overwrites rather than appends to cmd->rx_buf, =
corrupting long read transfers and causing FIFO underflows.
--

--- Patch [4]: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length =
and retry Direct GET once ---
commit 0493e80008c19d117849be20fe713d3e08ab598e
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: Validate GET CCC payload length and retry Direct GET once

This commit adds retry logic for Direct GET CCC commands and validates
the payload length of GET CCCs after a successful transfer. Failed Direct
GET CCCs are retried up to cmd->retries times when the driver reports
failure or an I3C error.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3666d011f10ea..965d74e6bf166 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1005,7 +1037,25 @@ static int i3c_master_send_ccc_cmd_locked(struct i=
3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
> =20
> -	return master->ops->send_ccc_cmd(master, cmd);
> +	max_attempts =3D cmd->retries + 1;
> +	ret =3D -EIO;
> +	for (attempt =3D 0; attempt < max_attempts; attempt++) {
> +		unsigned int i;
> +
> +		if (cmd->rnw)
> +			for (i =3D 0; i < cmd->ndests; i++)
> +				cmd->dests[i].payload.actual_len =3D 0;
> +
> +		cmd->err =3D I3C_ERROR_UNKNOWN;
> +		ret =3D master->ops->send_ccc_cmd(master, cmd);
> +		if (!ret && cmd->err =3D=3D I3C_ERROR_UNKNOWN)
> +			break;

[Severity: Medium]
Does this loop also retry internal kernel software errors?

If a host software error occurs (for example, -ENOMEM during DMA descriptor
allocation, or -EOPNOTSUPP), master->ops->send_ccc_cmd() will return the
error code. This bypasses the !ret break condition, causing the loop to
retry indiscriminately.

Should the loop explicitly distinguish between bus-level I3C errors that
need retries and local software errors that should immediately abort?

> +	}
> +
> +	if (!ret)
> +		ret =3D i3c_ccc_validate_payload_len(cmd);
> +
> +	return ret;
>  }

[ ... ]

While reviewing the retries for GET CCC commands, I noticed a separate issue
in the Renesas I3C driver's receive interrupt handler:

drivers/i3c/master/renesas-i3c.c:renesas_i3c_rx_isr() {
    ...
    } else {
        read_bytes =3D NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) *=
 sizeof(u32);
        i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
        cmd->rx_count =3D read_bytes;
    }
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this overwrite the
receive buffer rather than appending to it?

When an I3C read transfer exceeds the FIFO threshold, renesas_i3c_rx_isr()
fires multiple times. Instead of appending received bytes to
cmd->rx_buf + cmd->rx_count and accumulating cmd->rx_count +=3D read_bytes,=
 it
writes to the base address of cmd->rx_buf and resets cmd->rx_count.

Later, renesas_i3c_resp_isr() calculates bytes_remaining =3D data_len -
cmd->rx_count. Because rx_count only reflects the size of the last chunk,
bytes_remaining exceeds the actual data left in the FIFO, which could cause
an underflow and read garbage data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783493867.gi=
t.tze.yee.ng@altera.com?part=3D4
