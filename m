Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9881917F9;
	Mon, 20 Jan 2025 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375821; cv=none; b=LElsL7+GorNX8JuBMJh38h2Ru5a7eXHoCk/cPfslLzGC3ojTrd1z4GjaMIwg0LHEfy/PbZs5QeuGiJI1N+VCbkW2EURFJ7SHKy2QP+Q/PgDHbv/uU4nebN0gbUyWTEQNsscnARZSZGndsaMDvLqJlctt/mqqsG2ZW62k+O/3pzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375821; c=relaxed/simple;
	bh=zu9vsVvhED70f/LPHYWIlfe+I4fG057OYGUfoVCiomk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sE78vIdcfpk7Ww9i/oz9B75yXWieY246MlYqrtc4P2e4xzM8QmxWIBbHJlcov5z2zBrb48h3XdRJKd4PDyXKtYChPcmIv+xx9AnShdxWn86Ha0+pBoR0IftsHS9jr/uVRc+NDdg2odRg2Fks/S1YgUlm79YiH0/hp2hMMTQJ10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWSbIlvT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWSbIlvT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66AEC4CEDD;
	Mon, 20 Jan 2025 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737375820;
	bh=zu9vsVvhED70f/LPHYWIlfe+I4fG057OYGUfoVCiomk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pWSbIlvTyL8kNVCT1Lkho4J9zn/bcsSpN4rMT9NYfAaccbGPwBoCSA5Cd7vqNCxHN
	 f6ANrFOPYEkgRkMw+LPmrAP2pO5MSK0NsRPyJ/K+y2+alum2mrqivcQGFw9UVTy0XO
	 dTlyGnQI2UTp8hE4e+xxCqDxYqDevJk206NVERAZv2m6LqurqgSkv92wGBS926Gm6U
	 He8vD5I4SrW9qZWdQEK/81446UOQeNRb3ZPuXLn4q7tMqyi66gKTwiaIxHfNHaTiEd
	 xHbFAfiqFaAWgEJf1wiUHwm6DsADc+dS7L59YQCBCQTXH158u66drooQcv5o5HI3K9
	 dRV5VwJ8YgSdQ==
Message-ID: <2fb2db33-9d45-442a-bfb9-55173751f20f@kernel.org>
Date: Mon, 20 Jan 2025 13:23:33 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] firmware: imx: add driver for NXP EdgeLock
 Enclave
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2025 17:52, Pankaj Gupta wrote:
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE),
> are embedded in the SoC to support the features like HSM, SHE & V2X,
> using message based communication interface.

Fix your machine so this is not a "future" work.

> 
> The secure enclave FW communicates on a dedicated messaging unit(MU)
> based interface(s) with application core, where kernel is running.
> It exists on specific i.MX processors. e.g. i.MX8ULP, i.MX93.
> 
> This patch adds the driver for communication interface to secure-enclave,

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


> for exchanging messages with NXP secure enclave HW IP(s) like EdgeLock
> Enclave (ELE) from Kernel-space, used by kernel management layers like
> - DM-Crypt.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---



