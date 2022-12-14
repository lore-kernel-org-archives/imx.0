Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6427533E6
	for <imx@lists.linux.dev>; Wed, 14 Dec 2022 09:54:04 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bp15so9483970lfb.13
        for <imx@lists.linux.dev>; Wed, 14 Dec 2022 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kf/hux+ArtQPQoRedrCFEtwRtgKPZb0GFbZ64k8NluY=;
        b=OB10TLoJ2BA2m54sWwHQ1j52swhQ9/eF7gJxTghSP1Hv0A/TIOA+YbIdxR2NcS5/cv
         yQhu+jlzeWA5hA3v5A937yzLCl1ur1x/JL6ne6wqPKZ9NqAdrt1wiNJ3NWJ0kzkWEmv4
         4cSzOzsrwXklN0MmIrlnnWG39HSVZvsQTIymKOHxD546X0aM6Hd9pdsoYwC3ig5uN6B/
         7wE9+nyzwtZGtEuURhUmaPoERPr/58CU2cNvYQreFP8A2jaCl0KspMQ2f1Fl408jm0Yu
         EPhBVkacFlQW0RsrzuyaXIytCPe4THeb8iof9dBfIsKIfaxdvHsLBnXKQ/S3wRwby7J3
         KBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf/hux+ArtQPQoRedrCFEtwRtgKPZb0GFbZ64k8NluY=;
        b=O/W2RYyAocQT3uJSP7MIYktqoODYJtc+xdr0dmACRSCCsSgXEYh0RH6DXsR8w6wSkz
         Bk2/sf9EYrukKZFU1IKJgpXODNfkrxVzP+5o/IcxyHMx3s4MfhZAidp2bLRJr92krBif
         FZuQ+18nv1TZovy7L/RgZwjoyQhQPl45iRxJsYwKmA4DqRfGzz4Z32L5XigBVs7gNNJp
         /q4YBydiJ6EyZ48doRhJJTmKyGGtomr47D8yiSWC9wU8s0haKwlxfSMXbZWXDFxuN+zf
         aUG1g2BzQNSK7gUeBzGyLnylQ5rP/aVVINjf2JBCUoFL/ez7g24vGfCBu7lI8y05xiwm
         wZDg==
X-Gm-Message-State: ANoB5pkEi+hDeT+yrYibml+gZN1KkVKI++wGRvi/zDOEUsOP2+KJOeql
	8DUUCKIhzbP43Q7h++hxoS0qRg==
X-Google-Smtp-Source: AA0mqf6NOqIox3Nt43gjeuE9Ojxr7O32O7+8okMoITereI9k4BJtKKxkF44c+YCv4rwYKI1HtSDA/g==
X-Received: by 2002:ac2:5f47:0:b0:4b5:9dc4:e785 with SMTP id 7-20020ac25f47000000b004b59dc4e785mr5417327lfz.45.1671011641955;
        Wed, 14 Dec 2022 01:54:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w13-20020a19c50d000000b004b5284a92f9sm736065lfe.208.2022.12.14.01.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 01:54:01 -0800 (PST)
Message-ID: <88944b64-5e95-389f-5b47-2046c401f1b6@linaro.org>
Date: Wed, 14 Dec 2022 10:54:00 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/4] iio: accel: add the new entry in driver for
 fxls8967af
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Han Xu <han.xu@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20221213171536.1880089-1-han.xu@nxp.com>
 <20221213171536.1880089-3-han.xu@nxp.com>
 <84bd582c-1dde-822c-48b7-025887fd0203@linaro.org>
 <20221214093214.00000a03@Huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214093214.00000a03@Huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2022 10:32, Jonathan Cameron wrote:
> On Tue, 13 Dec 2022 19:53:30 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 13/12/2022 18:15, Han Xu wrote:
>>> Add this new device entry in the driver id table.
>>>
>>> Signed-off-by: Han Xu <han.xu@nxp.com>
>>>
>>> ---
>>> changes in v2
>>> - change chip info orders
>>> ---
>>>  drivers/iio/accel/fxls8962af-core.c | 7 +++++++
>>>  drivers/iio/accel/fxls8962af-i2c.c  | 2 ++
>>>  drivers/iio/accel/fxls8962af.h      | 1 +
>>>  3 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
>>> index 98811e4e16bb..c3589c3084ee 100644
>>> --- a/drivers/iio/accel/fxls8962af-core.c
>>> +++ b/drivers/iio/accel/fxls8962af-core.c
>>> @@ -127,6 +127,7 @@
>>>  #define FXLS8962AF_DEVICE_ID			0x62
>>>  #define FXLS8964AF_DEVICE_ID			0x84
>>>  #define FXLS8974CF_DEVICE_ID			0x86
>>> +#define FXLS8967AF_DEVICE_ID			0x87
>>>  
>>>  /* Raw temp channel offset */
>>>  #define FXLS8962AF_TEMP_CENTER_VAL		25
>>> @@ -765,6 +766,12 @@ static const struct fxls8962af_chip_info fxls_chip_info_table[] = {
>>>  		.channels = fxls8962af_channels,
>>>  		.num_channels = ARRAY_SIZE(fxls8962af_channels),
>>>  	},
>>> +	[fxls8967af] = {
>>> +		.chip_id = FXLS8967AF_DEVICE_ID,
>>> +		.name = "fxls8967af",
>>> +		.channels = fxls8962af_channels,
>>> +		.num_channels = ARRAY_SIZE(fxls8962af_channels),
>>> +	},
>>>  	[fxls8974cf] = {
>>>  		.chip_id = FXLS8974CF_DEVICE_ID,
>>>  		.name = "fxls8974cf",
>>> diff --git a/drivers/iio/accel/fxls8962af-i2c.c b/drivers/iio/accel/fxls8962af-i2c.c
>>> index 17dd56756ff9..a8944b255a28 100644
>>> --- a/drivers/iio/accel/fxls8962af-i2c.c
>>> +++ b/drivers/iio/accel/fxls8962af-i2c.c
>>> @@ -30,6 +30,7 @@ static int fxls8962af_probe(struct i2c_client *client)
>>>  static const struct i2c_device_id fxls8962af_id[] = {
>>>  	{ "fxls8962af", fxls8962af },
>>>  	{ "fxls8964af", fxls8964af },
>>> +	{ "fxls8967af", fxls8967af },
>>>  	{ "fxls8974cf", fxls8974cf },
>>>  	{}
>>>  };
>>> @@ -38,6 +39,7 @@ MODULE_DEVICE_TABLE(i2c, fxls8962af_id);
>>>  static const struct of_device_id fxls8962af_of_match[] = {
>>>  	{ .compatible = "nxp,fxls8962af" },
>>>  	{ .compatible = "nxp,fxls8964af" },
>>> +	{ .compatible = "nxp,fxls8967af" },
>>>  	{ .compatible = "nxp,fxls8974cf" },  
>>
>> This is confusing. The I2C ID table has driver data, but OF ID table
>> hasn't. So are they compatible or not?
> 
> Due to some evilness in i2c that 'works' as long as the two arrays have
> matching entries.  As a general rule we prefer to have the data in both, check
> the firmware table first and only then fallback to i2c_device_id data on the
> basis it is less fragile.
> 
> The evilness in i2c is that the search for match data will use the dt compatible
> stripped of the vendor prefix and string match that against the i2c_device_id table.
> 
> Nice to clean this up, but not necessarily in this series (fine if it is though!)

OK, so in fact devices are not fully compatible - I got mislead by OF
table. I'll comment in bindings about it.

Best regards,
Krzysztof

