Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C338F65C
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212651; cv=none; b=Tjf22iU8Orkp2Vm7zt0z8q9n23dh9Cl4PeiOfR3qe50QIOnpz8PvSOEn0NpLUy2lRcr2ALh4wLbyEAhGSEh8ZPbuPARMTa3++hbd/aWujOpeRGrSCLLwsZSOVRQe8hyEdY5objDSkkFNujGUL7Oo7x54KmjfTYd/vJLdgFSeF/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212651; c=relaxed/simple;
	bh=hAjH3U6ztveW8945CZCq5QWGsezvoQ8JNbmQmTKRzJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/0Wgimb9HCgs1rdo81hr71thxC9doadbyNpbUphy5hPPbmxK/vNh7V8y0e8vQqT+FTOD+6JqDuo1yevYOh1ftviQJ8aA/czyQc5C4VnALweu2IcTAi9dZCdJo5LdzipRk6MtO3aswOHa+i8CgQVNjxnB4vIe6bJMYs4yRimDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2tafqSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2tafqSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1353E1F000E9;
	Thu, 16 Jul 2026 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212649;
	bh=4E6rSMFEq2ivH/yK4dEsmzDMGHSbcrhKuTc8PgYnfvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2tafqSP0NHHXJdBUgZDjGXTof8Zj6F/mxgiZrl5Ci2b+HQdoym1iVgK/S/X0vP8/
	 XeYhkuTFKjDTe2ZPaMVwPU6Z8uB16o4jtRoGphDZUWzWflgA0xS8j4cMu+lrdbGFsK
	 qJfBNd5mph9j53z/CZXQBWdQZvuuuHFzQkhEDpsli8ecVv1mpbhReLOKNDVL8BMH+v
	 10lkbXXcD6YevPPO8wMJoWrG1yRHQyhni39Leo2zMDICfmYrFCxo4kRUubE1v5uw+B
	 8TO7HbyF5smMXNQQN9s8qzfgA2GBUi8zMepM3Be1qzUQoLQXzYlT8xkXb5bBlGFC2M
	 vPhHgqC6EDklw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] nvmem: make all reg_write callbacks take const
 void *
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: Frank.Li@kernel.org, ojeda@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260716142415.28718-3-linkmauve@linkmauve.fr>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-3-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:37:28 +0000
Message-Id: <20260716143729.1353E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Medium] Incomplete API migration leaving deprecated reg_write callbacks =
active

Pre-existing issues:
- [High] kCFI panic due to function pointer cast of regmap_bulk_write
- [High] Hardware state corruption and out-of-bounds read in sprd_efuse_wri=
te
- [High] OP-TEE session resource leak on alignment check failure
- [High] Missing locking leads to state corruption across multiple backend =
drivers
- [High] Sleeping in atomic context within sprd-efuse driver
- [High] Security check bypass during multi-word writes in zynqmp_nvmem_wri=
te
--

--- Patch [2]: [PATCH v3 2/4] nvmem: make all reg_write callbacks take cons=
t void * ---
commit ec203eda05f126cbe777e1158095fb9e39499796
Author: Link Mauve <linkmauve@linkmauve.fr>

nvmem: make all reg_write callbacks take const void *

This patch updates various nvmem drivers to use the new reg_write_const
callback instead of reg_write, matching a recent API change that passes
immutable data.

> The previous commit switched from a pointer to mutable data to a pointer
> to immutable data, so let=E2=80=99s fix all users of this API.

[Severity: Medium]
Are there some drivers missing from this update? It appears several nvmem
backend drivers are still assigning the deprecated reg_write callback,
which leaves the migration incomplete:

drivers/nvmem/at24.c:at24_probe() {
    nvmem_config.reg_write =3D at24_write;
}

drivers/nvmem/at25.c:at25_probe() {
    at25->nvmem_config.reg_write =3D at25_ee_write;
}

drivers/nvmem/eeprom_93xx46.c:eeprom_93xx46_probe() {
    edev->nvmem_config.reg_write =3D eeprom_93xx46_write;
}

