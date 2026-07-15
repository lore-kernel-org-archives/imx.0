Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245BB4C6EF2
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146864; cv=none; b=FHM+TUJ3QRa5k6Pp3uWocw581OMtwY88U9CGfLsehQFvuS/MHnDlXFQlA1qyuvN7WLpCSw9kvnb1rSTrvckj6vPOPZYpQigC5SqXBI+TU6EQOvARsBeEJG7d+jjWqT2OCzcJC3hqC7e+XA5r7NEq0In3crea72p/0FQK4XhMuzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146864; c=relaxed/simple;
	bh=7BMarNZprxTK00Ozeb2zkhqjZlUscvtGPJ0SveidKHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EnEARA1YNmJodsYtWpoVytKupyKHgh2fcTenejub2ZByvD2RmECi6IT1LETGZnzB51qWS1fU0+6b1tv95fCOgfvXQfROFdT+DRCY1/KHHSJnDunYeqWXMQcpyuQ/ZSuFEvFze5mXVZOB/5DQdwyJthpq10Okjz+/2nL/AYe3IPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlQaZeJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlQaZeJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1CD1F000E9;
	Wed, 15 Jul 2026 20:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146862;
	bh=Vt4Ij9BkEDrjHpf2FuVRD/sTwfgT130h+QRo36efLug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlQaZeJy3R+LrHLWfKEe/sl7UWw6D8TM3Dylhl1pFU60rzt9e4QOoFq5yMwLI7NCj
	 1dJRim6zGSDcZLglf8qZjh/DXqQfMHvuCQCc8+WjSydAs3sGWOL/xWs2Xy34/Ubg6+
	 +mlUeHTQQE4csbbTI9n1IU2tuTG9zgSlEOn/9l37zt+9916G/qrBfPjg74jizYIm9G
	 iDimc7SZ+b0Rl5jTxI45eOub6aLfelhmc04oeGOYptKDhbN93Q7ZfDmaTjzt29hyVH
	 hUZQjVkapD0U/5UGIP6boX/tVfBBIGMdndrNhiJtxTmlicWnfg6mUyccGKo+Mvlj9T
	 D04skVEYs60mQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] nvmem: make all reg_write callbacks take const
 void *
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: neil.armstrong@linaro.org, Frank.Li@kernel.org, ojeda@kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev
In-Reply-To: <20260715195520.25410-3-linkmauve@linkmauve.fr>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <20260715195520.25410-3-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 20:21:01 +0000
Message-Id: <20260715202101.9E1CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [Critical] The nvmem core incorrectly evaluates write permissions, causin=
g all drivers providing only `.reg_write_const` to be unconditionally treat=
ed as read-only.

Pre-existing issues:
- [Critical] The Spreadtrum eFuse driver incorrectly calculates memory offs=
ets and size constraints, leading to out-of-bounds MMIO writes, memory corr=
uption, and kernel stack information leaks.
- [High] The bcm-ocotp driver fails to disable programming mode on the erro=
r path.
- [High] The stm32-bsec-optee-ta driver leaks TEE sessions when unaligned w=
rites are requested.
- [High] The imx-ocotp-scu driver has a Time-of-Check to Time-of-Use (TOCTO=
U) race condition when writing to ECC regions.
- [High] The meson-sm firmware driver exposes a lockless shared memory race=
 when interacting with meson-efuse.
- [High] The lpc18xx-eeprom driver lacks serialization, causing a race cond=
ition on the EEPROM power state that can crash the system.
- [High] The qfprom driver modifies global clock rates and regulator voltag=
es without serialization.
- [High] The lan9662-otpc driver modifies hardware state and registers with=
out locking, leading to race conditions and fuse corruption.
- [High] The bcm-ocotp driver modifies command and address registers withou=
t locking, leading to OTP fuse corruption.
--

--- Patch [2]: [PATCH v2 2/2] nvmem: make all reg_write callbacks take cons=
t void * ---
commit 757b2f38ab10e7e5415fbd52779fa12f901c3ac4
Author: Link Mauve <linkmauve@linkmauve.fr>
Subject: nvmem: make all reg_write callbacks take const void *

The previous commit switched from a pointer to mutable data to a pointer
to immutable data, so let=E2=80=99s fix all users of this API.

