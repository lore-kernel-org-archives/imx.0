Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0817A31E
	for <imx@lists.linux.dev>; Sat, 24 May 2025 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068049; cv=none; b=sxln9x1Scs3Yzclgyr7LRQVcE7Go+U1WklDHNvaph58kCla7iy47mUs4mEoX1MEhY9qTPTB0s+a5AlKNQk8dtJAzUBn691waKLNiFFMgBLNJAKQb+7AkxQcrQT/JLtgDSkrzHNg0Kz84/mWLT+csCG4W1qVpku2Vjo3lct96xSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068049; c=relaxed/simple;
	bh=I6HEzLGnLMV/1y8If1T3+TyLatSI7Db52eFHOCDQc6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCqfmVY0iqWdRzQQF4oyKd309aLVqloGbIskcWY2s6ptMM8W1G2QuMsbUiRKLLnISDWx/KPQ6VElF0nrKgV9lFzVbp+8zGRloWO57cpEhKe4QwmkfZNLXV14tifZkrhHBVrw+Xz5S51q8939zQzvF1jNZ2t9ZVb4W7xLJ7fBSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NeC0/b5x; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NeC0/b5x"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad5735755c8so9833566b.0
        for <imx@lists.linux.dev>; Fri, 23 May 2025 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748068046; x=1748672846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SrCnX7ZGW71AQWL3Tr85Pt+nNECZZ216v6JjnroPo+c=;
        b=NeC0/b5xSVRf9BMzLnjCCOvcardVoof2g2RDM8HyqayuSYooOf50oBuGnQ97chD2HS
         FiydkOaxKl2m4WBUTAZbO+1bNdG0FsrrQ1wZ/sh6ZKNoIPO36RFD7PIEhy8/x9b/aZDu
         LrEDra26VaOAvrSuQWqvZDAEp0dcwzXIUmv5neIXVmv15/wmOJiB3X6HqHErKCmX8fpB
         UZsjBXQ336Fj2qSQp3vvKJPKEy4GJBVAS4cysNV1VJBPfN4aeaM2T1QLrAsDCI3vrPSV
         3ckcBufCa4S0xDDWn+VlStzVb2AnZtVgdKGBghI7xFVOENNyV7cpNaQ0C/RaEI2Zt0gT
         1HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748068046; x=1748672846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrCnX7ZGW71AQWL3Tr85Pt+nNECZZ216v6JjnroPo+c=;
        b=D8D6MOpFjUoF1gYX83F6nl2ZSb5K5xt8h/wLoEC5AXRu1L+6AA4czIchyzr89I73Tf
         cdPaoukuckMwrn7eObQaloBtN8zQzNpvk2kBLV/xWEIOcnQHoL8t82abkmHXIl5yOaLC
         djX/oDh/m0Okm+Njrlm7to1x8iYJxOGzYbnutOKJFSXreNG9m8SQQfMSQ80B+b89IeJK
         h0qryLEmKmRV+m+46Oa03dYIErhcEvbsm/F4YWG4kOvWS3D8JcQigBC1DI39NxpgAG1n
         IMG+xU5nCM1wSPrHWA8HxbrUucqz7Snr3K64Ytnw3QqptzPLDZge/rEbZnTDQ52mzTEp
         2WEw==
X-Gm-Message-State: AOJu0Yyh+YeE4yXaDbLEIv4zFsSovv0o+MInBGR6yEqOOnFcSjYEYCvB
	2zDDO+2HBv2+HgiDr8aun3GlZ01qlWVaAaiQpo1PMf6B4CLkIk5bX+BKf/j5zdrSiM4=
X-Gm-Gg: ASbGncvSMfU1/kzfqrAzZHTGNOoowcfVqn6sqxDGv0FcGAx2BBVTRXMZHdPd5vyT7vd
	AJ7KLhhhcaOZ+jkD40METjUMRo9aTtnI/xPRv5ay/f4S0Ornpa6Orm/5l0wuE0wUt2uoqfK+ARm
	Y7vObIUB5+/XJAJK2q+i2NaulPiQQRYg0SUMzSuzAXzEqSY7QN+4V6mVEvXqGVhzwGqPnh0zZe4
	lWyu2gPE1Q6z18cMIIzEuizZHtE6muKQve9VSjWDryxuEw1NpumSgDccjmTbvSuh6xj7C2MiObx
	5XNnYL5xOl9yDX2ku97Bys4orlqIIF/cNCS3+/QYDPTKSkXz/5qfn4l/KL3c2GkPWdgerkc=
X-Google-Smtp-Source: AGHT+IFrGOHRDPV2gmNCJFm1ILCmmRF9v/HBorbGU1yfb5w8KGXInfeDVlK0y6rEslMoaySXGbfAkw==
X-Received: by 2002:a17:907:2e01:b0:ace:ef48:c7c1 with SMTP id a640c23a62f3a-ad85ae6d64fmr40696166b.0.1748068045678;
        Fri, 23 May 2025 23:27:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af2asm1357676766b.4.2025.05.23.23.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 23:27:24 -0700 (PDT)
Message-ID: <fdd10564-2041-4ee4-9546-fbcce12e1d52@linaro.org>
Date: Sat, 24 May 2025 08:27:22 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Frank Li <Frank.Li@nxp.com>,
 mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ming.qian@nxp.com
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2025 01:22, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
>> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
>> are backward compatible with "nxp,imx8qxp-jpgdec" and
>> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
>> wrap and all slots together. Reduce minItems of power-domains to 1 for
>> i.MX95 and keep the same restriction for others.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Krzysztof, will you take this one once the DTS part is ready ?
> 
No, that's a media patch, not a Samsung or any other subsystem I
maintain. I do not have write access to media tree.

Best regards,
Krzysztof
