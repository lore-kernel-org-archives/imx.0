Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8A18FC9F
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193672; cv=none; b=oLWYNH0hx5xHXRObbpA3Hv2d2DX/RS5X+rWY64ibA5gz6W51T/2cSRe10clbpczQps9xmSFQeajf2MSqWf7DAqTSfNGFojBp8imIeJsh0IgYY/ZQhbL5v8QasFPNYGFeMbhlbsQ21H+aaJM/T0hKLn82rIDIboQZDPnJrIn8pqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193672; c=relaxed/simple;
	bh=mNYCIaC/TiQFcye4zOvTyd+zkhijqrF9hc5gPlQ6OiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRyvbpJ1lpGKqyfaQMJfVVDosqZKHWQ0f+Qd+mLO46A09W1slTqPi4SWiosIgWlv4/dSVXBxzMWNlp96v2O/bR7yjfuxUEep4mF5x6SVeqJNiflwmwhNCxbAcqd1zInGMRFkGsTzHfZgcNtACgxeZVuI9gCvYXFdVYrStE0aL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfVrDLDp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfVrDLDp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22359001f1aso162709765ad.3
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741193670; x=1741798470; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qjVsQnSqRQBd2D93xCfGrKX4ZhGOSg4lpjeYRuVrhMg=;
        b=hfVrDLDpqZHJo2gqvzcjevvAB7q6q+WyvZREfoVh7HEvq6Qqej5e+2ZvypV0bSSfbN
         QiYvVK5oydRCo0t6/UXDSm141CxmCWfCYiW0TTOz/tHAA8WTxxQbG4/ot+0V+za76xeV
         xFd5P+PpcV+hBQ8m87pDTEFl/nRm46wmldsebLna0DaAEN3yF9HelcmLetHgfTcIzLTV
         tXNwNCz9aGGkQe4J5d8tmyj1ykWtd0cQ1a1tj48AdsxdjAE95m+0KL6nVQnm4hn0JXuJ
         D2JyoFmfQ5i4UJiBM1LIDLgl8jlVEt4NFU0XvlMPYxJfnOl+7mA3vDhGK8k8W2Fqx+02
         hYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193670; x=1741798470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjVsQnSqRQBd2D93xCfGrKX4ZhGOSg4lpjeYRuVrhMg=;
        b=bGCJP2RdrVH6rlxrAGvBOMcctj5FVgT5sTeUzSXZGDiftUp++06Wz8sHLMqjSsq2+w
         W4BeIQLYF69LVyTCRE5YxekgGn4uli1bvM2MY6SAKf68Oq6jAQtyQjZ91S0hY0hWmBAZ
         krxUEKPcZXZNXwk2uXxyvaFTIdYrGd9tYPkUokZ6FQf3M2iVg6PCb2JI2zRtpwGT9kKg
         A0xs9RcdLHyiUboqfyKw8efz9gZwbPcfr/Pl6PIxrnHs2YvgiYPg9y6SN9tC3QgKntWQ
         1KdXAuMwXs58hDU1C0XdWaJh6uvJJR0IFyUeAmDsyJDu8JioYaJMznMUPXUDRRP11BPp
         m6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxcTt9Qpr1L5059vzF33su+wKGGJCiAt8vGghnYKRc6kA7vbxS4nnt/TRKlPYz39vBfok=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeTksGEWmAjXmugcTSqosq9EKXChRwmMRsZTxi4NfkDzoFL1jC
	ugKbte2oOYM5VaxNuxxfBSrWUYnn4h3pCZhQfyoXOYP+otnRV24k
X-Gm-Gg: ASbGncviuCsDfopU44VL9S1Fxu8qQeXS82soyw3cOTCPSrRkGEMIDDD73O9NStCyLqa
	7x9IxVRjcITT1n9YgskdeU4UIMz08kRZsZui80+4Rl64PARspubrO+iHdFwH5N8tA4jU0UpbNrT
	t6bVfdMVekEXPIAE0MUTncYwWZhU7F8ryLe5pfhwQlGCYTsTldmCcaFfwWPuGFWb7Zd6HqwtYaC
	GknQQjSHA34B8ij8aGTFBkmUSh6iPWx3DEFr51Dh0z5G2OWP3xpBxRR1tME9BgfooeqHBvNQTvx
	PljwflpFO/PMB6rMyTUj/A/q/MdN+Dbinu70lpw3H9NAY8gNUH/A2fi/okns0uEy85do5kOrlV4
	tFlPYx6Hm5ZzcMb1Edw==
