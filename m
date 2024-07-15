Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97F1862BB
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721035325; cv=none; b=hakWyg87fARiNqOUhHY1aT+KaZBONU+r3BEFu4GFl2lpqj7QT7UFiIOLIN6IF+ixPXtx0kYrtZOVow/5QyPDPJ9+w+IINVehI1NeMvQ6759VwxM/R1rx3/jKBjivXAFsebDxZjJRX5ez5Z4O/lLreXEVui2qdsJ5zfCAVDWOob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721035325; c=relaxed/simple;
	bh=gQwFkfYUsyCNMfYcisVu8rGAr0bAMxYc/UTVv9C0Lws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biBSaF5Z9ASW28BJN9jQ7Vk5xKZMlOq5WqOgek3OwMIrchH8DqpB9CBz+pz8jvFrv57wMmhSCbrB2qa/FRUAuCEqAvCC3sMHrXkBtuyYZ4VKjZiHzJ9aIXT6VANat2UD/HLTK6XfdlaIkMqwt/Ufk1vZ22+0S3ij1CyvxUcomio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sk+TggCi; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sk+TggCi"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so58595711fa.2
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721035321; x=1721640121; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzUrcSKPOx3F10gumq/RtLo0BiUspDhF63mAJeflmlw=;
        b=sk+TggCiHbBbrrVS/pXBrRJWhmt249M654fUaDF4tvyj0VY5KqEjJheKPR49h1irat
         mHjgMXz5H0ycXM+qEZaXUfQdOmioKuLMwAbkP3wR/6PiBgQgLNSbX5dLENF1fXUbZYt+
         PLKkk/HQok9nZZutbF6+bm80mkEKOzHmKpnPpT6On5fe2zmOxHHO1lsavp01VvovrJDq
         AEldchO8Tyts2FPGniYmBoQBXGiYSXecEda3UblC46r8UyrEkl1AhzPrPbsy0BhnT3UD
         NBLVmgoXY5HlUnlS8ct6OiNFm0vx15Qsk0sOIb37ccIIQrPMi1yDmww2nV/idaSh9Pp0
         dUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721035321; x=1721640121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzUrcSKPOx3F10gumq/RtLo0BiUspDhF63mAJeflmlw=;
        b=uA0r9/s+7irw9ncCCclsgAhdQYBrAXLLP0iH/etKhPsW1dMk/ppLIeujsLAe1NMVUr
         +olEOnJsBTxjaT0ihyd2vcMaqWLOgVFkiNFAecoiM80tyX5Iu6LioHOQjDrr+W9P8EIp
         rT5A3Jw29gVWpYIQNAFE3WB/FJrAN6KdfQs1MnbE3z/C0Nyvrk0dpxh2lJ1INTSghRny
         VLIny9oQcNJzL+eeLjDTB0puguv/DNicMeAVJ1W2eUez71RRn9+7UYkC8XilUOP+SEf1
         /n77NiPZFSoj0QHBphW12vdkhWTwmQoTqsDA8Wlgm3BzcepE/tz2r75ftFWcp3+jG19n
         kzHw==
X-Forwarded-Encrypted: i=1; AJvYcCWhXWDQhKoIkQjobW/K+Wrvk2MtUgcgRE7da62+fqLG37kNFRw16gvFO7tNAjL9+qeSWVcihDuwpIyZHY4gescVmDRH
X-Gm-Message-State: AOJu0YyqI8WdKRKx1x6BoWJuGWKU//s90vFc0ugErDByGJGsEcdcpClV
	F5Dp9rgYw/xQ+YZrFcdVMlKXkKGfz9Bqxv71ry8A8X1VUCV/aHwILeMo2y82DQw=
X-Google-Smtp-Source: AGHT+IF/+AJbHLXohqSQ0XRGQc/GKg4cNhF8cuLtHAuiUlm5z+UVxHHPYV/1+FE6SNp+cer/mIRn8g==
X-Received: by 2002:a2e:9dd3:0:b0:2ee:8777:f86a with SMTP id 38308e7fff4ca-2eeb3188d1cmr119886761fa.37.1721035320730;
        Mon, 15 Jul 2024 02:22:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e709:abf9:48b3:5079? ([2a05:6e02:1041:c10:e709:abf9:48b3:5079])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dafbec3sm5764675f8f.85.2024.07.15.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 02:22:00 -0700 (PDT)
Message-ID: <343175eb-ac00-4a41-844d-ae1c9901cf1d@linaro.org>
Date: Mon, 15 Jul 2024 11:21:59 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] thermal/drivers: simplify probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/07/2024 14:59, Krzysztof Kozlowski wrote:
> Simplify error handling in probe() and also fix one possible issue in
> remove().
> 
> Best regards,
> Krzysztof
> 
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

