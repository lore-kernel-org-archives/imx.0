Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD528399
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688398; cv=none; b=A4fS0cl1m50QX0tvzFR/lhIGZ60vgn4KMgBOAPJ6vIZNO1Mr8mwbHxoKXGF7jxNYFVVAbppLDs+cstAKZe+3MTvLaVQl0GMg/F4NP4CwtKJ1nznShHnSf72WlQzK6PgHmPGdxMvIJ9JwjjlipbQbU/ch/DOXxk2k9NhWtTgrttE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688398; c=relaxed/simple;
	bh=Y/5urKYTOqio95K43gXG//DRCZ8nL0Q2b5ihww3tbCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/Wfyqt159/9dsx6yO0OzaU6YnzU12cQyZXNpyOtS72DnT04fLjlzNk2WmfCeuU0f3esyM1vFMQIcOIdk+hUJvh8I7pnPW6VsIsbAyEkfGg+pOdCuQ7c0Ra8eLhgnDTVrDuXI4oAfUkHmXqP5kdsOC/5K12f8kRipfTlmdfo0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDQuDtKA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDQuDtKA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so11091559a12.3
        for <imx@lists.linux.dev>; Tue, 04 Feb 2025 08:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738688395; x=1739293195; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzjTE8nlX2eQ23U0E4E07xc2+cNl0OsyuVXGm4FKols=;
        b=JDQuDtKA9vIlCW+bFp3Bfilx9WzpHTssiCtEnuMwKQQ/lX5EHbFC+u1SeYrcMzdV0g
         7Ho+O8hPAfiRpND7M1FVfsF2ohTe+4gKLFlThe3qKnTPKqrjdetLGbYQaJkzTfqH7XBw
         tdSeeEE+zWfqb34T5D1uZUSGc3EAo4+uMgwM4NtLscIrJz50N95JUMGvm0h9jnoBYE+2
         HnLkV9JtqZ1iXNiugDXDqrJRvqLuafGlmoWFvGNDmqiH3SsDP1C/Q/dqR3IAz/Pm2hzv
         Zs2csyVqj1pxTW5qDUxJ2wvku6gbMbRbgvFijfaxpKiLlvRYt+Yd202RpQGPN0wHew3s
         gnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688395; x=1739293195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzjTE8nlX2eQ23U0E4E07xc2+cNl0OsyuVXGm4FKols=;
        b=q88LUPgw8w/zcX/MjF8vxtZVJ3ohI4SJhAKwAF8RZg/2ZYhoMAUFZfuDQ1Fpp4E2nz
         dxl4YKeCLUOkincq8gYlb8EGbXBy9Kew+pKROXkW1eWbfDkcvJjpW9VKochgeAK/JA1z
         rYogZp3JgNOeFKsmGKsDRXrTssJwVpmpxPd2J10+XmhyfTOgfFwzyV5ayGRmqZY+lCnq
         luCjAq3SkPv8QUwX6rfaYpknDVuMl4tXcf3LA6hpy4ZqRKBcmfh8DLGXpd9QIc/4XL3d
         EH8K+bwbGRrMdGDeN190HTc3t0vehiE9XayMbN7GoGv3CaNLMdjnOpd22xUAFqWSxXJv
         zIMw==
X-Forwarded-Encrypted: i=1; AJvYcCVZK7q+PIqSTJEap82hqMPeWM8meOyvGft1KxPFQIJUiV5VCkLkuh9wsShpm6J87/d2a1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YylOdP8vinCfvMpTvjmm518sHckTtV9bLhpxGUpZCglYxto9er2
	iMpi2LmCyF8KsXVjjWvjzu/zhosXeldrc0IvA/OrZrrdqYCAEfR/
X-Gm-Gg: ASbGncvPm1Ussjg/YwNsUlvv2us9/tmWxWgnuRyBNdVtiw8O+9cW833K0W40SlWrTD5
	u+52jyfjnSyZvBrAw9T8DBnVi2JB+X0P6HCTVEJI+Tb1Yhzo5LJ8nydETZHHPTbdA/RWDEZtPTm
	3Q/7+lG2Zch17WJ6D8tKgkDix/mht1PMkVg66W/2Py2jws79uUDNRkC7jZpq5mVzxOm4dv2tCup
	T0eOazU8D9TISg68FvJCgK1Fhy7SBwIe8yrS+804WGa9R/xX9gMaLNKf9VQIDOyWJmVfkitlv8g
	3uU9Bp+/nLj8iH67xfasacg5yg/MVHdaEXrPVItt8NVm
X-Google-Smtp-Source: AGHT+IH8Iy3ZyolfBbUXrqtUTyMhcXI60TOMHqsPkLuWLQaMDjNuMKX8AmdvK66jYCyYDSgiDm2fDg==
X-Received: by 2002:a17:907:7251:b0:ab6:df79:f577 with SMTP id a640c23a62f3a-ab6df79f65cmr2771692166b.9.1738688394934;
        Tue, 04 Feb 2025 08:59:54 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff269sm947030866b.118.2025.02.04.08.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 08:59:54 -0800 (PST)
