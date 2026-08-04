Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D43290B7
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856512; cv=none; b=FEgXJQyAsbvehkYi63h2FcktA5GHB0qsIBQ8MWB/HggoQKPbqzkiarJ6nvRTOu/49gl45YoqbtPczCKpaGcXkRDPV0bcxwMN09N1SbLRJ9+3AsU5stA/IDY4JDv5yExSO7wOhX/5AOK6tCaYge+VOUCTJ9RrE55lH0XzevEgVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856512; c=relaxed/simple;
	bh=qmZB4KhpUm4eDJ0imx/164KLkZTYeNHc46mRM9h+QfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eyoBEb4H58JwlUcDXA8H8+87fRKLch8dCAGogZ7JUfvLBUeII1GXUjQuI6rzZ/sCDY0G1K23p7JmT6ikKerT2ACgekdl/3e4W+5QHvJpqgZJihiWD4GB0ccd7C82zbjHf0RAS5KDFPYqDIIdQzEQbQ+XZrQbd8REIPC+nQuVmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IImvvaMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IImvvaMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE6C1F000E9;
	Tue,  4 Aug 2026 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785856504;
	bh=FhI9BUnv192/80GxwF7+5RJlRO9MBYLxMpckriGiOSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IImvvaMdLMs7HEc1lhxvH9v8YWZ4ISuHU/6haxSLei+36oYbYFFuOzmA9YLbHuW4k
	 CCcz67igovkZ1E375M02NvPy1RMBo6GSoHdnhg6Oz/3Rldvxe8WPT/SclbzrrJn6RB
	 5Tx9mYVWmoLJeKLO1e+h8ZZ82ax7wsJ/Lq41KeMTtIDfuRM6iBs0O7RRgSRMsMNqw9
	 06PLPl5Zjcp8ogBhqd0RWoUamttJ/ZGjPjpUwPbzDtXvrItLg/f9hnbQhwQ4kYElJG
	 6kWOacY2pyNj6o4gWhyJhvDmzDtQXJesuk8DbL0NvtJWwBcsG41rmozKSfCZxbSWRM
	 Uh/FgaDIKIx/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] nvmem: make all reg_write callbacks take const
 void *
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, ojeda@kernel.org
In-Reply-To: <20260804135940.2378737-4-linkmauve@linkmauve.fr>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
 <20260804135940.2378737-4-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:15:03 +0000
Message-Id: <20260804151503.CEE6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Kernel stack out-of-bounds read in `sprd_efuse_read` and logic=
 error in `sprd_efuse_write`.
- [High] Nvmem offset is incorrectly treated as a word index instead of a b=
yte offset.
- [High] Validation of PUF user fuses can be bypassed during multi-word wri=
tes.
- [High] The OCOTP controller is permanently left in programming mode if a =
write or read operation fails.
- [High] OP-TEE session is leaked on invalid arguments in stm32_bsec_optee_=
ta_write.
--

--- Patch [3]: [PATCH v5 3/3] nvmem: make all reg_write callbacks take cons=
t void * ---
commit 09f4e61d9e81ee5be0fd90c9f53ec6d29da8b412
Author: Link Mauve <linkmauve@linkmauve.fr>
Subject: nvmem: make all reg_write callbacks take const void *

This commit updates the nvmem subsystem to use a pointer to immutable data
for all reg_write callbacks. It modifies the various drivers to change the
function signatures accordingly.

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
This is a pre-existing issue, but if a read or write operation fails in
bcm_otpc_read() or bcm_otpc_write(), does the controller get stuck in
programming mode?

Looking at bcm_otpc_write(), if poll_cpu_status() fails, it returns early:

        ret =3D poll_cpu_status(priv->base, OTPC_STAT_CMD_DONE);
        reset_start_bit(priv->base);
        if (ret) {
                dev_err(priv->dev, "otp write error: 0x%x", ret);
                return -EIO;
        }

This bypasses the disable_ocotp_program() cleanup. A similar early return
in bcm_otpc_read() bypasses reset_start_bit().

Could this leave the hardware with start bits set or in programming mode?

> diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
> index 517d83e11af2c..57008228100f5 100644
> --- a/drivers/nvmem/imx-ocotp-scu.c
> +++ b/drivers/nvmem/imx-ocotp-scu.c
[ ... ]
> @@ -178,11 +178,11 @@ static int imx_scu_ocotp_read(void *context, unsign=
ed int offset,
>  }
> =20
>  static int imx_scu_ocotp_write(void *context, unsigned int offset,
> -			       void *val, size_t bytes)
> +			       const void *val, size_t bytes)
>  {
>  	struct ocotp_priv *priv =3D context;
>  	struct arm_smccc_res res;
> -	u32 *buf =3D val;
> +	const u32 *buf =3D val;
>  	u32 tmp;
>  	u32 index;

[Severity: High]
This is a pre-existing issue, but does this code treat the byte offset as a
word index?

In both imx_scu_ocotp_read() and imx_scu_ocotp_write(), the byte offset is
assigned directly to index without dividing by 4:

        index =3D offset;

If a client requests a byte offset like 4, wouldn't this result in
accessing word 4 (which is byte offset 16), potentially reading or writing
incorrect fuses?

> diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
> index 1a7e4e5d8b86c..f960fa8cb25cf 100644
> --- a/drivers/nvmem/sprd-efuse.c
> +++ b/drivers/nvmem/sprd-efuse.c
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
>  	struct sprd_efuse *efuse =3D context;
>  	bool blk_double =3D efuse->data->blk_double;

[Severity: Critical]
This is a pre-existing issue, but can this lead to an out-of-bounds kernel
stack read in sprd_efuse_read() and logic errors in sprd_efuse_write()?

In sprd_efuse_read(), there is a 4-byte local variable:

        u32 data;

If a caller requests a multi-byte read where bytes > 4, the memcpy uses the
requested size:

        memcpy(val, &data, bytes);

Does this copy out-of-bounds kernel stack memory into the output buffer?

Similarly, in sprd_efuse_write(), it passes the raw byte offset as a block
index and writes without looping over the requested bytes:

        ret =3D sprd_efuse_raw_prog(efuse, offset, blk_double, lock, val);

Would this write to the wrong hardware block and fail to process sizes
larger than a single word?

> diff --git a/drivers/nvmem/stm32-bsec-optee-ta.c b/drivers/nvmem/stm32-bs=
ec-optee-ta.c
> index f89ce791dd12a..3184b976b1f91 100644
> --- a/drivers/nvmem/stm32-bsec-optee-ta.c
> +++ b/drivers/nvmem/stm32-bsec-optee-ta.c
[ ... ]
> @@ -203,7 +203,7 @@ int stm32_bsec_optee_ta_read(struct tee_context *ctx,=
 unsigned int offset,
> =20
>  /* stm32_bsec_optee_ta_write() - nvmem write access using PTA client dri=
ver */
>  int stm32_bsec_optee_ta_write(struct tee_context *ctx, unsigned int lowe=
r,
> -			      unsigned int offset, void *buf, size_t bytes)
> +			      unsigned int offset, const void *buf, size_t bytes)
>  {	struct tee_shm *shm;
>  	struct tee_ioctl_invoke_arg arg;
>  	struct tee_param param[2];

[Severity: High]
This is a pre-existing issue, but could this leak an OP-TEE session on
invalid arguments?

In stm32_bsec_optee_ta_write(), the session is opened, but if the
alignment check fails, it returns early:

        ret =3D stm32_bsec_ta_open_session(ctx, &session_id);
        if (ret)
                return ret;

        /* Allow only writing complete 32-bits aligned words */
        if ((bytes % 4) || (offset % 4))
                return -EINVAL;

Does returning -EINVAL bypass stm32_bsec_ta_close_session() and exhaust
OP-TEE sessions?

> diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
> index d297ff150dc02..54905a608157d 100644
> --- a/drivers/nvmem/zynqmp_nvmem.c
> +++ b/drivers/nvmem/zynqmp_nvmem.c
[ ... ]
> @@ -183,7 +183,7 @@ static int zynqmp_nvmem_read(void *context, unsigned =
int offset, void *val, size
>  }
> =20
>  static int zynqmp_nvmem_write(void *context,
> -			      unsigned int offset, void *val, size_t bytes)
> +			      unsigned int offset, const void *val, size_t bytes)
>  {
>  	int pufflag =3D 0;
> =20
> @@ -194,7 +194,7 @@ static int zynqmp_nvmem_write(void *context,
>  		pufflag =3D 1;
> =20
>  	return zynqmp_efuse_access(context, offset,
> -				   val, bytes, EFUSE_WRITE, pufflag);
> +				   (void *)val, bytes, EFUSE_WRITE, pufflag);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but can the PUF user fuse
validation be bypassed during a multi-word write?

In zynqmp_efuse_access(), the validation logic checks the first word and
relies on an exact match of the starting offset:

        if (pufflag =3D=3D 1 && flag =3D=3D EFUSE_WRITE) {
                memcpy(&value, val, sizeof(value));
                if ((offset =3D=3D EFUSE_PUF_START_OFFSET ||
                     offset =3D=3D EFUSE_PUF_MID_OFFSET) &&
                     ...)

If a multi-word write starts before the restricted offsets, it bypasses the
exact-match offset checks. In this scenario, pufflag evaluates to 0, which
completely disables the PUF-specific validation logic for the overlapping
words.

Could this allow forbidden bits in the PUF fuses to be programmed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804135940.2378=
737-1-linkmauve@linkmauve.fr?part=3D3
