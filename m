Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4528283CBF
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662898; cv=none; b=omwucLyNRFgygN6GCoqlo5a7RnDbUGfhrGAY7CGtZYf4zkVkyahnwLs4C+pfFwM3Gyh/QRF/H8OApIByIg5gVpPGfsrgYNDVbzU3+OZ81nSLeOa1DUBiiv1ZC8oRMhWheV8x9yCO9VPvh91R2SlDFhqDrTD51s8dQg/2cyEacQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662898; c=relaxed/simple;
	bh=LDYlkq0NYoqpc06SO7oPF5wAWr+JswoEt0WOCbaHpnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcYDfAXJDZD5UUc85xOlmrjlr2GELBYotno8H8Na05XKpMAm31zDRpzV5SNaccj+twtIEXhyQhyQ5PtEtIA4Qc6IPy2V4bcPN9Vvdv12jl6Oq/gK7C28VxPn86Jal8iQiFjtjj/fbGx68cCHbG4kcbn/VVKai9Va2dhyWsMajC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXbt8hJl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXbt8hJl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b7c2788dso2758822f8f.1
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773662895; x=1774267695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w7vqutMSmgVpn3ThO5Er3aw2eL/y6hhRcsFUaNNpPFA=;
        b=iXbt8hJlW57QbSIm5ImAIQGB9UtESUe3+SGK6AKb11g+ZLHcbXLL39PNY1rbb4MhT/
         6voLPzotGnXHWIMA3yENFJdt99ccA6V1hi6CS3PuHpX2qR38OV7INWyg/3FSCaEDM69g
         NwboSy2yPbMwnckx9loyCKrNpFJQ2hMlB/4rsSCQyeKYba8r6BCLjkW6BdDMNObkPNap
         9g8uQaFRZchvM7c9intCIZt4Ccle5NYC6Xh5TWgAbzb+0gwlokSsKNmW25xbGTFbncHC
         b83ah7lTYIMRsuUuzxgeih6vU4Mg4Q4AWNY4cTpL6HdPzNAcIIq650AXQex6jFpyCrjX
         lqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662895; x=1774267695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7vqutMSmgVpn3ThO5Er3aw2eL/y6hhRcsFUaNNpPFA=;
        b=ewMJOJsI/iLcl8V/clXq9yAvcvc8ovUJ5aHXSFucv0CrozZ8cI3n3PDV4IxQGP2LTB
         KOpibXvkcPuNRa/FNDIq1byNmtfjK/kWqKmKfE/BAOffdJQEhBwjsM6hfIgSNcdY80pv
         hqr0TEj0nV0L+q5TfmzOeegoW5ypsqdkgU2M5e+bovd3XDZ2aioMmgwAHOseUl+d9IZl
         OdN+RJc1O7c2aiV0tFbent6ZdcOdl/f3pXXqxz18lJzG9h7EmHTGtthz9uRfT2PAr/my
         JuynVIi6YrlEKdeleOivZHOssRx3Co03woNqMt0OTRuxHv6bQVU3fzelV9wv/C8bB8Le
         PfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWbPPuCBp5aSdOvovWqWKZu0/lSMm+KhZC4UWRGTOZZVKCKQZd2DsvwqbWO7S9qBWEbg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2b7+Q13m3qXYVidz1mJ5m/sri79MTldcp5dt0T7tMr1P7a1LU
	wgNyxJ7b6qprq2cMXm+Db7r+BMirKHseak3iuaF05jtS3FNPPLj+9X7OANtFXuGWOrk=
X-Gm-Gg: ATEYQzxIw4q6Xjkg0R8Rt0vreNyPKRwgeNL+q3voXEpHQAjRpid7uXLQsvZMmVQ6Zv4
	7hQf+a9WVVxk9FOpdHfKQRTFwFP+nAaR8DEx0gVL2/brX8Ip4ZwDBlklbo4XCQwZ/GjA1RAZvnw
	ndZ8LUVc4+f2ZCwiDy2rwthZrLXRzUOaFNOy/bUBzFH2QEV9rXN+OnH7ymZNeb1apdK9Vf0ifOV
	ltW3ab32Y5s3ScQBcb761T7/ZOTlS3h93Fei+taZuWKxeFX1A+MiBSlhlRP8f4TNkAgMiFbmCot
	yCE7XEn5vq+HjPe935/arqDMX7hbWY5vSwrG/g7FUgYcUdg1Q9+Z11/0R5BAAqEWoXgLCV2zwnN
	HzdYhkww733XOc2DjEyKmeVtDpZthbRbTPCmsjyGP6D0fYXK59yXB8coffu9r1QZmRxTMv3BZ1a
	azSahheW2hw10ly1/ymoTHCo+W5VqDhatySScNUuk=
