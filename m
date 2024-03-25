Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6681C5AA4
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711366281; cv=none; b=cX4eAHi2OorY4X+4t/NKDcoNct8X2iUs9z6gFgCO5fwvCn8U0A3Mzu8a2fgPVFDmlsgxqTiTSZ/wGzBbRRK3xxrh3wijIIParer6guYPy/GejYq6AuK14jfbhLmYQ6LFQ/d7uRexZH3Q6HtFAHuswgF6d/UxJjBHNP98bjb91P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711366281; c=relaxed/simple;
	bh=EyIlueejT0gK9GuEs5MdPNg8HDGXDVqmLnd5nxFpcZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ypqqy0jNaJp+tlKd2kL0uFEjfsxRMJr1+5V/QFvxpnk8qOIDk4liDIuhhjqmuluhH4RBeqRG0hcEx+YJrg6NnTqx9RCjH0bQ+vG2pI2wquJ6Hgf97Btl0Bq9UxmvOUgKiR9SHihKoT1Ln0Jd9Tcd1q3UsMzxDKxLwNaxWUO5Qvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8KZlyed; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8KZlyed"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-515a97846b5so1218350e87.2
        for <imx@lists.linux.dev>; Mon, 25 Mar 2024 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711366276; x=1711971076; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJkBHyUsM1Ra6ur6SOchqQjxQFdX44EdA5Gc6F4wbhw=;
        b=F8KZlyedlKjUsYhj4Q/vESYIp9pHZQhUtWDQkhJ8Vx3KNqZTv40pVcBLbA0R6D1wtl
         ZZGq3mTKylnGM4itsgi2BQa5mGUjlNehN5vNMpaerOmUTfp688w8hVlBR9fPzKbHAkSr
         ygzeKHWYg+icw23nhVvdThdXlOBRDUks6U4bGbdUXE7u3tth4+aSRpQbjC642qZLYx4C
         e0PynP0Ext/s/eTrkzFM96RMJbCXRtUyHlhMKqfUcdrLrfrSPoTcwT+7/SQoq2B5XGz2
         chEHRYUFW1davAN/UmT+Ma7/dkHqHNR7hHO60MRRcFJYuV0MQ3sjDJL8xBh+fEFyv2I6
         F3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711366276; x=1711971076;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJkBHyUsM1Ra6ur6SOchqQjxQFdX44EdA5Gc6F4wbhw=;
        b=CjpkR6d38C52A0fGH0ak+RP8L1KWmF8HXGNeOivv4g8+SU2CIs35swZEcW+ExrmgAD
         qEyPsDY5Zv9i10p/rEnmZCHqoT4PsGW/fJf7A/CBk2nEmuxZ0x5v9tLxt4X54kj1jXqz
         EMQEhASuOtsCu3cx3Q4UL8jnHmRFT32QT0rGxKTwzXmRtuuZWpPTRPb4VLpIimMgaf7S
         7LhatJ+0oQKQxTjHVwHZCpETPe63uFYQqyr/MCQqP2ga3bMZXJoUogDTimBozIvhr87Q
         Vu7tz1ldcL1qdJNlSsMZ481IiEzVwZ1xTTU2I17SKgFHB290DJrgtvmPEw2q/VTbX8Pq
         Yf2A==
X-Forwarded-Encrypted: i=1; AJvYcCVsuZtz+RFg7HwpeyxxPwZqCx5kcVRXTiaFf/khXJqtQ2Q/BNIUi/AbjR6STVhL/IuCym3lo6c79SoUrpn6wJ2yhsKa
X-Gm-Message-State: AOJu0Yyo8GzHJE/wLPr/SFgt+CKFEbEGgK6duMQchf4vq5RMdb/LPVht
	3cn+iNwqJ8tOiC29kMjnq17PN8XXG7r9AnHZZOE79czU8fhtYW57
