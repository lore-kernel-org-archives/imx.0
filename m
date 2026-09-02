Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB154A5EB1;
	Wed,  2 Sep 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366483; cv=none; b=RGioJ7fbwPM9l282VYabIl33m4Uvvy3VbjOe+mDD8gtZZ3Zfpig2SGqzLsfyRqbqkaoqCFr0UzUeKEfMxklfBp5cX7NwEfvMBoyocUdBqB+8GRE6bS9xMfpxtELy8siDqzh02hjAWIV61/k9P3kHI1+I06iu0TELLxulEroSz88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366483; c=relaxed/simple;
	bh=RtQuk8/RFqmkyFm4EC3Mw225VzDi/hY9MeOiADALU+I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j0ixO9dLf7oyZJYs68foBr4/izXt8mpR9Bs8HO3dU/3m2Kn2HZ5uaEjzZ7kFn5iCXD01PukNDxXfXRE2agzI08CEVXzJo76ML3spsINueozSWydicZDXYa+FM21TmEbUtcp01A7DCqAmlm2SKfzUsnxIgXoQU85SmLTAAo6RTYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjmrz7Y1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjmrz7Y1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BCF1F000E9;
	Wed,  2 Sep 2026 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366481;
	bh=2vosrKphzZBfR/M+zGUfAJTRCr+FvrFSKj1GHz8Q2NI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jjmrz7Y1As6KAfzM2qeP5xKVrrQy1L5PzOX96C1rUArBb5ryaEsBp3ZZW1AmBYK7F
	 rRKPjg1Y1OawGhxZUUyBru23RT2NXWLvD3wzfpaia5LCe5N2PVbcAlz9EJ7JcWqBYD
	 ZyxvFGWl54E5oUk5pRn0HbjvuRrCrk00yXkQockEEYhePMC+ioOu0SmOfslhNCjHaZ
	 9jNNqX3JIAUiqmqN6seWjHU9TTb6cwlvbNMcW2PHBlcgEm1P0lyA8/Zbj2DRcW7IBJ
	 qX0bqrGG332WjehS21xyvmi4HDRVge/pj/g+1rqAcyXWiH1Vcc0EBozOwhchq8fugc
	 6wPvHyyBGV97A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v46 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903-imx-se-if-v46-3-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
 <20260903-imx-se-if-v46-3-aefaab525034@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:28:00 +0000
Message-Id: <20260902162801.60BCF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Deadlock in suspend/resume path due to GFP_KERNEL memory allocatio=
ns in ele_get_info().
--

commit 05cadf4c7e4a0295c86129fe662754b87efdff7e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave. NXP hardware IP(s)
for secure-enclaves like Edgelock Enclave (ELE) are embedded in the SoC to
support features like HSM, SHE & V2X. The secure enclave FW communicates
with Linux over single or multiple dedicated messaging unit (MU) based
interface(s).

Closes: https://sashiko.dev/#/patchset/20260902-imx-se-if-v45-0-6e400879d8e=
c@nxp.com?part=3D3

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> new file mode 100644
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
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree) =3D
> +		kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	get_info_len =3D ELE_GET_INFO_BUFF_SZ;
> +	if (priv->mem_pool)
> +		get_info_data =3D gen_pool_dma_alloc(priv->mem_pool,
> +						   get_info_len,
> +						   &get_info_addr);
> +	else
> +		get_info_data =3D dma_alloc_coherent(priv->dev,
> +						   get_info_len,
> +						   &get_info_addr,
> +						   GFP_KERNEL);

[Severity: High]
Can these GFP_KERNEL allocations cause a system deadlock during suspend?

The commit message notes that ele_service_swap() was updated to use GFP_NOI=
O=20
because it runs in the suspend/resume path, and direct memory reclaim could=
=20
trigger I/O to a suspended storage device.=20

However, it appears ele_get_info() is also executed synchronously in this=20
exact same suspend/resume path:

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> +int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
> +{
> +	struct ele_dev_info s_info =3D {0};
> +	int ret;
> +
> +	ret =3D ele_get_info(priv, &s_info);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to get info from ELE.\n");
> +		return ret;
> +	}

Since se_suspend() unconditionally calls se_save_imem_state(), which in tur=
n=20
calls ele_get_info(), won't the GFP_KERNEL allocations for tx_msg, rx_msg,=
=20
and get_info_data bypass the fix you made in ele_service_swap() and still=20
risk the same I/O reclaim deadlock?

Should these allocations in ele_get_info() also be changed to use GFP_NOIO=
=20
to ensure the entire suspend/resume chain avoids I/O triggers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-imx-se-if-=
v46-0-aefaab525034@nxp.com?part=3D3
