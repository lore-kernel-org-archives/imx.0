Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3031A8413
	for <imx@lists.linux.dev>; Wed, 11 Dec 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908975; cv=none; b=DDBavngt8Hwm9SlbsbJRoiqaUdnqbe0EceelsoWttaSV7/40vczi6oWsmT8nPbsEzweSnoMhZctXFbyI9I8mQbEpqz8CJBSvyYIRwQNo4cHHn3g2QEEm5fWOxJoBggjhvOeIm7wJ8zzLo/TBCw6yg70UZMO/QNnF43b9MKmqhrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908975; c=relaxed/simple;
	bh=802xWoruFrM6UWvGPBXrZ6WkMGqrdJEknczsKo3UtXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n9rlMu4rilecg7kCtAsW9UtpFdrUEj7N4BIsAfLe6aYORJFgNdV1E1XPCJkSwn+vaxZYt02zRyRoLA2WGFvVLeos39DCVuYoBRHM8wszgj/xtkQhTrU+YD9Vat6qiubJ5JgPMhhoa9XcDhHt2lj/xQx6UiNLIBcCZxtnUFMlXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DxvSj4SN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DxvSj4SN"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa551d5dd72so115495766b.3
        for <imx@lists.linux.dev>; Wed, 11 Dec 2024 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733908972; x=1734513772; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCZlxHkJ48nRwX6UP4cGsTA2zFjZ+gWGiw6Ko4V5V38=;
        b=DxvSj4SNVdv5Z5tpxogDZ9PBSOf7CGnqfvnQxG+c5eJLIKx5ag/PHflYa982CRC9yH
         KMhFVjLt1GUNNyM154Qh4asigBAIY0xnUmbj1gFy5ojcaQRZh7YzH+P+6zwSVeW8Igh6
         a6xGvZn3gAfcWy2VFCEQRPyXFvc89Z7abPMzCJZmSsrVJ6lEsREdYdi/ZhiTwO+DwKL8
         B6gyFOWqIfN35XcMnx0zakDYDT1ZQwmRwFzBIQs5jvZoBVvzNhomCAtHA2VcnyGgn5bv
         v3cawUnYCKDnk5cYRv4hzE7h46cq936PshxKMuxpuKOU88Kg+fDwltqH5jJMM2pegs3J
         Hw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908972; x=1734513772;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCZlxHkJ48nRwX6UP4cGsTA2zFjZ+gWGiw6Ko4V5V38=;
        b=WWD7UvoQHuNKuTYlTZVpxs1HLYHbkGfOFJ8uraty3rHIX2au6czCuk1ftxphzWpjbS
         s352bJQltXNfbcEASMGyox7eS+Q9NWaPxvHpLwOBtU6eYTYzKHJKfsKHPvaENgwmtpUF
         TlLaxn1tIu2t4Yw80j3lGu5/yayLY6xQlfBHEGXZKrLb394kgNdOjHkSWzCJOU/Dij76
         Ib7VCG3IhoSkup/yZrCtdHrLXTnsxC4dpHu0YuUHLSroSJztngJLMW0t4KR21qB9xWXG
         AT91sDpU72AwerQMYgOWtJNbOm4ohDItE1NxSb46q1Sntwz+BCdLz1ihflT3fMLM55OK
         UUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvBKAhoFBXTDjguAJ9Cbl8QWWtDPHRN/FwUaKgan0o36Flx3Kema305EaFfn4o7TR0E2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDt4mzLemq/q1KOBrWakHQcKt4oMZvhw/V1czNs/9E7TWczf3U
	6BvVMRsC0bSYaY4xX9rq5YJFiATvPz96KxYt6aH9zJWc9z/ygxTmDp2cNJD3rzg=
X-Gm-Gg: ASbGncvP1TRezfz0GrxHh7Hp5Flqas85gcNOniL/EDl/WmdRo3z3ZBXdm4ZL/klU/xR
	6WIAI6bdYaaBP2yKxeKKcF9Lh/AhBQYl5y73iRjyUf73jWb1/j0XjqudiUU1L0NYmoWAtStBWqI
	qF3cRzkKt8PL7sBgmK2r1ZfuhN0LSLG4HaB9ANefsBVtp/O1jxn1WWw/KMYxr9qui2IVbvmcHK3
	9iS0ySPpBiCF+2D6tjYWT/5c2cndgKscPTdw5erb20hyTo1IoDzBrSkuXG0tSfG3190haYtZw==
X-Google-Smtp-Source: AGHT+IEQuNsj9SuHtQ71/9NIzH8ZUB3oh7ag7Bs+XXBHk+z2Fuj/DJfL+Mge7ob6PwV6gFWegJF3+w==
X-Received: by 2002:a17:907:6094:b0:aa5:46ee:9545 with SMTP id a640c23a62f3a-aa6b11825a2mr68380066b.5.1733908972135;
        Wed, 11 Dec 2024 01:22:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa663334906sm627451066b.72.2024.12.11.01.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 01:22:51 -0800 (PST)
Message-ID: <357a8910-82cc-4401-b985-0d01cc7b9128@linaro.org>
Date: Wed, 11 Dec 2024 10:22:48 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/12/2024 12:34, Krzysztof Kozlowski wrote:
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> No comments since August... Can it be applied?

I think I missed here Rob's review.

Best regards,
Krzysztof
