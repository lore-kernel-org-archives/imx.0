Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6A3D413F
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 22:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784153980; cv=none; b=mlToxlMXussjLmOtJx+JvPotvpLvUi5VhE0luVrqkhLyr3X6AUbur686/bPTuaxPARa9SkNrXtIlA3t7aht+hIhYLeWBoai+v47tLiX/D6EfyRlIW4UkvDqvlE+KnZG8rb1Xm4uXYPCUqu5+1zJmkt5UT1bPuHeaKubuI+F6FZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784153980; c=relaxed/simple;
	bh=TVyEB8gOoUd5hf4zrPZ3Ydv/tJMP3bzEXzkHGSCWLCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmpxjQ1glKwodAt1IJ6Nf1slVzfBHvMdferrJckHicD1dMS/Gq8bpDGS2Aq1Z72Vj5HtGVfluJv2PHsju1FmF2W6o0qJDK+x321yXqagbrcoSF370JoZYTQS/FeJbPRizhUfRqlNk8KYpl+UH3f/Zru04TUjzOETwzhIq3eZatw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hd6qEkKL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hd6qEkKL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so37349425e9.2
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 15:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784153975; x=1784758775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DBYDZpsFUeRudlpMR1y8rpExdPIx+TjQhIEvfP6wToI=;
        b=hd6qEkKLE2k+vVFo5nITzjvyg/5JUePFaJyUHPgdQRdFgqeEp6BCas7/pCSqrMQ+Aa
         FrxTciy2Aw3ctOsYHyibSWtg1bqBVskp1gCUdYMdnJOil8mKqu941gmTFJhBpn3p4EW+
         9R5KWWbvPTGVWaBmICbx+ujd8V0vXFsdMtzPL6Qb6GGJnaY1rLC5OvXIotIRj213bEeJ
         1wfZ2COOQPbJQSm0oxkj0o7wte1ouF6XA57Xo96dNjUIhP5vo80C03gvKtVPFhiwu+Va
         RE3t8ukkX24sQ3Uzov2M3kWVx1Rcjb5oh7NDnqwmJbnPUbwwYx155RG7FH0YJskKhKAm
         lhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153975; x=1784758775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBYDZpsFUeRudlpMR1y8rpExdPIx+TjQhIEvfP6wToI=;
        b=AEyK9GN7u87g2mz19IdJMNN1ca0D/neVr/COtvITIWwHXffhz16+qJ/ahmtsKr7bUt
         aegTAJjitw9zJ6G32XnoMkzWF1bfgEDYQj7yjH5eb3U3TakStpuTcOls14rLB99xzCZ/
         wLQfeSoUndAL13/sFZs68wqMElPJHqWV/hg0YzV8wyeAPINZE9VrchlanohVp+6gUZRF
         o+C8TfMOho2g3Et8Of7uLWzwPp9F7BmZYNi3OirbQOoJ7jqGKwSS27OgjM8x31qpbbLv
         Hly8yf9dQ2sq2hikTljjLJJcSA0Z1WsNcCYVLX//6YV4g/DwoMJyBKPUFl/m/RbdXkTA
         fTwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9IWmwcoMZ5UHqe8C+JCkg9AanALY/czhjLfarmk7leWBVnhGIfp06C3EG7t96HCgghPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpc/R153geS3N8WHJZCPF2wgYDzd96L5y9JmrXRViDK0zC/HA4
	uJfqD1j/stHqU4OkBIc1/Qp/Rk9GgqaDCVZDShvO/SjnbbwSnKXAODGv6+sGHidQFuY=
X-Gm-Gg: AfdE7cm1DzD+kQfF54+EU9uSZgLugW6HmfLQpZispOQTN+W/266SDdDuEgJ3X+5YVln
	2FM11HLsuAwsUxQ6UUw/M+y+cVC0C1ud5uLWRx3rBtrnZgLDLzhI3/37OwtJBTz7+YkEuJ5ToDC
	W4qGYFob1oNcR0A53gNeq0IDpBY+5cQ4dAE3xPjeaq2LdKyo5m35bzeC93p+OWUuI9/WkMbC3lP
	bjvwWksFwOV/B58Q5yZhGx48EtJzoKJeEmaOESwGaUeeFqR+WrlIFSnMhiiPX9LmTf5UEcaXLEV
	aBWIESMAecO3D9kq7mJAtcVxcNPkH53dzhN0gA+uJImIdk9fbQy0s3fJD2oYTdBkyYrKgqEGQLg
	ShRUtmYDUCMWNoJDVNiMMIdg+jJrdw/O83+ZmlJTdlO0ROf4xqC66NrHstBn2K4j2XqV6vqAKpH
	0Ct/Xoai4=
X-Received: by 2002:a05:600c:54c8:b0:493:bc4a:fb50 with SMTP id 5b1f17b1804b1-495389e3322mr71456295e9.38.1784153974792;
        Wed, 15 Jul 2026 15:19:34 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c6fe0c6sm73384695e9.1.2026.07.15.15.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:19:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 00:19:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v27 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <algFexGzM5u9aF_X@monoceros>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-3-bb7c45952f06@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my2fybndgktrcak5"
