Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E52248AF
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770347571; cv=none; b=PNsZadfGLQmfDxly5pGUzxfmTkNRwEsTYjn0uiMu9t3jAbEPmM1J6nnTXoq3Yl3qLIL/42ZclmumnZxs+KTCVXyQM9ztiu7XERIo3LC8DU+WN4VEKic+fpszHFWgM3ABaeaMK6Sx7orLpoSvJidzZE6C0e0wqrSJBzG/pZSpZyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770347571; c=relaxed/simple;
	bh=NaAXrnwW6YsMJmtaJziXGkE853X5PCqFNxLJQsOviDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUqC/Vn7+2m36j3Z82cDR0p88zyADd6mRySx65Rv5qzwBEbHZcMcvL6re7bnlMW4Mu8DZJFCvpItFSWZF1SXDBJz/PFpum/WGRiuD8Zk2JevMZqGb1IHQaYoVdzhOv+djyIYscUwZUTGOOfzt4TQzb2I+d+YpxpKb5UXZ+QDioA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuZqaleQ; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuZqaleQ"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40970f97638so1117669fac.3
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 19:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770347570; x=1770952370; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dnwBnnXwTbGKc64te5moRcqi85iIUqtFB+6L7f67Qeg=;
        b=YuZqaleQqbE4IcpIsDBiwlrVYSyOReWLPTXuGGvwo9cw1KLINu6Hm3zkoz7XnYS2m9
         hFqf2RgFdJ+P+kCKZpD3PgKJBfw6Pry70AsbqIjRT1/aJYLQEJjioDzndSr4q0PxO/b5
         wNwF9CpOX6VgSAM/uF70N1Eo5yF2BxXps0E7zIXklb61/38VzKLAf5Lb3KvKrnHjkr6/
         Qa1Ux6x4Zqrs8d7FalOHuUDCH7Z2c4ZYkADfrt2pftebGscn95+xlutj/mmuJIy6y/SR
         WkS9wYfZaSlvyb84uwiylcDwmL0oUxbb//iVcVYUdYB5OiwEgivhqpxl/e9ZUYGnfQbF
         tMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770347570; x=1770952370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnwBnnXwTbGKc64te5moRcqi85iIUqtFB+6L7f67Qeg=;
        b=iTcjvuEKUTwfIHWudU8eKFoKoBgNddsdmnHJAJ9SDbnNbXsqXYGOT24QxpukxtXZl9
         67SpicwO5qcL6egnfkBa+mCPMbNIYVFVX4+aV+geqXDXlVywY+JqFb2lQroFLWZDbF2U
         6mWy3x4CvuMFkrdYnLar5vVxWF5YFggCw3r1ZEm2NW9lbFgIi3rwfo6qZLkrhDSqFr25
         Pxfv4lFm/YbyBHmObkn7u2Lj/YvWs87WxTzXAVu8OFavsM1iC+AxXrvyFlmf20K/OnXq
         W9hxsRPQCLmP8gNL/vh2E0pSNJNRZLY2wH/fLTrQAQWXy+pBT5YzVi/hDpBVCRAGSIkN
         fD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlv8k8kP8hpl65Ypn79uK7P9dkrhs1sFZv/yPWtwoZXV1Qd0H1CLIGnvDMX7fT1xni+V8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH/jZ75urh9AFT+OzX9tvP63BLxHFRjOQ/iDJKA2LVj+yahmll
	JCpvTo3tnPPOrwmvBMhKtoGqVG1CGViT/BFdB7ccuJdvpAQETelTYPFZ+lrTPt65
X-Gm-Gg: AZuq6aJkUSLrQbMb6scUPKqEVShQirdH0iwTAZfFN9YeYg0g2B7mVqVUK/pRwfMNBCa
	iQAzF+ZIhF9kDEmD2kc5I504D6ynkQcHA8enCSDhe6J+rgpiBo855vLQG19z2k3zwJ51v3qlAy5
	bdljG/Rh1dpxUi9eDdLT9Rhju9cNCeimZ2DZ0hvADwWVVcOTmPnhjOME+wKMi4TDu4YfF/TkPVT
	UZ/BDSS6aTI36FVexVyEID5KaC92R2PcGZxUPYCU6SSw1a7tFRQkSJX8euNGw3PSC5ReB5nrvE3
	4iSL/ATA5B750EuxNMkmQCnOZsug3U8sFt1ZpuL5FeK8apqS7vxXTPJZuTRS0E46xF2+STjQ7ei
	kgZL7fYdogALBID3mmo+zQEmFfW3Yeyr/l45jPu1tJYKnraJXZVzrAd4xm6B+8Ap0KwPwlXkRR2
	8cR/pfxmmUZWGOYuxbSwy4rfWErOKIpLYLOsZWgOMjcL14Z+crEY1Yesoe49lB
X-Received: by 2002:a05:7022:4390:b0:11b:a514:b64f with SMTP id a92af1059eb24-127040120b4mr517321c88.13.1770340320161;
        Thu, 05 Feb 2026 17:12:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm987181c88.8.2026.02.05.17.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 17:11:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1ded7e75-67e6-48ab-b63b-e9e38559f26b@roeck-us.net>
Date: Thu, 5 Feb 2026 17:11:58 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
 Peng Fan <peng.fan@nxp.com>
References: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/26 16:23, Peng Fan (OSS) wrote:
> From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> 
> On i.MX94, watchdog sources clock from bus clock that will be always on
> during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
> between the bus clock and watchdog, but the LPCG is not exported for
> software to control, it is hardware automatically controlled. When
> Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
> gate off the clock to stop watchdog and resume clock when Cortex-A55 is
> woke up.
> 
> So watchdog could always be alive to protect Linux, except Cortex-A
> platform WFI is executed in Linux suspend flow.
> 
> Introduce a new hardware feature flag to indicate CPU low-power-mode
> auto clock gating support, and use it to avoid stopping the watchdog
> during suspend when LPCG can safely keep it running.
> 
> Add i.MX94-specific watchdog hardware data and DT compatible entry to
> enable this behavior.
> 
> Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> [peng.fan@nxp.com: rewrite commit log for clarity]
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> - Update commit log for clarity
> - Link to v1: https://lore.kernel.org/r/20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e89854f14edca0fd5fa84591c2d2 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   struct imx_wdt_hw_feature {
>   	bool prescaler_enable;
>   	bool post_rcs_wait;
> +	bool cpu_lpm_auto_cg;
>   	u32 wdog_clock_rate;
>   };
>   
> @@ -360,7 +361,8 @@ static int __maybe_unused imx7ulp_wdt_suspend_noirq(struct device *dev)
>   {
>   	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
>   
> -	if (watchdog_active(&imx7ulp_wdt->wdd))
> +
> +	if (watchdog_active(&imx7ulp_wdt->wdd) && !imx7ulp_wdt->hw->cpu_lpm_auto_cg)
>   		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
>   
>   	clk_disable_unprepare(imx7ulp_wdt->clk);
> @@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>   	.wdog_clock_rate = 125,
>   };
>   
> +static const struct imx_wdt_hw_feature imx94_wdt_hw = {
> +	.prescaler_enable = true,
> +	.wdog_clock_rate = 125,
> +	.cpu_lpm_auto_cg = true,
> +};
> +
>   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
>   	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> +	{ .compatible = "fsl,imx94-wdt", .data = &imx94_wdt_hw, },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
> 
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20260203-imx94-wdog-1e0aa14d661b
> 
> Best regards,

