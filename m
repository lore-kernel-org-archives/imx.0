Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA49202F7E
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351838; cv=none; b=QD0zxrgrkhRZ7UojdPU5z41g8CQXBDZZ3hM3HtH2f8WW1EfbGod3XxdFb2UFhqhiz1jSve1wVWueCyOyVuFlttFvtrCBtvAkWF8pEPm/B/ImWokBu1I3chFItTVFz8EZg/7xvDYVvDVCvhtP+HdwZhyryJ118L4/NWg27F2Xa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351838; c=relaxed/simple;
	bh=G+GKfXvv/rnv0WSZor2J49k45YPOTkCV2hzrNFFf3oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6j3JQ3Y4f+X5v8Vuk5dtY+6M1ZhtXOXFUG9hicDoVwaABwFJFSQi2B887DEvD0ivJ+0NYoOTxUH0MBVBgnq6sIloJMhcB4JZbDyXm0NkV/du2WvgZqN3Z717pqpkJPBrBoF4XxBvT+EzyD1ZOPgQY7uG+KhErboXc29vmjfAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/DC1OOd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/DC1OOd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso27579715e9.3
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 04:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734351835; x=1734956635; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0M4ROyI5VuUm1Dqoke2sKtA4Jn5qP7aZUfIjFZkt4A=;
        b=O/DC1OOdKpjWD9eqp4/1acn9WqDkaXeB3iDDdOjR41NuAgnMtU7rlvXq+Rthg8AgCl
         wDW8tm4Fxo5WDXuh+tTyEVWlpDLHEJ89To20bDa4clH5oghyGI9pnjtd6nqu9Ar4BGVP
         mP34ARB/TjT3LqoAv/6whzti4YfNs8kfa2mPXB/cRkWH1oHxt0xMWSTEYymvoArm+hfH
         s16WK2SEbMZ1Uv9CW1X7tC1/NAJyd91d5rRraZ8ABBOJ64GUqLeNRMY8U6L8VlSdWm88
         H0z5j8ZC1IPizjgJbBEw3Q3e2RX8D8yuQs/6/WSL2JzIJ5uoiVSs2a7/5Oc2YW5usy9Y
         8Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351835; x=1734956635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0M4ROyI5VuUm1Dqoke2sKtA4Jn5qP7aZUfIjFZkt4A=;
        b=M8xrTQ+vJBvthcHxf6VmOfX/Kt1TS6dETmMxpZrUZkeczTfhyo5AQeDycRBss+0cr9
         3r+cSeuACBCHRO+2qnLZKi7Qe0moqrituZCKpWWL80Nj0kOlVpCeO+ZzQOORwsoIsal8
         bRViAZExktYJeYH68tqdHMz1FPb0rP4VTyimuxumx5WOUofvMpwuPd80CFRIVity/7xn
         rfgG+aB+jBgQjwanvPytA/x7xT03PnztE4ZCUsnGzzuj+TtV5rlBAavgrPHa5pBlGiq9
         Sya7WyVEuoJVuoDXo3R27RqJWys3lqED/wQfmFY95NCPTCSHc3ugjizWtTnSSO/WSR/l
         SibQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA5yjeXujlOe9Cvjh8zitv25csYlvUnLOEsyZVPETQi1RAY4x1q7fKgONaC0Yebs/2tpw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj//fZnA7fer3K84L9HOTeCQjYT1cJzio0eTpMlwLUne/s6UFL
	YB/0XTYnLhlHXStdcVIFoTEOi5f6Yh6Ojckum5mwTaLcPiOGhthz
X-Gm-Gg: ASbGnctLaPe/MPzImnwF+/b7kjH3Yz7MhrH06qMrbSnUPeVvLaP+EHbF4cbnofX9YIE
	KO2T93XdewGZBeyDatdoOQeMFMozpSnIfBq9FTzHKldjsKoZn4er/QFkvDdeuxFva1k3cJcDaMv
	91Ii4CL9Txzt7noSqu/bsxp8N7h7EUEamlxsVCRFmW36tDqBH1tXh48Vw1Pq4DfagUC9p+PziD9
	19NxIoaSXwjiRswlqNSZa2u5TEn7Hc29w8EUDRY9G988OSjHXyrPb3Y8y+mgFrNorVBisDSXTym
	pYPLEQ==
