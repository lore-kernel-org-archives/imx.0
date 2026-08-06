Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D043641BA8B;
	Thu,  6 Aug 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014929; cv=none; b=TQgUAZCUoGqi/bgK6RziiqbkcYP4Up1wroMxHTv8gFPg0ny6m9SXfEiHIbuKwctPwyII5YuUk8EiPSFFiJLID4w7Bfj9UiAavG28hAxHXBFx10Qqomm1xHf7DUQGrx7SvAVozzUUKH47L/4CF2f/lDZUkOoLRf8CTueVRrS+P1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014929; c=relaxed/simple;
	bh=dL/mp1wLOqRdHb88lJAFmK+cvIiwkzMc5V4LqSqCtCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zhh4xG+cvY2q2vehXHKzdYLHxjy+oicS7GVY3yTsgxOw6ldCQSikSBQzxlIktoFCYztXXDb7V9UnGR3deluqd0lFUZBEQ0bndMf33LKZcSp14cQAmnDYkgKpPraGuxlB/ZgjtXiXs8gwO7yTguGgZxrEmNBfVAYozPLiYy/PUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSCPgF8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSCPgF8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B64D1F000E9;
	Thu,  6 Aug 2026 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786014927;
	bh=bYW2jB0IaiJmGyijAs2yoRv9PJGNDBx5Ivi6c6bTq6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSCPgF8g+psFpSFR94TjXz+jVF1XQRfhShtJK09+2LmewzqmyGYa/lvH6wNAZTxjk
	 /GsBvA9KI42b0qda7F5S8Py0wkSxzkGGjSI5C+W9wAB4zLNR4JxYUinNYKiOORyVM2
	 3bsanA1CLslso8BeL0U54xi2W+MZu3KObU/ehXbQEU0pK9WVe80l5zA+WuLUTh3BTP
	 zujVjr/uWSPe9gk+WluXPIV+aQ0WVsMcQrlDgaP9cvDFKB5lzOIM7pL1UKwy6V4IYC
	 uS6conoxCdRdxbE0DCxaM+YVJspB3EWnBGJwwLBY7nfTXaxqwrU3Z98vVnxoilk04P
	 Ddqf/tkrBOUFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v35 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260806-imx-se-if-v35-4-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-4-11b25bb308ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 11:15:26 +0000
Message-Id: <20260806111527.2B64D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `devname` string pointer is cached inside `clbk_rx_lock` but=
 dereferenced after the lock is released and the completion is signaled, le=
ading to a potential Use-After-Free.

Pre-existing issues:
- [High] Returning `-ERESTARTSYS` after a successful firmware transaction c=
auses the VFS to silently retry the ioctl, leading to duplicate execution o=
f non-idempotent firmware commands.
--

--- Patch [4]: [PATCH v35 4/7] firmware: imx: device context dedicated to p=
riv ---
commit df99e6bab818347c619050f003cdaa34c153bd90
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW. No functionality change.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index bc08ea2dcd87d..707fb69431baa 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -214,7 +219,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *t=
x_msg, int tx_msg_sz,
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;

[Severity: High]
This is a pre-existing issue, but does returning -ERESTARTSYS after a
successful firmware transaction cause problems with the VFS layer?

If a signal is delivered to the process while waiting, ele_msg_rcv() catches
it but waits uninterruptibly because the command is already in flight. Once
the firmware successfully responds, ele_msg_rcv() returns the positive
response size.

However, in ele_msg_send_rcv(), seeing signal_rcvd is true causes the
positive return value to be explicitly replaced with -ERESTARTSYS:

		if (err > 0)
			err =3D -ERESTARTSYS;

Would this cause the VFS layer to automatically restart the syscall,
leading to the same firmware command being issued a second time, which
might be unsafe for non-idempotent operations like key generation?

>  		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> -		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
> +			dev_ctx->devname, err);
>  	}

[ ... ]

> @@ -296,13 +303,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM=
_MSG_LEN).
>  		 */
>  		se_clbk_hdl->rx_msg_sz =3D min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
> +		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> -				*(u32 *)header,
> +				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				devname, *(u32 *)header,
>  				(header->size << 2), rx_msg_sz);

[Severity: Medium]
Could this code trigger a use-after-free of the devname string when dynamic
file descriptor lifetimes are fully implemented?

In se_if_rx_callback(), the devname pointer is cached locally, but the lock
is then dropped and complete() is called. This can wake up a waiting thread.

If the waking thread immediately closes the file descriptor, could dev_ctx
and its dynamically allocated devname string be freed before the dev_err()
statement above finishes executing?

[ ... ]

> @@ -337,14 +345,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  			sz_mismatch =3D true;
> =20
>  		se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, exp_rx_msg_sz);
> +		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> =20
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> -				*(u32 *)header,
> +				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				devname, *(u32 *)header,
>  				(header->size << 2), exp_rx_msg_sz);

[Severity: Medium]
Does this branch also share the same potential use-after-free pattern as the
cmd_tag handling branch above, if the waking thread frees dev_ctx before
dev_err() completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-imx-se-if-=
v35-0-11b25bb308ef@nxp.com?part=3D4
