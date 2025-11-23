Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5B24BBEE
	for <imx@lists.linux.dev>; Sun, 23 Nov 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763930056; cv=none; b=Jfn6l7iNOqn3yycLJ+XWDXMk5Znb8Za7yQg0Qm34K1HQEfhZHwzzKosfl1+iIJUhjDbCy9N/whGVnz0UT2bHdfAAOX9wfO1rRW4z+9GUhjT7KqxUW2zIw7QluaUadW8VkpC0aCH+j5JHG6+9E1SYJNdyQjgkODRPfTQ7J7Ut6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763930056; c=relaxed/simple;
	bh=TaiUhzbyYcG/8FAEyD156B0a9iOAyQAgn4si6rj72tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHMBjoAjqeGht1rqlws4uTInAwr1mhXe6kFvOJIwYIJXcAeD+wCpJn0T4eYCIM+k3Nje1ciutCSaVBpF2XJ7t/pWWGsh/kuZIurujDMiot0YfXrYjPnlXsKvw4uJ3CGmQF5NWatSD9/GD1W8h+9A4KGO0eEG6sTj5IyPABlUwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZVwTZbm; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZVwTZbm"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso2435238a12.3
        for <imx@lists.linux.dev>; Sun, 23 Nov 2025 12:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763930053; x=1764534853; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+fSThLT+HCKSoOJiWs40mRyAwBBxDVJCSCuzNEhZbSE=;
        b=QZVwTZbmovcxAep8SbDykkJkKA5ZIPgJkCzHeTqhy5nixQFVkPGX6xZjLt0qMseETJ
         MfI1R3Ku7Af3UzSl5YZE8RLAH0BEzbNLNZDD8nuNAj82zg9r6+Xuoi1+jCOimGHijwZg
         54E8jDmXnrULEWsEFwV3ZgZUeG4tHSbiLHxd0nSY2g3zrD21EkMRl+WAaS/vVW/3TZOP
         2ksc3GNB0foD6ULOtq/obCz1Zbq3rf4g2xfOB+SPZByc03LlBG2UUH04sYSwEexP7KNH
         qLYb50q3pppfQV5PDPnKrD1BMR/R9AM6Q6IxdCHonfHmMXBgmOPJSwVgI8WUVLEI/yju
         Gfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763930053; x=1764534853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fSThLT+HCKSoOJiWs40mRyAwBBxDVJCSCuzNEhZbSE=;
        b=irAnVMSH15dePOxKQ2JapnzPFdoP17wEKUKcLLhBdqXqvcNc718yb1OMHU6qxYK0BD
         /8Wuoim670ZU1j8cwczS24nfGiewnM6thXncwRz87MRGgFjiufSQ84yYQRvEP5sT6IQZ
         cDRJN+b9CiagWUboxaEM20855jUk3J2a6GqemaJnDpKmPaKFEhj+6wyg8GGKM85Wmf9P
         ASwME+4B8jo8yvl4X4TNx66dAz4ndCpnFRJv0GFxIbBnws0zTT4il6sdsbc1qtrto8RQ
         6cYaLsUs07bWNGoY56dTFpI0AGahn0A3SfjS0Wg75U153JATseCkWo1bSVg84bWJEBeW
         swPg==
X-Forwarded-Encrypted: i=1; AJvYcCUuoH86Hn/VZVV0qBr79OtpqJ5QUn1OzjlxvpUqydzN86fUBv0r1g+hiFa7z0UG0uJ3Bf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRR8dKDwNFJ6p9Gne9Cg3+W9xwgZdOCw9m+/QKee6p0KvFLeel
	11yNv5EefvazFhhMaEowxG31GwMIu5LHFRoKpclRZ91ilbUxHBeBmjer
X-Gm-Gg: ASbGncuVKtGZKD0fVMGE1TjTOP01Dq5bRNUfv1LoCKSWhhxcQhbDG05g9n2jl8aSWe3
	dOQqoGEqbLl6jnWbnYAJFrgVPsIC3mnWRQzvsR09PuRPsQvERCs42dRwIdfxE5aEf5VUtYm8vp5
	jZ8pX/CFx2PRMfPVHXBnkcuHg0sMst8Hz930kRXqJ1/escoW5xC6QYzlcbYF3z783SyJ4rh3Rq5
	ZiyxA+Xmeuc5jQ/9PwJdHOXJK6MiK147SY+oTEMakM9sGufSXkj4xylvpqS9AFsxd/pgAUPEXa+
	jShQbpEVVCzydMhhAO8SXJDRV84d2Cs9W57N1Cy9eGPd8Trsp1stGxBCpohqMPPHer7ASyIEXn2
	p/WMW6Dc918YioBkWTntaoFB2SME5BQ5dwV3lwAQAgdX0sKGr3tFsTDiAUsdDeVJ9LWeMcReSq4
	mRXxSgZ3a/7ne68MKNhQ2uPKcSU9P6r/CpkmJLii64uj48D0eC99oxfsQ8DAY=
X-Google-Smtp-Source: AGHT+IENFg36XExTmHzXNRjVdPqu1iJ06vazccIkuJC7qGzrG4lLe7OGnlxSbQIq5oVJJazmLmViQg==
X-Received: by 2002:a05:7300:b593:b0:2a4:617a:419f with SMTP id 5a478bee46e88-2a7194a9af6mr6582890eec.2.1763930053224;
        Sun, 23 Nov 2025 12:34:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc5e3750sm40707867eec.6.2025.11.23.12.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 12:34:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca42bf49-47a7-40c5-9b39-1651feaa29b9@roeck-us.net>
Date: Sun, 23 Nov 2025 12:34:11 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: handle the nowayout option
To: Oleksandr Suvorov <cryosay@gmail.com>, linux-kernel@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20251123202437.2340955-1-cryosay@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251123202437.2340955-1-cryosay@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/25 12:24, Oleksandr Suvorov wrote:
> The module parameter `nowayout` indicates whether the watchdog should ever
> be allowed to stop, but the driver currently ignores this option.
> 
> Pass the `nowayout` parameter to the watchdog core by setting the
> WDOG_NO_WAY_OUT flag accordingly.
> 
> Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
>   drivers/watchdog/imx7ulp_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0f13a30533574..03479110453ce 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>   	watchdog_stop_on_reboot(wdog);
>   	watchdog_stop_on_unregister(wdog);
>   	watchdog_set_drvdata(wdog, imx7ulp_wdt);
> +	watchdog_set_nowayout(wdog, nowayout);
>   
>   	imx7ulp_wdt->hw = of_device_get_match_data(dev);
>   	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);

