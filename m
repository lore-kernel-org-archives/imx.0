Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA0226D17
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756723; cv=none; b=MigTihOnDRwjhLHtR1kH85p0L8Px9a3hjmopnQO6iY6ou2qhVn74DQNm3zNhkH9NPdRLKF2zA15LiHgzLVzo2nQcjCsvhpMU4icn5EGgUT2a/pi/rTENlAxQx3WJZzeoejkxs0JuKRZfGMsHKTRq4GO099NmfGjtB6rT0ALY/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756723; c=relaxed/simple;
	bh=GS5S/kAL5cB0dyezw9Y2bdHtxdBpYhgJJzuBS8KofsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8NS4x6e/7Dl3E6ygGQ4lBDC19e3UMG7yX4UPutOROgvE62iNoH6KW8rx14Sv8YG0J/jctYEbffGIIj20bcSUxo9TkMv8yHmKYZ6wvDDYV6PdAjDBru+RLISXiABaqdJbxRPzNahDYlqkPHaE+Urwi10MVbGYHccRrM3LDkzksA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhRSx7fx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhRSx7fx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b312a08a2so1037410f8f.1
        for <imx@lists.linux.dev>; Sun, 09 Nov 2025 22:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756720; x=1763361520; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7kSQR2mHljVM9pPmspMiUraHJjkPCCeKTaNFeu9c9xc=;
        b=lhRSx7fx89UbzW0Rd75Ktg/fD3Mblw8JjZhITH9rQsUnWDLYTkvaMeBR131j3ZNPIo
         zN2+oNnV+r+KFxYsAhqifPuwNP3lTcgW1gCnJD5KdDrvTBqWKd9RmDnoevBJKSfQW32k
         A/YgcOw52siVDljTCjPMs8PDcDcRd05am0icLfnkQIkm2t7vyKHQIEJmDJEdSBniuZmq
         sCnKArAhk5Hrd2a5ethqykFdYDOko3vG9O8yH2rWKXo6UWz5PfcQ98HU3YilYAwpTVP2
         ZCXWkwbN4qV58bvCk0vFXMG1TxcmrjoMkTczCbGsYwjolKuw8ZuKl7S3h7eriTqByTys
         M2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756720; x=1763361520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kSQR2mHljVM9pPmspMiUraHJjkPCCeKTaNFeu9c9xc=;
        b=F9ZwHKMqAU25z3pQ8eGr2BRWNChCkzsMSXP3IkWk33HgCHZavLrE7C5pE1fhDyglN7
         InB8+sf2SIrLNAHKiwKmB/ZuMU5gPlcgmWk9Z3zaxw/RZIE7r3mV3YUMe8E0ODr3hPxl
         1E2KFPWwXJGgaTDsMKxaboU/6nycP/S93tH7OJ0T9smmtqnqQ7XXTWvywcNLqebteW8b
         oEAStiM4OWsYfTYkY5HeGE0TYoHkQuEd9vdhm8llJRRjI2Jn0Otsr9wr0+2N2BMNDhUW
         9ftLJ1UEJWTVrvpSN+51suGtrbaPmUPKjqT3L557+oCyi5oXBQ9B3SJzZ0FzwW0PLxwq
         TJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3hp9qhYop0X1M4TLtRjkrpm2kJ+Lm1nhWp40WkUEqXJO9ztUl6Lt1U4/j/N18tNPlZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDbqU42QxikSV7BQtX20EjYZZXwC9q0ybocli1eg7wHMy8TH3W
	Iy/jdOqEgXqPsq9bDxobqJ52mcxGtD3unRYsi5S1AOd9Hxf1NUYH/R2FKyL8LlggGVE=
X-Gm-Gg: ASbGncugxDjZIbDpA4skzQccsub2+c3ykpv3fpayayUOS7neLXd6kUmQSXXCvQUjVPR
	g29HzVobXdqsTxL0AQNj0VbAh/iC1aUgns4GDIdjzts5JBoSnvmh15FbozmlQSgJR21SViy7guz
	/i6xsmnsBbVz9Jr4aC3nEHGp2vHuJAT5ZV9QlOaCIekPLOZGrGZ0quN+dvS1urKXDepBCJoxx0L
	aCjPksnlSWZSEHB6lsdrchzPICLbI4FzbSDKA5SmN0T4MAuJ5yqqwno2j20MxthRhHWuP9CZo3k
	nemO4nmbj5nrIEHMiFCdEo4UEJQqQ8w2Qi5rV8TAz2LZshQNBt4V3lGB35VEbC1Su1f4TPgSx9C
	Sh0ODPVU9Ct+f8P6lRkx/Grsfyf6W0fvys+t5B/Dz9J/kYLUBhYlfXWbOAgoTogTcNNMdPz+v9N
	Yj/fObcRsTNER2nbju
X-Google-Smtp-Source: AGHT+IFMcnA9pYYlnbLP/XD39suwrsBDerGX9hKDXL4+G1Ps4KoXb3zZoLCORFMf9T8PgOyp+I/FKQ==
X-Received: by 2002:a05:6000:3107:b0:427:914:7468 with SMTP id ffacd0b85a97d-42b2dc1e528mr6060266f8f.15.1762756719387;
        Sun, 09 Nov 2025 22:38:39 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm20181653f8f.39.2025.11.09.22.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:38:38 -0800 (PST)
Message-ID: <4479a34b-58b3-45aa-9d2e-5e2a64f61e9d@linaro.org>
Date: Mon, 10 Nov 2025 08:38:37 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mtd: spi-nor: micron-st: add die erase for
 mt35xu512aba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-2-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-2-cde50c81db05@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/25 6:02 AM, Haibo Chen wrote:
> mt35xu512aba do not support chip erase command, and it contains one
> die, and only support die erase.

does this need a fixes tag then? With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>> 
> Unfortunately the die erase opcode does not have a 4-byte opcode,
> here forced to enter in the 4 byte address mode in order to benefit
> of the die erase.
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Also, would you please help us with SFDP dumps, as you did in the next patches?
It helps ups keep a database and update flashes to get rid of the non SFDP data.

Thanks!

>  drivers/mtd/spi-nor/micron-st.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 92eb14ca76c57f29ece1edb3fe652c56d1c2888f..89cd146095584ddebdd258a186f6398b420e5800 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -159,6 +159,22 @@ static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
>  	return spi_nor_set_4byte_addr_mode(nor, true);
>  }
>  
> +static int micron_st_nor_one_die_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> +	params->n_dice = 1;
> +
> +	/*
> +	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> +	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> +	 * consider the die erase too. We're forced to enter in the 4 byte
> +	 * address mode in order to benefit of the die erase.
> +	 */
> +	return spi_nor_set_4byte_addr_mode(nor, true);
> +}
> +
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
>  	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
> @@ -189,6 +205,7 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
>  static const struct spi_nor_fixups mt35xu512aba_fixups = {
>  	.default_init = mt35xu512aba_default_init,
>  	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
> +	.late_init = micron_st_nor_one_die_late_init,
>  };
>  
>  static const struct flash_info micron_nor_parts[] = {
> 

