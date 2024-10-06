Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72452206E
	for <imx@lists.linux.dev>; Sun,  6 Oct 2024 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728202810; cv=none; b=YWLnWEywKN5ADhTDA2H3hcHLn/HB67km0HrMw0UPoUe3zw/hYRYyIVue3E4EeIdSX4xUgxJZGWYN3+AUhhxRhOrsvKUYDoEERw+9DMDIw3BZOwrGCTnOJwc+l6dmyww6KxCjrjbanBlJeKo3PzfVRD+pf1N1dNIEm3g+Kc3ZZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728202810; c=relaxed/simple;
	bh=xskBt4LRT3HhgA9irs479W8nOcSuA9XX1tFTBt6qcjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5uSl/cidPMCfzNssjObhMzaQQ+mBQdT8HXMe+mqaA6dyaxuTsHFd+DlGLOjuO4AFcXXFpeV9BkJZzsrseE3g+sxSx3Am2QIf3z4Uvb7zIzkSgTweUVlPmcIFNLkxNwnu3YZKI9V2UQi821CKu66F5O6+PRoJZtCaT2ZO3dMdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Skcj6n; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Skcj6n"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cddc969daso5157885e9.1
        for <imx@lists.linux.dev>; Sun, 06 Oct 2024 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728202806; x=1728807606; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wEIHDQplm4jDqTmGvJKy5HVY4XM91FFJ0wP6347TcVo=;
        b=q+Skcj6nXneM6cDqc4YrR2+2RewMaRlpYCvSQTrt2biaEeHl9dt9CxYsha/hSrCZGL
         gCpBv0l1oAqHixRI7UfaL5VwAAYs+NjJanGnFelj8jVLl/sJ6rM7D6sBHNvDNH53U9/j
         9e2oQahM/XpJgJ6pYVrhMe5oTQLrG+bVJ1b4ki1kmOZxcYDN1+qP6hvl86595vts/Vxs
         8mQn8mVUawSNXyAioMm1W5UwzL5F6e+/67toSkrwuOUokvIjZwHz89i6yKT8MY/HPXBM
         P9tt2S0i1d1dQigODk8gCLYRn1YPNZCVQX7CfcteQbR2JWySoalxGI5ABkPKliy1yQV3
         vJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728202806; x=1728807606;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEIHDQplm4jDqTmGvJKy5HVY4XM91FFJ0wP6347TcVo=;
        b=qWyke95c68Z37g2I12BzB0susP/JLofPy5ljOiEkr/T8p8Bk2VdljbmNjBeCXYHlco
         nomJNARZe5EPxQzbHr3oGDWUlwMcLP2U1eLKef0UPVwNq1mGonuL3E57hHTCB92CTg1Q
         eqZ2o0xK5TTj0wtFQwKwGLkbrhHUgZcfyujEvPDQvmM/GdwfSJqhX/Nh36v7RHDEsbh6
         Dw/uTGs4q5pjwA2GmIK4qgDCAyvzeXk5ziJo1tFTi9XHBBtU977bkC5In3aD9cj2TXwP
         1Py3C+ecRzEm7X0RHQvoFRCTMH7MSCLdTVem5WBnVJ+k73b29BtnzhOEtX4cuB53Aui6
         bwbg==
X-Forwarded-Encrypted: i=1; AJvYcCXxDEouh0QvJOmJMJW7jeEFf1ENrsIrIpAWntkJJJf5vcnKGylH/3sT7TF4xWKxK1UuiUM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa+wMHHYeLyQF2tJYYo5YGW+YGc78h/50mB5yFdiUz9FLT/R1O
	/wAwDeKw9pEWkQGmF288LagXilTovXRi1bBonZ63tffv3gsZu1Ai8AkRDrQlrts=
X-Google-Smtp-Source: AGHT+IHc7CjhXNjSnG2kfYIubtM/X8gwjZtBcZXhkF6l/K21ZWt6a99LhWB04H5/xjsH/rpQKfmsYg==
X-Received: by 2002:a05:600c:3b1a:b0:42c:b9c8:2ba9 with SMTP id 5b1f17b1804b1-42f85af0d24mr26199515e9.6.1728202805926;
        Sun, 06 Oct 2024 01:20:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4a89dsm58797815e9.41.2024.10.06.01.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 01:20:05 -0700 (PDT)
Message-ID: <127856ca-fb79-45f5-ad0a-8aa219bae85b@linaro.org>
Date: Sun, 6 Oct 2024 10:20:02 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EDAC: MAINTAINERS: change FSL DDR EDAC maintainer to
 Frank Li
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter
 <rric@kernel.org>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, York Sun <york.sun@nxp.com>
References: <20241003193348.102234-1-krzysztof.kozlowski@linaro.org>
 <20241006080810.GAZwJFauv4TWAICuQg@fat_crate.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241006080810.GAZwJFauv4TWAICuQg@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2024 10:08, Borislav Petkov wrote:
> On Thu, Oct 03, 2024 at 09:33:48PM +0200, Krzysztof Kozlowski wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 636a84ccb5f6..03474c934930 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8120,7 +8120,8 @@ S:	Maintained
>>  F:	drivers/edac/e7xxx_edac.c
>>  
>>  EDAC-FSL_DDR
>> -M:	York Sun <york.sun@nxp.com>
>> +M:	Frank Li <Frank.Li@nxp.com>
> 
> Let's start by making Frank a reviewer first. I wanna see how we can
> work together, how responsive he is, etc.
> 
> My experience so far is that most of those EDAC single driver
> "maintainers" become silent shortly after they get added so I'd like to
> avoid yet another such case.

Can you change it to R: when applying or you want v3?

Best regards,
Krzysztof