Content-Disposition: inline
In-Reply-To: <20260715-imx-se-if-v27-3-bb7c45952f06@nxp.com>


--my2fybndgktrcak5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v27 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
MIME-Version: 1.0

Hello,

On Wed, Jul 15, 2026 at 11:39:09PM +0530, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>=20
> Add MU-based communication interface for secure enclave.
>=20
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
>=20
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>=20
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
>=20
> Other dependent kernel drivers will be:
> - NVMEM: that supports non-volatile devices like EFUSES,
>   managed by NXP's secure-enclave.
>=20
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes from v26 to v27
>=20
> Fix several issues reported by Sashiko in the ELE driver:
> --------------------------------------------------------
>=20
> 1. Critical: encrypted IMEM DMA/physical address discarded / address 0
>    Status: Fixed.
>    The IMEM buffer now uses dma_addr_t daddr, and save/restore paths
>    pass imem->daddr to ele_service_swap(). This resolves the old issue
>    where imem.phyaddr could remain zero.
>=20
> 2. High: ele_msg_send() failure leaves waiting_rsp_clbk_hdl.rx_msg dangli=
ng
>    Status: Fixed.
>    ele_msg_send_rcv() now uses a common clear_waiter path. On ele_msg_sen=
d()
>    failure, the response waiter state is cleared under
>    waiting_rsp_clbk_hdl.clbk_rx_lock.
>=20
> 3. High: tx_msg may be freed while mailbox still has async pointer
>    Status: Addressed
>    The i.MX MU mailbox controller copies the message payload into
>    hardware registers synchronously in imx_mu_send_data(). The ELE
>    client does not retain the tx_msg buffer after mbox_send_message()
>    returns, and TX completion is handled by the mailbox controller/core
>    "knows_txdone" set as false.
>=20
> 4. High: global var_se_info shared mutable state
>    Status: Fixed.
>    Mutable firmware-load and IMEM state is now per-device in struct
>    se_if_priv. get_load_fw_instance() returns &priv->load_fw. The
>    remaining var_se_info only carries common SoC-level revision data.
>=20
> 5. High: ele_service_swap() silently truncates 64-bit address
>    Status: Fixed.
>    ele_service_swap() now takes dma_addr_t, and the v27 changelog
>    states that upper 32-bit addresses are rejected before placing
>    the low 32 bits into the ELE message field.
>    Firmware authentication and IMEM service-swap paths use DMA
>    addresses end-to-end.
>=20
> 6. High: soc_device_register() handle not unregistered
>    Status: Fixed.
>    The code now registers a devres action using devm_add_action_or_reset()
>    to call soc_device_unregister() for the soc_device_register() result.
>=20
> 7. High: manual dmam_free_coherent() can double-free devres memory
>    Status: Fixed.
>    The explicit dmam_free_coherent() for the encrypted IMEM buffer
>    is removed from probe cleanup. The buffer is now treated as
>    devres-managed and released by devres.
>=20
> 8. High: hardcoded MAX_SCHEDULE_TIMEOUT bypasses response timeout
>    Status: Fixed / design-controlled.
>    The response-wait path now uses callback-handle identity to decide
>    whether timeout applies, instead of using command-receiver file
>    identity. Command receiver daemon wait remains intentionally
>    long/indefinite by design. The miscdev patch also shows timeout
>    handling moved toward per-dev_ctx context.
>=20
> 9. Medium: ele_get_info() mixes goto cleanup with __free()
>    Status: Not Accepted.
>    This was intentionally not changed. The scoped __free(kfree) ownership
>    for tx_msg/rx_msg and the manual gen_pool/DMA cleanup for get_info_data
>    are separate ownership domains.
>=20
> 10. Medium: lockless clearing of rx_msg
>     Status: Fixed.
>     The response callback state is now cleared under
>     waiting_rsp_clbk_hdl.clbk_rx_lock in the common cleanup path.
>=20
> 11. Low: resume ignores se_restore_imem_state() return value
>     Status: Fixed with non-fatal PM policy.
>     The return value is now captured and logged. The driver intentionally
>     keeps suspend/resume non-fatal if IMEM save/restore fails.
>=20
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260629-imx-se-if-v26-0-146446285=
744@nxp.com?part=3D3
>=20
> 12. Address review feedback from Lothar Wa=DFmann.
>=20
>     Make se_fill_cmd_msg_hdr() return void and remove dead error checks a=
t its
>     call sites, since the helper only fills the message header and always
>     succeeded.
>=20
>     Remove the trailing comma after the final empty of_device_id sentinel=
 entry
