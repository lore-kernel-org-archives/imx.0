Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEAC15887C
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731367904; cv=none; b=ADJovr6/w8pTQu6SJceJ5JFQKCD8z36DUZPtto1R0xIVEGwBkDhiVxlJeRE2VpQuoFhbRG51ZOB3Zp9tMiqwptBtDV/5uoJJnl66XZoxAuqzb4uhd4Gy26TOqPiDCfnxbhdrWkNzE0kuXqqZUucxfK6DYt0P6Abo2tUH829hHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731367904; c=relaxed/simple;
	bh=MZg+7mA32hq/33u5yEjdiQRdlrPDbHWQRtxg3e4RXLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sv3/ZGNQLEIE3A7UJpvJzxN8aqHdzHXOTG1pJ/pM4SPEaHRp1lUib89J79bNLIWEsTRLmGCw8OCeWd6+yBOgte5PXvg5X21JJr0kNKePBCIxFzEitPedUxMrAuC/xfucSrD0XKDuQ7wKQmDjvSymBBoPNsBd5cnkzdG/hUBPN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGOkcjAh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGOkcjAh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c714cd9c8so51114585ad.0
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731367902; x=1731972702; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0CxGPRc/hvI7VkJ7WnQuoryGfDbvzXp7f28v45x6BOw=;
        b=BGOkcjAh1HIQ18TmopQCkMY+0Jr3iBaUU5/3+RmeVsdcUnikEfO2AXNThV/L7mJlH5
         QM5+mLUStoNX8Z02sDkXQEr0BO++dVnScu0uLxd33C4n1uhO3cFlQq4tMugcCaKZguLU
         8pmhRnGBsJT0mG3seFEohkBQtk5V+kHOLyZTeQMN2d+AA49JGiG0MlAsNDXgkZD+8iNI
         qH+vyiOsHnub5i0ZwsNSeSI1CnZvch3HWcdAR5DISEPmrYR+O++vB7PP5wyN9PJzPbR5
         iUQMabJOoYDlM0PK2jzSD6mOCnSsPvIFeo/cDPuGwRk4bcGFadF6gX1LVVHfvdfgWJqU
         vlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731367902; x=1731972702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CxGPRc/hvI7VkJ7WnQuoryGfDbvzXp7f28v45x6BOw=;
        b=Eu/8r9LJWA8QR9zrzJvIlN89P3fmf+bDukXWf6pfbZ3Ekp59ETvON3Lv6cbFE4D2kU
         T2GGhskCI7RvSUHcr+5Ijw/331aQ/ovuUWXKTga2N+LfzZJfMB1X9z0LL2G6EXMhFvp8
         utQXlHsSOPbIp0giR6hn81zwqK89jRJn/M705y0cCOlhVPusdhnBvga/yb6wJPpZSwK9
         KaD9UgnIf8RZxDKMy8gmv6ltVE4avqBkj7xHAJjsWDHjpE6Pm1TfLzwS9aQYxQm3LEjG
         SZ01jtYEGq01o2Q/YCCcCyg2v3qwasHvtDDZu2HDFQl4b3JFJppcx8fgo6W5Tk3ifCPs
         Jvow==
X-Forwarded-Encrypted: i=1; AJvYcCWF2w4GQJi1Cl7QFXvTGvtEugv9SNLXIvT4ZvJB3KVp8X9ipq0Ga4NBIu3t/tLrMR2IfHY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRNPSaERiKXZC6wXUPprrjX4z0xHnJ6STNbDe0WOTGgPo8rf6a
	Gm35DEfH2C+mZRCiNF719RGAk4gRRn6kdsJBTse3rmSle4UJTp+L
X-Google-Smtp-Source: AGHT+IEBkTlHjkg32X7fZGi05A4GmaJEJlXkxAfydPRC5Spm5Nt9TrC8C1I7I6cXzZDuUOCaNe+W3w==
X-Received: by 2002:a17:903:2347:b0:20b:b455:eb4f with SMTP id d9443c01a7336-21183d6eff4mr214496655ad.25.1731367901740;
        Mon, 11 Nov 2024 15:31:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e7b7e0sm80998185ad.263.2024.11.11.15.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 15:31:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7bdd2db8-41c8-43d8-ae73-84a221d2d004@roeck-us.net>
Date: Mon, 11 Nov 2024 15:31:39 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: tmp108: Add support for I3C device
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-4-bff511550aad@nxp.com>
 <41995c8a-8b05-4c56-b4a3-5f275a88b899@roeck-us.net>
 <e8921251-02bb-409e-88d0-d635e7d08929@roeck-us.net>
 <f2690f72-9b50-438d-8301-9e93b03de3e4@roeck-us.net>
 <ZzKRRdXpeHVyUDOM@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZzKRRdXpeHVyUDOM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/24 15:20, Frank Li wrote:
> On Mon, Nov 11, 2024 at 10:37:04AM -0800, Guenter Roeck wrote:
>> On 11/11/24 10:10, Guenter Roeck wrote:
>>> On 11/11/24 10:04, Guenter Roeck wrote:
>>> [ ... ]
>>>>> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>>>>> +{
>>>>> +    struct device *dev = i3cdev_to_dev(i3cdev);
>>>>> +    struct regmap *regmap;
>>>>> +
>>>>> +    regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
>>>>> +    if (IS_ERR(regmap))
>>>>> +        return dev_err_probe(dev, PTR_ERR(regmap),
>>>>> +                     "Failed to register i3c regmap\n");
>>>>> +
>>>>> +    return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
>>>>> +}
>>>>> +
>>>>> +static struct i3c_driver p3t1085_driver = {
>>>>> +    .driver = {
>>>>> +        .name = "p3t1085_i3c",
>>>>> +    },
>>>>> +    .probe = p3t1085_i3c_probe,
>>>>> +    .id_table = p3t1085_i3c_ids,
>>>>> +};
>>>>> +module_i3c_driver(p3t1085_driver);
>>>>> +#endif
>>>>
>>>> While looking at i3c code, I found module_i3c_i2c_driver(). Can we use
>>>> that function to register both i2c and i3c in one call ?
>>>>
>>> Answering my own question: No, because devm_regmap_init_i3c()
>>> does not provide a dummy function if i3C is not enabled.
>>>
>>
>> I do have another concern, though: What happens if the i2c part of the driver
>> registers and the i3c part fails to register ? module_i3c_i2c_driver() handles
>> that situation by unregistering the i2c driver, but I don't really know
>> what happens if a single module registers two drivers and one of them fails.
> 
> After use module_i3c_i2c_driver(), and remove #ifdef I3C, and disable I3C
> in config, build passed.
> 
> It possible cause by
> 
> static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> 					  struct i2c_driver *i2cdrv)
> {
> 	int ret;
> 
> 	ret = i2c_add_driver(i2cdrv);
> 	if (ret || !IS_ENABLED(CONFIG_I3C))
> 		return ret;
> 
> ^^^ !IS_ENABLED(CONFIG_I3C) is true, so linker skip below part. So no
> ref to i3cdrv, so linker remove all related codes.
> 

Yes, but I don't think we can rely on the compiler removing the call to
devm_regmap_init_i3c().

Thanks,
Guenter