> +int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
> +{
> +	int err;
> +
> +	err = ele_get_info(priv, data);
> +	if (err < 0)
> +		return err;
> +
> +	return err;
> +}
> +
> +int ele_ping(struct se_if_priv *priv)
> +{
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
> +	int ret = 0;
> +
> +	if (!priv) {
> +		ret = -EINVAL;
> +		goto exit;

This does not make sense. return.... but is this even possible?


> +	}
> +
> +	tx_msg = kzalloc(ELE_PING_REQ_SZ, GFP_KERNEL);
> +	if (!tx_msg) {
> +		ret = -ENOMEM;

return -ENOMEM.

> +		goto exit;

Please read in coding style how gotos are supposed to be used.

> +	}
> +
> +	rx_msg = kzalloc(ELE_PING_RSP_SZ, GFP_KERNEL);
> +	if (!rx_msg) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	ret = se_fill_cmd_msg_hdr(priv,
> +				      (struct se_msg_hdr *)&tx_msg->header,
> +				      ELE_PING_REQ, ELE_PING_REQ_SZ, true);


Fix your coding style - run checkpatch strict on this.

> +	if (ret) {
> +		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.\n");
> +		goto exit;
> +	}
> +


...

> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
> +int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
> +int ele_ping(struct se_if_priv *priv);
> +int ele_service_swap(struct se_if_priv *priv,
> +		     phys_addr_t addr,
> +		     u32 addr_size, u16 flag);
> +int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr);
> +#endif
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> new file mode 100644
> index 000000000000..67d1fa761172
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -0,0 +1,324 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include "ele_base_msg.h"
> +#include "ele_common.h"
> +
> +u32 se_add_msg_crc(u32 *msg, u32 msg_len)
> +{
> +	u32 nb_words = msg_len / (u32)sizeof(u32);
> +	u32 crc = 0;
> +	u32 i;
> +
> +	for (i = 0; i < nb_words - 1; i++)
> +		crc ^= *(msg + i);
> +
> +	return crc;
> +}
> +
> +int ele_msg_rcv(struct se_if_priv *priv,
> +		struct se_clbk_handle *se_clbk_hdl)
> +{
> +	int err = 0;
> +
> +	do {
> +		/* If callback is executed before entrying to wait state,

It is not a networking device. Use Linux coding style.

You already got such comment long time ago and not much improved.


> +
> +static int se_if_probe(struct platform_device *pdev)
> +{
> +	const struct se_if_node_info_list *info_list;
> +	const struct se_if_node_info *info;
> +	struct device *dev = &pdev->dev;
> +	struct se_fw_load_info *load_fw;
> +	struct se_if_priv *priv;
> +	u32 idx;
> +	int ret;
> +
> +	idx = GET_IDX_FROM_DEV_NODE_NAME(dev->of_node);


NAK. Node can be called firmware and your entire driver collapes.

> +	info_list = device_get_match_data(dev);
> +	if (idx >= info_list->num_mu) {
> +		dev_err(dev,
> +			"Incorrect node name :%s\n",
> +			dev->of_node->full_name);

Nope. "firmware" or "secure" are correct node names. Where did you
document this ABI?

> +		dev_err(dev,
> +			"%s-<index>, acceptable index range is 0..%d\n",
> +			dev->of_node->name,
> +			info_list->num_mu - 1);
> +		ret = -EINVAL;
> +		return ret;
> +	}
> +
> +	info = &info_list->info[idx];
> +	if (!info) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		ret = -ENOMEM;
> +		goto exit;

Nope, You don't get how common exit works. You are supposed to clean up
in comon exit paths, not print error paths, especially ones which are
not welcomed - like here.

> +	}
> +
> +	priv->dev = dev;
> +	priv->if_defs = &info->if_defs;
> +	dev_set_drvdata(dev, priv);
> +
> +	ret = devm_add_action(dev, se_if_probe_cleanup, pdev);
> +	if (ret)
> +		goto exit;
> +
> +
> +	/* Mailbox client configuration */
> +	priv->se_mb_cl.dev		= dev;
> +	priv->se_mb_cl.tx_block		= false;
> +	priv->se_mb_cl.knows_txdone	= true;
> +	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
> +
> +	ret = se_if_request_channel(dev, &priv->tx_chan,
> +			&priv->se_mb_cl, MBOX_TX_NAME);
> +	if (ret)
> +		goto exit;
> +
> +	ret = se_if_request_channel(dev, &priv->rx_chan,
> +			&priv->se_mb_cl, MBOX_RX_NAME);
> +	if (ret)
> +		goto exit;
> +
> +	mutex_init(&priv->se_if_cmd_lock);
> +
> +	init_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	init_completion(&priv->cmd_receiver_clbk_hdl.done);
> +
> +	if (info->pool_name) {
> +		priv->mem_pool = of_gen_pool_get(dev->of_node,
> +							 info->pool_name, 0);
> +		if (!priv->mem_pool) {
> +			dev_err(dev,
> +				"Unable to get sram pool = %s\n",
> +				info->pool_name);
> +			goto exit;

Why do you print erros twice?

> +		}
> +	}
> +
> +	if (info->reserved_dma_ranges) {
> +		ret = of_reserved_mem_device_init(dev);
> +		if (ret) {
> +			dev_err(dev,
> +				"failed to init reserved memory region %d\n",
> +				ret);
> +			goto exit;
> +		}
> +	}
> +
> +	if (info->if_defs.se_if_type == SE_TYPE_ID_HSM) {
> +		ret = se_soc_info(priv);
> +		if (ret) {
> +			dev_err(dev,
> +				"failed[%pe] to fetch SoC Info\n", ERR_PTR(ret));
> +			goto exit;
> +		}
> +	}
> +
> +	/* By default, there is no pending FW to be loaded.*/
> +	if (info_list->se_fw_img_nm.prim_fw_nm_in_rfs ||
> +			info_list->se_fw_img_nm.seco_fw_nm_in_rfs) {
> +		load_fw = get_load_fw_instance(priv);
> +		load_fw->se_fw_img_nm = &info_list->se_fw_img_nm;
> +		load_fw->is_fw_loaded = false;
> +
> +		if (info_list->se_fw_img_nm.prim_fw_nm_in_rfs) {
> +			/* allocate buffer where SE store encrypted IMEM */
> +			load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
> +								&load_fw->imem.phyaddr,
> +								GFP_KERNEL);
> +			if (!load_fw->imem.buf) {
> +				dev_err(priv->dev,
> +					"dmam-alloc-failed: To store encr-IMEM.\n");
> +				ret = -ENOMEM;
> +				goto exit;
> +			}
> +			load_fw->imem_mgmt = true;
> +		}
> +	}
> +	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware, configured.\n",
> +			SE_TYPE_STR_HSM,
> +			priv->if_defs->se_instance_id);

Drop probe success. Useless.

> +	return ret;
> +
> +exit:
> +	/* if execution control reaches here, if probe fails.
> +	 */

Obvious comment.

> +	return dev_err_probe(dev, ret, "%s: Probe failed.", __func__);

Drop. I think I asked already long time - like 10 revisiosn ago - to
drop simple function debug messages. Look at other drivers how exit
paths are handled.



Best regards,
Krzysztof
