Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A0D272E51
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150119; cv=none; b=PBq8nxLr/+xL1ZL0/zOrOaG2vaw7yoBCo3RHnvNQFReGeQgURltiBeoUAs4s4tKfXy90lekwm2CHVRQqhuLN6X4PQdSyZpr/2rNDOv42SCq4EiE+p4OO+bLRmUGHLKPYWitiLMqesImmCYbA0CKnbL92zTS8Qy8BrIo3Fnkj1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150119; c=relaxed/simple;
	bh=dSd0eofZC3/Gkt8gKUfgpf0S2itiPDG3Tf4+Ys4dvXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy1r8+mLuQnrKwHgQJa5H2D1KnAru6jUqAqs/fnHbakBicoJJ5HqVQO6+4GLpVBlwS6u01irPEKdYBir3EW1ai1vJeyltNepNAWQnZoQvVMMKnbP9ajN0tnRXMd+B40/P5Ae51wyBrq1HxBC5HL8boLU4APbUHgmhMreHn/uZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+m4KOLU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+m4KOLU"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b463f986f80so1374371566b.2
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761150115; x=1761754915; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=;
        b=Y+m4KOLU9y00J+PRgYI+GLE6CeR+JPkYM34SurW/TLgAq1Leivh7vHOOnrcd2gWpkD
         yaXS44qm5ccGcQGg2fLXgJHPvCUqEnnX9U1x96vw2y5uq1VO2wsli/WO5ap9uRyNQ8+K
         50zbvxM5iz8klDzQ+fPTSeKXvPCgxnRN02wN/gjGf3MvJuza4fG/D+N3yEtYqlIEq0wh
         6MGEDJX8gnoGI1beR+itw051TfJS35NO1AbNfJ+G4NgdKQ+DP0CzxjYOMfD4dyOcaCME
         VyO+QDfNwQrW8jQtRg9D7M8Ho7VpNHCtLTyBud+DzI8ibeuNbI5wa5749EkeudFDYp+z
         CcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150115; x=1761754915;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=;
        b=RTQkEyZzU5lNdRVGKtMVw5fcds6rHrjHcnh+s3QcQBXNp6xrgBVlPcIakbZf3V7C5G
         oJK4m/eLAW5/PP0U/0Ga9nnDmadzhCkpKKQx1otg62/sj/SFdLIwGCdYahDKGxLboxr8
         1ryAwC52tWPWxbpcYCPHWIibNlfZ8SVvUiwQ+d2wzaxmOyhALGnS5wU6eOHgN5trspbf
         /P1ZRkQaxXfGXecwPnJyOBAZvEQi25AttPwa4HEtYM6y9Io0qFIIDxbp/CdHylXYYSKP
         u3C0iT6qiRVH1Dft7gISCFXNpyrcOvReVutFcMqZAOMsZLd4gsuNY56pViQSPFR6NIF9
         T1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmLZjWc9i+2tbdNu0czNwDu+qRYmcAKQerSBREJCKpIqCiO4sKDUDymczt9WS+YlaV8CU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHiWyWStG0WAwlv5eIUk1m82zaHdr6T0pTRlM1LcahuhNmM/QB
	ZVFwdBvkObN41NIQIlpGXj9cDtvt1Q7Un/tCKS4ltg/Vus/IuG9RjA60OMsa4eGcvXY=
X-Gm-Gg: ASbGncty0SNQZnexxz9oVXPydTSZoGWCL1v/GZT3cSYt5KQ7U9toMjkyznLnIx04O1n
	t/vWOwWcz/mkxjLBI3TVMCe8vE/2R8lJKtzuTX1OeRNOWtv5Qhlg4NSj16+Q1jC00p2DaGw3yZz
	94vdGsIVVYvpJ6rMy7W3IOMnRy1tpnQZ5bBqtZZPddQB2NJ3g1REoE1I1wmUb9Mm2BAH3Fjy1Ey
	Mj3KiCku8giNll1rVjm9qAVvg2ENol5oyD6tKo+p+zI1WdlvjQ3oYHVmZWvniOr6txIT8TyS55+
	JQsrpGN7nl+G7V3rBI3X2SyxTam/ghEsxyRUB3nr3zlGBslV2nEd1IM7np5+6v7M3uBi5gCe5Jr
	azHRcc0J9xzGIy6upYO++i+e6te9W6pwU63q/DiuZmY2cIOYa5MHbu/N+7CdJxYdnkEQpTy7LLM
	qpEalglQxwFKaJnvSKmX2fTUVUrEwWB8yVz5Zxy/L4Iw==
X-Google-Smtp-Source: AGHT+IGYChwhuUEGPVHCLuRk88XLXPKT4H0pjkSRx8SDm4X53gF3hPcQE6y1DcQp5mZdYfFKZ8VvaQ==
X-Received: by 2002:a17:906:ef07:b0:b45:33bb:24f3 with SMTP id a640c23a62f3a-b6474f182f1mr2501488866b.44.1761150114810;
        Wed, 22 Oct 2025 09:21:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da1ba1sm1377700166b.14.2025.10.22.09.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:21:54 -0700 (PDT)
Message-ID: <5ff5bda1-246e-406e-a07f-6ae7e8f468c3@linaro.org>
Date: Wed, 22 Oct 2025 17:21:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
To: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
 kernel@puri.sm, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <0k5cPW5X5XBAPEI-utRwsf6huR-TBzPWKNIFiDo0w8R8qHEtZDcBbkrDaG-ZSl7Hts8VXGVOY_F21eKS0lIcQA==@protonmail.internalid>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2025 11:22, Isaac Scott wrote:
> Call on v4l2_get_active_data_lanes() to check if the driver reports that
> the number of lanes actively used by the MIPI CSI transmitter differs to
> the maximum defined in device tree.
> 
> If the number of active data lanes reported by the driver is invalid, or
> the operation is not supported, fall back to the number of allowed data
> lanes.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>   drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>   	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>   	csis_fmt = find_csis_format(format->code);
> 
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;

The function you've added can return -EINVAL;

Isn't that a fundamental error at this point ? It would make sense to 
trap -EINVAL and refuse to go further.

> +
>   	ret = mipi_csis_calculate_params(csis, csis_fmt);
>   	if (ret < 0)
>   		goto err_unlock;
> --
> 2.43.0
> 
> 

