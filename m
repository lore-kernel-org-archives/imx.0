Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B841E0DF4
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730195857; cv=none; b=VuYxASqvNEG0qkeUGr8wu8oqGqCcztLRA4fY+GR9iS6U5We828VzAIWPuro+wHDouGABNBuycK6jZ/RlIDU9L8s0arMSmA8/+5GEFb+bSMOdClXN85zypxSobAGOUROJWSNLVnJAEF5PjOUR5BlWMmqnwG1bn5oKCPR9/cfjr08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730195857; c=relaxed/simple;
	bh=olqUwa6YUCEmqvZyc4jGc2TK5EVh4TJVBBF2wDX/b7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUXr6WWBqB/uybG2uQdzPOMa9YnqBfAk7TbFiBV8UjnuMV5YpNnNc9TEXSaznTX7svOzpDgDn2u+fgSrS8DoVCAQOOlOHWpYGdthzlmrV7CtOBlRS61/VY/NdNT0ZQXYQ1fzGoxywcXAPe+1g2jwtOPgH53135mr4dTEJJy+8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQj0rK7V; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQj0rK7V"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so3867468f8f.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730195853; x=1730800653; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=;
        b=vQj0rK7VYe7gHdz+w/pMVX6iyxg2MH/f5/KuzYTYj+VUlvQfrygqBN5eKJ0oSh6y4H
         G6aZ3jiLGSX3VcTlIYGLdKuUkBgj+fMWNsmfa1+Neqwjc8uuWx+pIaZxFQwvoivNE6tU
         fCrJa05Ze+65eRAVPcismD9/k78Gu9objWGbS+7Kyd1QBOBaz2t7PWIFO3z2QeZFIpbq
         xRbq1szJqRPOwGSVEiZt5qRMAogOdSxvM8/9OVTCu4w89Ro+PlCcywfVm98qr4kcZFSX
         71U1gFb9pJtsQmPJPo+Sj0/l06daR6iv0GwDov4wXW21KLet1kVrOTM5WcAFGdsW7wX7
         gFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195853; x=1730800653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=;
        b=mK7cLp2mcf3V7xnqX6mSteAX8SGS5jRzc7xVFSyczokvGzAsw5Bgk/WmosjNanbvr5
         VzScgYwFXykdXOXQ5PKQJqb19njuYuIOJMAtfgqagWYk+8v/9+MNJzi+KRs/1rH4HEa2
         3VKLgrNG0rFj4m6ICtaELMdwg0gfh3/Q28H4JZGipA9lOZE88zt/Lua0lo8m38Fux/ox
         aMEY82lgIgpDWdqGxCc1CgUBObK5kF/T97nht9+5ipT6MXj3XXaK3zTf+pBnWmEmaeLs
         rvwZoLczi1CkkI2yANjohoFSXnslR9vioXEppSVfee8FVMFoH4ZZBYKJx77pYH/OxQ65
         OF6g==
X-Forwarded-Encrypted: i=1; AJvYcCXJPb0LBnBS/nWeCuuFAqpui6Jydj87g2UDSKntXciT3PjhgGuOTyyfamxO86A2TDFCwYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkzmVm62ljHAL4UKQLoEoSjb8t4IpwLppp1I8CWeKfCGuFnGQd
	wQwFJSwLOLTN6YEcLRWS0v8dyv4ECXMB6kvX+i7FO/vIJPAFQ1vWYgphi2cl2OI=
X-Google-Smtp-Source: AGHT+IHhmgSstrKyHX2Iwez/d7VdkcjXlscKVW8yRli6oSKJ8qbcBw12V0iO42/emHYeLXIDzokkEw==
X-Received: by 2002:a05:6000:bd0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-380611850a0mr8235479f8f.31.1730195853404;
        Tue, 29 Oct 2024 02:57:33 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bde6sm12026123f8f.40.2024.10.29.02.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 02:57:33 -0700 (PDT)
Message-ID: <470c0b52-17d1-44e4-9a70-5b410ead9500@linaro.org>
Date: Tue, 29 Oct 2024 09:57:31 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: support vcc-supply regulator
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
References: <20241027-spi-v3-0-42e81723bbcc@nxp.com>
 <20241027-spi-v3-2-42e81723bbcc@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241027-spi-v3-2-42e81723bbcc@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/27/24 12:16 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b6f374ded390a0c0429a61dd0579204e0e98bfa1..d95427c4f4d0839c5df348eeddea59582ef99d9d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -3465,6 +3466,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
>  
> +	ret = devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return ret;

This is all looking good, but please move it to spi_nor_probe().

All the SPI NOR controllers need to move to spi/. We stopped adding
support for the SPI NOR controllers few years ago.

> +
>  	ret = spi_nor_hw_reset(nor);
>  	if (ret)
>  		return ret;
> 
