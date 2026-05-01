Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15094A35
	for <imx@lists.linux.dev>; Fri,  1 May 2026 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777624257; cv=none; b=m0yJGF4xyUhSEW2d9r2wdn9miUHmu84eFxrbolDfJGeDv6LeBUpcoDuxJ9XHPv/Nr9TEw3mqShUyfYbilVvPjR40K/JhaNsBQmxd5vxcjUnRyZ/nfedUELvaOEH8nT4C5e0ZOlmoA/dmeoTbLmax4TxTQxxoA7RHMRiduvPirPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777624257; c=relaxed/simple;
	bh=vi4Y4FrM2u7/NGWEpyOvXjv9CtvV21IppSt/L2UJ634=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWKytl275yGmKURl8As9hntjLJtBctDTEHxzBiOVhqgpbQj93nk0ECYhFSTq8xibtcF4/phgScnfSBOWefp3WSFebyDuZE6rdGPzBGZurwNqnUEKgvzexsjZRguPD1MnN2aO03hoYT+73JwfwJF3Aw1PhEQ5fORJGh3VoBVrxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypjk3WHk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypjk3WHk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44a5174670eso330806f8f.1
        for <imx@lists.linux.dev>; Fri, 01 May 2026 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777624254; x=1778229054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
        b=Ypjk3WHkQuJ+rsKib13HXQDoggfPyJ2jmUIw55yyAUA9eLVdnEYIOgOLprm9rLTlu/
         hn6kv/NMqU9vCu6gwlwYwDinTyGkOowVP7mreWNzSL2pvNCnkNetxdDdZVAOxn4kL0ZA
         QW4LvwP6yck66ZsyOd72c899eF2Lp65dxJC2hZZuuHqFd18voaaAJR7FDADvyMAq24AQ
         Ldm4KYLsrr01KOB7fGsITd+6u1KTTrMwcqRtXtcbbuObLgkHaqV7LWB8qHU4g3vbmbFf
         FUIRG946BKNOUecJ57U8R3qGzZQi3u+s2zmOIJc49FhNWYTanscvPW2KkOJUubG+IRpP
         bfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777624254; x=1778229054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
        b=ZzEoR64iT0BqnzJxlUG7SRgC/oL3YS8JmtcFCV3tirdxXG9u73v9N+wW5E37VP53vU
         cfduYfhqExYdqycD6v91Skp1UOaXlUCaXLblh2vu98Ci407xBjcA5rupgTUd8IwGu3Ct
         Fw6ar8Zd0n+GNI/KbyQKG9GeK8atagriALvKWjnqd8JWAMy1RA6xTYfHCG35ELpvVZYx
         2VdkcLSAkiEvJN1gbyCLYuuTYQNo2yPRv6VAkAr42I7AAkV4KpQNJgLbhl3zDaMo5khW
         n2eEvlrbUENH8yq+KyEtBkBwh6S6e+J5tQfPiz96zSdtVbqdnzQ1/ODtj0cFCBEjthEK
         HAKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ohwi2tWBp9ExltImT8zml8z0ElRNE25tLA/tEhpNwAvjYnvt+swI6/6TA7rk3lGIjP20=@lists.linux.dev
X-Gm-Message-State: AOJu0YzByXg+WtU7VzSqzZw3R8JW7D8WzDADMUxDtiExy32vIXRatDYU
	9arzlZObJXEkx78qngZvha7KuuHnzb0KdZtKCTFMDU3j4GDZX+JII+i8
X-Gm-Gg: AeBDiesNmyUqWkfJaz3SdWYqwlyM8Q3GWd1psBPF3ZbUDDJogsL3BXbs8vjLz9Wxl0H
	oTBXbLLaVBkvQj5e/kBu0U4ht6AJEP/i0vHNlBh8ofj72p3dJhZvHDXhbKAVMgBlg/Ca4ujNVnK
	706WBCg3UNXsDn8ehWsoAQsjlbOFKal4P5B/WyenqsNOgOYW+0WUNqoipBLLU1a1xiGDE7OhvwG
	KA7pT9lZp/ZhSnp4KsgWh4eqS/nEa4NaNFWoe1S/+Q9iGTm9dDlDccBczBL8AteDKl29jq5F5F6
	st6ylTIIq5JTt+0skEV5UJNo5cUX3140jKliTMX0UXulJr/78ASmfeI7Diqv6CeDyfw2iPY3JUB
	rlT9jOm9JOV+6dCxltQK7UuK5ooj9Inw61a6faHkR/NwSyc3ElaPXMbagiiWxa+po9DmQW0nfsI
	7ZmUqo5MATNlAyuzhudieYPi8LPQaUStgxMyk38Q+ccUAuhT1Ie6mYCw/TOP7nnZDnWnxc9ZUix
	AndktTPTVlakA==
X-Received: by 2002:a05:6000:2582:b0:44a:2cb3:b633 with SMTP id ffacd0b85a97d-44a2cb3b668mr6019597f8f.12.1777624252671;
        Fri, 01 May 2026 01:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defbfsm3336950f8f.17.2026.05.01.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 01:30:52 -0700 (PDT)
Date: Fri, 1 May 2026 09:30:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hans Zhang <18255117159@163.com>
Cc: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, lhjeff911@gmail.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
Message-ID: <20260501093050.3f97cd3e@pumpkin>
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Apr 2026 23:54:46 +0800
Hans Zhang <18255117159@163.com> wrote:

> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro across multiple SPI controller drivers. This improves readability and
> adds compile-time checking without functional changes.

I don't think these changes are worth the effort.
The readability doesn't change much - you need to know what a slightly
more obscure 'helper' does.
The extra compile-time checks are pretty unlikely to ever find a problem
and mostly just slow down the compile.
The generated code is likely be slightly worse.
And, with the best will in the world, it is easy to make silly mistakes.

	David

> 
> Each patch modifies a single driver, allowing independent review and
> application.
> 
> Hans Zhang (10):
>   spi: amlogic-spifc-a1: Use FIELD_MODIFY()
>   spi: amlogic-spisg: Use FIELD_MODIFY()
>   spi: cadence-xspi: Use FIELD_MODIFY()
>   spi: meson-spicc: Use FIELD_MODIFY()
>   spi: nxp-xspi: Use FIELD_MODIFY()
>   spi: sn-f-ospi: Use FIELD_MODIFY()
>   spi: stm32-ospi: Use FIELD_MODIFY()
>   spi: stm32-qspi: Use FIELD_MODIFY()
>   spi: sunplus-sp7021: Use FIELD_MODIFY()
>   spi: uniphier: Use FIELD_MODIFY()
> 
>  drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
>  drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
>  drivers/spi/spi-cadence-xspi.c     |  3 +--
>  drivers/spi/spi-meson-spicc.c      |  5 ++---
>  drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
>  drivers/spi/spi-sn-f-ospi.c        |  5 ++---
>  drivers/spi/spi-stm32-ospi.c       |  7 +++----
>  drivers/spi/spi-stm32-qspi.c       |  5 ++---
>  drivers/spi/spi-sunplus-sp7021.c   |  3 +--
>  drivers/spi/spi-uniphier.c         | 13 +++++--------
>  10 files changed, 27 insertions(+), 44 deletions(-)
> 
> 
> base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b

