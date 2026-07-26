Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439039A4A4
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785072641; cv=none; b=Ed0yTYfnvdSD5r4wVtWoZZ8B9NYtz73LixtGsZfaKG4GGXJbdFjNoZTA/3G/yZcP7MGWaMzrGiYtwQGzETWvC8M7LKJjeiij/p9StrK+pEy1CIa4VOcgg9m0isaLaisvquV6jsqIGqgZ6x2121HlbpOVUPIcBqUQsmhGKr5n5Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785072641; c=relaxed/simple;
	bh=GXW05UTF86nuhwqY3GktSUk08spHdAdTdQIY1yp7Thg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IsGbxHETCkNVXvTauHehxTAzfxqLvXCD87R8vfkWsnu7pJ/UqUUJH66cXiOKV4FHfq3o/DEIKEstLvCww6UCsckDBl1uz5HThnnYyrvEzmUDNr2Y4s2CP1W0Awc8e+hEjRj1sRtIAhee+jP8c4YoXND3dMiEg5ykYuSnoqpTWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzbhPfvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzbhPfvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF58C1F000E9;
	Sun, 26 Jul 2026 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785072640;
	bh=ygKL8b5S+/5opKlW5/5kSiAhU39LSuImXVnR8LGoXGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EzbhPfvqXszQ0+d0hzsUO/07oxZ2s9l4k3VFdRRqwKVfJ65VEYnvkcJcXScsFw+x9
	 K9j5vyaZde3xQlThfcGHwQFqTWarORzkI2zsM9CO4UzRPr6FtqZBX1E88ytASChQda
	 xbb6SyZ0+U+L5EyxEP9cA/doiYvT38yjaBeKlf591x/22dLPNSbAqZK68XPYkPO5Jt
	 cfTmIYeXbVd2kPQtTLNF4LQd/rtTaXHJIm4Oxw3G/NwqZDMf8R9qUwNaXCnZ8B4xw8
	 6vhcuYhoDds0Wi14LsbPnzX35N3R64S0Cv9cP4pMozD1WnwwoNvx271YLZ2W5mA+5N
	 7ghR/LC+L68EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] nvmem: make all reg_write callbacks take const
 void *
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, ojeda@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260726131724.15299-4-linkmauve@linkmauve.fr>
References: <20260726131724.15299-1-linkmauve@linkmauve.fr>
 <20260726131724.15299-4-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 13:30:39 +0000
Message-Id: <20260726133039.CF58C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The patch claims to 'make all reg_write callbacks take const voi=
d *' and 'fix all users of this API', but it fails to migrate many nvmem dr=
ivers.

Pre-existing issues:
- [Critical] The `sprd_efuse_write` function reads out-of-bounds for small =
writes and silently truncates large writes, while `sprd_efuse_read` suffers=
 from a stack buffer overflow.
- [High] The `bcm_otpc_write` function performs an out-of-bounds read when =
`bytes` is not a multiple of `otpc_row_size * word_size`.
- [High] The `lpc18xx_eeprom_gather_write` and `lpc18xx_eeprom_read` functi=
ons will enter an infinite loop and cause OOB memory access if `bytes` is n=
ot a multiple of 4.
--

--- Patch [3]: [PATCH v4 3/3] nvmem: make all reg_write callbacks take cons=
t void * ---
commit 4f1bd94da9f8c5ba3e21c869d089a1a71eeccbc7
Author: Link Mauve <linkmauve@linkmauve.fr>

nvmem: make all reg_write callbacks take const void *

The previous commit switched from a pointer to mutable data to a pointer
to immutable data, so let=E2=80=99s fix all users of this API.

> nvmem: make all reg_write callbacks take const void *
>
> The previous commit switched from a pointer to mutable data to a pointer
> to immutable data, so let=E2=80=99s fix all users of this API.

[Severity: Medium]
Is this commit message accurate regarding fixing all users?

Although many files are updated, prominent drivers like at24.c and at25.c
(and others outside drivers/nvmem/) still appear to use the legacy
.reg_write callback with the mutable void * signature.

Could the commit message be clarified to state that it only updates a subset
of drivers?

