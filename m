Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40A2E8B95
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756932; cv=none; b=nlw3tbYJ4QWcmaKnqE+bIUZuVOtRnDwuXvHtIflk+XcXbsQaYMKoJGHXG9BrCeyTGZNbt4yDyEEzxc4c4ZnrtE884EeLq9hb8HXphCtbtNo0bEN7re1UERzYjuildPwX+QJF2GLgUXxvqbvVZee/eBqEUe3L0QdKIc6BX/N6ZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756932; c=relaxed/simple;
	bh=5mmjX1IaaDVJLVWgVFdt55MCv1YS4eHSLixMCjLkZ1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dk3lhXQQhV9l9pqaWkSylosMl4Hj5cpq8df+j4n7n3gO8Qb1E1hdCKbeGr3KcnZOpZbiUKyMa5nt5pbUYGOI3BPeWsh1ppcI2BSVhdRlK412LPC9J4Lj9SSEkO+Q8zknWomTUuFj1JOF74WDjag/x8C1dLE/QcemfLSwSD9elLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bflEWlkq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bflEWlkq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so31304545e9.1
        for <imx@lists.linux.dev>; Sun, 09 Nov 2025 22:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756929; x=1763361729; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6bovgW6M7IaME8m+3MWwurxo5DAnDQ6F4m1f8PyL1M=;
        b=bflEWlkqSvxSR8U4xhLqaEb+1+DOdBaCJFg8eTzT6z0xf4+PtOXnrBJ2+aY6wWNDXM
         yTQ4LmWTLjCo8Snp+Tkq0WNNe8mRURjRFC8Q7J9oJn+naLgROlYbves86rGMoBUCWT+o
         QBfU2yCyXeECciDSX4GZ+jsm8Q9lxZcSRJI6UQ2sfQ0SGpGmFbyZfQl+wSRi3/w8uPbV
         KRbVVWFggCRAWHNTxjk4ML4ocnZ9p3EOUO3ZnHkJGbtkeUT3R5fXnC0o+LkM0tHj/4Rd
         DlXL0xhK2+pMr/rzv2sNJdFXxkKwGvUkU+7wzXAId+tSbSNETKkN/KPRn1W91S1YLxGo
         0kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756929; x=1763361729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6bovgW6M7IaME8m+3MWwurxo5DAnDQ6F4m1f8PyL1M=;
        b=F9oSINiNjAo81OVMrUkAEizgLj8Thpoa7zRkjMIbXc7MosnhSQ5d6Kj88BH89powV6
         LNxeSnMYHIUPl6ErlixnsHrRACA4STiTr/JsfIGZlC12/SZunGEMLGd7yVewC4hVDDfo
         X1U0hXvCwbVc8x+qPm/GJzDclE3O4rZ1rIbYnEZOUMFF7tl64HKqXQbBYp0Tk2Na+dtg
         en4SUBPb3tzw3ocfcdSHtqTzQVq29jtqwuwgVvhVLHGMJwKsYbMJcE5RTP5VUdDN2OVi
         NlStC5tb2fG9FpozMcZXm9sXAU/94/Sl2Lmg0IwPi5lFOvnhnbj/iymt18QqfT3bArKv
         jDtg==
X-Forwarded-Encrypted: i=1; AJvYcCX/DOGVzDIAlhCE5NIz2uJd0wdw/AROJmGiyU9Ot1W2G/uEdPoOYLCwGk3mb3eASMAhMKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOSpxUKBhkjjkw+aDPXlpJ7oHWy0jxZIz1jnKFs8MvwcNgd+5U
	gOM0F89GmlxrpMhl8AGIZUwfrpBh6dw1lKxQyT47+7JpEG7NrYZ30IPS7cEJ+ww2HOo=
X-Gm-Gg: ASbGnctNxo014Jc2h2s+5+tTHi/Z3wGxC/70TYPLxNWjDYNx4dnRiI7dNAC3Rq24VAe
	LXG1uTqTMYPpWPMM0zlpDog00/nkt4M0ZLj3IVbMck99yFHApMiAqpmMhueYCCDk8rQfc/17xC4
	eiIsx9ou5fObD6dzMB1W/V6jX9cn/n0OYZKHcq835lEknM7GkubOdbnvjjUcTdU/S4zqN54BOty
	xsy98QUuZR6P0GNAD2kEvJRoMY9kH+dRM6vEyf0Q9Ayjh0zpa7Tf6DjsagwRRJ0qRcNmcPHNlPT
	AkNptQIIizM4LjU7LxMdWB0c9voyQXM0DQhuxBzA7CrSOYlvNaOSMlYNZPP3IrOyWEB84Fc0X4a
	dKCkN15RYeT6NRHb3W8JchSq/SJQY9HlGuwcPemuE7osSDsl3zS5Rzo01eZRNvHszVPu+PCVN1x
	Y1Tp0iWmD7DAcgzUnHSgln2ZeK3QY=
X-Google-Smtp-Source: AGHT+IFeQlHe6Lgxh0t0G+yg4ltlGLrSe2rLWiTzLA7NtqazJKMqLz3Vmd4kQU1Tog7Gnfuon0XUgA==
X-Received: by 2002:a05:600c:1c8e:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-47773288fa6mr64526045e9.34.1762756929296;
        Sun, 09 Nov 2025 22:42:09 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm20193170f8f.19.2025.11.09.22.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:42:08 -0800 (PST)
Message-ID: <b046d19f-6e55-47db-b7a8-6c8766da2e7f@linaro.org>
Date: Mon, 10 Nov 2025 08:42:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-3-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-3-cde50c81db05@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/25 6:02 AM, Haibo Chen wrote:
> mt35xu01gbba is similar with mt35xu512aba, but with two dies.
> SFDP contain the wrong size, so define the size dierctly in
> the flash info. And it also support 8D-8D-8D mode, but SFDP
> lack SNOR_F_IO_MODE_EN_VOLATILE, so add this fixup flags here.
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> 
> ---
> 1) This mt35xu01gbba is populated on the imx95-19x19-evk board, was
>    tested at 200MHz using nxp,imx95-fspi SPI controller.
> 2) root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
>    mt35xu01gbba
>    root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
>    2c5b1b
>    root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
>    micron
>    root@imx95evk:~# hexdump -Cv /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
>    00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........0...|
>    00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |................|
>    00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |................|
>    00000030  e5 20 8a ff ff ff ff 3f  00 00 00 00 00 00 00 00  |. .....?........|
>    00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
>    00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a........'=|
>    00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p..P..|
>    00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.............|
>    00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |................|
>    00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.........|
>    000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |................|
>    000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |................|
>    000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |................|
>    000000d0

you have SFDP here

cut

> +	}, {
> +		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
> +		.name = "mt35xu01gbba",

drop the name field and add it as a comment. See recent flash additions commits.> +		.sector_size = SZ_128K,
> +		.size = SZ_128M,

drop these, SFDP shall handle them.

> +		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
> +				 SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,

Drop this line, let SFDP handle it

> +		.mfr_flags = USE_FSR,
> +		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,

can we drop SPI_NOR_4B_OPCODES?

> +		.fixups = &mt35xu01gbba_fixups,
>  	}, {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
> 

