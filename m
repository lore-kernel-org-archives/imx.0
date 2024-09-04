Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2A1D0942
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725456916; cv=none; b=o7S31wEkvJu7f74keoBGNHqf035tktj9ZqiZg8ZxqA7eD5fgw2IjeO7dHYz8Ih97JLusa3UQHsejDKFwg9OubA0HG6xumvRPdlZoIjQ9kxMvAqU2Dag9Bv/ti4qEnU3ezOKnEw/z7TWmLtp4iMt39RCoyA5dWuqgfQdETP6Ht9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725456916; c=relaxed/simple;
	bh=41xFYfekiMubd9r2YEtmUlcXoreoFCjcE8w50qz+NWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PB/fhTbAL6n9Fj7mDdXdPUd3TQFPKFuEyLXMyqDLVsLBxrfSF7+rnR/vW6sB5iPt+vI8CzLhQxk77exrnEC/EfpPl3G1G7Wfw0vTQzgMsTmsH/kn4zAYRJrRqQrGvF3e/PYqcWhegZeBjlyYLfKUGBGlZzZsh4L/WaLLMqjfjsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGxmLCMp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGxmLCMp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c8cef906so2356558f8f.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725456913; x=1726061713; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ld5cWyae/iB0k1Ca1RVlaEbBbyAMRHm9ax0zyn7Axo=;
        b=OGxmLCMptQLN6zl6wgqBql/IAdQ2JmJUPsGrXsixhv2k05cEWechEEd/z02OPXL54X
         Jk7tcwGKXZ0NunzVfWeysoyeCBi25wc0/XaaGFdJHFJQ06XpHwfZoBLVGoYPd2zS3Tj6
         VVEa89IbHZbdBU1jbk6pB6Xqg8t52+k8lvlSiU0JI33by1Df4N0yxWe84hLlQ29g8BXi
         xGnO9j43/S0AjniGSmbU20T4dYEqlqXgKeYUrAMJ11HCantLqgHWBMvqVNibKEJEg5c6
         vJrgDRBh3oVhKnvbpcHy22f/KofviTrCJWZHJr4+sYT8qUGYI9ukn/d8kfTmBDhA9Ixg
         lemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456913; x=1726061713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ld5cWyae/iB0k1Ca1RVlaEbBbyAMRHm9ax0zyn7Axo=;
        b=s0O8bROu2GLem3hwQJaeYfOSohN84G+KOdCOAjIgdr/IxdtIm3qcqo+TVumKdZzxl7
         6/M3AuWoKOHAk7EHuviES2Wa0DsZ62PhXhElTxzmsVdd39WgyVMtX8wID7XwwvxbmUJl
         bkvT/LZnFoFNlIHMRi7tnjBEYpOZvAFyK9CxuplCx1L5qLXuWIzjIiNFsTARoRS7RxOi
         ai3AjJg9LHRbR4LG5wgOqbbHDzbSFYFnRGWrFHC6HfHIMVt/TbzMURvlBl6H+8KKYr69
         1hn+Tg3jyPdBGp32nbiG4jmJKtmMQc4ixdjyxox7oZ7ZYs3t9jy/cyzVgw6YkoLv28J/
         73fw==
X-Forwarded-Encrypted: i=1; AJvYcCUf9CYi3UDoR8C9FTw13oaePdFl7e1i+awxOJpY3oTo4Ki0XQAXzzwbYZvLedR9mBd2MvY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3mLEhp+dBpB8MpZ3M9FKR8xVaeLAkkUYObC6l/4zmO3/cYoIt
	/b72JUfYL57RcdWgxijvHwomEErmVR4OCnw1OYgoqprMyiu7rtxMPjq24t2c48c=
X-Google-Smtp-Source: AGHT+IE1R2i+awcjDPl197c7K24+01eFHTYrMYyuAR8ePTTzDeEHp8BDpPPt5Zs/ISrbNMsn/ws9NA==
X-Received: by 2002:a05:6000:4029:b0:374:ce9a:ff11 with SMTP id ffacd0b85a97d-376dea47205mr4000346f8f.50.1725456913032;
        Wed, 04 Sep 2024 06:35:13 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3767dc16f83sm4099348f8f.60.2024.09.04.06.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 06:35:12 -0700 (PDT)
Message-ID: <eac88362-4b3e-4fd1-b649-2f374453aeae@linaro.org>
Date: Wed, 4 Sep 2024 15:35:11 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] thermal/drivers/imx_sc_thermal: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240717085517.3333385-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240717085517.3333385-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/07/2024 10:55, Alexander Stein wrote:
> This adds the error code to the error message and also stores that
> message in case of probe deferral.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
