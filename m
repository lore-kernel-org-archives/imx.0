Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59D61773A
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711394583; cv=none; b=FF6eLdIcQ+QK0cGAz8wMgVHGLchkApGQMvnQXGKE4N2iMCHWAaASsdw6mTMjDmwhPIm2HoivgZpKMUkX0SuyxpNVvjvs7HtTEMqEMyHkIppgHIkDimNo+Z+UG8r9skEC2eNTpQc/vMjN2mLDCnskyh4cDFLStHSRgZlSewC5T/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711394583; c=relaxed/simple;
	bh=ZQreLDvLGIrzkFGbwHef8At6nHP/2EFl/UmYsaPgXGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmM742i76w6y3Y5Pp/hRQDtnRsxzZDbPvA89WBN2Qw+fi7pfgixYKvITnG/9sriKnorNVbbRJlcR3FfMCA9E+qzLJu6c1IJ6nr7er0yWGwjgAZshU5AP9QKsOeUYmUb2EydQvdXvvF77hN/kHN+iq49py8QcMw2b/q9DAvaZJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLmbupWX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLmbupWX"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso64611261fa.2
        for <imx@lists.linux.dev>; Mon, 25 Mar 2024 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711394578; x=1711999378; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhkcMqTLNkLuPm50ozYV9EYYWkwPV3b0+RgksnZ0gjM=;
        b=jLmbupWXki7DZk6cR3DigiBMWVsvygZ9L8Nae97SHf9BCAzjjIcmvJPkhzl8QGKjTW
         zMTZ0lJBKbWDSehTQSEpRDP2/TKIMiDzNKSiiUafqB/N9LT32vm4dTfNDxFzUGMPsVTP
         zIqYSzFm0WcUhPbiCWnO58xgb62ip1j/hTvI5MzUXGZXeXBHLz5dPa+j5X7DeXcsWVF5
         C/4qLoYZFDJl7/ffn6EmC8opcU4VaoEs9TzKr2x7JDme/xnm8lmBCpnMSw/Yra4j0uLy
         hMiaXsLpjAtM32e0a9w5EJO1YdD7myZpcKyzcU2aLFFilNHHVAgZB4NVrtiHNG+W20YI
         PUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394578; x=1711999378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhkcMqTLNkLuPm50ozYV9EYYWkwPV3b0+RgksnZ0gjM=;
        b=smIgv7xnIfLC6LuYG24DX27XpPsb/EbnhEe6z8shKxH79yJsO6rod0FmXpBpGOGpkS
         B20t09ld8Rcn/Vc0ZFilW1jxy7JaeaXWSQWnSWlDJBNPF2J8gFKS/p209uGzqJuMVYrx
         VqJIsZ0vYrBuRS4LlWciN55ma1rCC4ir+63B6DpmqBEHy3OFLk/0XgM6O+EA9IvYKBUw
         njgZvByX4yop+A1ykNZh6VGd4fga3tQyddwwC0AVNUB9M56IVy1MCSXsn8/NfJxPgFj9
         yzK/qMIVGIiP3Z/odSVAvGPd9qWlZmapwuAcSOJ7UiLeoBo3Z4DGzPfL3jjBDRXguVii
         382Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAMKiSBPIHMhLAQlpH0YJWE91TiRR9OqBUN2rqZJffOoznj41l4aQoOkDNrNHs7b+oH4dFF8uxX6ULLp7cumR30OQZ
X-Gm-Message-State: AOJu0YzVzxBfxh/C1Vrw1+Z+NF7TPtXxWVhImVDeOh9PnNA56a8jGBJ9
	NasD5oUWwvV6cX5GtyUSjl29ihwgOL5K6n/p8Z+4g8ZpzkK4GrGdSNNnTWtnfI4=
X-Google-Smtp-Source: AGHT+IHgt2mz7H1qNHnVnVUYsH/mYp+h3FUJb9i4gOOJMqFMA3Zb6UHuOT65S3E9TZ1JDfScM+2PVA==
X-Received: by 2002:a05:6512:2105:b0:515:9437:8f29 with SMTP id q5-20020a056512210500b0051594378f29mr4767070lfr.21.1711394578035;
        Mon, 25 Mar 2024 12:22:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id la2-20020a170907780200b00a4503a78dd5sm3369159ejc.17.2024.03.25.12.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:22:57 -0700 (PDT)
Message-ID: <31b493d1-ad74-48c7-8585-9df323418ae3@linaro.org>
Date: Mon, 25 Mar 2024 20:22:56 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: add i.MX95 clock header
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20240324-imx95-blk-ctl-v5-0-7a706174078a@nxp.com>
 <20240324-imx95-blk-ctl-v5-3-7a706174078a@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240324-imx95-blk-ctl-v5-3-7a706174078a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2024 08:52, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add clock header for i.MX95 BLK CTL modules
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/dt-bindings/clock/nxp,imx95-clock.h | 32 +++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/nxp,imx95-clock.h b/include/dt-bindings/clock/nxp,imx95-clock.h
> new file mode 100644
> index 000000000000..83fa3ffe78a8
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx95-clock.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_IMX95_H
> +#define __DT_BINDINGS_CLOCK_IMX95_H
> +
> +#define IMX95_CLK_VPUBLK_WAVE			0
> +#define IMX95_CLK_VPUBLK_JPEG_ENC		1
> +#define IMX95_CLK_VPUBLK_JPEG_DEC		2
> +#define IMX95_CLK_VPUBLK_END			3

No improvements, so again: drop counting.

Same in other places.

Best regards,
Krzysztof

