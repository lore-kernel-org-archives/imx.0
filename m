Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6D4CB28
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158537; cv=none; b=G3BAA2JNVOgDyVpa0CNR8/kYbxGj1cLSoJwdIjeSK4rdMiq2EG8zfocrXTvV4/ruTxmsppuTRLscM/WhOXMacRRmyNKcKBh0HXafJFaM0SXVArJqTi0Wwkhf+s0JUwLMerjxpuulx0eoBRpX2kWWuGKIWDKEjNW8AgAwXrUCpLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158537; c=relaxed/simple;
	bh=2xXlsoTymeXdtVXdGZypDHiA+INDaREfHMbB8LwbGHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTxLc2hJNros5jGEYHorxWAhfpNMULKC7lGaTZ539uXO7Jvl26Umogi/BLi3GpHUUWDCIwdZCdpb2RlnPBFdaaSRXZ5A8U/LGVThRanhQnHqFtDpeszuyrGOqD0vrZYYNTSnraxTCGf6fQZp91ZZ/w8VFyRS70eatfHdL4gHGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHxe0wHk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHxe0wHk"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee7a1ad286so13699451fa.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158534; x=1720763334; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdzePDvp+BZunFZcEzbg9ryWVygXOO8G3bu/1oy3U1g=;
        b=LHxe0wHkUCgNxcSrjPu05YuxWzY182IqXljyPzeVB3O9kj1VYDZbIfJlds6GCcuWw3
         asFURcDTlUJzDvjioXo3XXjw30c96jcxiMcsbM61+h7bnK6SQxTVkg3DV0jw9imQm3ta
         Ks8Ws1vJ6TQ3Qsiy6pCzfs+453AjRo0d1p0zqBKc3tg6uIn1Jnu4mFqF4MjPrXE8SrZG
         zQirLD+IlH+4CePc47QAzZ37KQEtYtcr/v5c9GZxNCDz0grTeUS8wIzek5ZosPJfP7Vc
         2GLJ5T0vpbqX7yR7Tcyxavo1vP4kCdvTDNHrYyMTDzKgAgephFymNIAr2eZf9YpLSpl3
         NkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158534; x=1720763334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdzePDvp+BZunFZcEzbg9ryWVygXOO8G3bu/1oy3U1g=;
        b=fVy69kvn5qGKPX6PNf3lcSD9U8fZoYc9P5uUIXRf3AiUj8og4pTfCQaKY6xIuBdT8a
         XcQLlawsDNLz/tGbW2nS2jfUbYLwPPBjk7syzGhjlUKJH3UdCmtI1Uujc3zp2KsDrAv5
         SL6gKbTLxL5VEmWDCi1qa6jy9riU/W80ELcZjeFzsLHsxD8nGuQwl23DIZROma3gWTQu
         EI8pd1C6B9Yg4cJarFXZ+/23q89ytcuJNIE/feG/m63/kIg11M8eI3M/Mq1YVAwf2P2a
         K/PkZZGZiiLLFTga9TeG6yqOswGCsXS7dopR90TB4+wMFpS7657eJVHqSaFkVM+MCVca
         MWLA==
X-Forwarded-Encrypted: i=1; AJvYcCUE1F1oSLvyRlrU/rRuzwOZLfzIboIPJhooGd/BmmMHDPuasX+JGdXz83U322oueBZD0GcYoxHS5k8ejjVZXuSkn329
X-Gm-Message-State: AOJu0Ywd1tqdhC6B55iAd6DtzYKV+vkuAXNFZD4jOuz/NOdxMekHmczN
	ZHTQzDAcNPNmCoGRfLbjXoul15sLxX7HSLNymkga/oazHfePHw5H
X-Google-Smtp-Source: AGHT+IHy5HQfUA8D7qIJnq8EpH5PvPiRX2gESm+xurT8dL43q61PTzq7H+k6IGRQkbVSwzLIZRkh4g==
X-Received: by 2002:a2e:8183:0:b0:2ec:52da:6070 with SMTP id 38308e7fff4ca-2ee8edff093mr26391741fa.42.1720158533029;
        Thu, 04 Jul 2024 22:48:53 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee51695feasm25657891fa.131.2024.07.04.22.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:48:52 -0700 (PDT)
Message-ID: <c487772e-08c6-4b30-af27-b32d6f5f176f@gmail.com>
Date: Fri, 5 Jul 2024 08:48:50 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/24] mfd: rohm-bd718x7: Constify struct
 regmap_irq_chip
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
 <20240704-mfd-const-regmap_config-v2-14-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-14-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> `bd718xx_irq_chip` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/mfd/rohm-bd718x7.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 7755a4c073bf..25e494a93d48 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -60,7 +60,7 @@ static const struct regmap_irq bd718xx_irqs[] = {
>   	REGMAP_IRQ_REG(BD718XX_INT_STBY_REQ, 0, BD718XX_INT_STBY_REQ_MASK),
>   };
>   
> -static struct regmap_irq_chip bd718xx_irq_chip = {
> +static const struct regmap_irq_chip bd718xx_irq_chip = {
>   	.name = "bd718xx-irq",
>   	.irqs = bd718xx_irqs,
>   	.num_irqs = ARRAY_SIZE(bd718xx_irqs),
> 

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