X-Google-Smtp-Source: AGHT+IELUYOiv9nEvMo6emFh85nrbdMhcJOVKHgtRdU/NVg8mbP4tsGNtdZVd7IcFJrPh5kmFt3Caw==
X-Received: by 2002:a17:902:f693:b0:223:6455:8752 with SMTP id d9443c01a7336-223f1d39301mr66361165ad.43.1741193669541;
        Wed, 05 Mar 2025 08:54:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9e46sm115772545ad.53.2025.03.05.08.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:54:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23608097-f226-471b-b070-d3834e5c129b@roeck-us.net>
Date: Wed, 5 Mar 2025 08:54:27 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hwmon: emc2305: Use
 devm_thermal_of_cooling_device_register
To: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com, carlos.song@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20250304162136.1963384-1-florin.leotescu@oss.nxp.com>
 <20250304162136.1963384-4-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250304162136.1963384-4-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/25 08:21, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This prepares emc2305 driver to use configuration from Device Tree nodes.
> Using devm_thermal_of_cooling_device_register also simplifies cleanup
> procedure, so we are able to remove the emc2305_unset_tz and emc2305_remove
> functions which are no longer used.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 28 +++-------------------------
>   1 file changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index a236f27c75bc..5f3f06308826 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -112,8 +112,6 @@ static char *emc2305_fan_name[] = {
>   	"emc2305_fan5",
>   };
>   
> -static void emc2305_unset_tz(struct device *dev);
> -
>   static int emc2305_get_max_channel(const struct emc2305_data *data)
>   {
>   	return data->pwm_num;
> @@ -293,8 +291,9 @@ static int emc2305_set_single_tz(struct device *dev, int idx)
>   	pwm = data->pwm_min[cdev_idx];
>   
>   	data->cdev_data[cdev_idx].cdev =
> -		thermal_cooling_device_register(emc2305_fan_name[idx], data,
> -						&emc2305_cooling_ops);
> +		devm_thermal_of_cooling_device_register(dev, dev->of_node,
> +							emc2305_fan_name[idx], data,
> +							&emc2305_cooling_ops);
>   
>   	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
>   		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
> @@ -337,21 +336,9 @@ static int emc2305_set_tz(struct device *dev)
>   	return 0;
>   
>   thermal_cooling_device_register_fail:

This label is no longer necessary. Instead, any goto can be replaced with
an immediate return statement.

> -	emc2305_unset_tz(dev);
>   	return ret;
>   }
>   
> -static void emc2305_unset_tz(struct device *dev)
> -{
> -	struct emc2305_data *data = dev_get_drvdata(dev);
> -	int i;
> -
> -	/* Unregister cooling device. */
> -	for (i = 0; i < EMC2305_PWM_MAX; i++)
> -		if (data->cdev_data[i].cdev)
> -			thermal_cooling_device_unregister(data->cdev_data[i].cdev);
> -}
> -
>   static umode_t
>   emc2305_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr, int channel)
>   {
> @@ -599,14 +586,6 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> -static void emc2305_remove(struct i2c_client *client)
> -{
> -	struct device *dev = &client->dev;
> -
> -	if (IS_REACHABLE(CONFIG_THERMAL))
> -		emc2305_unset_tz(dev);
> -}
> -
>   static const struct of_device_id of_emc2305_match_table[] = {
>   	{ .compatible = "microchip,emc2301", },
>   	{ .compatible = "microchip,emc2302", },
> @@ -622,7 +601,6 @@ static struct i2c_driver emc2305_driver = {
>   		.of_match_table = of_emc2305_match_table,
>   	},
>   	.probe = emc2305_probe,
> -	.remove	  = emc2305_remove,
>   	.id_table = emc2305_ids,
>   };
>   