>     so future compatible entries cannot accidentally be added after the t=
able
>     terminator.
> ---
>  drivers/firmware/imx/Kconfig        |  13 ++
>  drivers/firmware/imx/Makefile       |   2 +
>  drivers/firmware/imx/ele_base_msg.c | 272 ++++++++++++++++++++++
>  drivers/firmware/imx/ele_base_msg.h |  98 ++++++++
>  drivers/firmware/imx/ele_common.c   | 448 ++++++++++++++++++++++++++++++=
++++++
>  drivers/firmware/imx/ele_common.h   |  43 ++++
>  drivers/firmware/imx/se_ctrl.c      | 410 ++++++++++++++++++++++++++++++=
+++
>  drivers/firmware/imx/se_ctrl.h      | 111 +++++++++
>  include/linux/firmware/imx/se_api.h |  14 ++
>  9 files changed, 1411 insertions(+)
>=20
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index 127ad752acf8..e3cb7f965e70 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
>  	  core that could provide misc functions such as board control.
> =20
>  	  This driver can also be built as a module.
> +
> +config IMX_SEC_ENCLAVE
> +	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driv=
er."
> +	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
> +	select FW_LOADER
> +	default m if ARCH_MXC
> +
> +	help
> +	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
> +	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> +	    like base, HSM, V2X & SHE using the SAB protocol via the shared Mes=
saging
> +	    Unit. This driver exposes these interfaces via a set of file descri=
ptors
> +	    allowing to configure shared memory, send and receive messages.
> diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
> index 3bbaffa6e347..4412b15846b1 100644
> --- a/drivers/firmware/imx/Makefile
> +++ b/drivers/firmware/imx/Makefile
> @@ -4,3 +4,5 @@ obj-$(CONFIG_IMX_SCU)		+=3D imx-scu.o misc.o imx-scu-irq.=
o rm.o imx-scu-soc.o
>  obj-${CONFIG_IMX_SCMI_CPU_DRV}	+=3D sm-cpu.o
>  obj-${CONFIG_IMX_SCMI_MISC_DRV}	+=3D sm-misc.o
>  obj-${CONFIG_IMX_SCMI_LMM_DRV}	+=3D sm-lmm.o
> +sec_enclave-objs		=3D se_ctrl.o ele_common.o ele_base_msg.o
> +obj-${CONFIG_IMX_SEC_ENCLAVE}	+=3D sec_enclave.o
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> new file mode 100644
> index 000000000000..997854e10e14
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/types.h>
> +
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/genalloc.h>
> +
> +#include "ele_base_msg.h"
> +#include "ele_common.h"
> +
> +#define FW_DBG_DUMP_FIXED_STR		"ELE"
> +
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{
> +	dma_addr_t get_info_addr =3D 0;
> +	u32 *get_info_data =3D NULL;
> +	int ret =3D 0;
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
> +	if (priv->mem_pool)
> +		get_info_data =3D gen_pool_dma_alloc(priv->mem_pool,
> +						   ELE_GET_INFO_BUFF_SZ,
> +						   &get_info_addr);
> +	else
> +		get_info_data =3D dma_alloc_coherent(priv->dev,
> +						   ELE_GET_INFO_BUFF_SZ,
> +						   &get_info_addr,
> +						   GFP_KERNEL);
> +	if (!get_info_data) {
> +		dev_err(priv->dev,
> +			"%s: Failed to allocate get_info_addr.", __func__);
> +		return -ENOMEM;
> +	}
> +
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
> +
> +	tx_msg->data[0] =3D upper_32_bits(get_info_addr);
> +	tx_msg->data[1] =3D lower_32_bits(get_info_addr);
> +	tx_msg->data[2] =3D sizeof(*s_info);
> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0)
> +		goto exit;
> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> +				      ELE_GET_INFO_RSP_MSG_SZ, true);
> +	if (ret < 0)
> +		goto exit;
> +
> +	memcpy(s_info, get_info_data, sizeof(*s_info));
> +exit:
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)get_info_data,
> +			      ELE_GET_INFO_BUFF_SZ);
> +	else
> +		dma_free_coherent(priv->dev, ELE_GET_INFO_BUFF_SZ,
> +				  get_info_data, get_info_addr);
> +
> +	return ret;
> +}
> +
> +int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
> +{
> +	return ele_get_info(priv, data);
> +}
> +
> +int ele_ping(struct se_if_priv *priv)
> +{
> +	int ret =3D 0;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	struct se_api_msg *tx_msg __free(kfree) =3D kzalloc(ELE_PING_REQ_SZ,
> +							  GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree) =3D kzalloc(ELE_PING_RSP_SZ,
> +							  GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
> +
> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
> +			       ELE_PING_RSP_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
> +				      ELE_PING_RSP_SZ, true);
> +
> +	return ret;
> +}
> +
> +int ele_service_swap(struct se_if_priv *priv,
> +		     dma_addr_t addr,
> +		     u32 addr_size, u16 flag)
> +{
> +	int ret =3D 0;
> +
> +	if (upper_32_bits(addr)) {
> +		dev_err(priv->dev,
> +			"ELE service-swap address exceeds 32-bit range: %pad\n",
> +			&addr);
> +		return -ERANGE;
> +	}
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	struct se_api_msg *tx_msg __free(kfree)	=3D
> +		kzalloc(ELE_SERVICE_SWAP_REQ_MSG_SZ, GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree) =3D
> +		kzalloc(ELE_SERVICE_SWAP_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
> +	if (ret)
> +		return ret;
> +
> +	tx_msg->data[0] =3D flag;
> +	tx_msg->data[1] =3D addr_size;
> +	tx_msg->data[2] =3D ELE_NONE_VAL;
> +	tx_msg->data[3] =3D lower_32_bits(addr);
> +	tx_msg->data[4] =3D se_get_msg_chksum((u32 *)&tx_msg[0],
> +					    ELE_SERVICE_SWAP_REQ_MSG_SZ);
> +	if (!tx_msg->data[4])
> +		return -EINVAL;
> +
> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
> +			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
> +				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
> +	if (ret)
> +		return ret;
> +
> +	if (flag =3D=3D ELE_IMEM_EXPORT)
> +		ret =3D rx_msg->data[1];
> +	else
> +		ret =3D 0;
> +
> +	return ret;
> +}
> +
> +int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
> +			dma_addr_t img_addr)
> +{
> +	int ret =3D 0;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
> +		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_ad=
dr);
> +		return -EINVAL;
> +	}
> +
> +	struct se_api_msg *tx_msg __free(kfree)	=3D
> +		kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree) =3D
> +		kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
> +
> +	tx_msg->data[0] =3D lower_32_bits(contnr_addr);
> +	tx_msg->data[1] =3D 0;
> +	tx_msg->data[2] =3D lower_32_bits(img_addr);
> +
> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
> +			       ELE_FW_AUTH_RSP_MSG_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
> +				      ELE_FW_AUTH_RSP_MSG_SZ, true);
> +
> +	return ret;
> +}
> +
> +int ele_debug_dump(struct se_if_priv *priv)
> +{
> +	bool keep_logging;
> +	int msg_ex_cnt;
> +	int ret =3D 0;
> +	int i;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	struct se_api_msg *tx_msg __free(kfree) =3D kzalloc(ELE_DEBUG_DUMP_REQ_=
SZ,
> +							  GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree)	=3D kzalloc(ELE_DEBUG_DUMP_RSP_=
SZ,
> +							  GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
> +			    ELE_DEBUG_DUMP_REQ_SZ, true);
> +
> +	msg_ex_cnt =3D 0;
> +	do {
> +		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
> +
> +		ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
> +				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
> +					      ELE_DEBUG_DUMP_RSP_SZ, true);
> +		if (ret) {
> +			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
> +			break;
> +		}
> +		keep_logging =3D (rx_msg->header.size >=3D (ELE_DEBUG_DUMP_RSP_SZ >> 2=
) &&
> +				msg_ex_cnt < ELE_MAX_DBG_DMP_PKT);
> +
> +		rx_msg->header.size -=3D 2;
> +
> +		if (rx_msg->header.size > 2)
> +			rx_msg->header.size--;
> +
> +		for (i =3D 0; i < rx_msg->header.size; i +=3D 2)
> +			dev_info(priv->dev, "%s%02x_%02x: 0x%08x 0x%08x",
> +				 FW_DBG_DUMP_FIXED_STR,	msg_ex_cnt, i,
> +				 rx_msg->data[i + 1], rx_msg->data[i + 2]);
> +
> +		msg_ex_cnt++;
> +	} while (keep_logging);
> +
> +	return ret;
> +}
> diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/e=
le_base_msg.h
> new file mode 100644
> index 000000000000..4c3699543e87
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2025 NXP
> + *
> + * Header file for the EdgeLock Enclave Base API(s).
> + */
> +
> +#ifndef ELE_BASE_MSG_H
> +#define ELE_BASE_MSG_H
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +#include "se_ctrl.h"
> +
> +#define ELE_NONE_VAL			0x0
> +
> +#define ELE_GET_INFO_REQ		0xda
> +#define ELE_GET_INFO_REQ_MSG_SZ		0x10
> +#define ELE_GET_INFO_RSP_MSG_SZ		0x08
> +
> +#define MAX_UID_SIZE                     (16)
> +#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
> +#define DEV_GETINFO_FW_SHA_SZ            (32)
> +#define DEV_GETINFO_OEM_SRKH_SZ          (64)
> +#define DEV_GETINFO_MIN_VER_MASK	0xff
> +#define DEV_GETINFO_MAJ_VER_MASK	0xff00
> +#define ELE_DEV_INFO_EXTRA_SZ		0x60
> +
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
> +
> +struct dev_addn_info {
> +	u8  oem_srkh[DEV_GETINFO_OEM_SRKH_SZ];
> +	u8  trng_state;
> +	u8  csal_state;
> +	u8  imem_state;
> +	u8  reserved2;
> +};
> +
> +struct ele_dev_info {
> +	struct dev_info d_info;
> +	struct dev_addn_info d_addn_info;
> +};
> +
> +#define ELE_GET_INFO_BUFF_SZ		(sizeof(struct ele_dev_info) \
> +						+ ELE_DEV_INFO_EXTRA_SZ)
> +
> +#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
> +	const u32 *__x =3D (const u32 *)(x); \
> +	size_t __sz =3D (uid_word_sz); \
> +	((u64)__x[__sz - 1] << 32) | __x[0]; \
> +	})
> +
> +#define ELE_MAX_DBG_DMP_PKT		50
> +#define ELE_DEBUG_DUMP_REQ		0x21
> +#define ELE_DEBUG_DUMP_REQ_SZ		0x4
> +#define ELE_DEBUG_DUMP_RSP_SZ		0x5c
> +
> +#define ELE_PING_REQ			0x01
> +#define ELE_PING_REQ_SZ			0x04
> +#define ELE_PING_RSP_SZ			0x08
> +
> +#define ELE_SERVICE_SWAP_REQ		0xdf
> +#define ELE_SERVICE_SWAP_REQ_MSG_SZ	0x18
> +#define ELE_SERVICE_SWAP_RSP_MSG_SZ	0x0c
> +#define ELE_IMEM_SIZE			0x10000
> +#define ELE_IMEM_STATE_OK		0xca
> +#define ELE_IMEM_STATE_BAD		0xfe
> +#define ELE_IMEM_STATE_WORD		0x27
> +#define ELE_IMEM_STATE_MASK		0x00ff0000
> +#define ELE_IMEM_EXPORT			0x1
> +#define ELE_IMEM_IMPORT			0x2
> +
> +#define ELE_FW_AUTH_REQ			0x02
> +#define ELE_FW_AUTH_REQ_SZ		0x10
> +#define ELE_FW_AUTH_RSP_MSG_SZ		0x08
> +
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
> +int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
> +int ele_ping(struct se_if_priv *priv);
> +int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
> +		     u32 addr_size, u16 flag);
> +int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
> +			dma_addr_t img_addr);
> +int ele_debug_dump(struct se_if_priv *priv);
> +#endif
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> new file mode 100644
> index 000000000000..3f5f78df49b5
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include "ele_base_msg.h"
> +#include "ele_common.h"
> +
> +/*
> + * se_get_msg_chksum() - to calculate checksum word by word.
> + *
> + * @msg : reference to the input msg-data.
> + * @msg_len : reference to the input msg-data length in bytes.
> + *            Includes extra 4 bytes (or 1 words) chksum.
> + *
> + * This function returns the checksum calculated by ORing word by word.
> + *
> + * Return:
> + *  0: if the input length is not 4 byte aligned, or num of words < 5.
> + *  chksum: calculated word by word.
> + */
> +u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
> +{
> +	u32 nb_words =3D msg_len / (u32)sizeof(u32);
> +	u32 chksum =3D 0;
> +	u32 i;
> +
> +	if (nb_words < 5)
> +		return chksum;
> +
> +	if (msg_len % SE_MSG_WORD_SZ) {
> +		pr_err("Msg-len is not 4-byte aligned.");
> +		return chksum;
> +	}
> +
> +	/* nb_words include one checksum word, so skip it. */
> +	nb_words--;
> +
> +	for (i =3D 0; i < nb_words; i++)
> +		chksum ^=3D *(msg + i);
> +
> +	return chksum;
> +}
> +
> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl)
> +{
> +	bool wait_uninterruptible =3D false;
> +	unsigned long remaining_jiffies;
> +	unsigned long flags;
> +	int ret;
> +
> +	remaining_jiffies =3D MAX_SCHEDULE_TIMEOUT;
> +	do {
> +		if (wait_uninterruptible)
> +			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
> +							  remaining_jiffies);
> +		else
> +			ret =3D wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
> +									remaining_jiffies);
> +		if (ret =3D=3D -ERESTARTSYS) {
> +			/*
> +			 * Record that a signal was observed, then continue waiting non-
> +			 * interruptibly until the response arrives or the timeout
> +			 * expires. The caller can surface the interruption to userspace
> +			 * after the protocol transaction is brought back to a
> +			 * synchronized state.
> +			 */
> +			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
> +				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
> +				wait_uninterruptible =3D true;
> +				continue;
> +			}
> +			break;
> +		}
> +
> +		if (ret =3D=3D 0) {
> +			/*
> +			 * The response buffer belongs to the caller of ele_msg_send_rcv()
> +			 * and may be freed as soon as this function returns. Clear rx_msg
> +			 * under clbk_rx_lock so that a late se_if_rx_callback() can
> +			 * observe that the waiter has timed out and must not copy into
> +			 * the stale buffer.
> +			 *
> +			 * If the completion has not yet been signaled, mark the firmware
> +			 * path busy. This acts as a circuit breaker: reject new
> +			 * command/response transactions until the delayed response
> +			 * arrives and the callback closes the breaker.
> +			 */
> +
> +			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +			se_clbk_hdl->rx_msg =3D NULL;
> +			if (!completion_done(&se_clbk_hdl->done))
> +				atomic_set(&priv->fw_busy, 1);
> +
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +			ret =3D -ETIMEDOUT;
> +			dev_err(priv->dev,
> +				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
> +				get_se_if_name(priv->if_defs->se_if_type));
> +			break;
> +		}
> +		ret =3D se_clbk_hdl->rx_msg_sz;
> +		break;
> +	} while (ret < 0);
> +
> +	return ret;
> +}
> +
> +int ele_msg_send(struct se_if_priv *priv,
> +		 void *tx_msg,
> +		 int tx_msg_sz)
> +{
> +	struct se_msg_hdr *header =3D tx_msg;
> +	int err;
> +
> +	/*
> +	 * Check that the size passed as argument matches the size
> +	 * carried in the message.
> +	 */
> +	if (header->size << 2 !=3D tx_msg_sz) {
> +		dev_err(priv->dev,
> +			"User buf hdr: 0x%x, sz mismatced with input-sz (%d !=3D %d).",
> +			*(u32 *)header, header->size << 2, tx_msg_sz);
> +		return -EINVAL;
> +	}
> +
> +	err =3D mbox_send_message(priv->tx_chan, tx_msg);
> +	if (err < 0) {
> +		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
> +		return err;
> +	}
> +
> +	return tx_msg_sz;
> +}
> +
> +/* API used for send/receive blocking call. */
> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{
> +	unsigned long flags;
> +	int err;
> +
> +	guard(mutex)(&priv->se_if_cmd_lock);
> +
> +	if (atomic_read(&priv->fw_busy)) {
> +		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> +		return -EBUSY;
> +	}
> +	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
> +	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;
> +
> +	err =3D ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	if (err < 0)
> +		goto clear_waiter;
> +
> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * A signal was received after the command was sent. ele_msg_rcv()
> +		 * kept waiting until the FW/kernel protocol was synchronized again.
> +		 * If the transaction itself completed successfully, report the
> +		 * deferred signal to userspace using normal syscall-restart semantics.
> +		 * Do not hide real firmware/protocol errors such as -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;
> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}
> +
> +clear_waiter:
> +	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> +	priv->waiting_rsp_clbk_hdl.rx_msg =3D NULL;
> +	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D 0;
> +	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> +
> +	return err;
> +}
> +
> +static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
> +				       struct se_msg_hdr *header)
> +{
> +	/*
> +	 * List of API(s) header that can be accepte variable length
> +	 * response buffer.
> +	 */
> +	if (header->command =3D=3D ELE_DEBUG_DUMP_REQ &&
> +	    header->ver =3D=3D priv->if_defs->base_api_ver &&
> +	    header->size >=3D 2 && header->size <=3D (ELE_DEBUG_DUMP_RSP_SZ / 4=
))
> +		return true;
> +
> +	return false;
> +}
> +
> +/*
> + * Callback called by mailbox FW, when data is received.
> + */
> +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> +{
> +	struct se_clbk_handle *se_clbk_hdl;
> +	struct device *dev =3D mbox_cl->dev;
> +	struct se_msg_hdr *header;
> +	bool sz_mismatch =3D false;
> +	struct se_if_priv *priv;
> +	unsigned long flags;
> +	u32 rx_msg_sz;
> +
> +	priv =3D dev_get_drvdata(dev);
> +
> +	/* The function can be called with NULL msg */
> +	if (!msg) {
> +		dev_err(dev, "Message is invalid\n");
> +		return;
> +	}
> +
> +	header =3D msg;
> +	rx_msg_sz =3D header->size << 2;
> +
> +	/* Incoming command: wake up the receiver if any. */
> +	if (header->tag =3D=3D priv->if_defs->cmd_tag) {
> +		se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl;
> +		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (!se_clbk_hdl->rx_msg) {
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +			dev_warn(dev, "No command receiver registered for message: %.8x\n",
> +				 *((u32 *)header));
> +			return;
> +		}
> +
> +		/*
> +		 * cmd_tag messages are delivered only to the explicitly registered
> +		 * command receiver. Unlike the synchronous response waiter path, the
> +		 * command receiver uses a dedicated long-lived buffer installed by
> +		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
> +		 * breaker handling used for rsp_tag messages.
> +		 */
> +		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
> +			*(u32 *)header);
> +
> +		/*
> +		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
> +		 * as the NVM command are initiated by FW.
> +		 * Size is revealed as part of this call function.
> +		 */
> +
> +		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
> +			/* Store the response buffer maxsize in local variable.*/
> +			rx_msg_sz =3D MAX_NVM_MSG_LEN;
> +			sz_mismatch =3D true;
> +		}
> +
> +		se_clbk_hdl->rx_msg_sz =3D rx_msg_sz;
> +		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
> +		complete(&se_clbk_hdl->done);
> +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (sz_mismatch)
> +			dev_err(dev,
> +				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				*(u32 *)header,
> +				(header->size << 2), rx_msg_sz);
> +	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
> +		bool exception_for_sz_mismatch =3D check_hdr_exception_for_sz(priv, he=
ader);
> +		u32 exp_rx_msg_sz =3D 0;
> +
> +		/*
> +		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
> +		 * ele_msg_send_rcv(). After timeout or error, that path clears rx_msg
> +		 * under clbk_rx_lock before returning to its caller, which may then f=
ree
> +		 * the buffer. Check rx_msg under the same lock here so a delayed resp=
onse
> +		 * can be detected and dropped instead of copying into freed memory.
> +		 *
> +		 * A late response also closes the firmware-busy circuit breaker, allo=
wing
> +		 * future command/response transactions to proceed again.
> +		 */
> +		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
> +		exp_rx_msg_sz =3D se_clbk_hdl->rx_msg_sz;
> +		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (!se_clbk_hdl->rx_msg) {
> +			/* Close circuit breaker on spinlock race */
> +			atomic_set(&priv->fw_busy, 0);
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +			dev_info(dev, "ELE responded (late), recovery FW available.");
> +			return;
> +		}
> +		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
> +			*(u32 *)header);
> +
> +		/*
> +		 * For rsp_tag traffic, the sender provides the expected response
> +		 * buffer size. If firmware returns a different size, clamp the copy
> +		 * length to the caller's buffer capacity before memcpy() and report t=
he
> +		 * mismatch after dropping the spinlock.
> +		 */
> +		if (rx_msg_sz !=3D exp_rx_msg_sz) {
> +			if (!exception_for_sz_mismatch)
> +				sz_mismatch =3D true;
> +
> +			se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, exp_rx_msg_sz);
> +		}
> +		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
> +		complete(&se_clbk_hdl->done);
> +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +
> +		if (sz_mismatch)
> +			dev_err(dev,
> +				"Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				*(u32 *)header,
> +				(header->size << 2), exp_rx_msg_sz);
> +	} else {
> +		dev_err(dev, "Failed to select a device for message: %.8x\n",
> +			*((u32 *)header));
> +	}
> +}
> +
> +int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *=
msg,
> +			    u8 msg_id, u8 sz, bool is_base_api)
> +{
> +	struct se_msg_hdr *header =3D &msg->header;
> +	u32 status;
> +
> +	if (header->tag !=3D priv->if_defs->rsp_tag) {
> +		dev_err(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x !=3D 0x%x)=
",
> +			msg_id, header->tag, priv->if_defs->rsp_tag);
> +		return -EINVAL;
> +	}
> +
> +	if (header->command !=3D msg_id) {
> +		dev_err(priv->dev, "MSG Header: Cmd id mismatch. (0x%x !=3D 0x%x)",
> +			header->command, msg_id);
> +		return -EINVAL;
> +	}
> +
> +	if ((sz % 4) || (header->size !=3D (sz >> 2) &&
> +			 !check_hdr_exception_for_sz(priv, header))) {
> +		dev_err(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x !=3D 0x%x)=
",
> +			msg_id, header->size, (sz >> 2));
> +		return -EINVAL;
> +	}
> +
> +	if (is_base_api && header->ver !=3D priv->if_defs->base_api_ver) {
> +		dev_err(priv->dev,
> +			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x !=3D 0x%x)",
> +			msg_id, header->ver, priv->if_defs->base_api_ver);
> +		return -EINVAL;
> +	} else if (!is_base_api && header->ver !=3D priv->if_defs->fw_api_ver) {
> +		dev_err(priv->dev,
> +			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x !=3D 0x%x)",
> +			msg_id, header->ver, priv->if_defs->fw_api_ver);
> +		return -EINVAL;
> +	}
> +
> +	status =3D RES_STATUS(msg->data[0]);
> +	if (status !=3D priv->if_defs->success_tag) {
> +		dev_err(priv->dev, "Command Id[%x], Response Failure =3D 0x%x",
> +			header->command, status);
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
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
> +
> +	/* Check for the imem-state before continue to save imem state. */
> +	if (s_info.d_addn_info.imem_state =3D=3D ELE_IMEM_STATE_BAD)
> +		return 0;
> +
> +	/*
> +	 * EXPORT command will save encrypted IMEM to given address,
> +	 * so later in resume, IMEM can be restored from the given
> +	 * address.
> +	 *
> +	 * Size must be at least 64 kB.
> +	 */
> +	ret =3D ele_service_swap(priv, imem->daddr, ELE_IMEM_SIZE, ELE_IMEM_EXP=
ORT);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to export IMEM.");
> +		imem->size =3D 0;
> +	} else {
> +		dev_dbg(priv->dev,
> +			"Exported %d bytes of encrypted IMEM.",
> +			ret);
> +		imem->size =3D ret;
> +	}
> +
> +	return ret > 0 ? 0 : ret;
> +}
> +
> +int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *i=
mem)
> +{
> +	struct ele_dev_info s_info;
> +	int ret;
> +
> +	/* get info from ELE */
> +	ret =3D ele_get_info(priv, &s_info);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to get info from ELE.");
> +		return ret;
> +	}
> +	imem->state =3D s_info.d_addn_info.imem_state;
> +
> +	/* Check for the imem-state and imem-size before continue to
> +	 * restore imem state.
> +	 */
> +	if (s_info.d_addn_info.imem_state !=3D ELE_IMEM_STATE_BAD || !imem->siz=
e)
> +		return -EIO;
> +
> +	/*
> +	 * IMPORT command will restore IMEM from the given
> +	 * address, here size is the actual size returned by ELE
> +	 * during the export operation
> +	 */
> +	ret =3D ele_service_swap(priv, imem->daddr, imem->size, ELE_IMEM_IMPORT=
);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to import IMEM");
> +		return ret;
> +	}
> +
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
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele=
_common.h
> new file mode 100644
> index 000000000000..0365759fdd12
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __ELE_COMMON_H__
> +#define __ELE_COMMON_H__
> +
> +#include "se_ctrl.h"
> +
> +#define ELE_SUCCESS_IND			0xD6
> +
> +#define IMX_ELE_FW_DIR                 "imx/ele/"
> +
> +u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
> +
> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl);
> +
> +int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
> +
> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz);
> +
> +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
> +
> +int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *=
msg,
> +			    u8 msg_id, u8 sz, bool is_base_api);
> +
> +/* Fill a command message header with a given command ID and length in b=
ytes. */
> +static inline void se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct s=
e_msg_hdr *hdr,
> +				       u8 cmd, u32 len, bool is_base_api)
> +{
> +	hdr->tag =3D priv->if_defs->cmd_tag;
> +	hdr->ver =3D (is_base_api) ? priv->if_defs->base_api_ver : priv->if_def=
s->fw_api_ver;
> +	hdr->command =3D cmd;
> +	hdr->size =3D len >> 2;
> +}
> +
> +int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem=
);
> +
> +int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *i=
mem);
> +
> +#endif /*__ELE_COMMON_H__ */
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> new file mode 100644
> index 000000000000..7cb98a373334
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dma-direct.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/firmware.h>
> +#include <linux/firmware/imx/se_api.h>
> +#include <linux/genalloc.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sys_soc.h>

