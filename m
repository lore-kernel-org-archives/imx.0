Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8C1C2DCE
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725269393; cv=none; b=Tu7w0HfTANGzwtMx7mvoMk8u5S51Anm+S1LCPBgmesa593HB0bX2aMmR4GPN38Ir5XkNABXaTkrnbXVg6D7nhuP1WmYCAGYgTWXFQj2z4ryoqx6e+JfZ8T9qBuvj85xBCc+uNR4WtSaj8Em174bnaRR9jasAyyxkW4g1tpYekQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725269393; c=relaxed/simple;
	bh=tkU6Up04ywW/1rRD39iCyC9XOTeC8+OqS8BWB+CpvwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j+lYlsERE4AH+QUxndy8YAJyM+DYMHPy95N63Vqr8r6LtubaDVmcFDPzLQ3v4D0hPDKfqj6x9CQTxyaTv3+jhqbW4y5+a6nORUvFEpQwFTBp49IV6L8YXegM6KoF5RpxQeA5xSmBAyYcAOavmWgLomUxSSUm7y29u4COf1AfNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZicoRql; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZicoRql"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a86e9db75b9so426662966b.1
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725269390; x=1725874190; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPsLVJHNf9AL2cGNm+/rVQrKrbYuFpSLncZ9xh4T+lU=;
        b=BZicoRqlIOOM0AFvOnArTDXIeQgl/57etLFN//buw1+5HWql5aj7cANHFCBxm8TpsY
         UwI/70G0J+IAx/FyS6vQMnkE5RWeYmemzspf7R7uDkd8+bAB+ZNYYvCjvdc8/cgCv9n5
         JXBjncyDQ/HLqizG14VMaVVdfNbpjMv0mHPNwaONlmbKkVYHuef+IcGLmI8QvFJ4uEQm
         +ffFecBfLIWsNBgXIooonS9DvmKtx5NJQEi5B8VL4K3SO3tmA55dBrURKv8g8m09lc09
         1l8NSv/IGcsvbor5JO4yUpHXFFme3MWAWlaVjO4vcZdRsPSmtretvzrS9fD1NXtevg3c
         q9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725269390; x=1725874190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPsLVJHNf9AL2cGNm+/rVQrKrbYuFpSLncZ9xh4T+lU=;
        b=xHW3DTik4MV6qP0gVIrC01zewxNADWB99eGik7qMCZ3NvAXowD23C+6i24zXZ7hjRn
         d7rwHzyouOVUdsCpM+DEO1m6yhuOwueeoSwJVL0kgLQ+rnSgkUfJY4YOfSEdNMoA283C
         OZ5k8W6grFcacuK6hV6fTSRL6YQp4LdLm2OcvBPnZ0ANi41iflpkQFDdVnlq+qrGzSm2
         pdCFNylepmzyKXNs7ih1UqHUGTOKUzYZhpHHmJaI0QLo7/aYrS+qUKy18YW8cMbg0LHn
         UpPNUYRJmmn9YbCEtuXTXGP5gLr/cNIQI9sZAMOmjJyAgfIoPIjvKzxQpDjulDbQ+TzS
         KHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBCZI8u7vaU+P2zMUIE60f06a3msV3iAwfediHZnY21LlcTZdSXYW0ogH/eL+7XpUH1ls=@lists.linux.dev
X-Gm-Message-State: AOJu0YwY/AqtNzgtsZ8MJXssseul8PSBmXqCrnCCPquDf3v5BZLJM1Bv
	LS52TgwnLwY5hAwavmR2kshflH3gJIEZybA6b/ZvjhBOxvQBjf/YC556BSXFCXk=
X-Google-Smtp-Source: AGHT+IHyxYPGT71yvNGl55/joi025MgwKVNHS5yHfr4kLEH+kbbmq1SIbL5dyYz9GztD9lJk9RVwnw==
X-Received: by 2002:a17:907:6d14:b0:a80:f358:5d55 with SMTP id a640c23a62f3a-a897f91fae3mr1073287766b.33.1725269389610;
        Mon, 02 Sep 2024 02:29:49 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8988feb61fsm543434766b.10.2024.09.02.02.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:29:49 -0700 (PDT)
Message-ID: <66b8c478-44c4-46b2-a029-bbf847429e2b@linaro.org>
Date: Mon, 2 Sep 2024 11:29:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clocksource: imx-tpm: fix return -ETIME when delta
 exceeds INT_MAX
To: Frank Li <Frank.Li@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20240725193355.1436005-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240725193355.1436005-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/07/2024 21:33, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> In tpm_set_next_event(delta), return -ETIME by wrong cast to int when delta
> is larger than INT_MAX.
> 
> For example:
> 
> tpm_set_next_event(delta = 0xffff_fffe)
> {
>          ...
>          next = tpm_read_counter(); // assume next is 0x10
>          next += delta; // next will 0xffff_fffe + 0x10 = 0x1_0000_000e
>          now = tpm_read_counter();  // now is 0x10
>          ...
> 
>          return (int)(next - now) <= 0 ? -ETIME : 0;
>                       ^^^^^^^^^^
>                       0x1_0000_000e - 0x10 = 0xffff_fffe, which is -2 when
>                       cast to int. So return -ETIME.
> }
> 
> To fix this, introduce a 'prev' variable and check if 'now - prev' is
> larger than delta.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 059ab7b82eec ("clocksource/drivers/imx-tpm: Add imx tpm timer support")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Reviewed-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