> diff --git a/drivers/nvmem/apple-spmi-nvmem.c b/drivers/nvmem/apple-spmi-=
nvmem.c
> --- a/drivers/nvmem/apple-spmi-nvmem.c
> +++ b/drivers/nvmem/apple-spmi-nvmem.c
> @@ -29,7 +29,7 @@ static int apple_spmi_nvmem_probe(struct spmi_device *s=
dev)
>  		.stride =3D 1,
>  		.size =3D 0xffff,
>  		.reg_read =3D (void *)regmap_bulk_read,
> -		.reg_write =3D (void *)regmap_bulk_write,
> +		.reg_write_const =3D (void *)regmap_bulk_write,

[Severity: Critical]
By migrating to .reg_write_const and leaving .reg_write as NULL, does this
inadvertently make all these devices read-only?

Looking at the nvmem core in drivers/nvmem/core.c:

nvmem_register() {
    ...
    nvmem->read_only =3D device_property_present(config->dev, "read-only") =
||
                       config->read_only || !nvmem->reg_write ||
                       !nvmem->reg_write_const;
    ...
}

bin_attr_nvmem_write() {
    ...
    if (!nvmem->reg_write || !nvmem->reg_write_const || nvmem->read_only)
        return -EPERM;
    ...
}

Because the core checks !nvmem->reg_write || !nvmem->reg_write_const,
setting reg_write to NULL causes the core to strip write permissions and
return -EPERM for all sysfs writes.

