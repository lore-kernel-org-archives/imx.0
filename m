Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D439E193
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774504380; cv=none; b=aek2IcUq80SbBqo0ZuSY9cPR/2DC99gpd90ThSSPw4Rr5PUNR4r77Cklxq5qXgws+zZoMnh0NHxUJEyuLMc4VZFGewX6J2pFFWRDg0ZtEs+DB/TEGbUTPZvPDKQHvSIHC/lx+34xZLZ/x9w5AeCsJFg3OajcOeV04jIPSlM7VU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774504380; c=relaxed/simple;
	bh=0yhZX0DH8A5C35IHXsYkFJYJVmgHMHBij5UNfrFZogE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VozISFjdcqXo+GfUuHDPCL3UvDIm/P2F6wETwMMPsvzFH5u6zXjmyJLrKqMhiZdPys7qzw2t3/UmS0obj7l2meoiqX0fJj9Tk19S3jCyJheqG+cd8R0XmFezEDCTVvvh1l4SxHv6kI/BqPiYK8jDSmYvWoj4Q6X7VTg1xTtAVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mh3HexvF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mh3HexvF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b0b0064027so3791095ad.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774504377; x=1775109177; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=;
        b=Mh3HexvFzvLIYi93uaFwdcXGfBVnp164PI1ZpejtoAJYkck0AwEfQcAeq8KJxuOMpp
         oq8TtU47MaG7Fq6A3akTGMEtl2Hw6Fgqf2qvxgyabPZI8fD+hQLgIenFVs+c/NDsGIvy
         hb0J1xdCuS4zPSX41exxQTggKWyFsKFoJpe/hi/5/iel2e3bN7u/nEVKt3wHmQYZie0m
         dHnB8Q5I8/eC5qDV20dbT0pByVNecxDv2bEabCMGP5945GNTHW72biExjXVGXYRiuY9T
         eb/O7ooKsAvG0/lXg8Iu1QGFMuZj26QZ5G4tHIIvJvNuyj0N6FC//Iak0LUTDDImkd4Z
         fyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774504377; x=1775109177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=;
        b=I+wW7iOifmK9579fdhFEbCGz0ve4Kc1ZMOURQML2DjpcCpGsYYXHolL3gptoSClDh0
         q0vGytVb9Ce8zZTJfrWxLP0h/0R6bAoG/9GBRX9c9HJ+s5p7jq+XOxOQArk9kvjS/aUZ
         lbz7hqJvArDydfM67tqJdMl6Tjio/jjiCfXAOKgm0DTFO8rdJSsplr8ktKOY5TJbszCR
         Zk00qeDrq9M1dN0EjWNDzBDT41Y9eKUC2y1JyIMMFTJpTncWF+GWbr6JaV8lyDZaQthz
         GOcC0t94ZKjcUZ9e91lY421RWhKREaE20ND2VuO/Nk8w9XvWzrYcbiUpp/5JMBrnRMps
         T3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUXD1097UOpOeubr8gxJ9+JoBd5I0OyDpQHOPoCKzi6mcwAd38B4r6kS6lkgVAvd4m7Ub8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpCb/vvv0XOwnUudjRaWl7YnHnD7I9s3TpTrCHWomj7NYO2o2I
	+UeDO6eQwEeRYaNWtBWHMDvT8BHIrRJlndJDlxWRKt7IBvb7LT5j+jye
X-Gm-Gg: ATEYQzxAvI84xhGUYPpWWVRKCuyQda0FT0CggQiJbGoow1fGz6767HR+Jwmx8jYcGvK
	B6YmWvHm8TqX+ZKv+zjkfpLTx+ik97Qlo4w35YJoz6jDOyLwxKl0Zr3H1VKFbKgO5+I6yj4ihyi
	J2ngQ65JdWhKhLg/wMLWxz1JW3KBrnShtSl2fw+j2j3vBUZa/tzS+9nF/cS/pwh1DiWyJk7jySK
	gCoAKQ9DtRgPFgL04tAERqCnmZYLw+4y+iKmDvy1Oyh6hpodp+yh8qbLeGJvpREY8q53KeGRvmN
	yRxqMFWWuYL52prPtnSo1OdG+hAGB47hPbw6oMl8gSt4XHzZiUACe+4SsbpYKp/NFtCgDmWoRWA
	3IWpORjMEiBey8lz6WABPCqIzZS42f6dR+Nf93kpvGjY9kidFjIugle65D07j1+D5MDlArz4BdI
	wxLkO8Sm3+gJR17wfWEiiOMkqueLIbTxFxPfOOXWE3Y5IaMkjVttCY+0UGmCeztX4dHMpZEdwZo
	5wLr4AQg/M=
