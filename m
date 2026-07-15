Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326B24BC026
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145859; cv=none; b=HUM0FLsK8M/Zilhq47vrMBhTSG6CKGTDXCXL/lTgQAsP426gR15jT9nllN0Kucj5vd/Ryq58peeAq57NJh1Bl3VgdwDroEzDdbmEnhB8KMBd6R2YP9tsmEK2ANmfjzwWfF8xuvOQDDRu9sYreZgAiqZNlwU3j1tKBt7GVHN3apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145859; c=relaxed/simple;
	bh=JbrEv1x2xWTNLAKRGEfgpMIshgG7eDaFSjvk7kwkOm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbqZwIIOVk6Y1EBlNTlKvOR9cWOJAdHVcjgpQdI3+JdKFTzSTU4v/q7ZZXprHi62/kq1dez3YRIP2VZniSxajAPAwrGRcP0UTdMiH7MkGjvqGJ2DNUHGWTc4tJt2JiYYxGu5tk2p/6HHMiOsplPp1NH+4tWKz0B4bcHTo7ij9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geVekIWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geVekIWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66C61F000E9;
	Wed, 15 Jul 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784145856;
	bh=WlrTqgmh2dQDac3dpJtr8//yeT7zYfmesannB0/yeEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=geVekIWc5gozLI5pq/d796KX6jXVHIdwEvqv4hiytaUSgTrtI1LfUa8453Yngw3Bz
	 u3EitTkiOoZ6F6nvBlOmDDARt7umb9m8ETVIq+PB3qkEeVASbzVFWFQ5/fUh65blnr
	 NWH6UTLVVHTCfTfPMY2gackgsj1u363wi52/MKeMkDBWNC0sdrxgtb0FCMnLPa8VtN
	 Tk2p4PzjnW8oDRqaRHLYAuLxXFgqbkZ911HqpiTBDVudfEAvS+k1nDzfuPDbhP8WoO
	 V1kBDbtOW6sVk7DPwAO8Cq6RoPfIXtBOvEq8v1uhFL5vQpUcmC5JUQinsyqt1G1vj+
	 IkA0JPJaKpE3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] nvmem: core: deprecate reg_write callback and
 add reg_write_const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, ojeda@kernel.org
In-Reply-To: <20260715195520.25410-2-linkmauve@linkmauve.fr>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <20260715195520.25410-2-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 20:04:14 +0000
Message-Id: <20260715200415.C66C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Incorrect boolean logic using '||' instead of '&&' forces all NVME=
M devices to be treated as read-only and unconditionally disables hardware =
writes.

Pre-existing issues:
- [High] Concurrent nvmem writes race on the write-protect GPIO, which can =
lead to unprotected hardware states and failed writes.
--

--- Patch [1]: [PATCH v2 1/2] nvmem: core: deprecate reg_write callback and=
 add reg_write_const ---
commit fd9b6bd1e67a30d018b7e8f0d9db60403988e05a
Author: Link Mauve <linkmauve@linkmauve.fr>

nvmem: core: deprecate reg_write callback and add reg_write_const

This patch deprecates the reg_write callback in favor of reg_write_const,
which takes a const pointer for the data buffer. It updates the nvmem core =
to
support either callback when checking for write capabilities.

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 9d182eda0c994..66a85d31149d7 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -62,13 +62,20 @@ static int __nvmem_reg_read(struct nvmem_device *nvme=
m, unsigned int offset,
>  }
> =20
>  static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int of=
fset,
> -			     void *val, size_t bytes)
> +			     const void *val, size_t bytes)
>  {
>  	int ret;
> =20
> +	if (nvmem->reg_write_const) {
> +		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> +		ret =3D nvmem->reg_write_const(nvmem->priv, offset, val, bytes);
> +		gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> +		return ret;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but does toggling the wp_gpio here have a race
condition?

If two threads concurrently write to the same NVMEM device, they could
execute __nvmem_reg_write() simultaneously. One thread could re-assert the
write-protect GPIO while the other thread's hardware write is still in
progress, potentially causing the write to fail or corrupt the write sequen=
ce.

>  	if (nvmem->reg_write) {
>  		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> -		ret =3D nvmem->reg_write(nvmem->priv, offset, val, bytes);
> +		ret =3D nvmem->reg_write(nvmem->priv, offset, (void *)val, bytes);
>  		gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
>  		return ret;
>  	}

[ ... ]

> @@ -264,7 +271,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp=
, struct kobject *kobj,
> =20
>  	count =3D round_down(count, nvmem->word_size);
> =20
> -	if (!nvmem->reg_write || nvmem->read_only)
> +	if (!nvmem->reg_write || !nvmem->reg_write_const || nvmem->read_only)
>  		return -EPERM;

[Severity: High]
Does this logic inadvertently reject all writes?

Since drivers will typically provide either reg_write or reg_write_const
(but not both), this condition will always evaluate to true, failing all
sysfs writes with -EPERM. Should this be && instead of ||?

[ ... ]

> @@ -285,7 +292,7 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_=
device *nvmem)
>  	if (!nvmem->read_only)
>  		mode |=3D 0200;
> =20
> -	if (!nvmem->reg_write)
> +	if (!nvmem->reg_write || !nvmem->reg_write_const)
>  		mode &=3D ~0200;

[Severity: High]
Similar to the sysfs write function above, does this strip write permissions
from sysfs attributes for all devices?

Since at least one of these callbacks will typically be NULL, this condition
is always true.

[ ... ]

> @@ -975,7 +983,7 @@ struct nvmem_device *nvmem_register(const struct nvme=
m_config *config)
>  		goto err_put_device;
> =20
>  	nvmem->read_only =3D device_property_present(config->dev, "read-only") =
||
> -			   config->read_only || !nvmem->reg_write;
> +			   config->read_only || !nvmem->reg_write || !nvmem->reg_write_const;

[Severity: High]
Does this unconditionally set the device to read-only during registration?

Using || means any device that doesn't provide both callbacks will be marked
as read-only.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715195520.2541=
0-1-linkmauve@linkmauve.fr?part=3D1