> diff --git a/drivers/nvmem/bcm-ocotp.c b/drivers/nvmem/bcm-ocotp.c
> --- a/drivers/nvmem/bcm-ocotp.c
> +++ b/drivers/nvmem/bcm-ocotp.c
> [ ... ]
> @@ -179,11 +179,11 @@ static int bcm_otpc_read(void *context, unsigned in=
t offset, void *val,
>  	return 0;
>  }
> =20
> -static int bcm_otpc_write(void *context, unsigned int offset, void *val,
> +static int bcm_otpc_write(void *context, unsigned int offset, const void=
 *val,
>  	size_t bytes)
>  {
>  	struct otpc_priv *priv =3D context;
> -	u32 *buf =3D val;
> +	const u32 *buf =3D val;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for concurrent
reads and writes to corrupt hardware state?

In bcm_otpc_write():
    for (bytes_written =3D 0; bytes_written < bytes;) {
        set_command(priv->base, OTPC_CMD_PROGRAM);
        set_cpu_address(priv->base, address++);

And similarly in bcm_otpc_read():
    for (bytes_read =3D 0; bytes_read < bytes;) {
        set_command(priv->base, OTPC_CMD_READ);
        set_cpu_address(priv->base, address++);

Without serialization, concurrent sysfs operations could cause the command =
and
address registers to be overwritten mid-operation by another thread,
potentially redirecting writes to unintended fuse locations.

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
bcm_otpc_write() permanently leave the hardware in programming mode?

    ret =3D enable_ocotp_program(priv->base);
    if (ret)
        return -EIO;

    for (bytes_written =3D 0; bytes_written < bytes;) {
        ...
        ret =3D poll_cpu_status(priv->base, OTPC_STAT_CMD_DONE);
        reset_start_bit(priv->base);
        if (ret) {
            dev_err(priv->dev, "otp write error: 0x%x", ret);
            return -EIO;
        }
    }

If poll_cpu_status() returns an error, the function returns -EIO directly a=
nd
skips the disable_ocotp_program(priv->base) call at the end of the function,
potentially leaving programming voltages applied.

> diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
> --- a/drivers/nvmem/imx-ocotp-scu.c
> +++ b/drivers/nvmem/imx-ocotp-scu.c
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

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition wh=
en
writing to ECC regions in imx_scu_ocotp_write()?

    if (in_ecc(context, index)) {
        pr_warn("ECC region, only program once\n");
        mutex_lock(&scu_ocotp_mutex);
        ret =3D imx_sc_misc_otp_fuse_read(priv->nvmem_ipc, index, &tmp);
        mutex_unlock(&scu_ocotp_mutex);
        if (ret)
            return ret;
        if (tmp) {
            pr_warn("ECC region, already has value: %x\n", tmp);
            return -EIO;
        }
    }

    mutex_lock(&scu_ocotp_mutex);
    arm_smccc_smc(IMX_SIP_OTP_WRITE, index, *buf, 0, 0, 0, 0, 0, &res);
    mutex_unlock(&scu_ocotp_mutex);

Because the lock is released after checking if the ECC region is programmed=
 and
then re-acquired for the SMC write, two concurrent threads could both pass =
the
initial check and perform a double-write to the write-once ECC region.

> diff --git a/drivers/nvmem/lan9662-otpc.c b/drivers/nvmem/lan9662-otpc.c
> --- a/drivers/nvmem/lan9662-otpc.c
> +++ b/drivers/nvmem/lan9662-otpc.c
> @@ -140,10 +140,10 @@ static int lan9662_otp_read(void *context, unsigned=
 int offset,
>  }
> =20
>  static int lan9662_otp_write(void *context, unsigned int offset,
> -			     void *_val, size_t bytes)
> +			     const void *_val, size_t bytes)
>  {
>  	struct lan9662_otp *otp =3D context;
> -	u8 *val =3D _val;
> +	const u8 *val =3D _val;

[Severity: High]
This isn't a bug introduced by this patch, but can concurrent accesses to
lan9662_otp_write() and lan9662_otp_read() corrupt OTP operations?

    for (i =3D 0; i < bytes; i++) {
        if (val[i]) {
            rc =3D lan9662_otp_read_byte(otp, offset + i, &data);
            if (rc < 0)
                break;
            ...
            rc =3D lan9662_otp_write_byte(otp, offset + i, newdata);

Since these hardware register accesses and state changes (such as powering =
up
and polling) are performed without holding a local lock, concurrent sysfs
operations might overwrite each other's commands in flight, potentially
corrupting OTP data.

> diff --git a/drivers/nvmem/lpc18xx_eeprom.c b/drivers/nvmem/lpc18xx_eepro=
m.c
> --- a/drivers/nvmem/lpc18xx_eeprom.c
> +++ b/drivers/nvmem/lpc18xx_eeprom.c
> @@ -88,7 +88,7 @@ static int lpc18xx_eeprom_busywait_until_prog(struct lp=
c18xx_eeprom_dev *eeprom)
>  }
> =20
>  static int lpc18xx_eeprom_gather_write(void *context, unsigned int reg,
> -				       void *val, size_t bytes)
> +				       const void *val, size_t bytes)
>  {
>  	struct lpc18xx_eeprom_dev *eeprom =3D context;
>  	unsigned int offset =3D reg;
> @@ -110,7 +110,7 @@ static int lpc18xx_eeprom_gather_write(void *context,=
 unsigned int reg,
>  	usleep_range(100, 200);
> =20
>  	while (bytes) {
> -		writel(*(u32 *)val, eeprom->mem_base + offset);
> +		writel(*(const u32 *)val, eeprom->mem_base + offset);

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a lock arou=
nd
EEPROM power management in lpc18xx_eeprom_gather_write() and
lpc18xx_eeprom_read() risk a system crash?

    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
                          LPC18XX_EEPROM_PWRDWN_NO);
    usleep_range(100, 200);
    ...
    writel(*(const u32 *)val, eeprom->mem_base + offset);

    lpc18xx_eeprom_writel(eeprom, LPC18XX_EEPROM_PWRDWN,
                          LPC18XX_EEPROM_PWRDWN_YES);

If a read and write occur concurrently, one thread might power down the EEP=
ROM
while the other is still inside its memory access loop. Accessing powered-d=
own
MMIO regions typically causes a synchronous data abort.

> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -27,12 +27,12 @@ static int meson_efuse_read(void *context, unsigned i=
nt offset,
>  }
> =20
>  static int meson_efuse_write(void *context, unsigned int offset,
> -			     void *val, size_t bytes)
> +			     const void *val, size_t bytes)
>  {
>  	struct meson_sm_firmware *fw =3D context;
>  	int ret;
> =20
> -	ret =3D meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offse=
t,
> +	ret =3D meson_sm_call_write(fw, (void *)val, bytes, SM_EFUSE_WRITE, off=
set,

[Severity: High]
This isn't a bug introduced by this patch, but does meson_sm_call_write()
expose a lockless shared memory race?

In drivers/firmware/meson/meson_sm.c:
    memcpy(fw->sm_shmem_in_base, buffer, size);
    if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4=
) < 0)
        return -EINVAL;

Since fw->sm_shmem_in_base is a global shared memory buffer and there is no
locking, concurrent writes could overwrite each other's payloads before the=
 SMC
call executes, potentially writing corrupted or arbitrary data to the
write-once eFuses.

> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -253,13 +253,13 @@ static int qfprom_enable_fuse_blowing(const struct =
qfprom_priv *priv,
>   *
>   * Return: 0 or -err.
>   */
> -static int qfprom_reg_write(void *context, unsigned int reg, void *_val,
> +static int qfprom_reg_write(void *context, unsigned int reg, const void =
*_val,
>  			    size_t bytes)
>  {
>  	struct qfprom_priv *priv =3D context;
>  	struct qfprom_touched_values old;
>  	int words =3D bytes / 4;
> -	u32 *value =3D _val;
> +	const u32 *value =3D _val;

[Severity: High]
This isn't a bug introduced by this patch, but can concurrent calls to
qfprom_reg_write() leave the system clock and regulators permanently unbala=
nced?

    ret =3D qfprom_enable_fuse_blowing(priv, &old);
    ...
    qfprom_disable_fuse_blowing(priv, &old);

Inside qfprom_enable_fuse_blowing():
    old->clk_rate =3D clk_get_rate(priv->secclk);
    ret =3D clk_set_rate(priv->secclk, priv->soc_data->qfprom_blow_set_freq=
);

Because the old state is saved to a local stack variable without any mutex
serialization, a concurrent write could save the already-elevated clock rate
and regulator voltage as the "old" state. Upon completion, the hardware wou=
ld
be restored to this elevated state rather than the original one.

> diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
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
>  	u32 status;
>  	int ret =3D 0;
> [ ... ]
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
This isn't a bug introduced by this patch, but does the offset handling in
sprd_efuse_write() and sprd_efuse_read() lead to out-of-bounds access?

In sprd_efuse_write(), the raw byte offset is passed directly as the block
index to sprd_efuse_raw_prog():

    ret =3D sprd_efuse_raw_prog(efuse, offset, blk_double, lock, val);

Then, in sprd_efuse_raw_prog():

    writel(*data, efuse->base + SPRD_EFUSE_MEM(blk));

The macro SPRD_EFUSE_MEM(blk) shifts the offset by 2 (multiplying by 4).
Because word_size =3D 1 and stride =3D 1, userspace can request arbitrary o=
ffsets,
causing this to write far outside the intended eFuse MMIO region.

Additionally, in sprd_efuse_read():

    u32 data;
    ...
    ret =3D sprd_efuse_raw_read(efuse, index, &data, blk_double);
    if (!ret) {
        data >>=3D blk_offset;
        memcpy(val, &data, bytes);
    }

If userspace requests a read larger than 4 bytes, memcpy() will read past t=
he
local stack variable 'data' and copy uninitialized adjacent kernel stack me=
mory
to userspace.

> diff --git a/drivers/nvmem/stm32-bsec-optee-ta.c b/drivers/nvmem/stm32-bs=
ec-optee-ta.c
> --- a/drivers/nvmem/stm32-bsec-optee-ta.c
> +++ b/drivers/nvmem/stm32-bsec-optee-ta.c
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
This isn't a bug introduced by this patch, but does an unaligned write requ=
est
leak TEE sessions?

    ret =3D stm32_bsec_ta_open_session(ctx, &session_id);
    if (ret)
        return ret;

    /* Allow only writing complete 32-bits aligned words */
    if ((bytes % 4) || (offset % 4))
        return -EINVAL;

If the offset or bytes are not 32-bit aligned, the function returns -EINVAL
directly, bypassing the call to stm32_bsec_ta_close_session(ctx, session_id=
).
Because the nvmem core allows unaligned writes by default, this could be
triggered repeatedly to exhaust all available TEE sessions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715195520.2541=
0-1-linkmauve@linkmauve.fr?part=3D2
