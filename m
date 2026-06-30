Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2CC234994
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826293; cv=none; b=XK7eGhohRCK12H5c6Lem6SdnuLb2e7zCvP5dgU0UOsaWBUZzVQqDteI0xNtlENOaYrYIaUQeMsf76hpSwEj4P2f/GREOJnSxxp7YBgiD8+YgGivb+5l2Ns1KWMtpB/rd6pVvhmVb6ufGoHFc0B8PWYzDD2rqBiy4EprOYnqq1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826293; c=relaxed/simple;
	bh=mpIP2twbXU5wu61AhxaRndcoTo5gd8jbouCyByrHnV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=osojPYZXqCAJcAowbZbfxHHtCRYz53+fJK5BSvU2/Ot8PIHsnL3gdQvbUQc4H5AYhuMOIuS4uYqlxLUrzvFdYyTk0xJfJczraHuGCBVD1dR6HmBUqYufqzjCMnswMBxaG1TeVEsxJQJXpHM9Ee8uO4wmiIHacwuDc79ojGAzezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP1KrbUN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP1KrbUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB971F000E9;
	Tue, 30 Jun 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826292;
	bh=jgBPP24kPhoa7GRdRFVBPkmEASPRfh8ZqL0pr2pC9ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CP1KrbUNDjg6y/mVXD/+pCD2ngVRs5MWbGB3RuBu7vd5zcEmWlYWfFpFTyZKWkwoc
	 f7Z4FqqDtZjBNmobXBk4VrXLTZn10Xw3lFitD4Ig2LPbPZtv1QojSyjQHoKYbIUJ/W
	 RVN6JGuK7W2xCCgNFV0bXyErRqa8rHc71rwvRu1hU7qusjAAhHknZp82zG9ANtTgiN
	 QhCNdfBOHDUhaFSmCKOsg4+qkBJA6WlYxJBVKCZb+w361hE+hvJJagJNuq6gVIRQKU
	 vfQ1L3PcicbjWg9jlcd79RT9XpW5tMQM24tb8Em+cWCc4pcvmSO83XjFz83GIFY6GD
	 vIlF6uaQFWjlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:31:31 +0000
Message-Id: <20260630133131.ABB971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A pre-existing bug allows a NULL pointer dereference in dw_i3c_mas=
ter_end_xfer_locked() if a SET CCC command or write transfer returns unread=
 data without an error flag.
--

commit 6edcc13942ab9dc3576c652f10a4cea8ca077f26
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: dw: Report actual GET CCC payload length on success

This commit updates successful GET CCC transfers to report the actual
number of bytes read by setting dests[0].payload.actual_len from
RESPONSE_PORT_DATA_LEN. It also updates struct i3c_ccc_cmd_payload to
store this actual length alongside the requested buffer size.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 2f8c0c4683e06..e659ede79fc03 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -742,7 +742,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *mast=
er,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
> =20
>  	ret =3D xfer->ret;
> -	if (xfer->cmds[0].error =3D=3D RESPONSE_ERROR_IBA_NACK)
> +	cmd =3D &xfer->cmds[0];
> +	if (!ret)
> +		ccc->dests[0].payload.actual_len =3D cmd->rx_len;
> +	if (cmd->error =3D=3D RESPONSE_ERROR_IBA_NACK)
>  		ccc->err =3D I3C_ERROR_M2;

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
during a SET CCC command if the target terminates the transfer early?

If a SET CCC (write) command terminates early, the hardware can populate the
response queue with DATA_LEN > 0 (indicating remaining un-sent bytes) and
ERR_STATUS =3D=3D 0.

Looking at dw_i3c_master_end_xfer_locked():

    if (cmd->rx_len && !cmd->error)
        dw_i3c_master_read_rx_fifo(master, cmd->rx_buf, cmd->rx_len);

Since cmd->rx_buf is uninitialized (NULL) for write transfers, won't this
unconditionally pass a NULL pointer to the FIFO string-read I/O function
when handling the remaining bytes?

> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782824628.gi=
t.tze.yee.ng@altera.com?part=3D1
