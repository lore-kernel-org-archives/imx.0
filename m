Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E1E20E7
	for <imx@lists.linux.dev>; Wed, 16 Aug 2023 16:47:21 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c7so52872435e9.3
        for <imx@lists.linux.dev>; Wed, 16 Aug 2023 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692204440; x=1692809240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIgfPcw6KHE/6Lks+8MKncmnza5GWQiyx8PwVZfiLPw=;
        b=HTw07EB02yhDkYIQ2znQmgVG8F3+mlcwv7MOysQ+lkW72z9saYCC0IOXeH0+Z8gyeX
         It2rxQ+/FlbnKORdgYkGxCEaG0ne/sh35OQvL9Pz0FdPMtWNM9dRKISiAGwYVYh/JdZ0
         rq+YAT8TjgCRAGZXBRQs0lezRwn0NcfplWQy+ZsyJuRom5f7mdnMEMl1xIbyql0lrX92
         meceXA+rktDCVQ21n+U4naZks81bG2+/5sy/egOYlTfN1FZ+AfbYFWVQjUEAgNCIJIRs
         bF4+SdcU/YcSaYHF/O2yMpt1f89c0zBJLEUvi0Sy0oqBLAUPXrAe1CvQ8GZkGA9irUwO
         0WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204440; x=1692809240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIgfPcw6KHE/6Lks+8MKncmnza5GWQiyx8PwVZfiLPw=;
        b=hPidaL0x+XeHZ7Lzlz5Vz8FV2hZTqjydm9fDqHnBkImi+oxgFT0wtPyLg4KoUmRCrs
         DQqe0H1fOTn/KaPmKp96OmSO68KRWKQKcr5Ps96dERb+7wMDtIaEPCJmVyb+7SOvG861
         zw2FwyHDgmUS7w8ETsX7NWME9ksQECYSYJsM/ux86r70e8+PKCPzU8qGSxBtH/aSUBLs
         hwV1Jbu0xTSIAI636JeXHZl8jZKPWJwOm3jHT941nn3ikVUpiUHJX99CZt+zmsip+R5G
         0N2h/EdNvVHznzGx+GssxeEZ7W7IQ/ytpmvMTpxb9O839nmhPZ3DjNQQTM+NymCXv/cI
         tp2Q==
X-Gm-Message-State: AOJu0YxiuN+ApYqqmgNOe8UhpIjGOcHRKaNBndPIbGx9geYNbmqEfq6N
	Nl0t1ORTrz79vCtYu5jbROnzxQ==
X-Google-Smtp-Source: AGHT+IHp/NtTEGvzmgnaWFMxBMwVsk9Up5EfppAokIXJhW2LdXhWeV1KI79Vmlxvo3BpMi3b9fzPFw==
X-Received: by 2002:a7b:c851:0:b0:3fa:964e:e85 with SMTP id c17-20020a7bc851000000b003fa964e0e85mr1920508wml.5.1692204439475;
        Wed, 16 Aug 2023 09:47:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e11-20020adffc4b000000b00314427091a2sm21833584wrs.98.2023.08.16.09.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:47:18 -0700 (PDT)
Message-ID: <dd42952c-4dea-ea57-7ad2-73fa159d265d@linaro.org>
Date: Wed, 16 Aug 2023 18:47:17 +0200
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
To: Frank Li <Frank.li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20230712210505.1536416-1-Frank.Li@nxp.com>
 <f1d4ed62-8d01-173f-6e41-4671228782fd@linaro.org>
 <ZLGDhOffQwh7xW/n@lizhi-Precision-Tower-5810>
 <7eacc4da-ab14-3df5-2864-44a7262bac27@linaro.org>
 <ZNz5Drb+EVLjWxRV@lizhi-Precision-Tower-5810>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ZNz5Drb+EVLjWxRV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/08/2023 18:28, Frank Li wrote:
> On Wed, Aug 16, 2023 at 10:44:32AM +0200, Daniel Lezcano wrote:
>>
>> Hi Frank,
>>
>> sorry for the delay
>>
>> On 14/07/2023 19:19, Frank Li wrote:
>>> On Thu, Jul 13, 2023 at 02:49:54PM +0200, Daniel Lezcano wrote:
>>>> On 12/07/2023 23:05, Frank Li wrote:
>>>>> Avoid endless print following message when SCFW turns off resource.
>>>>>     [ 1818.342337] thermal thermal_zone0: failed to read out thermal zone (-1)
>>>>>
>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>> ---
>>>>>     drivers/thermal/imx_sc_thermal.c | 4 +++-
>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/thermal/imx_sc_thermal.c b/drivers/thermal/imx_sc_thermal.c
>>>>> index 8d6b4ef23746..0533d58f199f 100644
>>>>> --- a/drivers/thermal/imx_sc_thermal.c
>>>>> +++ b/drivers/thermal/imx_sc_thermal.c
>>>>> @@ -58,7 +58,9 @@ static int imx_sc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>>>>>     	hdr->size = 2;
>>>>>     	ret = imx_scu_call_rpc(thermal_ipc_handle, &msg, true);
>>>>> -	if (ret)
>>>>> +	if (ret == -EPERM) /* NO POWER */
>>>>> +		return -EAGAIN;
>>>>
>>>> Isn't there a chain call somewhere when the resource is turned off, so the
>>>> thermal zone can be disabled?
>>>
>>> A possible place in drivers/firmware/imx/scu-pd.c. but I am not sure how to
>>> get thermal devices. I just found a API thermal_zone_get_zone_by_name(). I
>>> am not sure if it is good to depend on "name", which add coupling between
>>> two drivers and if there are external thermal devices(such as) has the
>>> same name, it will wrong turn off.
>>
>> Correct
>>
>>> If add power domain notification in thermal driver, I am not how to get
>>> other devices's pd in thermal driver.
>>>
>>> Any example I can refer?
>>>
>>> Or this is simple enough solution.
>>
>> The solution works for removing the error message but it does not solve the
>> root cause of the issue. The thermal zone keeps monitoring while the sensor
>> is down.
>>
>> So the question is why the sensor is shut down if it is in use?
> 
> Do you know if there are any code I reference? I supposed it is quite common.

Sorry, I don't get your comment

What I meant is why is the sensor turned off if it is in use ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