X-Google-Smtp-Source: AGHT+IHllI1JbXYYae2H/MvITh+4jN27/1ciwccWg4jug4lIS1NHVOZJ0z8HLrN/tAQsxRz++H1Dmw==
X-Received: by 2002:a05:600c:350c:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4362aa147a8mr104737745e9.4.1734351833107;
        Mon, 16 Dec 2024 04:23:53 -0800 (PST)
Received: from [192.168.4.67] ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363602d940sm83170665e9.12.2024.12.16.04.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:23:52 -0800 (PST)
Message-ID: <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
Date: Mon, 16 Dec 2024 14:23:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-5-laurentiumihalcea111@gmail.com>
 <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
 <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com>
 <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/2024 5:13 PM, Frank Li wrote:
> On Thu, Dec 12, 2024 at 01:11:29PM +0200, Laurentiu Mihalcea wrote:
>>
>> On 11/13/2024 10:17 PM, Frank Li wrote:
>>> On Wed, Nov 13, 2024 at 02:52:39PM -0500, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add SOF driver for imx95.
>>>>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  sound/soc/sof/imx/Kconfig  |   8 +
>>>>  sound/soc/sof/imx/Makefile |   2 +
>>>>  sound/soc/sof/imx/imx95.c  | 401 +++++++++++++++++++++++++++++++++++++
>>> why not reused exist one? look likes simular.
>>>
>>> Frank
>> the SOF drivers do indeed have some similarities, but each of them has their own quirks which IMO makes it a bit harder to add the 95 support. We need to figure out the common parts and then move them to imx-common, but I believe this can be solved incrementally.
> You should create common part firstly, then implement equal function with
> existed part. Finially add imx95 part.
>
> Frank

Yes, I'm aware of how this _should_ be done, but, like I mentioned, the change is not trivial and will
require tweaking the other drivers as well. As such, I'd like to get the 95 support in as-is firstly.

Are there any other thoughts on this?