X-Received: by 2002:a05:600c:8489:b0:485:4552:8fbb with SMTP id 5b1f17b1804b1-485566fab29mr209712525e9.22.1773662894964;
        Mon, 16 Mar 2026 05:08:14 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e67ea40sm362357355e9.7.2026.03.16.05.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:08:14 -0700 (PDT)
Message-ID: <2b1eecef-9da4-45a7-9401-425715de4624@linaro.org>
Date: Mon, 16 Mar 2026 12:08:13 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH spi-next 11/11] spi: spi-fsl-lpspi:
 fsl_lpspi_set_bitrate(): don't treat devtype_data->prescale_max == 0 as a
 special case
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>
References: <20260316-spi-fsl-lpspi-cleanups-v1-0-1b695607702d@pengutronix.de>
 <20260316-spi-fsl-lpspi-cleanups-v1-11-1b695607702d@pengutronix.de>
 <dbdd4655-1c6a-42b0-a6fe-8d14db1043f0@linaro.org>
 <20260316-statuesque-effective-silkworm-011ed8-mkl@pengutronix.de>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260316-statuesque-effective-silkworm-011ed8-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/03/2026 11:19 am, Marc Kleine-Budde wrote:
> Hello James,
> 
> I've no strong feelings about this patch, I can drop it in the v2.
> 
> On 16.03.2026 09:57:15, James Clark wrote:
>> On 16/03/2026 8:39 am, Marc Kleine-Budde wrote:
>>> The i.MX93 is affected by erratum ERR051608, the maximum prescaler value is
>>> 1 not 7 as in the original datasheet.
>>>
>>> On unaffected SoC the maximum prescaler is 7. Commit 783bf5d09f86 ("spi:
>>> spi-fsl-lpspi: limit PRESCALE bit in TCR register") added struct
>>> fsl_lpspi_devtype_data to hold the system dependent prescale_max value.
>>>
>>> Commit 9bbfb1ec959c ("spi: spi-fsl-lpspi: Treat prescale_max == 0 as no
>>> erratum") introduced the special value 0 to signal the default and
>>> corresponding run-time check with a conditional operator.
>>>
>>> To simplify the code, set the prescale_max of imx7ulp_lpspi_devtype_data
>>
>> The whole point of the original change was to not repeat the normal value
>> for every device in the config just because one device has an errata. This
>> new change is exactly the opposite of simplification IMO.
> 
> Interesting point of view.
> 
> My reasoning is: When I look at the fsl_lpspi_set_bitrate() function,
> there's the special case handling with the ternary for the "0".
> 
> I asked myself directly special case, why? Why not directly use the
> value as it's provided by the devtype_data?
> 

Those structs are configuration for different devices though. Having a 7 
in there implies that it's something that is configurable to different 
values. When I was adding a new device that made be crawl through a load 
of datasheets to see why arbitrary values were needed only to find out 
that it's only for one errata where it's 1 and actually every other 
device should be 7.

I tried to change it to a bool "has the errata" or "doesn't have it", as 
that's the extent of the valid configurations that should be exposed. 
But Frank said he preferred a number with 0 as the default. That seemed 
like a slight improvement to me so that's how it ended up like that.

>>> and s32g_lpspi_devtype_data to 7 and in fsl_lpspi_set_bitrate() directly
>>> use the fsl_lpspi->devtype_data->prescale_max.
>>>
>>> On ARM64 this leads to a reduction of the code of 52 bytes:
>>>
>>> | add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-52 (-52)
>>> | Function                                     old     new   delta
>>> | fsl_lpspi_setup_transfer.isra                956     936     -20
>>> | $x                                          7144    7112     -32
> 
>> On clang 15 this change makes it bigger by 220 bytes rather than
>> smaller.
> 
> Quite interesting, with llvm-21 the size increases, too:
> 
> | add/remove: 0/0 grow/shrink: 3/1 up/down: 432/-32 (400)
> | Function                                     old     new   delta
> | fsl_lpspi_setup_transfer                    1072    1216    +144
> | .Ltmp1                                      7116    7260    +144
> | $x                                          7196    7340    +144
> | $d                                          5659    5627     -32
> | Total: Before=28126, After=28526, chg +1.42%
> 
>> I
>> checked because I was suspicious that removing a single ternary could save
>> 52 bytes, but it looks like the outcome after all the optimisations is just
>> unpredictable so there isn't much point in making changes like this.
>>
>> You also didn't say _why_ we need to save 50 bytes, or what the performance
>> impact is.
> 
> I just checked the impact on the code size with gcc and was positively
> surprised. :) I don't need to save 50 bytes and there's probably no
> measurable performance impact.
> 
> regards,
> Marc
> 