Please don't add new #includes for <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides of_device_id.

> +static const struct of_device_id se_match[] =3D {
> +	{ .compatible =3D "fsl,imx8ulp-se-ele-hsm", .data =3D &imx8ulp_se_ele_h=
sm },
> +	{ .compatible =3D "fsl,imx93-se-ele-hsm", .data =3D &imx93_se_ele_hsm },
> +	{}

{ } is the more typical way for the list terminator. (That's a nitpick.)

> +};
> [...]
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int se_suspend(struct device *dev)
> +{
> +	struct se_if_priv *priv =3D dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret =3D 0;
> +
> +	load_fw =3D get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		ret =3D se_save_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_warn(dev, "Failure saving IMEM state[0x%x]", ret);
> +	}
> +
> +	return 0;
> +}
> +
> +static int se_resume(struct device *dev)
> +{
> +	struct se_if_priv *priv =3D dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret =3D 0;
> +
> +	load_fw =3D get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		ret =3D se_restore_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_warn(dev, "Failure restoring IMEM state[0x%x]", ret);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops se_pm =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(se_suspend, se_resume)
> +};
> +
> +#define SE_PM_OPS	(&se_pm)
> +#else
> +#define SE_PM_OPS	NULL
> +#endif

If you use DEFINE_SIMPLE_DEV_PM_OPS() you can drop the #ifdeffery. (But
double check this does what you want.)

