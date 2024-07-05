Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381722F52
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720155250; cv=none; b=r5l14q05SDN/Dm4WZg2zgAcsZd90al9LnIkVEm+UERk727irhbesrWJtVPaAGmU07s9AyaKNQYThzRT9ZDJkF/os2hIeJNksBt4hbh05gj4rUm1sS3SbCyEDe9uxNZv52QSfHCmc3K7zltxvIgaEfCOi0OEnVhISRgrJmM7N2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720155250; c=relaxed/simple;
	bh=E2jAy5I7N+o8z5conGKpYZF1bx37yHfwltgnD/ccXOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWcqRxXR3m9TkpYYYEntjdmAikjnBHyQPzHLg1jAu7cYsBj6agxAzj4UafHnn43zmmh8zxgGThWDJHQnNvZvMy7Gl4zKgVlPwRDx5Cuxni1eHhBbTkX0TYWUC9+65Dn0XM/ev9i1MA5uOfV9TluoXeqHoclBoT3KGNzpujm8IRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNTBfM8y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNTBfM8y"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e99060b0dso1247854e87.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 21:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720155247; x=1720760047; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ8Be9g2pzsTx6g6CtiD+JiLK1AMOdko7+ZfugSfQzo=;
        b=KNTBfM8ypXzruT63KdlLY1u8jsZgg4PSvaUq5YJLYWVNZ5Eu63i0VIk42Y5M9iiKhH
         NGsS0gaOj0KHBxmTowllibV1LoUU8/YG6haLfXRPgxMP9vDvd4IDGFxDpCyZpmJoRPLX
         vlxSeFFbY06kJlKWhmI/ZGrQuO/y+eMo6MUFVc2WHagTVKOWD+281viQg/3CJ/T++EjH
         FCkX4q/y/luNDMC/qRxrKxV8lx/JwK9Cs3HQUXsEtg0dQpT335tf4eEOlw69GDeeWTov
         ynxbT/23rH5AeaqLE8iefopTMJis76pcdVMk6pi1Yi55UwqZiA6juvDSAgRnP19r/vd9
         ouFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720155247; x=1720760047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ8Be9g2pzsTx6g6CtiD+JiLK1AMOdko7+ZfugSfQzo=;
        b=sFwuO9jsJTaw/wIcto405zuESdiwKXFhdoNATzKyKo5nkx3DpGZvd46jtgLO2kvqhA
         VVBuGGVJKfD8l9DG1Jzgad1JDUTeh4coAjH14z+SA0gxHHrQGwIKmJaKqDXOPI8iBjZq
         x2NDSKd8SGazu69Y6FQ1yNGgr1c66hB1QlGOZyaU9iJ1yRTxQwBSbjTuExO/ipmH8HqT
         oyZyBAIGUwklVth4P2kYq0cwi7MDombXphID1fYCy/962+Otd9tI+hXQUwAQC9RHbC08
         0JjrxUaIlujhSrEtqrdB8sswh2jy4QKmDaj1XLJX4qlITLmrSuou/q7uvAXj5WGX7v1t
         455g==
X-Forwarded-Encrypted: i=1; AJvYcCVO3XS8mTwNx7sEl7EZnzgvqPgVCQWFreqPLgKnru4bqhSzfS6pIVEQPU1quxcqOSSg+TcyrbL+jNk1WCpvT5eUHTDb
X-Gm-Message-State: AOJu0YzgOjRD4KtXdMU1snXTuod8M0ESZ6aFJaAMdzMUD4O7RGJXVmfl
	gQ4afTHsNPeGZK5aUZSApBo+tojRCTL1HZdSoyDdRMk4OlboCI/D
X-Google-Smtp-Source: AGHT+IGj44uGCh9JIY4RYcfQemCEKLBK5WUZyizfBrWxRR2/ZppG5Hpmnmc4T+lCs23rpz8eZdLjpg==
X-Received: by 2002:ac2:5a5c:0:b0:52e:a008:8f39 with SMTP id 2adb3069b0e04-52ea06f55f7mr2523055e87.59.1720155246515;
        Thu, 04 Jul 2024 21:54:06 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b255sm2669892e87.260.2024.07.04.21.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 21:54:05 -0700 (PDT)
Message-ID: <62e4ee02-9b71-4281-b2b4-fd99c55ec585@gmail.com>
Date: Fri, 5 Jul 2024 07:54:04 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/24] mfd: rohm-bd9576: Constify read-only regmap
 structs
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-6-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-6-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> `bd957x_regmap`, `bd9576_irqs` and `bd9576_irq_chip` are not modified
> and can be declared as const to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks! Much appreciated.

> ---
>   drivers/mfd/rohm-bd9576.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> index 3a9f61961721..17323ae39803 100644
> --- a/drivers/mfd/rohm-bd9576.c
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -57,7 +57,7 @@ static const struct regmap_access_table volatile_regs = {
>   	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
>   };
>   
> -static struct regmap_config bd957x_regmap = {
> +static const struct regmap_config bd957x_regmap = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.volatile_table = &volatile_regs,
> @@ -65,7 +65,7 @@ static struct regmap_config bd957x_regmap = {
>   	.cache_type = REGCACHE_MAPLE,
>   };
>   
> -static struct regmap_irq bd9576_irqs[] = {
> +static const struct regmap_irq bd9576_irqs[] = {
>   	REGMAP_IRQ_REG(BD9576_INT_THERM, 0, BD957X_MASK_INT_MAIN_THERM),
>   	REGMAP_IRQ_REG(BD9576_INT_OVP, 0, BD957X_MASK_INT_MAIN_OVP),
>   	REGMAP_IRQ_REG(BD9576_INT_SCP, 0, BD957X_MASK_INT_MAIN_SCP),
> @@ -76,7 +76,7 @@ static struct regmap_irq bd9576_irqs[] = {
>   	REGMAP_IRQ_REG(BD9576_INT_SYS, 0, BD957X_MASK_INT_MAIN_SYS),
>   };
>   
> -static struct regmap_irq_chip bd9576_irq_chip = {
> +static const struct regmap_irq_chip bd9576_irq_chip = {
>   	.name = "bd9576_irq",
>   	.irqs = &bd9576_irqs[0],
>   	.num_irqs = ARRAY_SIZE(bd9576_irqs),
> 

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

