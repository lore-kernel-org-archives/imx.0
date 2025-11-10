Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52534D393
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762757168; cv=none; b=GCHhpB6yXMZYG3WS4OgRmUYNaNB494sTsp+5x+tBsj2yIVjHP1vTdK4397Kjr72HueXJGeuONt6pTJo5HkxAq7+O95vQ5vFmsv1A56hrfzOORAxTquC6Kxj/tbZ2l8Mb6lUC7+3VfM1elW8EqsWAk3GLBlUauKw1kS+Qw9Ebj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762757168; c=relaxed/simple;
	bh=lYwuLN473OxBWExBwnMZ8BirNa7UvPGxy7Z7qn7dsis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwEgL377Db0QXZt71FTvOCO3Nd/4y4nm7LQZlZIfxGp0z9nJAsgmDNMcaAd7ooKBzPlNZq1xYi0XYgHjCY7ekV/UY9scn46EJq1943Sd2xgBQQCH7tAaMIPr3+/idIltU41EPW4uFJ4DiAe6GwkF4R9Cxau+FOjwMlMagW8S3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n3pdbt6R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n3pdbt6R"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32900c8bso563132f8f.0
        for <imx@lists.linux.dev>; Sun, 09 Nov 2025 22:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762757161; x=1763361961; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pu1XhH2ZxG6Wd4en1D4CkiVWQG6H8ikgU7y2tqQz8Z4=;
        b=n3pdbt6RmTV6+l2fUmlNPu4AzzQyZTKm2Kxlu4vRN8ittzw8XDRRH22DCYLFiGtdd2
         3skUmCZY1rLpoDHgyUag5oLDX2JSE+8pjMEMpqgn9aHm04Q/FPYKMqMbJv1lxtLru2lV
         BH86X8RvzVYlVmyelrYxrApHA8E9Vpr74/soEabbaDGfnl9NM9RPU4gXwZaSejjlHhrW
         bI2+PnSrdiO1ZDj/6qDRXowTjHniNUkz1wX5s2/ld3f40L+QkEbkckI4pPjpmNNRgqf6
         Qpt43LjbfoPh22XRoHfttOP9ACgoNoBdfgIsP1Q7r7UIicMiMVyR0UUgeMDrqRiTwxnC
         IXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757161; x=1763361961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pu1XhH2ZxG6Wd4en1D4CkiVWQG6H8ikgU7y2tqQz8Z4=;
        b=RLyHa+h5zBDruXP8y6e+iNwmwnDf7jQbIzPTUwX18qrANiJY1kUWWLLMKchZqOS2iZ
         CDtBCu7QD7tIMaio6gEC8K5EtxHHrwQEKuzK0eDvrye/O5d4/Yu6AF0JvO5aDfq+NE/S
         WVRN+3Pvkh4P+ubLABy4aFieub1O2o+izgfp2Egx3QofmvW8XYTE9SoLRnuTInvz0lRH
         nupPbPkxgjSZDqY9c05C62DmnL2TCdeUYwgpubQXbo0Ph7fZNAxFcKDghxpT2QagIbgk
         kZnBZnpKIS+I6TtR24zx8/5yP1XQ2s5EfxB1gBEWyQSBlb9cmhQXWU4pWQZbMw/WTRm7
         jmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxIoLiM8EijM0xoZD/XyrOQZ6m+7QfP4IU8k9ad+1utmIHLrASUtYD22KqalbPfAj9Mmo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhOs90SZLZOHijZesmxDUGJ61izDPZBc5Z4wKTNj9SZbTFYUyA
	Kc2MVcGWl27goZIyraAJd1MEAORdLu2vw5N2g2gf/EfxE4w26m2oELUvmUeNIf/8DB4=
X-Gm-Gg: ASbGncuGAe1OU2HCOGHoDrIF7C+pu0a+MJKJrw7BRITJeIsmesg8Jqg3GUXsb4Tk6Uj
	4khya9rWesN6/o+7h9WxSK/63an7YXac/eXq577KPw2SWmPdU6+qqa+7Kd2JlBVfIDV47GTYvlj
	ioRG2XKFgotePiby9PTNm1vOG3YAeqICVSsuRaAHuPkqZ6bD8jm+Cfe25+9pOF2DvVP6H+PDiFZ
	EGVQ4QcwMFquaotKd5Nm/o4aeE1xxbcqoea1cuGTNfExWy5x1y2pKsk7WW7OOgn+j8WsiZde0Yh
	ZVa842oqUo+oJZcqUM6rOzeNCPHuNbPW2cVVI9gPzq2YcBG5Sx4AoflOC9ZiZTAatEerU+Icihh
	xiocsiWsltpVCjrBAUDX9Wq5Af20fh5sj4a4H5Au5kEJaKngoKAjzOCpexL4D4o0VM7zCZUqiMY
	pIv/vm+UVfquAFPaqB
X-Google-Smtp-Source: AGHT+IH7hyQPKhcZy8yzJus1HIGOBdpu+NzRSyrvlskw5IUKjuHbd1YMpjBQn0eJHTMLn2IbItWT0w==
X-Received: by 2002:a05:6000:1847:b0:429:cf88:f7ac with SMTP id ffacd0b85a97d-42b2dca2e52mr5114061f8f.44.1762757161534;
        Sun, 09 Nov 2025 22:46:01 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927d5sm13577288f8f.24.2025.11.09.22.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:46:01 -0800 (PST)
Message-ID: <7d8b0062-a6ec-43a9-ab00-3e11f0e2fb26@linaro.org>
Date: Mon, 10 Nov 2025 08:45:59 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nor: micron-st: enable 8D-8D-8D mode and die
 erase for mt35xu02gcba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-4-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-4-cde50c81db05@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/25 6:02 AM, Haibo Chen wrote:
> mt35xu02gcba is similar with mt35xu01gbba and mt35xu512aba, but with
> four dies inside. And it also support 8D-8D-8D mode, but SFDP lack
> SNOR_F_IO_MODE_EN_VOLATILE, so add this fixup flags here.
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

please dump the SFDP data for every flash that you touch, it helps
us with the sfdp database

>  drivers/mtd/spi-nor/micron-st.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index f724313f4dd3720908968c670e8d3d58f41c099c..b36174436b7aa0f7768dbe48e4ad4927c08a3d6d 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -214,6 +214,12 @@ static const struct spi_nor_fixups mt35xu01gbba_fixups = {
>  	.late_init = micron_st_nor_two_die_late_init,
>  };
>  
> +static const struct spi_nor_fixups mt35xu02gcba_fixups = {
> +	.default_init = mt35xu512aba_default_init,
> +	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
> +	.late_init = micron_st_nor_four_die_late_init,
> +};
> +
>  static const struct flash_info micron_nor_parts[] = {
>  	{
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1a),
> @@ -237,12 +243,13 @@ static const struct flash_info micron_nor_parts[] = {
>  		.fixups = &mt35xu01gbba_fixups,
>  	}, {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
> -		.name = "mt35xu02g",
> +		.name = "mt35xu02gcba",

we don't care about the name, drop the name and add it as a comment.

>  		.sector_size = SZ_128K,
>  		.size = SZ_256M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
>  		.mfr_flags = USE_FSR,
> -		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,

Whenever you can, remove the non-sfdp static data and rely on the SFDP
driver to handle it. Can you please drop sector_size, no_sfdp_flags and
SPI_NOR_4B_OPCODES?

Then do the testing and sysfs/debugfs dumps to prove the flash works okay.
Thanks!
ta> +		.fixups = &mt35xu02gcba_fixups,
>  	},
>  };
>  
> 

