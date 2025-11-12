Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F082DF136
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939280; cv=none; b=R2L+4H0TQXVR2gNWD7KlkSj7i7YUAcw3bzPFCbo7vgQTHaEccR00ezhVOhz6CNFXRjnxAyVkHQsN2uTD274KExZGItLNzHJophN+b7MOIU4Na7Q0yvxV+TEBe3u+FDjec8zvDSZc3etg/VP74EW/sQWQN/F4iG4dho9fC0FoMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939280; c=relaxed/simple;
	bh=2Qa5FpPwJauM2+K/bV7Ipmy84+Vvwqx8tkvxHl3fUKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K25VFEFKFP30MZFjABy306gP3HYhvTQmTaWB40h/WeUP6gw3NajOB+NoD0WlYG6wrtKleL/lfO2+uSCxyAcsyw5yokMZc97PYD3NCbDl9FszK/arbkk8B7xIbF8O6aKwu4PQZ5G5SZsIzXdRmezsWNJykM4KwnoLZd6S3AIN3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rq758Gxg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rq758Gxg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b379cd896so307395f8f.3
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762939277; x=1763544077; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vExX5lYwjZciNY84xOIPIx1RLXQKLj0IP41hX0dBbo=;
        b=Rq758GxgnDzbqqO8cw6trjPsegPbnULnaWpQgtbGE2ocaYzzj6rgL6d2T/3SrqUD8T
         J1+tSC9czbOFwcrRHgYM9+YBAo8Vhivan4qM4DQJ9nyjqL+snFs4f2hncOpAizmT97gF
         +lJ+dc96Nl14OOL/LC/YxF49RTC3rIMxaHjIz4LYG8tGsX2SkWdYNxVGWrO8o7By1gDa
         +8k2siJqoJX7K1Mrnr0OLgpewY6JMhJcxXxnkRxDtt55oqopCq1ABCb4UaexZr/qDcbR
         52W9c+l8cnB7Pid3pJ3/Fv4lC6xIyD3eRvXrSEDs9X5HmW499PEnSBN9rdnK/d63Pl68
         j8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939277; x=1763544077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vExX5lYwjZciNY84xOIPIx1RLXQKLj0IP41hX0dBbo=;
        b=QCaPIdsqJ93D+5GqPfR7J5a5TOlfu9uaOdUfemQk8cTa3gTl41hudbibfxm90U+m5L
         RWePuiPMdJcKmvsDqjPFD8xtJcXDh5f26Fw/qSW/DAtXwQ1I2EgVf8o8h95d8I25ywZu
         /IyFEVJuk+ZvOkGDrmsSiMBgX/9woC7AtumXSM81wyr3DdYYu2my/0WoYDufUY87sspT
         dmAMc+dj6447n5zq2lcOFy3Z2P1tNvVxCba6HsS2cbfb3j4hbJdSmLy9HvL52zaaP+ba
         pDNPpifH/QGPMg446YqoAq7FBSvKzaXWcQoNQ3gNphTY3gHVlqSG2CEih3vgNaBg+KnZ
         D3uA==
X-Forwarded-Encrypted: i=1; AJvYcCUO2ASMxGTNxr72Auxj5JPsk0Ls40108llL9+VOwRynqIPy3utNeLGpQ9dGEEibOwXY+j4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjRBo5Lr2ddOzPXJub5EtEs8cBnbfYFcOJfcb/X5Fk0Thk8LWY
	feLbxuzHfnuE0H7CoMyPO+2q9uW2bPw8NOZpyBn8Si+6m6/hekXG9u8FBM+P1pQs7/w=
X-Gm-Gg: ASbGncsiBQnkmunHqaSRx+HeJ6CImYoSMsLwGIsVfm3Qgl8otR377jM7aUoeG7LoYqE
	kmgUbLm4TAkWwqYVNmLaIx8G50OfKzOr4djH81seSfCjldzQ2lGBdgyWmwhvZkIySLLyEetFkvL
	+jb32/UnYySG0wTBkHDKyv01GiP9Cr/s2PPQjyMRigaChPp7u7tvKIdydTcZIFFG7G+ioblf+rf
	WizEl6ziMxoXIeZCT2r78NJGnR1v0qDjLLH0uOYgl5xqISPZzJxM5swVU2oO0dlNsU5n1NoHTcn
	FL54pYKx2drEHQedNz3bw+Qc2ZCVaj99hdlOaeMOaHyFA1/VDQZwjKSNKbZKXdbSKdmSR1Ag2NH
	Z8+3nH5QNbq6fIgeRn0MJ4dVG0s7jNyPpGTTy+rhC9LFIIDCeXgX/lITnRUuNGcu0T/qEZqX6of
	HhApHZPe+Gz9hrnyqY
X-Google-Smtp-Source: AGHT+IHoGl5ziEi7Ua+rMKa465Ycd1bn5Q+l1lO6xafRsuDtW0ahp1R+CiWWX89YTNLNjpqEi0+GKA==
X-Received: by 2002:a05:6000:3107:b0:42b:3366:634b with SMTP id ffacd0b85a97d-42b4bdafecfmr1846042f8f.31.1762939276840;
        Wed, 12 Nov 2025 01:21:16 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63dfecsm33332368f8f.12.2025.11.12.01.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:21:16 -0800 (PST)
Message-ID: <013215bb-3562-484f-868d-485d0da095d8@linaro.org>
Date: Wed, 12 Nov 2025 11:21:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-5-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-5-20aaff727c7d@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 8:48 AM, Haibo Chen wrote:
> mt35xu02gcba is similar with mt35xu01gbba, but with four
> dies inside. According to datasheet, it contain SFDP and
> support 8D-8D-8D mode. Add comments here, remider to change
> the code in future if has a chance to test on this chip.

you'll need to rephrase a bit the above> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 6d081ec176c37249e5ddb724b61bd70f68088163..cc053b4d615ade3f12068618f8355779561dce55 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -206,6 +206,12 @@ static const struct flash_info micron_nor_parts[] = {
>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>  		.fixups = &mt35xu01gbba_fixups,
>  	}, {
> +		/*
> +		 * MT35XU02GCBA contain SFDP, so no need the size
> +		 * and no_sfdp_flags here, should similar with

this is expected for all the flashes that have SFDP, so no need to
specify this again here.

> +		 * MT35XU01GBBA, but with 4 dies. If someone can
> +		 * test on this chip, can change accordingly.
> +		 */

How about we rephrase this to:
The MT35XU02GCBA flash device does not support chip erase, according to
its datasheet. It only supports die erase, which means the current driver
implementation will likely need to be converted to use die erase.
Furthermore, similar to the MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE
flag probably needs to be enabled.

With something along the above lines you can add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
>  		.sector_size = SZ_128K,
> 

