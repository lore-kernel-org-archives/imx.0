Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E671AA1EA
	for <imx@lists.linux.dev>; Fri,  8 Nov 2024 23:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110146; cv=none; b=DqpHICo7ZwkL5tKscpgE3YBXkvSmQEdFYZnU7SSUFZ6fdduFYfVMwpIpDbOm/hWg64P9W6Lu35QsW3gNkyF+idXaROScYqSS5+zuQ5flMTeoVnRnoFqLAeOgEvhQGimxATnuXV00H2DqD4072p++RQ7N5Hk/ee3+4x466e5wjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110146; c=relaxed/simple;
	bh=bvxtS1ZGnwWsMES63azj/84ceClMn6FxwZEVj7m6+go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVbcu5QduIZRyTNd7suci3Gdv5k6fMspujnR/rFgu3Uw8R7fA4cTdDct2KZmZzUNujvDQJoFn7+xpuykDJFWYIDCmMqH94Sq2Q8r/5trm45ddjHM+7pMBmrTlDYhl6Qivj8FzCDjK/Px6D4qynUE7nFLrWIdoaPXQRqdBZ0+GDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsAvUnIK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsAvUnIK"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so2261382b3a.1
        for <imx@lists.linux.dev>; Fri, 08 Nov 2024 15:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731110144; x=1731714944; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YDNI3QDwWxgmxejo6jXXE94KMUDPX67xnOmgp5Nl8dg=;
        b=GsAvUnIKeBMyFqoVJ5vnePWzoFiibEFxf5+k5s6BegCYatCRAfJCzimXlTaJrVLbhN
         0vjxVp+/NevyOKXLSVDVs+ZFVe+fo1Gd7+6jDar9+ExRIUun4V6DYYoQj6xw6g+i0xzL
         y1LxCWnDCTBNvjFpLfr+dFKrAwMy/65rs3EioQ2hlSwGaVlPTv2i6F/UgDvrecoKyC3r
         k1OysuRosPq9ZGUNt3jVhW4VoDqJUGY6QkP5vthaVKeawUngdNjknDxYkcICmHVnAtmV
         2GmDBULk3JTgRpdy8l8ZqPtfK6A7btj1zjA3vWIbOgDbUaSSiKi9pcuZ9Oc9rGbf+jeY
         OmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110144; x=1731714944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDNI3QDwWxgmxejo6jXXE94KMUDPX67xnOmgp5Nl8dg=;
        b=nRmSOsaYq6jXC1HDxVYXXPhQxYb53OwmZ0rIkyfx0YhDB1tpbI2g2DVeC2HtFfUXEQ
         2OWkj/KZhxVlelFyWdveIQ15MpkKvp/wvpiRVG7CMZ1D5tllLic+XRyw50KpdRoMwIM5
         q9DOiP2JXH/AkxwmiNf2xvsP+0uJ4GKFNsKhUx76Y74VoOYZWgcE1bNuDZTttmUDyGry
         HEVzs3LR/FWOCjFul5GyB+DzXGuVjNwlb2dsoEiFUsBJr6yn7+wEIq/JrUEsFN74mHcw
         30uDevhOQIE5R9CSs670EF3kOKi3atB0e6IG3iELrP6KQpseaZFn5f08BJMTAwg4+0+Y
         L37g==
X-Forwarded-Encrypted: i=1; AJvYcCWHOzD4nLcVjBCLpy4QeiUvMy92NFU3o/xOr9a1qlcXHyBAiO7jc3/VoQ1xcXA59x4yB2M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEgnc0yn3bS039cOJnl18HcU8ZBdMu3rUWivE8P89Y8r5ymwPk
	E98VS8Iuy0D1vqEy6ShIydgGxiF4T+FHi9pOz3fsKogfnnRMP1M+