drivers/nvmem/m24lr.c:m24lr_probe() {
    nvmem_conf.reg_write =3D m24lr_nvmem_write;
}

> diff --git a/drivers/nvmem/apple-spmi-nvmem.c b/drivers/nvmem/apple-spmi-=
nvmem.c
> index 88614005d5ce1..cbf25c53d048d 100644
> --- a/drivers/nvmem/apple-spmi-nvmem.c
> +++ b/drivers/nvmem/apple-spmi-nvmem.c

[ ... ]

> @@ -29,7 +29,7 @@ static int apple_spmi_nvmem_probe(struct spmi_device *s=
dev)
>  		.stride =3D 1,
>  		.size =3D 0xffff,
>  		.reg_read =3D (void *)regmap_bulk_read,
> -		.reg_write =3D (void *)regmap_bulk_write,
> +		.reg_write_const =3D (void *)regmap_bulk_write,

[Severity: High]
This is a pre-existing issue, but does casting regmap_bulk_write to void *
trigger a kCFI kernel panic? The actual signature of regmap_bulk_write
doesn't match reg_write_const, so calling it via this function pointer
could cause a control-flow integrity trap upon execution.

>  	};

[ ... ]

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

[Severity: High]
This is a pre-existing issue, but does this function lack locking?
Modifying shared command and address registers concurrently without a lock
could corrupt the shared state machine:

drivers/nvmem/bcm-ocotp.c:bcm_otpc_write() {
    for (bytes_written =3D 0; bytes_written < bytes;) {
        set_command(priv->base, OTPC_CMD_PROGRAM);
        set_cpu_address(priv->base, address++);
        ...
}

>  	struct otpc_priv *priv =3D context;

[ ... ]

> diff --git a/drivers/nvmem/lan9662-otpc.c b/drivers/nvmem/lan9662-otpc.c
> index 62d1d6381bf88..f586ae4cd126b 100644
> --- a/drivers/nvmem/lan9662-otpc.c
> +++ b/drivers/nvmem/lan9662-otpc.c

[ ... ]

> @@ -139,10 +139,10 @@ static int lan9662_otp_read(void *context, unsigned=
 int offset,
>  }
> =20
>  static int lan9662_otp_write(void *context, unsigned int offset,
> -			     void *_val, size_t bytes)
> +			     const void *_val, size_t bytes)
>  {

[Severity: High]
This is a pre-existing issue, but does this function perform unprotected
read-modify-write operations on OTP bytes? Modifying the OTP bytes without
locking could lead to data corruption in concurrent executions:

drivers/nvmem/lan9662-otpc.c:lan9662_otp_write() {
    for (i =3D 0; i < bytes; i++) {
        if (val[i]) {
            rc =3D lan9662_otp_read_byte(otp, offset + i, &data);
            ...
            rc =3D lan9662_otp_write_byte(otp, offset + i, newdata);
        }
    }
}

>  	struct lan9662_otp *otp =3D context;

[ ... ]

> diff --git a/drivers/nvmem/lpc18xx_eeprom.c b/drivers/nvmem/lpc18xx_eepro=
m.c
> index 504155e30bab2..78a35ef095fbd 100644
> --- a/drivers/nvmem/lpc18xx_eeprom.c
> +++ b/drivers/nvmem/lpc18xx_eeprom.c

[ ... ]

> @@ -87,7 +87,7 @@ static int lpc18xx_eeprom_busywait_until_prog(struct lp=
c18xx_eeprom_dev *eeprom)
>  }
> =20
>  static int lpc18xx_eeprom_gather_write(void *context, unsigned int reg,
> -				       void *val, size_t bytes)
> +				       const void *val, size_t bytes)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but does this function lack
locking when modifying shared power and control registers? Concurrent
accesses could corrupt the shared state:

drivers/nvmem/lpc18xx_eeprom.c:lpc18xx_eeprom_gather_write() {
    ...
    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
                          LPC18XX_EEPROM_PWRDWN_NO);
    ...
}

>  	struct lpc18xx_eeprom_dev *eeprom =3D context;

[ ... ]

> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 1de3435df116d..16b7f647a3f6f 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c

