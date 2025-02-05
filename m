Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6481FDA8A
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781898; cv=none; b=IhTtuuYM9kBrJ9L2coMgp6HllQJvmx94Z3MuVYqUuk+uYg7+dtKnsKOrsBDx3a6IK4WJQhtN5zTNZyNUmJFxV97lItVuMdom0G84pmB+K2MScD7r7XMEL0mFMrIFBdwkZsfMxt44Ssdoi4c/HsQSQegDDxioEKJ1ZI8tqeEiFbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781898; c=relaxed/simple;
	bh=gdy5cd3h4bVtyCWAkwap7NHW9h+FdHvkFYNDHTmIIPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtGRIqY9RW1y/858x0GxEbe2DzYNDTjXRzRWpcB7zZICr4UVpxn9ZLeqAuncXWHtX7B51p8w52Jwhdtw97ysoEAc0NFQadHdDTqvSvKWjs2lDyhJltCnWyLMJ9/gX1pzzMM+k3VnkNEGNL9x4M2qWIZZo6gHQl8BKWVARS4P6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEI0AqCU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEI0AqCU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so18656766b.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738781895; x=1739386695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a71A1t5rNrXw7gtQyGfuALjF7vqK5gL26+h1A6qZoco=;
        b=MEI0AqCUQVVR26zFgbvZ0myYZA+YePe1Cwh0vozwSXnH9aFNvodm2qNPM27uUb8sEm
         fzSIxXiHxQdbpW7fzahEPj4+4xf51+ynW9D5VqmZ+IEwx53GZN9+zEisp095r6VW1Jx6
         FmipEIU/d2C/z3BXTODl9GKCN1Q9XRNa8+hZ0N375K+eMCQxmLWzPNVfMk4UzxMaAwCQ
         Z2/eQqRIS1luJDlL517gWzWnSoMbv4kCGrIATY7PMwGkd+E1BIjUBmf2pVhh+Gh8l8t4
         T6G7aTGpvVdyg2qPvTOKwLMiDbr4ONCNYuxCnoI/VckT0PN30DoobNwk3usNJo0qyqUf
         sduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781895; x=1739386695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a71A1t5rNrXw7gtQyGfuALjF7vqK5gL26+h1A6qZoco=;
        b=jg3Cjvm5H776WhMROFOtuLwOS8CHANyiPxAiYrDflozZwtxIAdTTWGoUh8pjIXyz5U
         Z5GqGUC4xm6ENw2VvbRQdNBcDalZKtu1MUCnrByw/jxconLWCqjHuCMi0x/ZN64lFDIY
         zZ2msHH22IFIglNYM9zCV2WSxcgZ1ZZUVp1F1KPu1pPu2pWUmfDCZPKOa4F4ONmBE/5c
         Wn7aOHG0Vo604uSxHZT6/LJOK9nRWj+hLZPOlaaJIPNiP9epBMhTqRtWKB18jhAyoWbm
         L2Tu+dp47Oo5sORf8TdY2ceyewuIJ4d3pjWcutzzqIBWNWWjNPcOaDKOvHqR0bYmxNye
         pp/w==
X-Forwarded-Encrypted: i=1; AJvYcCUm1rpfSYS03JUCXeXYiDJ5wqhGrFfNvpC31dBRauydKEHvno+UNvOv2H8RCTiU5qri7hI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1seIZQ6pZ7mIzeytwf7Wfxz7DpumFgJJEmmRSuMJgENwCK4jJ
	BJ4W4g1lE62FZ9bCfcWh1ngLxzihQcuZOR/wtT7RNjhWrL4daUdy
X-Gm-Gg: ASbGncshSvERRX/HSn4s4UhzYn9tT7tI/XFugKy3Cv8wv5UzIB4BNwxXCGbKGT8/BDY
	qIYD9VmDSl0XNXE4DZ1xzcb6T5tH9wIbAHOcK7WUHON+rq/kftX7rER3o/kNKMBH7m8/WC606dw
	rxy/YnlAPZc+kl9/7T0N1o1phzsCNw94u2Vbfu7W0XFWfcipwY3nk12C24E4CYQPBt5Nn0MjiN4
	z+IPLBnHb9OxvUiKfyz9lPTxK51vr7P0Vme0MB2VsxVSjJFIHTNu6t6RvFfF0lQOMlg72AZlOgV
	fqqRiiB3IxJyhkXiwQJZ4qeVN4QioyyGzehCeXI+U1lc
X-Google-Smtp-Source: AGHT+IGHOcq2bEGp2OnqU9INvLV5JVgfAV06LBKYqVqWEMm9zU6Sr+3w2aBLE7MIY2wLnbC3eeLt0g==
X-Received: by 2002:a17:906:6a29:b0:ab6:d4ce:5674 with SMTP id a640c23a62f3a-ab76e9dc14amr34325066b.26.1738781894675;
        Wed, 05 Feb 2025 10:58:14 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47ceadfsm1152656466b.51.2025.02.05.10.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 10:58:14 -0800 (PST)
Message-ID: <2226a3d0-37b1-4018-83d1-8f5e9853169b@gmail.com>
Date: Wed, 5 Feb 2025 20:58:12 +0200
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
 <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
 <Z6ONWfIycA0oHEB6@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6ONWfIycA0oHEB6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


(snip)

>>>> +#include <linux/pm_domain.h>
>>>>  #include <sound/sof/xtensa.h>
>>>> +
>>>>  #include "../ops.h"
>>>>
>>>>  #include "imx-common.h"
>>>> @@ -74,5 +79,417 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
>>>>  }
>>>>  EXPORT_SYMBOL(imx8_dump);
>>>>
>>>> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
>>>> +{
>>>> +	unsigned long flags;
>>>> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
>>>> +
>>>> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
>>>> +	snd_sof_ipc_process_reply(sdev, 0);
>>>> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
>>> Are you sure have to use spin_lock?
>> not sure, this definition was taken from previous drivers. I'd say keep it for now
>> as removing it would require some more testing which will take some time.
>>
> Change lock type need seperate patch. analyze is more important then test.
> It is really hard to hit race condition at normal user case.
>
> You can check if any irq handle use ipc_lock? If irq handle already defer
> to thread irq, mutex most likely is enough.
>
> Frank

ACK

>
>> (snip)
>>
>>>> +static int imx_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_power_state = {
>>>> +		.state = target_state,
>>>> +	};
>>>> +
>>>> +	if (!pm_runtime_suspended(sdev->dev)) {
>>>> +		ret = imx_common_suspend(sdev);
>>>> +		if (ret < 0) {
>>>> +			dev_err(sdev->dev, "failed to common suspend: %d\n", ret);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
>>> does pm_runtime_force_suspend()/pm_runtime_force_resume() work?
>> no, these functions are not called directly by the PM core, but rather by the SOF core.
>> Using the proposed functions would result in the SOF core PM functions (i.e: sof_resume/sof_suspend)
>> being called twice in the case of system suspend/resume, which is wrong.
> Does SOC core should check it? I don't reject this change, but check
> run time pm status in suspend often cause some bugs.
>
> Frank

No, IMO this sequence is chip-specific so it shouldn't be handled by the core.