>
>>>>  3 files changed, 411 insertions(+)
>>>>  create mode 100644 sound/soc/sof/imx/imx95.c
>>>>
>>>> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
>>>> index 4751b04d5e6f..51a70a193533 100644
>>>> --- a/sound/soc/sof/imx/Kconfig
>>>> +++ b/sound/soc/sof/imx/Kconfig
>>>> @@ -50,4 +50,12 @@ config SND_SOC_SOF_IMX8ULP
>>>>  	  Say Y if you have such a device.
>>>>  	  If unsure select "N".
>>>>
>>>> +config SND_SOC_SOF_IMX95
>>>> +	tristate "SOF support for i.MX95"
>>>> +	depends on IMX_DSP
>>>> +	help
>>>> +	  This adds support for Sound Open Firmware for NXP i.MX95 platforms.
>>>> +	  Say Y if you have such a device.
>>>> +	  If unsure select "N".
>>>> +
>>>>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
>>>> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
>>>> index be0bf0736dfa..715ac3798668 100644
>>>> --- a/sound/soc/sof/imx/Makefile
>>>> +++ b/sound/soc/sof/imx/Makefile
>>>> @@ -2,10 +2,12 @@
>>>>  snd-sof-imx8-y := imx8.o
>>>>  snd-sof-imx8m-y := imx8m.o
>>>>  snd-sof-imx8ulp-y := imx8ulp.o
>>>> +snd-sof-imx95-y := imx95.o
>>>>
>>>>  snd-sof-imx-common-y := imx-common.o
>>>>
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
>>>> +obj-$(CONFIG_SND_SOC_SOF_IMX95) += snd-sof-imx95.o
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
>>>> diff --git a/sound/soc/sof/imx/imx95.c b/sound/soc/sof/imx/imx95.c
>>>> new file mode 100644
>>>> index 000000000000..5a0e44f5bd48
>>>> --- /dev/null
>>>> +++ b/sound/soc/sof/imx/imx95.c
>>>> @@ -0,0 +1,401 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#include <linux/arm-smccc.h>
>>>> +#include <linux/clk.h>
>>>> +#include <linux/firmware/imx/dsp.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_platform.h>
>>>> +#include <linux/of_reserved_mem.h>
>>>> +#include <sound/sof.h>
>>>> +
>>>> +#include "../sof-of-dev.h"
>>>> +#include "../ops.h"
>>>> +
>>>> +#define IMX_SIP_SRC 0xC2000005
>>>> +#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
>>>> +
>>>> +#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
>>>> +
>>>> +#define IMX_SIP_LMM 0xC200000F
>>>> +#define IMX_SIP_LMM_BOOT 0x0
>>>> +#define IMX_SIP_LMM_SHUTDOWN 0x1
>>>> +
>>>> +#define IMX95_M7_LM_ID 0x1
>>>> +
>>>> +#define MBOX_DSPBOX_OFFSET 0x1000
>>>> +#define MBOX_WINDOW_OFFSET 0x6000000
>>>> +
>>>> +struct imx95_priv {
>>>> +	struct platform_device *ipc_dev;
>>>> +	struct imx_dsp_ipc *ipc_handle;
>>>> +	resource_size_t bootaddr;
>>>> +};
>>>> +
>>>> +static void imx95_ipc_handle_reply(struct imx_dsp_ipc *ipc)
>>>> +{
>>>> +	unsigned long flags;
>>>> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
>>>> +
>>>> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
>>>> +	snd_sof_ipc_process_reply(sdev, 0);
>>>> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
>>>> +}
>>>> +
>>>> +static void imx95_ipc_handle_request(struct imx_dsp_ipc *ipc)
>>>> +{
>>>> +	snd_sof_ipc_msgs_rx(imx_dsp_get_data(ipc));
>>>> +}
>>>> +
>>>> +static struct imx_dsp_ops ipc_ops = {
>>>> +	.handle_reply = imx95_ipc_handle_reply,
>>>> +	.handle_request = imx95_ipc_handle_request,
>>>> +};
>>>> +
>>>> +static int imx95_disable_enable_core(bool enable)
>>>> +{
>>>> +	struct arm_smccc_res res;
>>>> +
>>>> +	if (enable)
>>>> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT, IMX95_M7_LM_ID,
>>>> +			      0, 0, 0, 0, 0, &res);
>>>> +	else
>>>> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN, IMX95_M7_LM_ID,
>>>> +			      0, 0, 0, 0, 0, &res);
>>>> +
>>>> +	return res.a0;
>>>> +}
>>>> +
>>>> +static int imx95_run(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	return imx95_disable_enable_core(true);
>>>> +}
>>>> +
>>>> +static int imx95_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
>>>> +{
>>>> +	struct imx95_priv *priv = sdev->pdata->hw_pdata;
>>>> +
>>>> +	sof_mailbox_write(sdev, sdev->host_box.offset,
>>>> +			  msg->msg_data, msg->msg_size);
>>>> +
>>>> +	imx_dsp_ring_doorbell(priv->ipc_handle, 0);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx95_get_mailbox_offset(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	return MBOX_DSPBOX_OFFSET + MBOX_WINDOW_OFFSET;
>>>> +}
>>>> +
>>>> +static int imx95_get_bar_index(struct snd_sof_dev *sdev, u32 type)
>>>> +{
>>>> +	switch (type) {
>>>> +	case SOF_FW_BLK_TYPE_SRAM:
>>>> +		return type;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +}
>>>> +
>>>> +static int imx95_get_window_offset(struct snd_sof_dev *sdev, u32 id)
>>>> +{
>>>> +	return MBOX_WINDOW_OFFSET;
>>>> +}
>>>> +
>>>> +static int imx95_set_power_state(struct snd_sof_dev *sdev,
>>>> +				 const struct sof_dsp_power_state *target_state)
>>>> +{
>>>> +	sdev->dsp_power_state = *target_state;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx95_suspend_resume(struct snd_sof_dev *sdev, bool suspend)
>>>> +{
>>>> +	struct imx95_priv *priv;
>>>> +	int ret, i;
>>>> +
>>>> +	priv = sdev->pdata->hw_pdata;
>>>> +
>>>> +	if (suspend) {
>>>> +		ret = imx95_disable_enable_core(false);
>>>> +		if (ret) {
>>>> +			dev_err(sdev->dev, "failed to stop core\n");
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++) {
>>>> +		if (suspend)
>>>> +			imx_dsp_free_channel(priv->ipc_handle, i);
>>>> +		else
>>>> +			imx_dsp_request_channel(priv->ipc_handle, i);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx95_runtime_resume(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_state = {
>>>> +		.state = SOF_DSP_PM_D0,
>>>> +	};
>>>> +
>>>> +	ret = imx95_suspend_resume(sdev, false);
>>>> +	if (ret < 0) {
>>>> +		dev_err(sdev->dev, "failed to runtime resume: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>>>> +}
>>>> +
>>>> +static int imx95_resume(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_state = {
>>>> +		.state = SOF_DSP_PM_D0,
>>>> +	};
>>>> +
>>>> +	ret = imx95_suspend_resume(sdev, false);
>>>> +	if (ret < 0) {
>>>> +		dev_err(sdev->dev, "failed to resume: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	if (pm_runtime_suspended(sdev->dev)) {
>>>> +		pm_runtime_disable(sdev->dev);
>>>> +		pm_runtime_set_active(sdev->dev);
>>>> +		pm_runtime_mark_last_busy(sdev->dev);
>>>> +		pm_runtime_enable(sdev->dev);
>>>> +		pm_runtime_idle(sdev->dev);
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>>>> +}
>>>> +
>>>> +static int imx95_runtime_suspend(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_state = {
>>>> +		.state = SOF_DSP_PM_D3,
>>>> +	};
>>>> +
>>>> +	ret = imx95_suspend_resume(sdev, true);
>>>> +	if (ret < 0) {
>>>> +		dev_err(sdev->dev, "failed to runtime suspend: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>>>> +}
>>>> +
>>>> +static int imx95_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_power_state = {
>>>> +		.state = target_state,
>>>> +	};
>>>> +
>>>> +	if (!pm_runtime_suspended(sdev->dev)) {
>>>> +		ret = imx95_suspend_resume(sdev, true);
>>>> +		if (ret < 0) {
>>>> +			dev_err(sdev->dev, "failed to suspend: %d\n", ret);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
>>>> +}
>>>> +
>>>> +static struct snd_soc_dai_driver imx95_dai[] = {
>>>> +	{
>>>> +		.name = "sai3",
>>>> +		.playback = {
>>>> +			.channels_min = 1,
>>>> +			.channels_max = 32,
>>>> +		},
>>>> +		.capture = {
>>>> +			.channels_min = 1,
>>>> +			.channels_max = 32,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static int imx95_probe(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	struct platform_device *pdev;
>>>> +	struct imx95_priv *priv;
>>>> +	struct resource *res;
>>>> +	struct arm_smccc_res smc_ret;
>>>> +	int ret;
>>>> +
>>>> +	pdev = container_of(sdev->dev, struct platform_device, dev);
>>>> +
>>>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return dev_err_probe(&pdev->dev, -ENOMEM, "failed to alloc priv\n");
>>>> +
>>>> +	sdev->pdata->hw_pdata = priv;
>>>> +
>>>> +	/* map SRAM */
>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +	if (!res)
>>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>>> +				     "failed to fetch SRAM region\n");
>>>> +
>>>> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(&pdev->dev, res->start,
>>>> +						       resource_size(res));
>>>> +	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]))
>>>> +		return dev_err_probe(&pdev->dev,
>>>> +				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]),
>>>> +				     "failed to map SRAM region\n");
>>>> +
>>>> +	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
>>>> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
>>>> +	sdev->dsp_box.offset = MBOX_DSPBOX_OFFSET + MBOX_WINDOW_OFFSET;
>>>> +	priv->bootaddr = res->start;
>>>> +
>>>> +	ret = of_reserved_mem_device_init(sdev->dev);
>>>> +	if (ret)
>>>> +		return dev_err_probe(&pdev->dev, ret,
>>>> +				     "failed to bind DMA region\n");
>>>> +
>>>> +	priv->ipc_dev = platform_device_register_data(&pdev->dev, "imx-dsp",
>>>> +						      PLATFORM_DEVID_NONE,
>>>> +						      pdev, sizeof(*pdev));
>>>> +	if (IS_ERR(priv->ipc_dev))
>>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->ipc_dev),
>>>> +				     "failed to create IPC device\n");
>>>> +
>>>> +	priv->ipc_handle = dev_get_drvdata(&priv->ipc_dev->dev);
>>>> +	if (!priv->ipc_handle) {
>>>> +		ret = -EPROBE_DEFER;
>>>> +		dev_err(&pdev->dev, "failed to fetch ipc handle\n");
>>>> +		goto err_unregister_ipc_dev;
>>>> +	}
>>>> +
>>>> +	priv->ipc_handle->ops = &ipc_ops;
>>>> +	imx_dsp_set_data(priv->ipc_handle, sdev);
>>>> +
>>>> +	/* set core boot reset address */
>>>> +	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, priv->bootaddr,
>>>> +		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_ret);
>>>> +	if ((int)smc_ret.a0 < 0) {
>>>> +		ret = smc_ret.a0;
>>>> +		dev_err(&pdev->dev, "failed to set boot address: %d", ret);
>>>> +		goto err_unregister_ipc_dev;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_unregister_ipc_dev:
>>>> +	platform_device_unregister(priv->ipc_dev);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void imx95_remove(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	struct imx95_priv *priv;
>>>> +
>>>> +	priv = sdev->pdata->hw_pdata;
>>>> +
>>>> +	if (imx95_disable_enable_core(false))
>>>> +		dev_err(sdev->dev, "failed to stop core\n");
>>>> +
>>>> +	platform_device_unregister(priv->ipc_dev);
>>>> +}
>>>> +
>>>> +static const struct snd_sof_dsp_ops sof_imx95_ops = {
>>>> +	.probe = imx95_probe,
>>>> +	.remove = imx95_remove,
>>>> +
>>>> +	/* mandatory "DSP" ops */
>>>> +	.run = imx95_run,
>>>> +	.block_read = sof_block_read,
>>>> +	.block_write = sof_block_write,
>>>> +	.send_msg = imx95_send_msg,
>>>> +	.load_firmware = snd_sof_load_firmware_memcpy,
>>>> +	.ipc_msg_data = sof_ipc_msg_data,
>>>> +
>>>> +	.mailbox_read = sof_mailbox_read,
>>>> +	.mailbox_write = sof_mailbox_write,
>>>> +
>>>> +	.get_mailbox_offset = imx95_get_mailbox_offset,
>>>> +	.get_bar_index = imx95_get_bar_index,
>>>> +	.get_window_offset = imx95_get_window_offset,
>>>> +
>>>> +	.pcm_open = sof_stream_pcm_open,
>>>> +	.pcm_close = sof_stream_pcm_close,
>>>> +	.set_stream_data_offset = sof_set_stream_data_offset,
>>>> +
>>>> +	.runtime_suspend = imx95_runtime_suspend,
>>>> +	.runtime_resume = imx95_runtime_resume,
>>>> +
>>>> +	.resume = imx95_resume,
>>>> +	.suspend = imx95_suspend,
>>>> +
>>>> +	.set_power_state = imx95_set_power_state,
>>>> +
>>>> +	.drv = imx95_dai,
>>>> +	.num_drv = ARRAY_SIZE(imx95_dai),
>>>> +
>>>> +	.hw_info = SNDRV_PCM_INFO_MMAP |
>>>> +		   SNDRV_PCM_INFO_MMAP_VALID |
>>>> +		   SNDRV_PCM_INFO_INTERLEAVED |
>>>> +		   SNDRV_PCM_INFO_PAUSE |
>>>> +		   SNDRV_PCM_INFO_BATCH |
>>>> +		   SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
>>>> +};
>>>> +
>>>> +static struct snd_sof_of_mach sof_imx95_machs[] = {
>>>> +	{
>>>> +		.compatible = "fsl,imx95-19x19-evk",
>>>> +		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
>>>> +		.drv_name = "asoc-audio-graph-card2",
>>>> +	},
>>>> +	{
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct sof_dev_desc sof_of_imx95_desc = {
>>>> +	.of_machines = sof_imx95_machs,
>>>> +	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),
>>>> +	.ipc_default = SOF_IPC_TYPE_3,
>>>> +	.default_fw_path = {
>>>> +		[SOF_IPC_TYPE_3] = "imx/sof",
>>>> +	},
>>>> +	.default_tplg_path = {
>>>> +		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
>>>> +	},
>>>> +	.default_fw_filename = {
>>>> +		[SOF_IPC_TYPE_3] = "sof-imx95.ri",
>>>> +	},
>>>> +	.ops = &sof_imx95_ops,
>>>> +};
>>>> +
>>>> +static const struct of_device_id sof_of_imx95_ids[] = {
>>>> +	{ .compatible = "fsl,imx95-cm7-sof", .data = &sof_of_imx95_desc },
>>>> +	{ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, sof_of_imx95_ids);
>>>> +
>>>> +static struct platform_driver snd_sof_of_imx95_driver = {
>>>> +	.probe = sof_of_probe,
>>>> +	.remove = sof_of_remove,
>>>> +	.driver = {
>>>> +		.name = "sof-audio-of-imx95",
>>>> +		.pm = &sof_of_pm,
>>>> +		.of_match_table = sof_of_imx95_ids,
>>>> +	},
>>>> +};
>>>> +module_platform_driver(snd_sof_of_imx95_driver);
>>>> +
>>>> +MODULE_LICENSE("Dual BSD/GPL");
>>>> +MODULE_DESCRIPTION("SOF support for i.MX95 platforms");
>>>> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
>>>> --
>>>> 2.34.1
>>>>