X-Google-Smtp-Source: AGHT+IF2nqxUG0rM7Fo+wTv5ljPmgwCa+w71rkB3zM9tbCRqlpdyPxc1zfzOtVQRkUO55CzC5ywi3Q==
X-Received: by 2002:a19:ca07:0:b0:512:fabd:8075 with SMTP id a7-20020a19ca07000000b00512fabd8075mr4079760lfg.48.1711366276190;
        Mon, 25 Mar 2024 04:31:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::6? (drtxq0yyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:7426:df00::6])
        by smtp.gmail.com with ESMTPSA id y5-20020a196405000000b00515a3293478sm955108lfb.104.2024.03.25.04.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 04:31:15 -0700 (PDT)
Message-ID: <472c6eaf-6cbc-484c-bc94-571d115176aa@gmail.com>
Date: Mon, 25 Mar 2024 13:31:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] mfd: rohm-bd71828: Add power off functionality
Content-Language: en-US, en-GB
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20240324201210.232301-1-andreas@kemnade.info>
 <20240324201210.232301-3-andreas@kemnade.info>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240324201210.232301-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/24 22:12, Andreas Kemnade wrote:
> Since the chip can power off the system, add the corresponding
> functionality.
> Based on https://github.com/kobolabs/Kobo-Reader/raw/master/hw/imx6sll-clara2e/kernel.tar.bz2
> No information source about the magic numbers found.

Oh, interesting repository :) Thanks for linking to it! I didn't know 
someone had reworked this driver...

I have access to the data-sheets so I also have some pieces of 
information. I hope I can clarify part of the puzzle. Unfortunately I 
have no information about the magic delays. I guess I could try asking 
though.

Oh, it seems to me this handler is only working on BD71828, not on 
BD71815. So, it should be tied to the ROHM_CHIP_TYPE_BD71828.

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   drivers/mfd/rohm-bd71828.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index 594718f7e8e1..5a55aa3620d0 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -464,6 +464,24 @@ static int set_clk_mode(struct device *dev, struct regmap *regmap,
>   				  OUT32K_MODE_CMOS);
>   }
>   
> +static struct i2c_client *bd71828_dev;

I'm not sure why to store pointer to the device and not a pointer to the 
regmap?

> +static void bd71828_power_off(void)
> +{
> +	i2c_smbus_write_byte_data(bd71828_dev, 0x03, 0xff);

0x03 is a "reset reason" - register. Spec I have states that the 
register should clear when a reset occurs - but it also says the bits 
are "write '1' to clear". So, for some reason(?), this clears the 
previous reset reason. I am unsure why i2c_smbus_write_byte_data() and 
not regmap()?

> +	mdelay(500);
> +	i2c_smbus_write_byte_data(bd71828_dev, BD71828_REG_INT_DCIN2, 0x02);

This clears the DCIN monitoring status bit from the IRQ status register. 
I don't understand the purpose though.

> +	mdelay(500);
> +	while (true) {
> +		i2c_smbus_write_byte_data(bd71828_dev, BD71828_REG_PS_CTRL_1, 0x02);

This write to PS_CTRL_1 initiates a state transition. 0x2 equals to HBNT 
state. Eg, in usual cases this should be a start of the power-off sequence.

> +		mdelay(500);
> +	}
> +}

If you have the hardware to test this on, then it'd be great to see if 
clearing the reset reason and IRQ status could be dropped. I can't 
immediately think of a reason for those.

> +static void bd71828_remove_poweroff(void *data)
> +{
> +	bd71828_dev = NULL;

This does not smell correct to me. Should we remove the 
bd71828_power_off() from the pm_power_off instead?

> +}
> +
>   static int bd71828_i2c_probe(struct i2c_client *i2c)
>   {
>   	struct regmap_irq_chip_data *irq_data;
> @@ -542,7 +560,18 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
>   	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, mfd, cells,
>   				   NULL, 0, regmap_irq_get_domain(irq_data));
>   	if (ret)
> -		dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
> +		return	dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
> +
> +	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
> +		if (!pm_power_off) {
> +			bd71828_dev = i2c;
> +			pm_power_off = bd71828_power_off;
> +			ret = devm_add_action_or_reset(&i2c->dev,
> +						       bd71828_remove_poweroff,
> +						       NULL);
> +		} else
> +			dev_warn(&i2c->dev, "Poweroff callback already assigned\n");
> +	}
>   
>   	return ret;
>   }

Thanks for doing the digging Andreas! I think supporting the power-off 
for devices using this PMIC is nice!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

