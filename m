Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02EA32254E
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911625; cv=none; b=j0gqT4AqlH/MVt03Dob3DYwvE4bSp5teEulkyQn5dWPVKi8RfuySQ8j38wNLN5apvMRKGkyqShJjP98iowuRVpfMxQmLiw2YBXMbm9CUGdWpt7LG/FwueKLhlQ+dZS3L1POiZJv3m4b3w3ZPNAsvevK0DFvs4dXjmrpu2PT6ixY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911625; c=relaxed/simple;
	bh=O35spgqehOrZR2tvQvdo7EUbG49QpK95STsTyry3mOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVevvBLzx/5lXrqU8bzqcL4rUVZESAFYhiZ+nzj+YfiIU4eUm09UJk/de0RicxA04zy3eEXqaw4ozs5kUt2lwgm3WcQWitdq1+UaO7sFDQbD7UefCM2Y9oE6eK9qWdOUksUi5AenK25qIdNKAYtNY04BqDfXQDFKaBayyaIlqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4KigKEc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4KigKEc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso4611753a12.2
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761911620; x=1762516420; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=;
        b=S4KigKEcfzQ6EHQ9+5j5zSbggKwhG5FSPHpNcnnjzq14VMFvsVhnqzKQrsKdMebjhV
         p+HQgI34SzKZFqEIqjqaEx4XpjZmuitK/R++XivYHby1FQs5nmtfrLKK0idsXWPY4xup
         X3Lq8yhqOZ0dzfudzDF+jnL50rIqC3XaL2ehs0+Rik+wdkVi9p6Rt4C/wCiTAr/ONhes
         AVeSuahFPknj4j6ftLkxF6IiZMGJSu6x6r++ytpdVXbolbRSmm1i/cBjmiv9mHlKRMW5
         zVndxjtsnpJ2kJR6/n6uOAh6dzwwBmbb9IT/G5pWCgaDobz2DrVzm4C0LM2zisZu3G40
         TNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911620; x=1762516420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=;
        b=ByQ1FNuT7+0XdjjHXfZQuFWh+mj5sekNZnUF9B0lei+aAEcSu5kMiOkR5fpmGA2Qqk
         2cPZf1Ew4pC8H6ef2z5IYHhUCQN6xxzSFeb1OBYphpadaXiE1hDTjfU+V9fJeb+WZ1/K
         4daZSzFZvIrV9lNRMEZ7X8F+cGtaVdKM7kUw3z67tyPRtbQMZPg/q2kiF1TfUa/1x8yd
         APiw0L3P9kQLBB8lEecQ0kYORj9FrW9dlsQBbTQTVvOlXAg/h/km3pqaTvUqPQJB2RJw
         Bc3SFXSk6QLTxgLmxFNXATtwbRjsOpEfAJgCgyhH961Gsd0/n+onszZnoSd1lSc5h650
         QhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW42bhcQ/wwfuX9/+OYnPKty4R00D8zQfU84F1aMnBQYHDhMg/LFHOd5TvP5UOhwua2GA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOE1oE/RIefHbVu1jTU2ZwF15mnqoJBSv7Kjxe81pgYQXuYP+j
	Gg4TLfvDVsw7ZZTsVhy+Gz8K4Hmk9Jq9zeJrjyCURtUp8CW0bghKC8vh
X-Gm-Gg: ASbGncsSG6XaCWsNGB1Bt2ni1RoFxQwxHCv+kibgWaI22jCTkAB2JZ6i/ote5ogR1aA
	Zl2xfG/PTq5F1JlcdDHHwkXKnhr92mp82MDuyBzh46Wls7dV3sjo2EbT2i2Cefo/0wRA7SZ5qGN
	FPBVHpt3cMXH5v684KUboU13byKoWM72I8isLB6fuITtMCxfVaFZQEGD+v0G5BZTWahJpYuO43D
	EO7QQ/FX8zlDJiuKAaxULcjtgXsn23vxDKOumfnX9VjT88nVNeNWod2lKsX2uFJgCeMofEHQxCb
	AY5+Cg4R0t5GdTgqp2MxwDC6OR9k/cQH62WRoYVV3uNECchZGwuA+u2NPC0BT0cf8BpgXEgexOF
	JAWrmYx2/f/nunYCLmFxs+BVG8qvF4CrpX1I9V0N6xOpEZ/pwkG7kndLg6DYOzqP4t/L4T7a/1P
	86WplLC+CKq/8DOJo7FdVl2Gv9xny/tWOL9CYCdX0Gv2g=
