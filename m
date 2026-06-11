Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478A3D812D
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174767; cv=none; b=lc5LloY3ZWh5W2QQynqbcVw6c+fRQL7sYfDY56UIVtAEVbndchiHmbSfR3T/Aw2cLPmExAmtuRn2Vu5z3JUWAXRSQI7Fq7YtwcY9e5RfytkGzTo0ik+HCNBgw0cMppngZJJ2KWiXyxiS6aaek+C/kQtKf6CRWRL7C1lvIsCzhhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174767; c=relaxed/simple;
	bh=OFQbX5Z3JQJ1QhhNYN679qxRs/OaDWJ0lqwZ63k6ouU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sL9Yrj9nrlPPslg8eAWHjKoVZVsc8rzB5vjdOG6F5ivOMNixdUzQR6ixdnvI4NewXCQ44aF3RdrFGkJzgZjdCunQQx+0mL4HpZ7IYwpZjShskLqwSjI1o0U6TUP7axuXGFrFFsZgtdBvxtqL3OtN5xMsXJb1HAZzVAiWfm51/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIDp2tDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIDp2tDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6C11F00893;
	Thu, 11 Jun 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174765;
	bh=vJfpmchHLryBvETAsW880fj2ONxTzEHFW8GeETz7uuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hIDp2tDKB1du3QdFgfXri5KfC4rmnw6aU4wt3TceJH3vZh51ZJvRmNc2t2klrO9v/
	 skAuL/IbJfFaUtw5nozj+FBJ0NZVsrmNOZgJL3GFt5QKc8ZhIhR+B8oGFrfCWzBt18
	 HGrl/Oi2CozGjny6mcFXTuR7wA46vYZpAiUh/7ZaPVEuehxRREiYc5tp3JItRUd1DW
	 QAlQRJjeOSHLTDCpNTDL+xe3l8dCgRFvvLpxksMjngSaV+jo+rxvfniO8F3GE/WSTL
	 JETps7wxvwPqOxZRuI6myLCHf058ty6cPcJa5aExS5qBzXlJJG9BEfMAqaRqrKyxxi
	 CVnW3P+uRdS1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: bound
 userspace-controlled response buffer size
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611155032.3200428-1-pankaj.gupta@oss.nxp.com>
References: <20260611155032.3200428-1-pankaj.gupta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:46:05 +0000
Message-Id: <20260611104605.6A6C11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The newly added validation check for `rx_buf_sz` uses `sizeof()`, =
which introduces an implicit unsigned promotion that allows negative sizes =
to completely bypass the boundary checks.

Pre-existing issues:
- [Critical] Dangling pointers in the `waiting_rsp_clbk_hdl` lead to a Use-=
After-Free and NULL pointer dereference on message transmission error paths.
- [High] Stale kernel memory from the mailbox controller's message buffer i=
s leaked to userspace when handling variable-length responses.
--

commit 5597d3c52a3085ad09aa072db67cb4eef9ccc91e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: se_ctrl: bound userspace-controlled response buffer size

The command-send ioctl path allocates the response buffer directly from a
userspace-provided rx_buf_sz value. Reject response buffer sizes that
are smaller than a message header or larger than the maximum supported
debug-dump response size before allocating the response buffer.

Closes: https://sashiko.dev/#/patchset/20260528091446.3331006-1-pankaj.gupt=
a@nxp.com?part=3D1

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 8fab3b7767b7a..bcb023e274864 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -542,6 +545,12 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct s=
e_if_device_ctx *dev_ctx,
>  		return err;
>  	}
> =20
> +	if (cmd_snd_rcv_rsp_info.rx_buf_sz < sizeof(struct se_msg_hdr) ||
> +	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {

[Severity: High]
Does the use of sizeof() introduce an implicit unsigned promotion here?

If a user provides a negative value like -1, the signed integer could
be implicitly promoted to a large unsigned value like SIZE_MAX. This
would make the less-than check evaluate to false.

Since the upper bound check compares two signed integers, -1 > 92 would
evaluate to false as well.

Can this allow negative sizes to bypass validation entirely and be passed
into kzalloc() further down in se_ioctl_cmd_snd_rcv_rsp_handler(),
triggering a warning splat from the kernel page allocator?

> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -EINVAL;
> +	}
> +
>  	if (tx_msg->header.tag !=3D priv->if_defs->cmd_tag) {
>  		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
>  		return -EINVAL;

[Severity: Critical]
This is a pre-existing issue, but I am curious if the callback context
can be left dangling when ele_msg_send() fails.

In drivers/firmware/imx/ele_common.c:ele_msg_send_rcv(), the pointers are
set before transmission:

    priv->waiting_rsp_clbk_hdl.dev_ctx =3D dev_ctx;
    priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
    priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;

    err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
    if (err < 0)
        return err;

If ele_msg_send() returns early due to an error, these shared pointers
are not cleared, and the caller will automatically free the rx_msg buffer.

If a delayed or unsolicited response arrives later, se_if_rx_callback()
might locklessly process it, find the valid dev_ctx, and execute a memcpy()
of firmware-controlled data into the previously freed rx_msg buffer:

    memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

Would this result in an exploitable Use-After-Free, or potentially a NULL
pointer dereference if dev_ctx was nulled out on timeout but rx_msg was left
dangling?

[Severity: High]
This is also a pre-existing issue, but it looks like handling
variable-length exceptions might leak stale kernel memory to userspace.

In drivers/firmware/imx/ele_common.c:se_if_rx_callback():

    if (rx_msg_sz !=3D se_clbk_hdl->rx_msg_sz &&
        !check_hdr_exception_for_sz(priv, header)) {
        // ...
        se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
    }

When processing an ELE_DEBUG_DUMP_REQ command, check_hdr_exception_for_sz()
returns true. This skips the adjustment of se_clbk_hdl->rx_msg_sz to the
actual received size.

The callback then copies the data using the unadjusted size:

    memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

If the hardware returned a shorter response, it seems this could blindly
copy stale data from the mailbox controller's buffer into rx_msg.

Later, in drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler(),
the entire buffer is copied to userspace:

    if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
             cmd_snd_rcv_rsp_info.rx_buf_sz)) {

Could this leak mailbox memory or other stale kernel data to userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611155032.3200=
428-1-pankaj.gupta@oss.nxp.com?part=3D1
