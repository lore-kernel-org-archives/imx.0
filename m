Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA33BE64C;
	Sun, 30 Aug 2026 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106383; cv=none; b=Te+PIYcJ8UdRf7F5w3ekpnvriss6QNW1/CDv3rbkF3OeM+SGwcjiCnr6B9El2E6j01foxL0SXOLXcsXZb4rwB8cBC/phqPNKXuEhrvipSzsJgnaowH7psBqu/4/mA1Xq6xoJx4H4j0ejbs4GoSJBYDCiQoSjugWi4qNoTLCjm4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106383; c=relaxed/simple;
	bh=9J2k/hAMj+tpd6fMEPVeI1f09wXJKBPopCOBOEbmqtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6NNlT9NmXup+/eyuLKK/lqS7xXLWoeN0Hql24uYwCXDAacToal9vnjju52aEV5j7/8YPqLYnmnkJJhLwknhMuBv71dSmzHNTRnOp+ADf2RDQjn/6hwwu+kh5ftX0ex1w50ifsKDZIuqfOOrR8JRz/SP56x56QcOuxmFkU3xi6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggUoTXWf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggUoTXWf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6181F000E9;
	Sun, 30 Aug 2026 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788106376;
	bh=xCUv1uQ/AFKLyMBL/+ysU3hEbEbqQgxUZmPGAftQX9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ggUoTXWftwdoACw5Z3L9XZ12RfMx/1m1UWGf67k31CwGqH2bnwHrp+6cj5NLk8Sz+
	 8x4yUnCHuTl6Zgs5zi4hVgu5Fhsi3BBvUIPqiuz3WXBmrKm8swpGO0k2OP+nPMQ8z3
	 +18Y9TJ5vcYd+X3LDtePDlAlkreFsI3qYmQVP1VW2sRS7a+hFxnj8P1ynkFp61glgA
	 KEUTN0C5t1wasWz0719noKPG58pxLpSCB1OZPwpjAYXWxTGnb1q+pCkOMAxgsJyQ/h
	 IEb4CuFej+xTG6qnY1NyShkM/rr4MFy16m58rUyNOnwzA7pY21MliNP7koIDTPdi5S
	 CBtO65IJ78hLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] media: hi846: Fix hi846_write_reg_16 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260830160025.211384-2-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 16:12:55 +0000
Message-Id: <20260830161255.7E6181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced pm_runtime_put() underflow and skipped I2C hardware wri=
tes result from unhandled negative error codes (e.g., -EINVAL) returned by =
pm_runtime_get_if_in_use().
--

commit baf92f1dfb7e9ab68d0b8a703aedfddfef46030d
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Fix hi846_write_reg_16 handling

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. Fix this by resetting *err to 0 only when it is positive.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index a3f77b8434ca7..7f069aca0fce5 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846,=
 u16 reg, u16 val, int *err)
>  	if (*err < 0)
>  		return;
> =20
> +	*err =3D 0;
> +
>  	put_unaligned_be16(reg, buf);
>  	put_unaligned_be16(val, buf + 2);
>  	ret =3D i2c_master_send(client, buf, sizeof(buf));

[Severity: High]
This is a pre-existing issue, but does the error handling in hi846_set_ctrl=
()
correctly handle negative error codes returned by pm_runtime_get_if_in_use(=
)?

If pm_runtime_get_if_in_use() returns a negative error code (like -EINVAL),
it bypasses the early return condition:

drivers/media/i2c/hi846.c:hi846_set_ctrl() {
    ...
	ret =3D pm_runtime_get_if_in_use(&client->dev);
	if (!ret || ret =3D=3D -EAGAIN)
		return 0;

	switch (ctrl->id) {
    ...
}

This causes the negative error code to propagate into the switch statement.
If the V4L2_CID_EXPOSURE or V4L2_CID_VBLANK case is hit, the negative value
is passed to hi846_write_reg_16(), which will immediately abort and skip all
I2C register initialization because of the `if (*err < 0)` check.

Furthermore, execution then unconditionally falls through to the end of
hi846_set_ctrl():

    ...
	pm_runtime_put(&client->dev);

	return ret;
}

Since a negative return from pm_runtime_get_if_in_use() means the reference
counter was not incremented, could this unconditional pm_runtime_put()
underflow the power management reference counter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830160025.2113=
84-1-mitltlatltl@gmail.com?part=3D1
