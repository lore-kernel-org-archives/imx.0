Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029016C680
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724073702; cv=none; b=WOcs0rsffuMsj2OIPb2A3qhrMTK/8T9bpFsiMK77JI0QTV1GlC4CesY+iW2WBk3S0nuaP9/Ra6mCw0IRQuLqB7b2PORVim6cmapvmMApyTE1Z398nI49Ph53YpM6AYMIVqrAYaq0C52SKf+Ojcm0i62mXbPPYCRwQipYw4jNMRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724073702; c=relaxed/simple;
	bh=j0Iwlg5j4dadwelZ87XP4p9m3m2RHVP7vOYFCf9iK3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pERTlX0gGbVkjo4UeGegiwjx2VjQuSvURGQ21gGCbAdCbQQBzEPKV9ZwginLUCg+NRzbj1jwwlBjRgi2pIfUGgCWQc3MrHeEisGCsq5w2c31b1g69si43HWGIG9DkxCYyx7jGNZgoNvIdY2ud+BL09eTpEP85pl8kf4RriCfRaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqFV2Xzc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqFV2Xzc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso36268085e9.1
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724073698; x=1724678498; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8W0rWQ9WRd8jkw4uMXP1Owfz1hG5dsk4pMOhNyblTc=;
        b=QqFV2XzcU3VSrgAEOMossB0nA3dAJHuSGKVorN6t9JR6fL5YCdL1mRe4tph7UeeM4H
         TsHbIbqY8yPfoJMt0OsAOwnnts9nc1lnPuQBQT7dfbSMwBbmKgvEGwsSbdJLzev/UVlg
         33S/13PQ/yZ60x4QS+l71fwbJ7jFqzQCWknsSR7z0JOnSYk3rh0YvWKxeFXFagl8HuyJ
         Gi0ZqiFuFNvZW6W9zW8ZXzx+PrkXhEvrwJFbFqZgJx71pWTdIW2nZWMssOpFQHK+ztZG
         WTBA0wqstuwYY52v1CmMDA7XlUN427NIQ6dG3rXsx1Xco6UTH5dzTPCmtqiHeyhSoZFP
         bwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724073698; x=1724678498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8W0rWQ9WRd8jkw4uMXP1Owfz1hG5dsk4pMOhNyblTc=;
        b=nRbM8Mdn5VOrB3Bxtzuv5LzQRoZ8k+4vVA86VYm7l+h8d1UJ/x6f6uAGEKIUaFW47W
         SO0Nud0dlilR+vKaq9lV0fp+dMSLXBfKVaMwt/9k5WxkT6QsjG2EJ1apaOHdPXR2kYK6
         RLX2WChLsiHix96qswmUVVPvKbPD8tU7VqdAIK07Af/SUQDI2zoDpELTDEPhreGLE8mF
         7rWnqNK1/vsrv+1Tjue4i27sup6JZhHEoYyB8nKO39qChvWzVg8RvCghN1tv1LNQdVb0
         kE4l380T9WO/YumJQTWfdKXkA5qL7mRRQw2cSaj4Tpwlsd6h0dcAnjUHj1Y0B/NyNkg0
         N/+w==
X-Forwarded-Encrypted: i=1; AJvYcCXREujNwktLGqTrvwlnc5W+GQmXup9C1CrRbsPgew07C+a+W0tB+0nPF9PGZoB+/mX51TEAGCXHtrAlB/nWW0Rsx7yy
X-Gm-Message-State: AOJu0Ywv9VGUYeJjhHZEtpT88pn4RZVqMjBptZz/kM66NQ03Td/DwATS
	XHyu7tLnfSnX2ogDTCFPmY69x+0uh6ynk4wGTSxHFbP2g9XGVopwxmGHEC893+g=
X-Google-Smtp-Source: AGHT+IG1Ebty4eoa3hakMU7RnYW00yXWrugH5vrGNipfdhauCeQQwc6vY+Y5/aPSe/glQvDuDFNt8g==
X-Received: by 2002:a05:600c:4707:b0:426:5cee:4abc with SMTP id 5b1f17b1804b1-42aa82492b1mr58241405e9.20.1724073697922;
        Mon, 19 Aug 2024 06:21:37 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37189839f9dsm10601679f8f.20.2024.08.19.06.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 06:21:37 -0700 (PDT)
Message-ID: <b88b6200-b92a-4cf3-946a-3c38cff886ec@linaro.org>
Date: Mon, 19 Aug 2024 15:21:36 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clocksource: imx-tpm: fix return -ETIME when delta
 exceeds INT_MAX
To: Frank Li <Frank.Li@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20240725193355.1436005-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240725193355.1436005-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/07/2024 21:33, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> In tpm_set_next_event(delta), return -ETIME by wrong cast to int when delta
> is larger than INT_MAX.

Is it something you observed or from your understanding of the code ?

> For example:
> 
> tpm_set_next_event(delta = 0xffff_fffe)
> {
>          ...
>          next = tpm_read_counter(); // assume next is 0x10
>          next += delta; // next will 0xffff_fffe + 0x10 = 0x1_0000_000e
>          now = tpm_read_counter();  // now is 0x10
>          ...
> 
>          return (int)(next - now) <= 0 ? -ETIME : 0;
>                       ^^^^^^^^^^
>                       0x1_0000_000e - 0x10 = 0xffff_fffe, which is -2 when
>                       cast to int. So return -ETIME.
> }
> 
> To fix this, introduce a 'prev' variable and check if 'now - prev' is
> larger than delta.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 059ab7b82eec ("clocksource/drivers/imx-tpm: Add imx tpm timer support")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Reviewed-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/clocksource/timer-imx-tpm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
> index bd64a8a8427f3..cd23caf1e5999 100644
> --- a/drivers/clocksource/timer-imx-tpm.c
> +++ b/drivers/clocksource/timer-imx-tpm.c
> @@ -83,10 +83,10 @@ static u64 notrace tpm_read_sched_clock(void)
>   static int tpm_set_next_event(unsigned long delta,
>   				struct clock_event_device *evt)
>   {
> -	unsigned long next, now;
> +	unsigned long next, prev, now;
>   
> -	next = tpm_read_counter();
> -	next += delta;
> +	prev = tpm_read_counter();
> +	next = prev + delta;
>   	writel(next, timer_base + TPM_C0V);
>   	now = tpm_read_counter();
>   
> @@ -96,7 +96,7 @@ static int tpm_set_next_event(unsigned long delta,
>   	 * of writing CNT registers which may cause the min_delta event got
>   	 * missed, so we need add a ETIME check here in case it happened.
>   	 */
> -	return (int)(next - now) <= 0 ? -ETIME : 0;
> +	return (now - prev) >= delta ? -ETIME : 0;
>   }
>   
>   static int tpm_set_state_oneshot(struct clock_event_device *evt)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
