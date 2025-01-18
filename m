Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F7166F3D;
	Sat, 18 Jan 2025 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737193886; cv=none; b=FT8x8IXaHSH7vmXlVqtI7v7oknVB2bSt0zIFzv6WoYUiAQ4sC45+9+0bulDac6j68or9NDQalSZSEQZ8bjyamJFxM4lbq1nusEQqYVwUzU3wKEq908eIuZMT+djeEjvRRqLUQs7Mhadupjh6icss7mZOnyVX4Sccud+QUAMIVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737193886; c=relaxed/simple;
	bh=P5POeLB1HYM4r7q+jyyRBr+bveo3NgD/uLDfzg3k38Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5o3tbEeE3bHeNroNPiCUZnB8GpaVKNiQYjAPJOZQTjMtlUqi0mYpkPNE2548A8pAIh4KdyUMNinOwf1/ETm45dAh7pSlRGPUSLrCOmSo8hPnFuXRuscKRWeRx13yW9RLLeEBtyC5bHgmyFbMPJfJW/mmheagdCvR0dYR5VdFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7yg3TqK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7yg3TqK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e44654ae3so434635166b.1;
        Sat, 18 Jan 2025 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737193883; x=1737798683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db8wy+NAvFX7oWbNNZfkOxUsDhaAAm9ZkDqWuFl4MaM=;
        b=N7yg3TqKupxVp3suIc8APqA1L0f6MT9oOqsT43M5UgevXmbnMWsSY929H0grYg+2BJ
         m1sB/gL70IOFuyMiy12aAhCUGazIf8/YG+r8da2wiy3jR/xViJEB/VlM3fvyjhwdUd0D
         ioIwWwoVoJe9Od67EZpWGFlynNgpLzYDvINOFcfjV00mPsKfKNuAjVN9/EhXBkpBLo1x
         U48EhQELKI3tVL0LXbSIQJli7kCBJClNn/jUEoqzTU69s/s/7mNQnYiX2ZR6g008tK0C
         q457xA6oglzmmPzYux+R0pOZGI4V3Ki7B9kWs5jX+gLVXrKabwUNLS6TV+cjFvpW0XMK
         zTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737193883; x=1737798683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db8wy+NAvFX7oWbNNZfkOxUsDhaAAm9ZkDqWuFl4MaM=;
        b=busks1aOlBU0T/Yg5B/7VEzSMlyLGh9KMWWNC/9nTD1+gCFNHEc692EdTz1ahJlo+d
         yn+zlNaTm1AUqwHYSS+pjNy0j/peseu4+8vnPNgzhpFmiHeQiwLZc+3bAIua1yS3TFzT
         mLj7ZBQSJ7NPf+p2A2PJa4m/noYilhdi/BF9p80NXQOIb3BWZMl3steipLQ7l78PDd71
         2SSWIpG96RiQChZQPK63i+gPy09emZMH2mLkBa0Ks4SrF/FMExn0/rAPxfLdW7XzukSM
         xmuDL3zm7htmJEYNPru7JAOTKp4/FdfzUBWME9q4yrpUMfSf1VWMyFIxa3unRhDUQmGs
         TSBg==
X-Forwarded-Encrypted: i=1; AJvYcCVWALh/yuzVone9r7Dbz4eGN6c07Mf7hLrplom81vQZ3y02sy0LEzeJpib3nPp5SGcmQZ/h4JlTjjGOAWk=@lists.linux.dev, AJvYcCXoL2kUDkSdqKPiJPLFJckIHiqO1o38RC7ADIH3geA9fhCw6Evnr/uCZ+TMggaQENep+eo=@lists.linux.dev
X-Gm-Message-State: AOJu0YywTJM7+wgL2AYneQ2RgACerPmCedk+JU+Xah+9Q9PoZXm6kmux
	k1Zc8JABdVwoHt/nOWfOZ81aaGrhWoWXe4cs8cGtfJZmIgcbILax
X-Gm-Gg: ASbGncsLgGp9Vb/HXya67bl1TTP/UTANg2Qg9xZ2Zpyy7x5AFXbId45hMVCuYqA/Ksy
	CYZD6x94RNa0QRoAr3TbnnIPzITq7xqZk4nEJ6Ylol+ImogDuPE/6xJoqYMPeaxzP8UMuB2jh27
	IiSxmQwUm1kRzDQQvJc4Fr9GDspqDQazmTwkTpOTCNUHBmuKBv5g2JcFfAKd51tFnsgvTAbmq+g
	kdBxbhXyw74g/8NZyfCP6HrEmShOXo44LebkDLJ+LGk8knu0/cXnGgyqRHA9oLQ7OU0YZWm5d2S
	iP4KliRh7YZKS8HdHp5GPraCqg==
X-Google-Smtp-Source: AGHT+IGSL4U5Xl+C2sAjU6wiHAWjkKHC+CgAd09MaHyOr2GDuAn9GsU+UuWVUF99+lnXmPsQs58C8g==
X-Received: by 2002:a17:907:930b:b0:aa6:a9fe:46e5 with SMTP id a640c23a62f3a-ab38b3dae38mr578880566b.53.1737193883243;
        Sat, 18 Jan 2025 01:51:23 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86244sm307104766b.152.2025.01.18.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 01:51:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dmaengine: Use str_enable_disable-like helpers
Date: Sat, 18 Jan 2025 10:51:21 +0100
Message-ID: <3794610.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
References: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 14. januar 2025 ob 20:10:20 Srednjeevropski standardni =C4=8Das =
je Krzysztof Kozlowski napisal(a):
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Changes in v2:
> 1. Also drivers/dma/dw-edma/dw-edma-core.c and drivers/dma/sun6i-dma.c
> ---
>  drivers/dma/dw-edma/dw-edma-core.c | 6 ++++--
>  drivers/dma/imx-dma.c              | 3 ++-
>  drivers/dma/pxa_dma.c              | 4 ++--
>  drivers/dma/sun6i-dma.c            | 3 ++-

=46or sun6i-dma:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/dma/ti/edma.c              | 3 ++-
>  drivers/dma/xilinx/xilinx_dma.c    | 3 ++-
>  6 files changed, 14 insertions(+), 8 deletions(-)