Message-ID: <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
Date: Tue, 4 Feb 2025 18:59:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] ASoC: SOF: imx: introduce more common structures and
 functions
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-2-laurentiumihalcea111@gmail.com>
 <Z6EeZ4lgKVHCee3e@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6EeZ4lgKVHCee3e@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 2/3/2025 9:52 PM, Frank Li wrote:
> On Mon, Feb 03, 2025 at 12:18:00PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The SOF drivers for imx chips have a lot of duplicate code
>> and routines/code snippets that could certainly be reused
>> among drivers.
>>
>> As such, introduce a new set of structures and functions
>> that will help eliminate the redundancy and code size of
>> the drivers.
> please wrap at 75 chars

sure, fix in v2


>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> ---
>>  sound/soc/sof/imx/imx-common.c | 419 ++++++++++++++++++++++++++++++++-
>>  sound/soc/sof/imx/imx-common.h | 149 ++++++++++++
>>  2 files changed, 567 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
>> index fce6d9cf6a6b..5921900335c8 100644
>> --- a/sound/soc/sof/imx/imx-common.c
>> +++ b/sound/soc/sof/imx/imx-common.c
>> @@ -1,11 +1,16 @@
>>  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>>  //
>> -// Copyright 2020 NXP
>> +// Copyright 2020-2025 NXP
>>  //
>>  // Common helpers for the audio DSP on i.MX8
>>
>> +#include <linux/firmware/imx/dsp.h>
>>  #include <linux/module.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/of_address.h>
> keep alphabet order

ok

>
>> +#include <linux/pm_domain.h>
>>  #include <sound/sof/xtensa.h>
>> +
>>  #include "../ops.h"
>>
>>  #include "imx-common.h"
>> @@ -74,5 +79,417 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
>>  }
>>  EXPORT_SYMBOL(imx8_dump);
>>
>> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
>> +{
>> +	unsigned long flags;
>> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
>> +
>> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
>> +	snd_sof_ipc_process_reply(sdev, 0);
>> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
> Are you sure have to use spin_lock?

not sure, this definition was taken from previous drivers. I'd say keep it for now
as removing it would require some more testing which will take some time.

(snip)

>> +static int imx_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
>> +{
>> +	int ret;
>> +	const struct sof_dsp_power_state target_power_state = {
>> +		.state = target_state,
>> +	};
>> +
>> +	if (!pm_runtime_suspended(sdev->dev)) {
>> +		ret = imx_common_suspend(sdev);
>> +		if (ret < 0) {
>> +			dev_err(sdev->dev, "failed to common suspend: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
> does pm_runtime_force_suspend()/pm_runtime_force_resume() work?

no, these functions are not called directly by the PM core, but rather by the SOF core.
Using the proposed functions would result in the SOF core PM functions (i.e: sof_resume/sof_suspend)
being called twice in the case of system suspend/resume, which is wrong.

(snip)

>> +
>> +static int imx_probe(struct snd_sof_dev *sdev)
>> +{
>> +	int ret;
>> +	struct platform_device *pdev;
>> +	struct imx_common_data *common;
>> +	struct dev_pm_domain_attach_data domain_data = {
>> +		.pd_names = NULL, /* no filtering */
>> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
>> +	};
> try keep reverse Christmas tree.

sure, fix in V2

>
>> +
>> +	pdev = to_platform_device(sdev->dev);
>> +
>> +	common = devm_kzalloc(sdev->dev, sizeof(*common), GFP_KERNEL);
>> +	if (!common)
>> +		return dev_err_probe(sdev->dev, -ENOMEM,
>> +				     "failed to allocate common data\n");
>> +
>> +	common->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
>> +							PLATFORM_DEVID_NONE,
>> +							pdev, sizeof(*pdev));
>> +	if (IS_ERR(common->ipc_dev))
>> +		return dev_err_probe(sdev->dev, PTR_ERR(common->ipc_dev),
>> +				     "failed to create IPC device\n");
>> +
>> +	/* let the devres API take care of unregistering this platform
>> +	 * driver when no longer required.
>> +	 */
> I remember only network subsystem use this type comments style.

will fix in V2

>
>> +	ret = devm_add_action_or_reset(sdev->dev,
>> +				       imx_unregister_action,
>> +				       common->ipc_dev);
>> +	if (ret)
>> +		return dev_err_probe(sdev->dev, ret, "failed to add devm action\n");
>> +
>> +	common->ipc_handle = dev_get_drvdata(&common->ipc_dev->dev);
>> +	if (!common->ipc_handle)
>> +		return dev_err_probe(sdev->dev, -EPROBE_DEFER,
>> +				     "failed to fetch IPC handle\n");
>> +
>> +	ret = imx_parse_ioremap_memory(sdev);
>> +	if (ret < 0)
>> +		return dev_err_probe(sdev->dev, ret,
>> +				     "failed to parse/ioremap memory regions\n");
>> +
>> +	if (get_chip_info(sdev)->has_dma_reserved) {
>> +		ret = of_reserved_mem_device_init_by_name(sdev->dev,
>> +							  pdev->dev.of_node,
>> +							  "dma");
> do you need put "of_reserved_mem_device_release()" at imx_unregister_action?
>
> The below error path will miss call of_reserved_mem_device_release().

good catch, thx. Fix in V2.

