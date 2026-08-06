Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030743B6D3;
	Thu,  6 Aug 2026 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015048; cv=none; b=dfBqbd8wTF4bTjo5KrIlccyHX3FcfnjQ2998l+XMUwDNoucj+dUXu7zGkVogqnKqitX1A/ZB3C7I4f/2q97+5HX8ixBlOu9DANsBpZHVjvHCB6NPB0VYB0iXINlhK0ZvS2EQkVbD+I7+fdM/Jka0y3T60ZG1wPdbLk2xLPVVyXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015048; c=relaxed/simple;
	bh=k7aPw3GnnrG9l+CPhFWKv28hXCojiOQh8Fs9ZVec/fI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nD3bW47EUXjql2mjn+Kt7/FgDKj2mC3OJA4Pq7QeOhgX87dFjo2DiFAhnLNqxkKRICnFkrHn3AGS2h9gm2wRpucF2tueSDVDrFkYK60sVbFAoSVuvrLWc9LsOX6235PgURCX2L3pvS4FhA3HNDXSKX2ukj7s1NJySfZNPU3xTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7cquu7d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7cquu7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CEE1F00A3A;
	Thu,  6 Aug 2026 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786015044;
	bh=+CT7SVt7oPr/deccCnV44NeacEr3JN/33yxgzHnODro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b7cquu7dfsd8+QyAvXFPTHO/St2mXKSkOamjdXCJ8kWkDp7Q3VBXU+5mUnOkU3Osi
	 3tA0t3VXfPNH4DhDQ+MDpuGKNUa86KPXG9ar7rlBbwTfC8e9IDmQx4gnGaL3LAeOzg
	 zPCo3g18XLQu5GhY1AkEAvRBmyK2XPNj1i3keFqfszKREO6k6t+ticGUWumpP7B7bH
	 IEircnf4CpsHBtKemgFdaMZpmurEP4QDFdVck8c56SHjtEeuMV4ls8AOFba3MTT4et
	 WDp3RHZ4HmVqo8DlYutnRvqoyHq6trYCt8aNMk7zTlEgV20r0XTSXKpjSPeUKNk0xB
	 7W1D6/fR/d5aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v35 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260806-imx-se-if-v35-3-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-3-11b25bb308ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 11:17:23 +0000
Message-Id: <20260806111724.61CEE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The DMA buffer used for get_info is freed prematurely upon a timeo=
ut, allowing the enclave firmware to corrupt memory when it completes the t=
ransaction.
- [High] Allocating memory with GFP_KERNEL during the PM suspend/resume pha=
ses can cause system deadlocks.
- [Medium] A successfully completed firmware command is incorrectly reporte=
d as interrupted (-ERESTARTSYS), introducing a replay vulnerability.
- [Medium] se_restore_imem_state() ignores validation failure and returns s=
uccess even if the IMEM state is bad.
- [Medium] Multi-byte fields in struct dev_info are populated via DMA by li=
ttle-endian hardware but are accessed as native integers by the driver.
--

--- Patch [3]: [PATCH v35 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 357109d983ad738d0dc813242f9d555c6b2d561c
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds the MU-based communication interface for the NXP EdgeLock
secure enclave, enabling messaging between the Linux kernel and the enclave
firmware on i.MX SoC platforms.

Link: https://sashiko.dev/#/patchset/20260121-imx-se-if-v32-0-c5222df51cc2@=
nxp.com?part=3D3

> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
[ ... ]
> +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_=
addr_t d_addr,
> +				 size_t size)
> +{
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
> +	else
> +		dma_free_coherent(priv->dev, size, buf, d_addr);
> +}

[Severity: High]
If the ele_msg_send_rcv() transaction times out, the hardware might still
process the command and DMA the response payload later. Since this cleanup
function unconditionally frees the DMA buffer back to the pool or system,
could a delayed hardware response silently corrupt whatever kernel data is
subsequently allocated at this physical address?

[ ... ]
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{
> +	dma_addr_t get_info_addr =3D 0;
> +	void *get_info_data =3D NULL;
> +	u32 get_info_len;
> +	int ret =3D 0;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	memset(s_info, 0x0, sizeof(*s_info));
> +
> +	struct se_api_msg *tx_msg __free(kfree) =3D
> +		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);

[Severity: High]
Can this allocation cause a deadlock during system suspend?=20

During system suspend, se_suspend() calls se_save_imem_state(), which invok=
es
ele_get_info(). Using GFP_KERNEL here and for the DMA buffer below can trig=
ger
direct memory reclaim. If the reclaim process waits on I/O or swapping while
underlying storage devices are already suspended, will the system hang?

[ ... ]
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.h
[ ... ]
> +struct dev_info {
> +	u8  cmd;
> +	u8  ver;
> +	u16 length;
> +	u16 soc_id;
> +	u16 soc_rev;
> +	u16 lmda_val;
> +	u8  ssm_state;
> +	u8  dev_atts_api_ver;
> +	u8  uid[MAX_UID_SIZE];
> +	u8  sha_rom_patch[DEV_GETINFO_ROM_PATCH_SHA_SZ];
> +	u8  sha_fw[DEV_GETINFO_FW_SHA_SZ];
> +};

[Severity: Medium]
Since these multi-byte fields are populated directly via DMA from the NXP=20
enclave firmware (which uses little-endian format), will they be read
incorrectly on big-endian architectures?=20

For instance, get_se_soc_info() directly accesses s_info->d_info.soc_rev
without any byte-swapping, which might yield an invalid version number on
big-endian systems. Should these be defined as __le16 instead?

[ ... ]
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{
[ ... ]
> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> +		 * On success report -ERESTARTSYS for the interrupted wait; the
> +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;

[Severity: Medium]
Does this unintentionally convert a successful firmware transaction into an
error?

When a wait is interrupted by a signal, ele_msg_rcv() continues waiting=20
uninterruptibly. When the firmware finally responds successfully, err will
be positive. By overwriting this success with -ERESTARTSYS, won't this=20
cause the kernel to silently replay the syscall from userspace? For=20
non-idempotent operations, executing the command twice could corrupt enclav=
e=20
state.

[ ... ]
> +int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *i=
mem)
> +{
[ ... ]
> +	/*
> +	 * After importing IMEM, check if IMEM state is equal to 0xCA
> +	 * to ensure IMEM is fully loaded and
> +	 * ELE functionality can be used.
> +	 */
> +	ret =3D ele_get_info(priv, &s_info);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to get info from ELE.");
> +		return ret;
> +	}
> +	imem->state =3D s_info.d_addn_info.imem_state;
> +
> +	if (s_info.d_addn_info.imem_state =3D=3D ELE_IMEM_STATE_OK)
> +		dev_dbg(priv->dev, "Successfully restored IMEM.");
> +	else
> +		dev_err(priv->dev, "Failed to restore IMEM.");
> +
> +	return ret;
> +}

[Severity: Medium]
If the IMEM state is bad (not ELE_IMEM_STATE_OK), the code logs an error
but still returns the success code (ret =3D 0) from the preceding ele_get_i=
nfo()
call. Does this hide the hardware failure from the power management subsyst=
em
and leave the enclave in a non-functional state after a system resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-imx-se-if-=
v35-0-11b25bb308ef@nxp.com?part=3D3