[ ... ]

> @@ -252,13 +252,13 @@ static int qfprom_enable_fuse_blowing(const struct =
qfprom_priv *priv,
>   *
>   * Return: 0 or -err.
>   */
> -static int qfprom_reg_write(void *context, unsigned int reg, void *_val,
> +static int qfprom_reg_write(void *context, unsigned int reg, const void =
*_val,
>  			    size_t bytes)
>  {

[Severity: High]
This is a pre-existing issue, but does this function need synchronization?
Modifying shared clocks and voltage states without locking could cause
state corruption:

drivers/nvmem/qfprom.c:qfprom_reg_write() {
    ...
    ret =3D qfprom_enable_fuse_blowing(priv, &old);
    ...
}

>  	struct qfprom_priv *priv =3D context;

[ ... ]

> diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
> index 1a7e4e5d8b86c..f960fa8cb25cf 100644
> --- a/drivers/nvmem/sprd-efuse.c
> +++ b/drivers/nvmem/sprd-efuse.c

[ ... ]

> @@ -192,7 +192,7 @@ static void sprd_efuse_set_prog_en(struct sprd_efuse =
*efuse, bool en)
>  }
> =20
>  static int sprd_efuse_raw_prog(struct sprd_efuse *efuse, u32 blk, bool d=
oub,
> -			       bool lock, u32 *data)
> +			       bool lock, const u32 *data)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but does this unconditionally
dereference the buffer as a u32 pointer? If the payload is smaller than 4
bytes, this could result in an out-of-bounds read:

drivers/nvmem/sprd-efuse.c:sprd_efuse_raw_prog() {
    ...
    writel(*data, efuse->base + SPRD_EFUSE_MEM(blk));
    ...
}

>  	u32 status;
>  	int ret =3D 0;

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

[Severity: High]
This is a pre-existing issue, but can this function sleep in atomic context?
If sprd_efuse_lock() acquires a hardware spinlock, calling the sleepable
clk_prepare_enable() could trigger a locking violation and soft lockup.
This seems to affect both sprd_efuse_write() and sprd_efuse_read():

drivers/nvmem/sprd-efuse.c:sprd_efuse_write() {
    ret =3D sprd_efuse_lock(efuse);
    if (ret)
        return ret;
   =20
    ret =3D clk_prepare_enable(efuse->clk);
    ...
}

Additionally, is the raw byte offset passed directly as a block index here?
Targeting incorrect addresses could lead to hardware state corruption:

drivers/nvmem/sprd-efuse.c:sprd_efuse_write() {
    ...
    ret =3D sprd_efuse_raw_prog(efuse, offset, blk_double, lock, val);
    ...
}

>  	struct sprd_efuse *efuse =3D context;

[ ... ]

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

[Severity: High]
This is a pre-existing issue, but does this function leak the OP-TEE
session if the alignment check fails? Returning directly bypasses cleanup:

drivers/nvmem/stm32-bsec-optee-ta.c:stm32_bsec_optee_ta_write() {
    ret =3D stm32_bsec_ta_open_session(ctx, &session_id);
    if (ret)
        return ret;

    /* Allow only writing complete 32-bits aligned words */
    if ((bytes % 4) || (offset % 4))
        return -EINVAL;
    ...
}

[ ... ]

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

[Severity: High]
This isn't a bug introduced by this patch, but does zynqmp_efuse_access()
bypass local bitmask validations for subsequent words during a multi-word
write? The check seems to only happen on the first word:

drivers/nvmem/zynqmp_nvmem.c:zynqmp_efuse_access() {
    if (pufflag =3D=3D 1 && flag =3D=3D EFUSE_WRITE) {
        memcpy(&value, val, sizeof(value));
        if ((offset =3D=3D EFUSE_PUF_START_OFFSET ||
             offset =3D=3D EFUSE_PUF_MID_OFFSET) &&
            value & P_USER_0_64_UPPER_MASK) {
            ...
        }
    ...
}

>  	int pufflag =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142415.2871=
8-1-linkmauve@linkmauve.fr?part=3D2
