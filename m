Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A82BE02C
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762938472; cv=none; b=uQRVrZWQlS/VnYz9LvuF7tMgu3ShzA7Y06sfPXXs/FL+nNRKF7giM11YKYfnYA8EmpjG+DuyfWLNd3GTXlRbjmGpFlLWVJRX+2C/0qAU9boUciOrH1yqEVDHC4xGaN9t5Uvq419S/3Ijw29gxrWes55CDmyRgeI4NmsuumbaRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762938472; c=relaxed/simple;
	bh=iLZmltUDQPrrhKihjCC4ei9e3XDEeX7Dysw2ockOiqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLWU/AHWWJK1f6IE6FL9aSY2f884Q7HQ6jITzLiYMvD3kSEh0Rd6OMDGTHoUnpBzHdD2SDa+QKgygcOsW0SqAGYJXsAbh1sVe8OW8DFg0r+0r1950mLgJdM/ykdeRoqqa+dq9FPTUmJHvBugFK6kqLG5+MP/wyTJLb4qBIpZzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/Igqzvg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/Igqzvg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso457551f8f.1
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938469; x=1763543269; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZGbcTOXFvtZxg3sMQLwS6prNPL/GN53EHQzV1EWATA=;
        b=n/IgqzvgnB4IJzO3RLtrS+YeBc+gv2MCpPIc8MJas+cb/z8Fi+MZX/JqzQdMmQOcoz
         OJBCO0GkiPHxhc8NcC6q/2UzLDRym6hTuBJh5CSoaHMiyiifgAfu7fI9uX1OF6CABnF5
         miInZmZUSFu1NZ3J6ilnqLKMnAG5Kjj1EaD1KJRI/h5BKDO5lejhiBhzy8nxJP+ydz/s
         CmuOUvcIED2gjiFFTPPdDfYq35666GZYikhCXTd+WkFhq6Ufe+f+GAefLZ6VbkuH+OLy
         nQBW0L9YTiKlGsKHRyGXmKcv03v0LlirEoCO+kUVilaVaZg2mOmyTWfcudkoUAosvxfB
         5R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938469; x=1763543269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZGbcTOXFvtZxg3sMQLwS6prNPL/GN53EHQzV1EWATA=;
        b=REFou+2x0km42oqOaoCS2Xk870qfJ4UUMQrW9g8JGs3tvhk86p4M2U3eTxZt1MDub9
         6RI++30BdVCo5TmoLdrNva8RQumi1ATJrTl1PFR47DDD1n/mbeZ8jkeicKX0nCP3k8dM
         MHR4g9leJbtRhQ1Q7/KHESYSE8X7pivT0U2iEOnHy4+ZHhGCeTzph2+4WOmKbzHN4EEq
         /Q4qnFEAhWbUbSJOlQ+SBZlmQi02YuYbLviu65rh2W2C2UE8ycihNINbv40I8jkD8WqU
         27tz/dn04JVXU5tfuekjvENKB4c0TRQvp0gGxokmbZZ4C//oHKFunUEOGFDsKfGCwsgL
         FlLg==
X-Forwarded-Encrypted: i=1; AJvYcCWvME3RY9cweLyirG3VMfIeTeREn6upLr1bY8Sh8rjfUGfoupUBOFzDy3DBfCti2BRqHRY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdjq5HVOHq2CgI/14Su8XUk6fHSXK9HB7QVngd3qy72lmrDj1U
	fm26+W2kNM3GWt7cx8NGBb9DJ0QPwi7fteefAO63rK/ofps4meBhg+Vh+EZQpuKWBaU=
X-Gm-Gg: ASbGncuT877WpGrzgll46zUQM3v6xNhvePFsN+8k+FPJbpY8dCJlY6RflyBt8hPqXE5
	/VV+lmQccr6u+i6goKA/ynq+K2D2KJMdATXpCGl/D+vpuL/LUMP/RLHqXP0mq1C0OWDA9PbSqoM
	DaJcXDG0/V+/AUH35RSNbpNpnBcyMBNLHHaHwPAhFwvCaN3SQElMaLRrUgFp4wVvtcSgY8jr0gL
	8fpO66OL7f1yrlXeq14zIB4qCaiyezrNmfSSHmq5hOtUeiZWSrgpOAf9v5g2LJ84iYUW8Vj6Vpc
	S9ZbV21Df1AK1hmYk9oO30/RTDesFOeWLA/TM8nlbhuo2AmSIbrOtnhuFT9jLMaalKoVg+JJPxm
	vF7UL5RGubdrHJiE0x7kW8D7nDD4n13Eez8WSASrkurrKHuQfrHBLQDQDmOb4cKoGT8m1QUGsXY
	B/Qw9kHQ==
X-Google-Smtp-Source: AGHT+IHJgyfCXCMoxcj7q8e/XHfaH+bqMlUfgAoObC86lK/8KAn1X6MgJ15lw0a/KRXGwmsb0fiiFg==
X-Received: by 2002:a05:6000:228a:b0:42b:2e39:6d45 with SMTP id ffacd0b85a97d-42b4bb98862mr2197431f8f.15.1762938469076;
        Wed, 12 Nov 2025 01:07:49 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm33109625f8f.20.2025.11.12.01.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:07:48 -0800 (PST)
Message-ID: <76970e66-7191-4e33-9def-4f28c414a125@linaro.org>
Date: Wed, 12 Nov 2025 11:07:47 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-4-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-4-20aaff727c7d@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 8:48 AM, Haibo Chen wrote:
> mt35xu01gbba is similar with mt35xu512aba, but with two dies.
> mt35xu01gbba has SFDP and support 8D-8D-8D mode, but SFDP
> lack SNOR_F_IO_MODE_EN_VOLATILE, so add this fixup flags here.
> Besides, mt35xu01gbba do not support chip erase, but support
> die erase, so add that in late_init().
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> 
> ---
> 1) This mt35xu01gbba is populated on the imx95-19x19-evk board, was
>    tested at 200MHz using nxp,imx95-fspi SPI controller.
> 2) root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
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

SFDP above

>  		/* MT35XU512ABA */
> @@ -193,6 +198,13 @@ static const struct flash_info micron_nor_parts[] = {
>  		.mfr_flags = USE_FSR,
>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>  		.fixups = &mt35xu512aba_fixups,
> +	}, {
> +		/* MT35XU01GBBA */
> +		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
> +		.sector_size = SZ_128K,

you can drop sector_size, can't you?

> +		.mfr_flags = USE_FSR,
> +		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
> +		.fixups = &mt35xu01gbba_fixups,
>  	}, {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
> 