> diff --git a/drivers/nvmem/bcm-ocotp.c b/drivers/nvmem/bcm-ocotp.c
> index 2490f44caa409..02adfd787de85 100644
> --- a/drivers/nvmem/bcm-ocotp.c
> +++ b/drivers/nvmem/bcm-ocotp.c
[ ... ]
> @@ -179,11 +179,11 @@ static int bcm_otpc_read(void *context, unsigned in=
t offset, void *val,
>  	return 0;
>  }
> =20
> -static int bcm_otpc_write(void *context, unsigned int offset, void *val,
> -	size_t bytes)
> +static int bcm_otpc_write(void *context, unsigned int offset, const void=
 *val,
> +			  size_t bytes)
>  {
>  	struct otpc_priv *priv =3D context;
> -	u32 *buf =3D val;
> +	const u32 *buf =3D val;
>  	u32 bytes_written;

[Severity: High]
This is a pre-existing issue, but does bcm_otpc_write() have an out-of-boun=
ds
read if bytes is not a multiple of otpc_row_size * word_size?

If otpc_row_size > 1 (like 2 for the v2 map) and the nvmem core passes
bytes =3D 4, the inner loop iterates twice:

    for (i =3D 0; i < priv->map->otpc_row_size; i++) {
        writel(*buf, priv->base + priv->map->data_w_offset[i]);
        buf++;
        bytes_written +=3D sizeof(*buf);
    }

Does this cause buf to advance beyond the provided length and read
uninitialized kernel memory into the hardware?

[ ... ]
> diff --git a/drivers/nvmem/lpc18xx_eeprom.c b/drivers/nvmem/lpc18xx_eepro=
m.c
> index 504155e30bab2..78a35ef095fbd 100644
> --- a/drivers/nvmem/lpc18xx_eeprom.c
> +++ b/drivers/nvmem/lpc18xx_eeprom.c
[ ... ]
> @@ -109,7 +109,7 @@ static int lpc18xx_eeprom_gather_write(void *context,=
 unsigned int reg,
>  	usleep_range(100, 200);
> =20
>  	while (bytes) {
> -		writel(*(u32 *)val, eeprom->mem_base + offset);
> +		writel(*(const u32 *)val, eeprom->mem_base + offset);
>  		ret =3D lpc18xx_eeprom_busywait_until_prog(eeprom);

[Severity: High]
This is a pre-existing issue, but can this loop run infinitely if bytes is
not a multiple of 4?

The loop decrements the unsigned bytes variable unconditionally by 4:

    bytes -=3D eeprom->val_bytes;

If the nvmem core passes an unaligned bytes value, does this subtraction
underflow and cause the loop to run indefinitely, leading to out-of-bounds
memory access? It appears lpc18xx_eeprom_read() shares this behavior.

[ ... ]
> diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
> index 1a7e4e5d8b86c..f960fa8cb25cf 100644
> --- a/drivers/nvmem/sprd-efuse.c
> +++ b/drivers/nvmem/sprd-efuse.c
> @@ -192,7 +192,7 @@ static void sprd_efuse_set_prog_en(struct sprd_efuse =
*efuse, bool en)
>  }
> =20
>  static int sprd_efuse_raw_prog(struct sprd_efuse *efuse, u32 blk, bool d=
oub,
> -			       bool lock, u32 *data)
> +			       bool lock, const u32 *data)
>  {

[Severity: Critical]
This is a pre-existing issue, but does sprd_efuse_raw_prog() read out of
bounds for small writes?

By dereferencing data as a 32-bit integer:

    writel(*data, efuse->base + SPRD_EFUSE_MEM(blk));

Could this cause an out-of-bounds read if the incoming buffer is less than
4 bytes long?

[ ... ]
> @@ -321,7 +321,7 @@ static int sprd_efuse_read(void *context, u32 offset,=
 void *val, size_t bytes)
>  	return ret;
>  }
> =20
> -static int sprd_efuse_write(void *context, u32 offset, void *val, size_t=
 bytes)
> +static int sprd_efuse_write(void *context, u32 offset, const void *val, =
size_t bytes)
>  {

[Severity: Critical]
This is a pre-existing issue, but is there a stack memory leak in
sprd_efuse_read()?

When the nvmem core passes a length up to PAGE_SIZE (4096) for sysfs reads,
sprd_efuse_read() allocates a local 4-byte data variable on the stack:

    u32 data;
    ...
    memcpy(val, &data, bytes);

If bytes > 4, would this copy up to 4092 bytes of stack memory to the
output buffer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726131724.1529=
9-1-linkmauve@linkmauve.fr?part=3D3
