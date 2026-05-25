Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD32EDD6B
	for <imx@lists.linux.dev>; Mon, 25 May 2026 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701661; cv=none; b=qSa5i2dcd6zfPqFPyjOgkvaIkDKwCS71TEi+AD2QI24UYUSByx5/AxweTOiQM4uynfE4Dt/HImLpTDTHq1RzMm6UxrXy3tcJzV22zdecSiL4QuQOZhj8jTd601gyFL19POhIHGudA1+xL2WNdxfIc04kr5hwHi8Ojq0xC7g8Sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701661; c=relaxed/simple;
	bh=785yMDhbKGp+RYhOY/oQ/TNR3gOPpY+JQW3xzK1+1N4=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h+eeKZr0Kw8OWYvTfffkIsmJAl+H0qVJRdH8+Ue/YXZwXjPBbIH9KzP/rgy9WxuOo5f/LOrNeKUW1Yq/mTYkoezgkbVAmW7f8D9g7MecXznqAN5UQV7YBnp6iJh0jZlzQO1fFeJYApOHNz/h0frH/Sukc6nJu6FAxFaUuS62Km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHHLN81B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHHLN81B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47E31F000E9;
	Mon, 25 May 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701659;
	bh=sRfIOQdKZkcLw9v49zCLrOa3edIMZNt+vTy9vUM0Quk=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=DHHLN81BddlfvsJiK9caWOEJ6ZBOpHORHu03Ys9W2AsHPsMPgZ6pM71BkppcoO+SM
	 3ND7i57g8sml+HVZQcPATB3blEDjT8tbsnefYv6qsaauiHj42onDibRzSVD5C0tU+z
	 WJCm0u2k3M3iUr2DLx8not81tj4j7M908g9uJ5AXKS+H8Nj3mNIvlzA6RNg/xQDfaj
	 05E2SCGmyuHhGUuZziiVs/MrlOUgwtME0+sb39Ja11CVD39W8yYWb77fGRVk756uK1
	 yyfZqHRusYYQttENgzqNHbqCWWb3rI3NKWYEfYR2AKEGKOpWUriwy5r0bbj/j8fJBS
	 myaxQCHXyLOgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] firmware: imx: ele: Fix debug dump size handling
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260525-ele-v1-v1-7-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-7-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:34:19 +0000
Message-Id: <20260525093419.C47E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The patch fails to correctly exclude the CRC from being printed =
when the number of debug dump words is odd, resulting in an incomplete fix.

Pre-existing issues:
- [Critical] A Use-After-Free (UAF) and NULL pointer dereference vulnerabil=
ity exists in `se_if_rx_callback` due to improper cleanup after a command t=
imeout.
--

commit 71d8abdcd91f20629227af0e25e2702c3ad5260f
Author: Peng Fan <peng.fan@nxp.com>

firmware: imx: ele: Fix debug dump size handling

This commit attempts to fix the ELE debug dump response handling by excludi=
ng
the trailing CRC from the valid debug words printed. It updates the size
threshold condition and decrements the total size.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 2f0046cd5ad06..ec718d322abcd 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -290,7 +290,7 @@ int ele_debug_dump(struct se_if_priv *priv)

[Severity: Critical]
This is a pre-existing issue, but can a timeout in ele_msg_send_rcv() lead =
to
a use-after-free and NULL pointer dereference if a late response arrives?

If ele_msg_send_rcv() times out earlier in ele_debug_dump(), it returns
-ETIMEDOUT, causing the function to exit and free the locally allocated
rx_msg buffer.

Looking at ele_msg_send_rcv() on a timeout path, it sets
priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL but appears to leave the
priv->waiting_rsp_clbk_hdl.rx_msg pointer intact.

If a late response subsequently arrives with matching tags,
se_if_rx_callback() will process it:

se_if_rx_callback() {
    ...
    dev_dbg(se_clbk_hdl->dev_ctx->devname, ...);
    ...
    memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
}

Would this result in dereferencing the NULL dev_ctx and copying the payload
into the freed rx_msg buffer?

> =20
>  		rx_msg->header.size -=3D 2;
> =20
> -		if (rx_msg->header.size > 4)
> +		if (rx_msg->header.size > 2)
>  			rx_msg->header.size--;
> =20
>  		for (i =3D 0; i < rx_msg->header.size; i +=3D 2)

[Severity: Medium]
Does this fully prevent the CRC from being printed if the firmware returns =
an
odd number of debug words?

The loop increments by 2 and unconditionally prints both data[i + 1] and
data[i + 2].

If the firmware returns 3 debug words and 1 CRC, rx_msg->header.size
evaluates to 3 after the decrement. The loop will execute for i =3D 2
(since 2 < 3) and print both data[3] and data[4], which means the CRC at
data[4] is still printed.

Additionally, does the rx_msg->header.size > 2 condition incorrectly skip
decrementing the size if the response contains 0 or 1 debug words?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D7