X-Received: by 2002:a17:90b:3f46:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35c0ddf6eabmr5677531a91.31.1774504377493;
        Wed, 25 Mar 2026 22:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22ce693csm329442a91.14.2026.03.25.22.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:52:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9648e0ae-8102-4f70-866b-163fbd5050eb@roeck-us.net>
Date: Wed, 25 Mar 2026 22:52:55 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: emc2305: Support configurable fan PWM at
 shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
 <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 09:04, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Sashiko has a couple of concerns.

https://sashiko.dev/#/patchset/20260325160444.1736866-1-florin.leotescu%40oss.nxp.com

I don't know about the shutdown problem. If that is real, a lot of drivers
have the same problem. Don't bother about it right now.

However, the range check should indeed be a separate patch.

Thanks,
Guenter

> ---
>   drivers/hwmon/emc2305.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..722ec1d054f8 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -32,6 +32,7 @@
>   #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
>   #define EMC2305_OPEN_DRAIN		0x0
>   #define EMC2305_PUSH_PULL		0x1
> +#define EMC2305_PWM_SHUTDOWN_UNSET      -1
>   
>   #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
>   	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
> @@ -104,6 +105,7 @@ struct emc2305_cdev_data {
>    * @pwm_output_mask: PWM output mask
>    * @pwm_polarity_mask: PWM polarity mask
>    * @pwm_separate: separate PWM settings for every channel
> + * @pwm_shutdown: Set shutdown PWM.
>    * @pwm_min: array of minimum PWM per channel
>    * @pwm_freq: array of PWM frequency per channel
>    * @cdev_data: array of cooling devices data
> @@ -116,6 +118,7 @@ struct emc2305_data {
>   	u8 pwm_output_mask;
>   	u8 pwm_polarity_mask;
>   	bool pwm_separate;
> +	s16 pwm_shutdown[EMC2305_PWM_MAX];
>   	u8 pwm_min[EMC2305_PWM_MAX];
>   	u16 pwm_freq[EMC2305_PWM_MAX];
>   	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
> @@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   				      struct device_node *child,
>   				      struct emc2305_data *data)
>   {	u32 ch;
> +	u32 pwm_shutdown_percent;
>   	int ret;
>   	struct of_phandle_args args;
>   
> @@ -548,6 +552,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   		return ret;
>   	}
>   
> +	if (ch >= EMC2305_PWM_MAX) {
> +		dev_err(dev, "invalid reg %u of node %pOF (valid range 0-%u)\n", ch, child,
> +			EMC2305_PWM_MAX - 1);
> +		return -EINVAL;
> +	}
> +
>   	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
>   
>   	if (ret)
> @@ -579,6 +589,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   	}
>   
>   	of_node_put(args.np);
> +
> +	ret = of_property_read_u32(child, "fan-shutdown-percent",
> +				   &pwm_shutdown_percent);
> +
  > +	if (!ret) {
> +		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
> +		data->pwm_shutdown[ch] =
> +			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -631,6 +651,9 @@ static int emc2305_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> +	for (i = 0; i < EMC2305_PWM_MAX; i++)
> +		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
> +
>   	pwm_childs = emc2305_probe_childs_from_dt(dev);
>   
>   	pdata = dev_get_platdata(&client->dev);
> @@ -714,6 +737,23 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
> +			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
> +							data->pwm_shutdown[i]);
> +			if (ret < 0)
> +				dev_warn(&client->dev,
> +					 "Failed to set shutdown PWM for ch %d\n", i);
> +		}
> +	}
> +}
> +
>   static const struct of_device_id of_emc2305_match_table[] = {
>   	{ .compatible = "microchip,emc2305", },
>   	{},
> @@ -726,6 +766,7 @@ static struct i2c_driver emc2305_driver = {
>   		.of_match_table = of_emc2305_match_table,
>   	},
>   	.probe = emc2305_probe,
> +	.shutdown = emc2305_shutdown,
>   	.id_table = emc2305_ids,
>   };
>   

