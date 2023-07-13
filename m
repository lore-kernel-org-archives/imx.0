Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4320F9E3
	for <imx@lists.linux.dev>; Thu, 13 Jul 2023 12:49:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31441bc0092so804183f8f.1
        for <imx@lists.linux.dev>; Thu, 13 Jul 2023 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689252596; x=1691844596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlKO0SkCIkcJEbFS4rnnF3znx3GAgy31FTGppc3TLOQ=;
        b=qHyTuFc2CS8qK1Z+yLbMDWJk47SUNkFJUdjIJesgBy5wDzVqVAHjBxIkpFCVwhc/Pj
         mahAfx+GhF00qgnTtNfqsfrlMIvfbFX84moj5lm6bcR5vwD0E9v07DzmWqivGum3UVXg
         Lq5kHHXSVZt57DhTLLzWZv4cFgKHbCHz7vdutnjanTphoHG9wpCi34itEWMxQ3a1oP/z
         BdXheNgdlmGQmCjaT+ewfOvX80vnnp+AweCa4ZeNMRBK1eQfWNeSMBQcwz5sf77xSQlV
         ll3fxA0Ve9suiy/5k4FrSw53JeqIsxdAi2dyvkP4N2SxEJU+qGbARRQH0Pe1yx00KFOq
         FeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252596; x=1691844596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlKO0SkCIkcJEbFS4rnnF3znx3GAgy31FTGppc3TLOQ=;
        b=a9u2a9t0m1VGED22WXXwRZVFbcmi4BJcEga3TW4pnG3D7utQuc32D/96BUfT0Rrdj1
         nQyNY1RDUJtEn/ZCnYypbiBGqa6QRQ4XY6JChhbKxpg3yqHcVFafkMTcR/V8mXiu3eFc
         7cgYGw82uBAhxiyXeukFba6OxY2mIuLrMwGP/X76yipwoUuItOxj3lwpREgbcWQeRXji
         eJ/PcMcdauU7V4g3B3fuo87zN0ZibLCXNe3NM1zIY+M3NzOYjOiZ209mbzgIqH9K3W8a
         lkWCTKOg/J4ImIkqwKjZfUM/U7iXBDroV/e2z0pYKV5VxrzBxARAvQva/jrXx3gnVVvQ
         m0kg==
X-Gm-Message-State: ABy/qLYXr+P1K6uImsBwef9L2IJ/qWYJmYpsilYpzwEFZLPyqBoPQgLS
	zk7zmwpAKqNcz4TyqyZgXlmVxg==
X-Google-Smtp-Source: APBJJlEZx0FfmTK4X0qxghvM7QrHXfKRrD0+SjmR/ECt5xZdi3FfvkbPU+pWO9gWdk9n2vdXdbJIwg==
X-Received: by 2002:a5d:5962:0:b0:314:31d5:2c3d with SMTP id e34-20020a5d5962000000b0031431d52c3dmr1477988wri.39.1689252595749;
        Thu, 13 Jul 2023 05:49:55 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g12-20020a5d46cc000000b0031455482d1fsm7916964wrs.47.2023.07.13.05.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:49:55 -0700 (PDT)
Message-ID: <f1d4ed62-8d01-173f-6e41-4671228782fd@linaro.org>
Date: Thu, 13 Jul 2023 14:49:54 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/1] thermal/drivers/imx_sc_thermal: return -EAGAIN when
 SCFW turn off resource
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20230712210505.1536416-1-Frank.Li@nxp.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230712210505.1536416-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/07/2023 23:05, Frank Li wrote:
> Avoid endless print following message when SCFW turns off resource.
>   [ 1818.342337] thermal thermal_zone0: failed to read out thermal zone (-1)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/thermal/imx_sc_thermal.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/imx_sc_thermal.c b/drivers/thermal/imx_sc_thermal.c
> index 8d6b4ef23746..0533d58f199f 100644
> --- a/drivers/thermal/imx_sc_thermal.c
> +++ b/drivers/thermal/imx_sc_thermal.c
> @@ -58,7 +58,9 @@ static int imx_sc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>   	hdr->size = 2;
>   
>   	ret = imx_scu_call_rpc(thermal_ipc_handle, &msg, true);
> -	if (ret)
> +	if (ret == -EPERM) /* NO POWER */
> +		return -EAGAIN;

Isn't there a chain call somewhere when the resource is turned off, so 
the thermal zone can be disabled?

> +	else if (ret)
>   		return ret;
>   
>   	*temp = msg.data.resp.celsius * 1000 + msg.data.resp.tenths * 100;

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

