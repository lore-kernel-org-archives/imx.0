Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16F370
	for <imx@lists.linux.dev>; Sun, 27 Oct 2024 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730036223; cv=none; b=V8cUH/7OPflmyZHsexRMTztfEVPr1jHQIW0iEGSE97MrMku9ZJmnaRZTUUkbhszTx+R6hIIzp8pXsCm0c/TNkxNWU7yjNjOiXEh77xNqzimpoi1RT+EsKRRzmvrt9yHpad84YE2J2knueZDmW0SzGppnXKxSNnB9IvXtiA1Whs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730036223; c=relaxed/simple;
	bh=7unY45pHjGhAhrO+MSrxgEW3pkCXBkPU4DbbsDWuFSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpzgIog0QMwO/3nwTzixkyrXmNyTLVOotu9RiO4lGi6cFNXXVSdTX13f723XGEb0fYb5Dx8KV0K0kfMJIv75KMQSA9trDJJt36Xc6z2rt/vkR32YJuUNYuiftQu41WdZzacYSFwt2jLfA6SLqaXTSeHCJZpcyU0dDPG9VMStvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6LQHRwB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6LQHRwB"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so3046864b3a.1
        for <imx@lists.linux.dev>; Sun, 27 Oct 2024 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730036221; x=1730641021; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/KcPSyWWs1+Qn6CYpWlfBVaLwNs9TIvs50gdMxSJ7ko=;
        b=Q6LQHRwBBi2dZ0zLGdivzUA8KqtmQ8VDn0oiBISSYEKrSAW2V6TTVSOnTsSjVUrsYl
         yTI/r9pWQLlRCPwyTMx8P5AO4z0V19tRzDL3BH7SxsZDB4ewFVozKegGmtDM7iqvrkO9
         c0/ewy+VfMxQppZs7KSx9Ut5xQdxxH8irCGXbcN7h/RcYVDzN+FR0bU46s+5Tqx3mtwo
         p/AUhlzvgnBU0ZQj50y/3lX+9sTxXa+NarnpfhAjj+c2lDQPs4qSv08vWLpvLqb7s+pA
         jCm3Gp5MzdgpxnBX3BgZ33WRhu4rZE7+a6uZSsNDysi+k+JuAmXYQfvesaZ4fK0X8Fss
         35/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730036221; x=1730641021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KcPSyWWs1+Qn6CYpWlfBVaLwNs9TIvs50gdMxSJ7ko=;
        b=eMs0XaVfcgaK5XFHvSzvhb79LHEGZlyBA+7ytNGseRfpX0UZS/mZWZp0jhlp+5rjrw
         w1ch52ZtX4TFIsktZy0LdEfckHBvOW2B32EbSbcZMzUD9NR6okDVANHLOIZma9ZdErP2
         vE7Ec66wkvQuLpfiNvcHlu1i/W03f3zpaElDMTDQgn/OKqE3LwbbKhzAqIpyoCvM0Zql
         QnQBpBMrFv20WT3y3d3yhdmkhuEYTY+DGgCkb0jMPNLTU+M6JsUIiecFRp3oxiVEJmaO
         Y145GFW+npiG0Ds52Nflhw4xOsaV5CYLRMs71+BBcR1rR/lXQCBmKSeqchBaf10kbdqv
         kywg==
X-Forwarded-Encrypted: i=1; AJvYcCXZNqWe4W2hKMvYudBdAzyFiXXc8xuiWL/Ax7/iEGNLpfZZ7T+yjIOvsGJrrhb3EtbO6iw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWpxXD57DBkKjWjeh6pu2VjI1BB+mN0GGW6kkhrnQ3/4rXMUf6
	v+uct/joIap7eSHGUmK+8vUDgdDu97hYq8ObC5ggMLeTlxsAKZxX
X-Google-Smtp-Source: AGHT+IHI/nrXwsmpW3azU2R3tX/p1QO7oRETbo+RxTXIXy0RR4/+J6Ho4j5PfP7eiIVrn1hU/tFiUg==
X-Received: by 2002:a05:6a20:ac43:b0:1c8:de01:e7e5 with SMTP id adf61e73a8af0-1d9a7573d30mr7998828637.15.1730036220817;
        Sun, 27 Oct 2024 06:37:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc867a2ffsm4016970a12.28.2024.10.27.06.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 06:36:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <33721072-6ff4-45bd-b20f-cc0a213e3aae@roeck-us.net>
Date: Sun, 27 Oct 2024 06:36:57 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: imx7ulp_wdt: Add TOVAL range check
To: Stefan Wahren <wahrenst@gmx.net>, Alice Guo <alice.guo@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241027105323.93699-1-wahrenst@gmx.net>
 <20241027105323.93699-3-wahrenst@gmx.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241027105323.93699-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/24 03:53, Stefan Wahren wrote:
> The WDOG Timeout Value (TOVAL) is a 16 bit value, which is stored
> at the beginning of a 32 bit register. So add a range check to
> prevent writing in the reserved register area.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0f92d2217088..a7574f9c9150 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -48,6 +48,8 @@
> 
>   #define RETRY_MAX 5
> 
> +#define TOVAL_MAX	0xFFFF
> +
>   static bool nowayout = WATCHDOG_NOWAYOUT;
>   module_param(nowayout, bool, 0000);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> @@ -192,6 +194,9 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
>   	int ret;
>   	u32 loop = RETRY_MAX;
> 
> +	if (toval > TOVAL_MAX)
> +		return -EINVAL;
> +

The whole idea of having max_timeout in struct watchdog_device is to avoid the need
for this check. max_timeout should be set to 0xffff / wdt->hw->wdog_clock_rate.
It is currently set to 128. With wdt->hw->wdog_clock_rate set to either 125 or 1000,
it can indeed overflow. However, checking the value above is wrong. max_timeout should
be initialized correctly instead.

Even better would be to set max_hw_heartbeat_ms and let the watchdog core handle
larger timeouts.

Another question is why the driver enables a clock but doesn't use its actual
frequency.

Guenter

