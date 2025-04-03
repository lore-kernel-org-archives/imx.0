Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710E1F4706
	for <imx@lists.linux.dev>; Thu,  3 Apr 2025 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682510; cv=none; b=t4rAn8HEEZ7VR2yAkvsGq6IkzaPRcjK7FtVvfTsYq4ybOtt2fSr7SrAyh0/CYlvH1Sr+1S9fczWmdaaJz3G9rVTgZN4NZSMgCGMh5WTZisSwa5pmhLfVYvj7Ilic4mIaQ5QUcwZEEZonqW+V6vgLkbdnxUAbplsm0RwnzJPGPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682510; c=relaxed/simple;
	bh=Bftxkh4bHFoiu3H0g5ZPpdrSHV6AgFSlGYQ4+hfbMdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRZktukGjbk6nlACdP2dUMrYJ6Hk7cnh/EEVN89mrM2gBdp9tm3gvNkzI2NoO/vqQB4W72rN4GfzXvroiO2yKJxQi7t/zyCrtYHSS/RGTWHL0davs12K7UIIDQmm4EYp4Uw8c2tqQYOkqDiG7LyaqnQAQFZhdjKFCCXBLRLtIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAAzyO3H; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAAzyO3H"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22409077c06so12027345ad.1
        for <imx@lists.linux.dev>; Thu, 03 Apr 2025 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743682507; x=1744287307; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MPG36/Xl3AvNG1FiiDUMt54TrdxpwOFTfcyH2y+w3F8=;
        b=SAAzyO3HHnNLMmZBsgOotpuQirHVXOeZ7Lx79qMFDLRUm9LkSRnpO0TdyL7tWIUHFs
         vAmtYFfnn/NkmPw/00F/aBr8VNZOehj61Keju7gWqdlF+kyiiceVSp148oxQ456YEI/+
         eq/wgB3dIlBn9N38cz+YFpItfxSkpgF0JBx8T41/g9GiaH9Pk7+owpDKaKuTEyss+BQs
         UvZUO9vUc/nCaNiGYKXoua0IWsgFiab1EBcTR2r8dY4z0nwQrhGtjtb5bbKF7YAmBGC/
         vfyBXBtSxdYUoVlVI/QrUu2+bpG20DyGISU+Db6t+MCVq7iYRSl41cs7iwSL8/x3hQ3P
         yVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682507; x=1744287307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPG36/Xl3AvNG1FiiDUMt54TrdxpwOFTfcyH2y+w3F8=;
        b=kJB1Nq61X5jynDV3J/DEevJ/8YLwsnqt30NbZS8NMvWVhgVFZzBWxk3DTnxxbuSGMZ
         QiB28dm/WgWXG+3v9qb3sIA9a3WH/kWyCL8nzcp90+GRQ76Ek30lC7zoWwlzMznZVpj1
         iDlPwT2zL366uwiG3zQAhrUPEA9vJYN2kQWkH4ohxWzT4lXNjWpkh/AL0eB4RnPIAwl5
         xWIbyiCTtjTKrXLAeNk/0llVm6Y/96BgSco4qDRDfZqFAIJu5WYTEBCKcsDg1bG1rb0S
         OE2dErwn41+x5fnh5hnehRVVLW9nTLnFUlLE/3gpYtakPAJpWgKLQygcCjxC7cpQwIRz
         VcuA==
X-Forwarded-Encrypted: i=1; AJvYcCXyFOw3ZEVZwlPPLtn1wk37qwuAM6CA61gFcTw+lrJXAjt2bgL4Amiaf1FUzgPjcVsu6Es=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfAkPpDyXIxaT7emrZ6s+NNJ/GjjNdojijz/LLcD7lfgqp9xvT
	rZS3TqWKl8hs9kttHU0e+QoaQRzHp+RuxyOCaqntXkaSB7QkC7Ve
X-Gm-Gg: ASbGnctmaSAYDsl5Q8+7/KAOnK6hEgEZFl/1T2iviu3kPWencsJArIErZUqiAzSpO6T
	sfsePopZ0rmgn5wo2hkf7YNPoMIll1/orhnBfMR2HYRkTlUSKnnaJl0ety9y+c9IE11DFTS3YpX
	LlsKG9NOUrX8doAHMz1tqknEcpS068fGngvkoig9xIffzutjg64nA/GELAomnrsDP6sjCesgKeo
	ER12v4hrVMaxCyTcn7/2VMhruYJBR4wi3JJAWSKusOhOzXphA+VKdAo4hMeB+Qfe1Cb9x0mUcgL
	gCN8FUw8T/aYesUsj8iaSbVAzdJIbCHxqE1NcGEptSkzIlaRfPN6vMyK2cxiYa9vDJlLH2YrAIs
	b2ioLVAuTOYtm6ao9vg==
X-Google-Smtp-Source: AGHT+IGNTOyNKFX1ox2cARvuLnsrRIZYhN/3/6mcnFnVhog2TVj4X+gtJH0rjiyodRdh5fgAkPaLfw==
X-Received: by 2002:a17:903:1ca:b0:224:24d5:f20a with SMTP id d9443c01a7336-2292fa1add0mr356936755ad.48.1743682507345;
        Thu, 03 Apr 2025 05:15:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866dccbsm12632115ad.176.2025.04.03.05.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 05:15:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
Date: Thu, 3 Apr 2025 05:15:03 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Florin Buica <florin.buica@nxp.com>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 03:15, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
> dedicated voltage regulator.
> 
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   drivers/hwmon/ina2xx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..ab4972f94a8c 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
>   		return PTR_ERR(data->regmap);
>   	}
>   
> -	ret = (dev, "vs");
> -	if (ret)
> +	ret = devm_regulator_get_enable_optional(dev, "vs");

devm_regulator_get_enable() should provide a dummy regulator if there is
no explicit regulator. Why does this not work ?

> +	if (ret < 0 && ret != -ENODEV)

Why this added check ?

I know it used to be necessary if regulator support is disabled,
but that is no longer the case.

Guenter

>   		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
>   
>   	ret = ina2xx_init(dev, data);

