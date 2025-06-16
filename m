Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217F2BEC28
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080222; cv=none; b=bad5IYwe22mYuQvduKgIFt1K46lG/VJkwlm5T4IAibUT3bqiyQJpO4AU/1y6LA5eAI4FJxXoliUOMUgEyHOy4ax2XjGHdFb8LIbc4t/Tc5LgiTi1nDYfETnzZWtcXAzQLqe80beFI1HrpN6yd3oL2EgOc+v6J0EXm2MYFlPBpxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080222; c=relaxed/simple;
	bh=cyawNk1X0Zi/5eV0YddzR83paiy0w8sFEtP0KMTHO+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSlapzHYY1l9+GQpqzRI9x+erpvKkDjPxPbxuO/CKhbjgn0A5qRSn3kIbHEmZIAqnLgfyJQ8tUldL4oTWMRYcEt0JDlOTsws1I2ZxxErmsZfBKfByQJbDoiMnYSwb7MzgSkndUWy+xp+dfNIC6TKbKSiKM7C1i8U/pxtuof5PIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0lIPrRX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0lIPrRX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so29562025e9.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080219; x=1750685019; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qEWpHoeWIO3tFYAF9CvYNghxJJaKn+YeJWG4YUN/nk=;
        b=g0lIPrRXeBkCdieZow4owicA0RwudmCxRTS/s1Q0+cxQEH0h09BhcKTdRn5mcSUkxf
         ww/7zrlzrbuTKNtCBRv7lFm6gPC2KMHfbgjyovgDJ7TUJb/jzLNlJINDoUiPfIl7JA1G
         TQALTbeI67RRszJhaLcwOz6CtcfLYAOAU9k1ydtLog5eVULZXEvV58K7rMWqvYeNZxts
         S5XO552SJbpIxzybVATjac8DeZTpHok9vyEpAHhPhZkqB6f32bV0WVVy0WUp2jJgf/ZM
         mFd0guyNm3so2Pj6HXcncuEsNPhJuZCRVJ/LKS/j4VoNDLI4jNIS2AkjhIq1N62eSLbE
         4C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080219; x=1750685019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qEWpHoeWIO3tFYAF9CvYNghxJJaKn+YeJWG4YUN/nk=;
        b=nzb6KP0GMgb1ccELbOeMzdt31zz419QYSlHo5lIRWLGUdMy6BtPJdPfHC9uEerIzCQ
         jNaj8yohKB4uwQO7PzYvZHXRPL0IfEQH9fyNPe+g4q+LCYGgjx8LI64PDhK37kIh2Luh
         jM/+2fpP9VoXYnrhrtVGR4qH1/Frv+xAu4zYbYa2Mui235xdfO3QBzwgIcd8o4klblDg
         62DSoT/hFypcNb/fvdb8RKPDqJ0ihj9oqJ0Nup+cfNkvM+n6NlgysbatLWKI4G0KpstE
         CYaJdUy235Vf5ngd97LXBqARDNaw6i8vmEX3JZ7sX5jbbe8yX89ysDO/jZ3vjts2H1YJ
         OPvg==
X-Forwarded-Encrypted: i=1; AJvYcCWlRUqKyc0JqKuZk588JSLfX3DeGbqDhHOfArZU2LwGs4hNxDQEHbVSDmLopfThCifT0VU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3HOF6ueIrtlN2mzyo8lJAvtlAyge402uXt+jQHYLrVwsBZ8UU
	mHJoVxsCqo9IbsRk13S806gTzj54sBI+9iV/xv5CX0V0IwpUnUGDyQ3IAChCc+5OIWo=
X-Gm-Gg: ASbGncuM2EPjpK5OpjP0BePLjMGriX5dEwZmAXhGUv+Xrl6FTqFbk7bsk4TYb0gQCSN
	5VmGB7zQ6m2l1pDTA0U8PbqtKLpYupU6qdslsnOyQs1lGuIg8OJKAdWyPDpFHzAOnpUuRqCKsJM
	MqUyBg7zkjC5i29QNJv9vmEQSl0Ql4BiHuzkTm3rnf4F9xbFX4XpYxMp30shQV65+drOmjRwNzp
	fwLtTh5BUl3/h1IQKDuREJlgPN81JXyJxNhv0+4uy+AklrGJkvHCagxGr0m6VsM68iy1hfhPFdX
	g/7HsRftEFxR8XHwkk3CCjW/QgYISNQ6RJk6OhwsHW6HXcDXvimbE25v+3hwuMmRn70=
X-Google-Smtp-Source: AGHT+IERCtaWBolBNjDrXYPOFWEd3Y/yA2ERjVGzzTRMp9TUI6iIxEBCxIQatiSsuRqkKHIXYBVg9A==
X-Received: by 2002:a05:600c:1d1f:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4534f9f165amr12231765e9.20.1750080218851;
        Mon, 16 Jun 2025 06:23:38 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e241b70sm142753815e9.18.2025.06.16.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:23:38 -0700 (PDT)
Message-ID: <f723d490-c228-42d5-9f9f-158df54a092d@linaro.org>
Date: Mon, 16 Jun 2025 14:23:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>, olteanv@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, larisa.grigore@nxp.com,
 Frank.li@nxp.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
 <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
 <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
 <20250616131944.GA30260@lst.de>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616131944.GA30260@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 2:19 pm, Christoph Hellwig wrote:
> On Mon, Jun 16, 2025 at 02:15:56PM +0100, James Clark wrote:
>>> Yes it does, it has a few modes that don't require it. Presumably we can't
>>> just add a depends into the kconfig for all devices because they might not
>>> be using DMA.
>>
>> *for all the different variants of spi-fsl-dpsi devices I mean
> 
> This is drivers/spi/spi-fsl-dspi.c?
> 
> Yes, looks like it is one of those rare devices supporting a DMA and
> non-DMA mode.  But everything seems nicely guarded off using
> "dspi->devtype_data->trans_mode == DSPI_DMA_MODE" checks there.  So
> wrap them into a little helper using IS_ENABLED(CONFIG_HAS_DMA) and
> everything should be sorted out.

Sure, I don't mind doing it.

But separately to that, I still think making the stubs consistent would 
save people a lot of time diagnosing build failures if they switch 
existing code to any of those 3 functions. Principle of Least 
Astonishment and all that.