> +static struct platform_driver se_driver =3D {
> +	.driver =3D {
> +		.name =3D "fsl-se",
> +		.of_match_table =3D se_match,
> +		.pm =3D SE_PM_OPS,
> +	},
> +	.probe =3D se_if_probe,
> +};
> +MODULE_DEVICE_TABLE(of, se_match);

MODULE_DEVICE_TABLE belongs to directly after the table.
> +
> +module_platform_driver(se_driver);

Please put this after se_driver (without a newline).

> +MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
> +MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
> +MODULE_LICENSE("GPL");

--my2fybndgktrcak5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpYB28ACgkQj4D7WH0S
/k5biQf8CGZFW2xaiubSOPObRH4OQpPk7C+P2mYf5gWb0scjxS7G7aKnNOVIF3Ml
PcwDASeXHZZEt8BPqvhlWiLKudWWWdLdz0pMbVVI4ed8OIhhSjsKBU6ZDNKA5YDL
Snvi5DnEZ5RGLfy8MhY/prX5YidEO/lyTQQsrmeTxRuICzFNujW7XGqxLQEUh1C2
1kexGB56ic4J3x3OW8rBz9owiEvKd5pctlLZrrQ2w54hH5A/PsFDhVi0RZwpRmLO
S9t3/ZiRu86sqJjanRR0HCwpCrCsLhxyqzN14MxWF0zBzIelgwaz274nbK8Ipc4b
Wly/YmwAiDT+GVcWMluXOzvXXFYB9w==
=vavJ
-----END PGP SIGNATURE-----

--my2fybndgktrcak5--
