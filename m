Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC81CA84
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 04:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720068613; cv=none; b=nC7jSxoquz2twfGG0PVrJIhLnF8jYS4o15oTCk20vEHrRVRr42IVs/yhzWv2arWtaQ9u+tjukHg4Drv8gqA48HDliOMuG67HtPOfbPjiyveifV/M5uT88wn9Kof1NXx3ZXB5sh7n8KiDFOacVOs+WiQZXfutdKifZekMacDkGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720068613; c=relaxed/simple;
	bh=uimIdKA0TrWa5z8++8K5fGmiw3AknKo2NW+1PuMJTlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHTHPVS+EqjLK0UjSqFJ2T8jPleDnqCTsjd7qs+2WY3OITiyw2M9D7fnT2pvkweRW/Xzmk0bzUu1HagFb6K1eWF92GyhCIZpT5nHS33EzVSOfVEmc0kO66IwBepkHM92Siw6xJN7dGhkKZSj6TDH6GcWS6Js2LGnq7onpUZL/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE43EmyV; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE43EmyV"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so2080381fa.1
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 21:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720068609; x=1720673409; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0bROoDmShRfYVJWcxUuDLMgaTkSSIsgbDg3S3gFNUs=;
        b=bE43EmyVj1HQ4LaQXmoGAl+WNrFhSWPuSs0hNU63hbNVvL44LA0cT0vCebGp2bN2+7
         gmjdgZQeQ5Xkc69jvqE3K8Ew7Dy+BBoGGLuo5d6cURNm3efoO06FcvCqY9m+RlI1P1kg
         U4d+X6cnGyIpo6FE/LH/SxSpzaBrXOV0z+0z9YH9764uEoHDhGptl3v6L5y5AKtZLv2I
         n0B46+uro15f+dQLwNuca9lM2/0H8oiyI2ZEPsskDrxzN4LFOhjHLuRekl+6OxzEbIJm
         DhrlXPPwTCBiYZddCtx1zZw4U255+yrQzuTuNbzUvntaGSwON1xaoe/1IfQTE/prtXmF
         AYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720068609; x=1720673409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0bROoDmShRfYVJWcxUuDLMgaTkSSIsgbDg3S3gFNUs=;
        b=X5ui5hma+FyioluEYLgA2MNfvB3Qus/Ms5Vl+eAeyrde/5sHmYTgqsKyF4je6ILNrh
         cA7hK+QF/K1gtNghhjhR2cF3sXeptEaMi5k1tzdv47A3z4UrDL959v8blW4EtOkwXpJu
         nSZu+1JeScbPxqpKQX+g4kDbCYom3S6r60W1NH1l81i48aEzJf47OHVV6BrBJ07Hsozf
         skjkIxIpMYITZ1aMDW1CR5+4WqiqJtg+QVpRaMqWIcSKrXp5OerHFGCks5BWu5CXZgjc
         BGDCLMwIKKXYou+mInmRvDVZ9c+6QUcYaqp9LOEOINxmztsdWnSLGhMnFn2KWiGUU6mL
         fhSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxdQvDk0Z9sWbolU59HpgH+A6CZt2W6d2eyF96qXneyGglEYlP06EUTK+raF2FLvmMRE1u1ufzAUWNTN5BzCOVQSWl
X-Gm-Message-State: AOJu0YxK69OhepIR7a6P/TphkMpi703mH8nVytpm1l8XX2m7TbbAB6Kr
	ECkRcCpMuKP3q/c3OO0wbV7QQh/Rj+xaZZndqnDtBP5z2FxQ+Vzg
X-Google-Smtp-Source: AGHT+IEHJ/ykgTHYMcUkN63qNzxJ9bqb6cfleOPZzzFBtF0u/7T8g8zQl8zXAPBuMB/j6J0C6id8ug==
X-Received: by 2002:a2e:a497:0:b0:2ee:8777:f868 with SMTP id 38308e7fff4ca-2ee8edc2deemr2275391fa.35.1720068608661;
        Wed, 03 Jul 2024 21:50:08 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee871e7a66sm3138181fa.82.2024.07.03.21.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 21:50:07 -0700 (PDT)
Message-ID: <0acd9da5-80ec-4a45-b00a-8e28ab4e345a@gmail.com>
Date: Thu, 4 Jul 2024 07:50:05 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] mfd: rohm-bd9576: Constify struct regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
 <20240703-mfd-const-regmap_config-v1-6-aa6cd00a03bd@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240703-mfd-const-regmap_config-v1-6-aa6cd00a03bd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/24 18:37, Javier Carrasco wrote:
> `bd957x_regmap` is not modified and can be declared as const
> to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/mfd/rohm-bd9576.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> index 3a9f61961721..634c65c7d108 100644
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
> 

Thanks a ton Javier. This looks good to me but if you feel like going an 
extra mile while you are at it... Do you think this could be extended to:


diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
index 3a9f61961721..17323ae39803 100644
--- a/drivers/mfd/rohm-bd9576.c
+++ b/drivers/mfd/rohm-bd9576.c
@@ -57,7 +57,7 @@ static const struct regmap_access_table volatile_regs = {
         .n_yes_ranges = ARRAY_SIZE(volatile_ranges),
  };

-static struct regmap_config bd957x_regmap = {
+static const struct regmap_config bd957x_regmap = {
         .reg_bits = 8,
         .val_bits = 8,
         .volatile_table = &volatile_regs,
@@ -65,7 +65,7 @@ static struct regmap_config bd957x_regmap = {
         .cache_type = REGCACHE_MAPLE,
  };

-static struct regmap_irq bd9576_irqs[] = {
+static const struct regmap_irq bd9576_irqs[] = {
         REGMAP_IRQ_REG(BD9576_INT_THERM, 0, BD957X_MASK_INT_MAIN_THERM),
         REGMAP_IRQ_REG(BD9576_INT_OVP, 0, BD957X_MASK_INT_MAIN_OVP),
         REGMAP_IRQ_REG(BD9576_INT_SCP, 0, BD957X_MASK_INT_MAIN_SCP),
@@ -76,7 +76,7 @@ static struct regmap_irq bd9576_irqs[] = {
         REGMAP_IRQ_REG(BD9576_INT_SYS, 0, BD957X_MASK_INT_MAIN_SYS),
  };

-static struct regmap_irq_chip bd9576_irq_chip = {
+static const struct regmap_irq_chip bd9576_irq_chip = {
         .name = "bd9576_irq",
         .irqs = &bd9576_irqs[0],
         .num_irqs = ARRAY_SIZE(bd9576_irqs),


Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