X-Google-Smtp-Source: AGHT+IGxIlFPS8hS595Xkfumk9wGbCOJQPHRYRtPAuDqD8SnR4VGwjFq2oqrDoT+nBuHOhjxEg9Krw==
X-Received: by 2002:a05:6402:1e94:b0:640:7529:b8b9 with SMTP id 4fb4d7f45d1cf-640770820e2mr2209238a12.30.1761911620065;
        Fri, 31 Oct 2025 04:53:40 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b448ed9sm1418859a12.35.2025.10.31.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:53:39 -0700 (PDT)
Message-ID: <19ef0124-9a61-455d-8402-70e840309cf5@gmail.com>
Date: Fri, 31 Oct 2025 04:53:37 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
To: Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-6-laurentiumihalcea111@gmail.com>
 <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/30/2025 6:06 AM, Philipp Zabel wrote:
> On Mi, 2025-10-29 at 06:52 -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As far as the Linux kernel is concerned, block devices such as i.MX8MP's
>> AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
>> clock controllers, reset controllers or mux controllers. Since these IPs
>> offer different functionalities through different subsystem APIs, it's
>> important to make sure that the register R-M-W cycles are performed under
>> the same lock across all subsystem APIs. This will ensure that registers
>> will not end up with the wrong values because of race conditions (e.g.
>> clock consumer tries to update block control register A, while, at the
>> same time, reset consumer tries to update the same block control register).
>>
>> However, the aforementioned race conditions will only impact block control
>> IPs which use the same register for multiple functionalities. For example,
>> i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
>> and reset control functionalities through different registers. This is why
>> the current approach (i.e. clock control and reset control work using
>> different locks) has worked well so far.
>>
>> Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
>> block control IP, we need to make sure that clock control, reset control,
>> and mux control APIs use the same lock since all of these functionalities
>> are performed using the SYSCTRL0 register.
>>
>> To do so, we need to switch to the regmap API and, if possible, use the
>> parent device's regmap, which, in the case of i.MX8ULP, will be the clock
>> controller. This way, we can make sure that the clock gates and the reset
>> controller will use the same lock to perform the register R-M-W cycles.
>>
>> This change will also work fine for cases where we don't really need to
>> share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
>> control) since regmap will take care of the locking we were previously
>> explicitly performing in the driver.
>>
>> The transition to the regmap API also involves some cleanup. Specifically,
>> we can make use of devres to unmap the device's memory and get rid of the
>> memory mapping-related error paths and the remove() function altogether.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
>>  1 file changed, 57 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index e9643365a62c..3f6d11270918 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>  
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> @@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock; /* protect register read-modify-write cycle */
>>  	void __iomem *base;
> Drop base as well, better let devres handle this.
>
> [...]
>
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
> Pass base instead of dev.


ACK. Will need some extra casts/annotations though as sparse will definitely

not be happy with this.


>
>> +{
>> +	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
>> +
>> +	iounmap(priv->base);
> 	void __iomem *base = data;
>
> 	iounmap(base);
>
>> +}
>> +
>> +/* assumption: dev_set_drvdata() is called before this */
> Why not just pass priv instead of dev?
>
>> +static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
>> +{
>> +	struct imx8mp_audiomix_reset *priv;
>> +	int ret;
>> +
>> +	priv = dev_get_drvdata(dev);
>> +
>> +	/* try to use the parent's regmap */
>> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (priv->regmap)
>> +		return 0;
>> +
>> +	/* ... if that's not possible then initialize the regmap right now */
>> +	priv->base = of_iomap(dev->parent->of_node, 0);
> Make base a local variable ...
>
>> +	if (!priv->base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
> ... and pass it as data instead of dev.
>
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register action\n");
>> +
>> +	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
>> +				     "failed to initialize regmap\n");
>> +
>> +	return 0;
>> +}
>> +
>>  static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  				       const struct auxiliary_device_id *id)
>>  {
>> @@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  	if (!priv)
>>  		return -ENOMEM;
>>  
>> -	spin_lock_init(&priv->lock);
>> -
>>  	priv->rcdev.owner     = THIS_MODULE;
>>  	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>>  	priv->rcdev.of_reset_n_cells = 1;
>> -	priv->base            = of_iomap(dev->parent->of_node, 0);
>> -	if (!priv->base)
>> -		return -ENOMEM;
>>  
>> +	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
> Not needed if priv is passed to it directly.


right, somehow I forgot that rcdev holds a pointer to our "struct device" even though it's right there....

will make the change, thanks!


>
> regards
> Philipp
