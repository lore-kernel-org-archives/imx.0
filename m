Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C775830148A;
	Tue, 12 May 2026 03:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557081; cv=none; b=ebZYAzZ/jgVg95wvvPd4mrO3uXzsUVU5J4yFwPLaQb+J9AoXJ5wTK+UMWFrucX5vUxcNu6wokT497WF7vSgobPTbGSrTb2UYAGRtGPc11pyB0AfZKb0QUOrv5y3X6DMZeXx18UyRUl4DFNSBDZOWMoecZBU7hxS0zEpa3vSXxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557081; c=relaxed/simple;
	bh=C0uKvBcsJshR+sAskrJ9qYCeCJ0hYo132tV0VbiynjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IGvudX6Ruuk1uXwCFZZDaXMQuu3hB0R+qDQFeTN+NTkcOSw7XsiHOuPc7c/iZzTJn5I2rXLzcaAohCcBu+JJpa9UhqNxtydUGpis9o7HGPOMKPHrATRi9dmI+NAUEuki0g0ybzZNn/4XAsKlCoSrUX8KKwft1RcwzINj7CGJ/aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsF2u6au; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsF2u6au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055CAC2BD05;
	Tue, 12 May 2026 03:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557081;
	bh=C0uKvBcsJshR+sAskrJ9qYCeCJ0hYo132tV0VbiynjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HsF2u6auMwTDQESHqx4D9fVWAx9Jo4FvfHhrMJhw6+OfSXr0qgmrJLayjzCigmH95
	 IxX+6YMM8uRUiBoAuK2HZESKSPFNksSoyfjNWwieJdRy3RN3JeSW2KwHguXt6bGOfc
	 8EjzItLFBSZzQT9Fd8GHtgLydB0TFjBZEnewgHL8GMxvxSvUzmitnRCDDUrTC0ilH+
	 utrhBfhEW5fm5f6aAngr/jy9Dy4vxN1p11448WvZc12HLtx8KF7+WEN5+PCajwyzSn
	 yOaSslat1I+fKeASvH8vLr9pRNLzIfXwuK7BLEZwxpka2L/q0Q6XnXjisz79/ZwH9U
	 KWIz0Vccy+9Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] media: hi846: fix hi846_write_reg_16 handling
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260511103927.279550-2-mitltlatltl@gmail.com>
References: <20260511103927.279550-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:38:00 +0000
Message-Id: <20260512033801.055CAC2BD05@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Runtime PM usage count underflow and torn hardware state due to un=
handled negative return values.
--

commit a7e288159f9d9020f112e24280a1cf27c80c8fca
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: fix hi846_write_reg_16 handling

This commit attempts to fix error propagation by resetting the error
variable to 0 when it is positive. It clears the positive return value
from pm_runtime_get_if_in_use() before performing I2C writes.

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

While this clears the positive return values from pm_runtime_get_if_in_use(=
),
does this leave negative return values unhandled in the caller?

If pm_runtime_get_if_in_use() in hi846_set_ctrl() returns a negative error
like -EINVAL when Runtime PM is disabled, the usage count is not incremente=
d.
The check for (!ret || ret =3D=3D -EAGAIN) fails, so execution falls throug=
h with
a negative value.

Because this negative value is passed into hi846_write_reg_16(), the check
just above this change will cause I2C writes to be silently skipped for
controls like V4L2_CID_EXPOSURE. Other controls like V4L2_CID_ANALOGUE_GAIN
might ignore the error and execute unconditionally, leaving the hardware in=
 a
torn state.

Finally, since execution continues, pm_runtime_put() is called unconditiona=
lly
at the end of hi846_set_ctrl().

Because the usage count was never incremented for the negative error case,
will this cause a PM usage count underflow?

Would it be better to correctly validate the PM return value directly in
hi846_set_ctrl() with a check like if (ret <=3D 0) return 0; instead of
clearing the positive error here?

>  	put_unaligned_be16(reg, buf);
>  	put_unaligned_be16(val, buf + 2);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511103927.2795=
50-1-mitltlatltl@gmail.com?part=3D1
