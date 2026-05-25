Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC01EEE6
	for <imx@lists.linux.dev>; Mon, 25 May 2026 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729491; cv=none; b=JTuVNG7mC0dxIX4+FXf6cmwXA8G0HcYsjeu9uOJN5BqqGjvKpoaS6RRGHAh89cFFJYROBHHNVa6KLj6lxC3LRK/MobWWclGf8hMEN5SZg4ID7wk88AUlHi1dyYLAWjNkGzOaZ/1Ex3ASC6BPAaG03ZNILCuFLRQNBkPTHRulVso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729491; c=relaxed/simple;
	bh=LqOIoz0R9MD0P64+YsqLL3hneBKOXn2mML0Gj1sw2wY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m6YHYEdmWr33E5TwHWiaXua6lKLdrz1UoQ+gV5LKi4VnRpg0/yeyP3ZJZtzjASi9fz1da/ZNi5P/6/Rm99YijucYHFHOd7xt9wYxODhZynVK2JgZs5NWk5TVMprtRn+DZ8pAOZYjAs5GOEh5oEYXqBpVVt1Mlib2zRo7SRAEfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGu2E27u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGu2E27u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C73A1F000E9;
	Mon, 25 May 2026 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779729489;
	bh=AurbEJ1S7LCXhV4ycKM7LRmQAzkEYTVut38845Ja7JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZGu2E27u/dRgM+Sz8BJBMVO0sXuDBq4iIyChuUZ/09jScPwIC5AHggG9chWOelEVZ
	 WOxP+Pc10QUikr8kMb5DK8vRmb9X/cMH5RI90hTCpXWMgt2nXLhBjBfD9Z+shlcLdf
	 5VPe0YRmnc0dQ8D8gfkY1/WOqjGTma5BaLZlRsU0rJ17pgEU0wA92vpENJJbLxXWyI
	 YQFGX2tjh2xjUO8aBvlWVmzy22SByNntFy/lyeM0vI/pKtqXTcAQ37W3EW6Oi96peL
	 YBKi6fdNTqD477et45mnOeLzQvgOzFlYI+UWYEsDmRtJ+ewpiK+2iuJXs1npS6HRna
	 unuz6fMCvUW7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] i2c: imx: fix locked bus on SMBus block-read of
 0 (atomic)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 17:18:09 +0000
Message-Id: <20260525171809.8C73A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The atomic read setup function `i2c_imx_prepare_read` fails to cle=
ar the TXAK (NACK) flag for SMBus block reads, causing the controller to in=
correctly NACK the initial length byte.
--

commit 727a0db8e9f87518943db19107dcd3fd92e92686
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)

This patch fixes a locked bus issue during SMBus block reads of 0 in the
atomic polling path by NACKing the in-flight dummy byte and extending the
message length to correctly emit a STOP. It also handles the case where
the byte count exceeds I2C_SMBUS_BLOCK_MAX.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index a208fefd3c3b3..14107e1ad4138 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1415,6 +1415,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struc=
t *i2c_imx,
>  	int i, result;
>  	unsigned int temp;
>  	int block_data =3D msgs->flags & I2C_M_RECV_LEN;
> +	int block_err =3D 0;
> =20
>  	result =3D i2c_imx_prepare_read(i2c_imx, msgs, false);

[Severity: High]
This isn't a bug introduced by this patch, but does the atomic read setup
fail to clear the TXAK flag for SMBus block reads here?

When i2c_imx_prepare_read() is called for SMBus block reads=20
(I2C_M_RECV_LEN), the I2C core initially sets msgs->len to 1. In=20
i2c_imx_prepare_read(), we have:

drivers/i2c/busses/i2c-imx.c:i2c_imx_prepare_read() {
    ...
    /*
     * Reset the I2CR_TXAK flag initially for SMBus block read since the
     * length is unknown
     */
    if (msgs->len - 1)
        temp &=3D ~I2CR_TXAK;
    ...
}

Because msgs->len is 1, msgs->len - 1 evaluates to 0, and I2CR_TXAK is not
cleared. If prior reads left TXAK set, the master will immediately NACK the
length byte. A NACK on the length byte signals the target to abort the
transfer, so no subsequent data bytes are transmitted.

A similar issue was previously identified and fixed in the interrupt-driven
path by explicitly checking the I2C_M_RECV_LEN flag. Could
i2c_imx_prepare_read() be missing the same check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-for-upstre=
am-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr?part=3D1