X-Google-Smtp-Source: AGHT+IEHn7LvKyz4qiE1kjywUOaxbLk9LaMdw4OZkuMYZImvcCX2vvxzceeB2V3jYqAdtqDqMOyhJw==
X-Received: by 2002:a05:6a00:99b:b0:71e:4c86:659a with SMTP id d2e1a72fcca58-7241328ea12mr5446159b3a.9.1731110143875;
        Fri, 08 Nov 2024 15:55:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078aaa21sm4398854b3a.51.2024.11.08.15.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 15:55:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c1b77ef0-f01b-4926-8259-e387166d0750@roeck-us.net>
Date: Fri, 8 Nov 2024 15:55:40 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hwmon: tmp108: Add help function
 tmp108_common_probe()
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-2-6a8990a59efd@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241108-p3t1085-v2-2-6a8990a59efd@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/24 14:26, Frank Li wrote:
> Add help function tmp108_common_probe() to pave road to support i3c for

help -> helper

> P3T1085(NXP) chip.
> 
> Using dev_err_probe() simple code.

Use dev_err_probe() to simplify the code.

> 
> Add compatible string "nxp,p3t1085".
> 

This is borderline and problematic. First, it is the one functional change,
and second, that functional change is not mentioned in the subject. At the very
least it needs to be mentioned in the subject. I would, however, prefer two
separate patches, even if that is just a one-liner.

Also, the key change is preparation for i3c support, not that a helper function
is added. The subject should be something like "Prepare for adding I3C support",
and the description should then mention the added helper function.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> dev_err_probe() have not involve addition diff change. The difference
> always list these code block change regardless use dev_err_probe().
> ---
>   drivers/hwmon/tmp108.c | 40 ++++++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index a82bbc959eb15..bfbea6349a95f 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -323,33 +323,19 @@ static const struct regmap_config tmp108_regmap_config = {
>   	.use_single_write = true,
>   };
>   
> -static int tmp108_probe(struct i2c_client *client)
> +static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
>   {
> -	struct device *dev = &client->dev;
>   	struct device *hwmon_dev;
>   	struct tmp108 *tmp108;
> -	int err;
>   	u32 config;
> -
> -	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA)) {
> -		dev_err(dev,
> -			"adapter doesn't support SMBus word transactions\n");
> -		return -ENODEV;
> -	}
> +	int err;
>   
>   	tmp108 = devm_kzalloc(dev, sizeof(*tmp108), GFP_KERNEL);
>   	if (!tmp108)
>   		return -ENOMEM;
>   
>   	dev_set_drvdata(dev, tmp108);
> -
> -	tmp108->regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> -	if (IS_ERR(tmp108->regmap)) {
> -		err = PTR_ERR(tmp108->regmap);
> -		dev_err(dev, "regmap init failed: %d", err);
> -		return err;
> -	}
> +	tmp108->regmap = regmap;
>   
>   	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
>   	if (err < 0) {
> @@ -383,13 +369,30 @@ static int tmp108_probe(struct i2c_client *client)
>   		return err;
>   	}
>   
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, name,
>   							 tmp108,
>   							 &tmp108_chip_info,
>   							 NULL);
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
>   
> +static int tmp108_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "adapter doesn't support SMBus word transactions\n");
> +
> +	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
> +
> +	return tmp108_common_probe(dev, regmap, client->name);
> +}
> +
>   static int tmp108_suspend(struct device *dev)
>   {
>   	struct tmp108 *tmp108 = dev_get_drvdata(dev);
> @@ -420,6 +423,7 @@ MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
>   
>   #ifdef CONFIG_OF

It might also make sense to get rid of this conditional and of the
of_match_ptr() below to enable instantiation through ACPI.
That should be a separate patch, though.

Thanks,
Guenter

>   static const struct of_device_id tmp108_of_ids[] = {
> +	{ .compatible = "nxp,p3t1085", },
>   	{ .compatible = "ti,tmp108", },
>   	{}
>   };
> 

