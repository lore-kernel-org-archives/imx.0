Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04863525A71;
	Tue,  8 Sep 2026 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868983; cv=none; b=us1aGl/spQ+SutenBf1eMd6XbVifo86ju2f7vN9/C0lFuC5hFO5tUtu4ckd4mu18rr727Q+w06Yv595IuS2Rg0szqf30IBPQngJOH/67d6JvfWOM4evsq49iwOGHUTbYIyXAOeW1HOnBAjNQpF9uSEkHwJL44rpewKWd2/D4+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868983; c=relaxed/simple;
	bh=RyijF3GrwWsNI2zb1gR6k7yFXdMKzG6Ooip7AFRIEa0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cIagO/BGKEqGq4PzKuPRwUSuU1xnt4gtRc4p3tbxR5pENy1EMtBpmS/CoOTwxAksQkU3kuxw78j+1P1X1Anv2OxI37KChaaFC5LT8T+W+8f4DtAtZN9SpZVq7xQNZ2qiqYLGWJVCKtppRpNlaiS2u7ffkzx973Y8tI3yFIgC82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lv5P2ex5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lv5P2ex5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAF41F00A3A;
	Tue,  8 Sep 2026 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788868981;
	bh=EQFEJwI934la2d0GZES6NHZo3W4TZFhtSkE5SHwJWSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lv5P2ex5Kvm/EcEaqRDZEA+npEpvKzj2ptjKP36g3r6+MBuxvVYlbtkFguCDdpzJr
	 xSkX4RQ3kPZ+Hbd7e4i8cIsC3SfnCnCbBzAaX5ZC11/m0bwV3xTavncRwY0wvEAKNd
	 QJt64x5IWGmoK0s0TeRqDAb2mEoSqO/xfy1niH2g00ttfT7IXDB403DSMzIuIySM8j
	 pSK4m92KZu7RgSDz4/+lk9ObECw+yWduDCWJxwxgmtZQSAa7f1o+WZliGUBAFqHRFY
	 l3o62iuGxOn0Nj+nYtkuG1DDwV4hSMtCr7Xx50xx/MbyZjwOSpki34Dxzz9+b8ZK6z
	 Pj3ya/s09uQeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v49 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908-imx-se-if-v49-3-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
 <20260908-imx-se-if-v49-3-a59529118839@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:03:00 +0000
Message-Id: <20260908120301.4DAF41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unchecked return value of dma_set_mask_and_coherent() can break =
system suspend and cause silent truncation.
--

commit 11689bad8661c5539198f994ba798438370f3e15
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: add driver for NXP EdgeLock Enclave

This commit introduces the driver for the NXP EdgeLock Enclave (ELE). It ad=
ds
a messaging-unit based communication interface for secure enclaves on i.MX =
SoC
platforms, managing firmware authentication, loading, and suspend/resume
states.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0000000000000..4b9354b0e24aa 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -396,6 +396,16 @@ static int se_if_probe(struct platform_device *pdev)
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

If the platform cannot satisfy the 32-bit DMA mask requirement, this will
fail silently but the probe will succeed anyway. Later, if DMA allocations
(like imem.buf or firmware images) return physical addresses above 32 bits,
functions like ele_service_swap() or ele_fw_authenticate() will explicitly
reject them with -ERANGE or -EINVAL.

This could render the enclave non-functional and break system suspend.
Should we check the return value and fail the probe if the required DMA
mask isn't supported?

> +
> +	/*
> +	 * Initialize load_fw_lock before registering the misc device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-imx-se-if-=
v49-0-a59529118839@nxp.com?part=3D3
