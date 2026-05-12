Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB972618;
	Tue, 12 May 2026 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549065; cv=none; b=B0xcR31kTSzlLCuEVa58T4rkdQGRV0Bqc64ylP1hf4ypme0kdxYkYgZofmo9VfswipyUz4y7LP/f0ZxSnIIayubpCbOvBjscXM2Kcw2+2LYQ8S/aaLPD+jIggPwnrUbL5GzBbQQm1dNaSd9iK5jYuqCH784qy/CASevsU4wzBPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549065; c=relaxed/simple;
	bh=5I4fFH78/urbTSm/Yv4MPrAehmDRePGY8oEbOsn8sW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tbUCwiRPWgny3GBWA7qu92i2HIRRZWtyqzj7xt94n4YI6JsloDRpBXvWdctU9CHRa4rXx7AxF9uIXlHMtHlOZj2u0RRiTJwwDmrqChzz+okdXGQTXnBLrroxjxnAjB+EpoSIbsLq6cccEPSJg6fGCIBdJWGGetmd4ZCYFsNjiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHRLLahh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHRLLahh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A699C2BCB0;
	Tue, 12 May 2026 01:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549064;
	bh=5I4fFH78/urbTSm/Yv4MPrAehmDRePGY8oEbOsn8sW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kHRLLahhJacU00g94n+viL7SULG62LSmEaSCTGtRYzDBiajU1uOnWVXinK2wLBcdH
	 mYx8WOaeQ6thJIAZx6k7EXcWfWm0jKbl10EP8aPkX5a3jWP/LY6RmVCBymEW1osxeZ
	 rkDdeHD5qOxgUf6Ot+pZXc5lW6pwrbj0VDJ+HEinelqpJ2hZAF3rtq8i13AQTBJ7gk
	 Vbpj9hACeWZ/r3HAuoxk26MMk9YVRN9vMz1XmRnIQa3IDBSZUuOxoqPxVeAQiq3JLr
	 HfO7+TqZ+Njc+2ZRHT3qSOBMumQ/Zkbh1i+jHwDqdVbYmSV1HMZlHHb1asI3QCdTFv
	 kIPIRnOzRCQ9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] media: hi846: fix hi846_write_reg_16 handling
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511090924.269106-2-mitltlatltl@gmail.com>
References: <20260511090924.269106-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:24:23 +0000
Message-Id: <20260512012424.4A699C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unhandled negative error code from pm_runtime_get_if_in_use() caus=
es silent failure of exposure/vblank controls and PM usage count underflow.
--

commit 4a36c43ca7959e04a86201166380c7cb4acf35d4
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: fix hi846_write_reg_16 handling

This commit fixes an issue where a positive return value from
pm_runtime_get_if_in_use() propagates back to callers as an error. It resets
the error pointer to 0 inside hi846_write_reg_16() before performing I2C
operations.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index a3f77b8434ca7..7f069aca0fce5 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846,=
 u16 reg, u16 val, int *err)
>  	if (*err < 0)
>  		return;

While this patch handles the positive return code, does it miss the case
where pm_runtime_get_if_in_use() returns a negative error code like -EINVAL?

If runtime PM is disabled, pm_runtime_get_if_in_use() returns -EINVAL. In
hi846_set_ctrl(), the error check misses this negative value:

drivers/media/i2c/hi846.c:hi846_set_ctrl() {
    ...
	ret =3D pm_runtime_get_if_in_use(&client->dev);
	if (!ret || ret =3D=3D -EAGAIN)
		return 0;
    ...
}

This allows the negative ret to propagate to hi846_write_reg_16(). Since
*err is less than zero, the function returns immediately, silently skipping
all hardware writes for V4L2_CID_EXPOSURE and V4L2_CID_VBLANK.

Additionally, does this cause a PM usage count underflow?

At the end of hi846_set_ctrl(), pm_runtime_put() is called unconditionally:

drivers/media/i2c/hi846.c:hi846_set_ctrl() {
    ...
	pm_runtime_put(&client->dev);

	return ret;
}

Since the usage count was never incremented when pm_runtime_get_if_in_use()
returned -EINVAL, this might trigger a usage count underflow warning.

Could hi846_set_ctrl() explicitly isolate the PM status, set ret to 0 before
making hardware writes, and only call pm_runtime_put() if the get function
returned a value greater than 0?

> +	*err =3D 0;
> +
>  	put_unaligned_be16(reg, buf);
>  	put_unaligned_be16(val, buf + 2);
>  	ret =3D i2c_master_send(client, buf, sizeof(buf));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511090924.2691=
06-1-mitltlatltl@gmail.com?part=3D1
