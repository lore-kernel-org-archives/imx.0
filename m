Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD48A4734F2;
	Wed,  2 Sep 2026 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347889; cv=none; b=hJPXUTU1nCOR/vZwfX/RkzVmqCrsML7ws1fMqLc+rr7Kq1Tiv6nmL21p038duvuH/R8d1ZK0YDchwdSQYbrJq+ssnkNSaOfIr3cjrRYYC7MdEVnoYRH0biNpfQzzCme1//yQ3jmcFysB57tGHpe4CcuRBJlNxBMo2y2nGgeIsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347889; c=relaxed/simple;
	bh=jurxoxM4Tk4ssZ61Dj67Qh18TDGHZ5fQcSnXaV/uqes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HOPdrkBWIt8D4obdSsUY8oyr58ntuP0LF7JuT/LE4nYOxmgyiFtT2hrpurCReb/HFLr2Qyuk0GQj1Fc99EqdpvhBHD6IZtaZcWLJBtdlALDErftHJU4nIrxFKVCUVJm5JVriMHLP22umCfVWwALmfRuj6pBT4GEPwluVO8opVEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9SFUl0k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9SFUl0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7AA1F000E9;
	Wed,  2 Sep 2026 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347887;
	bh=5coY2kh5PYGj/3ZQZNKGMWblGN7WtOrDMBDklxgZQNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D9SFUl0k6+8Ims970WcCq7aKNlt7f3G/T1jnhDubcIJKl6txw7w75slgRkm+PuxGg
	 qEjMzvi9hoOJZ05PNfXIWgt2IazRaMLwPD4YYgkggnKq7lxkR8ud1PYSCSa0G79cga
	 3BlXLm907D5u3GCefNNoLv6GGj+YvXi8YmZeS+mbwZ1k0KiykSAkUap61Kr73nKXjB
	 z0OAvDdUE24wgYe/5AoxC5hgzEguiwuY+s8F+hdFkG/pCaeR5WYBmey1O5CtTPry9I
	 BSMfkea5WuJVUFhFFCfIZWjkOiIgOnMtcgMlsf5X9mg51lxbMc2z133MWzDfwGtJaH
	 /Tx+40P4B7E3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v45 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260902-imx-se-if-v45-3-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
 <20260902-imx-se-if-v45-3-6e400879d8ec@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:18:06 +0000
Message-Id: <20260902111807.2E7AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Memory allocations with GFP_KERNEL during suspend/resume callbacks=
 can cause system deadlocks.
- [Medium] The return value of dma_set_mask_and_coherent() is ignored, whic=
h can lead to cryptic DMA failures.
- [Low] Incorrect format specifier `%pap` used for `dma_addr_t`, which coul=
d leak stack memory into the kernel log.
--

commit 5b128ec8a940b8c6d0e2e25fd2b73df2c1028b07
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds a messaging unit (MU) based communication interface driver
for the NXP EdgeLock Enclave (ELE) on i.MX hardware. It implements base
messaging protocols, device info retrieval, and power management callbacks.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 0000000000000..d00315d36e8ad
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
[ ... ]
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{
> +	dma_addr_t get_info_addr =3D 0;
> +	void *get_info_data =3D NULL;
> +	u32 get_info_len;
> +	int ret;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	memset(s_info, 0x0, sizeof(*s_info));
> +
> +	struct se_api_msg *tx_msg __free(kfree) =3D
> +		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);

[Severity: High]
Can this allocation cause a system deadlock during suspend?

Since ele_get_info() is called from the suspend path:
se_suspend() -> se_save_imem_state() -> ele_get_info()

Using GFP_KERNEL here allows direct memory reclaim, which might attempt to
flush dirty pages to storage. If the storage device (like dm-crypt) is a
consumer of this crypto hardware and has already been suspended, the system
could permanently deadlock.

Should this use GFP_NOIO or pre-allocate the buffer instead?

[ ... ]
> +int ele_service_swap(struct se_if_priv *priv,
> +		     dma_addr_t addr,
> +		     u32 addr_size, u16 flag)
> +{
> +	int ret;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	if (upper_32_bits(addr)) {
> +		dev_err(priv->dev,
> +			"ELE service-swap address exceeds 32-bit range: %pad\n",
> +			&addr);
> +		return -ERANGE;
> +	}
> +
> +	struct se_api_msg *tx_msg __free(kfree)	=3D
> +		kzalloc(ELE_SERVICE_SWAP_REQ_MSG_SZ, GFP_KERNEL);

[Severity: High]
Similar to the ele_get_info() allocation above, this is also called from the
suspend path via se_save_imem_state(). Could this GFP_KERNEL allocation also
deadlock if the system is under memory pressure during suspend?

[ ... ]
> +int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
> +			dma_addr_t img_addr)
> +{
> +	int ret;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
> +		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_ad=
dr);

[Severity: Low]
Does this leak stack memory into the kernel log on 64-bit platforms?

The variables contnr_addr and img_addr are of type dma_addr_t. The %pap
format specifier expects a pointer to phys_addr_t. If sizeof(dma_addr_t) is
4 bytes and sizeof(phys_addr_t) is 8 bytes on the architecture, printk will
read past the pointers and print unrelated stack memory into dmesg.

Would it be safer to use %pad for dma_addr_t pointers?

> +		return -EINVAL;
> +	}
[ ... ]
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0000000000000..9e3f81a9a2728
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +static int se_if_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (if_node->reserved_dma_ranges) {
> +		ret =3D of_reserved_mem_device_init(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to init reserved memory region.\n");
> +	}
> +
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));

[Severity: Medium]
Is it safe to ignore the return value of dma_set_mask_and_coherent() here?

If the architecture rejects the 32-bit mask and falls back to 64-bit, later
dma_alloc_coherent() calls could return 64-bit addresses. Since the driver
truncates these into 32-bit fields using lower_32_bits() before sending
them to the firmware, could this result in cryptic DMA failures or memory
corruption?

> +
> +	/*
> +	 * Initialize load_fw_lock before registering the misc device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-imx-se-if-=
v45-0-6e400879d8ec@nxp.com?part=3D3
