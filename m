Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5D2512E1
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017547; cv=none; b=Wb77nxrOMycwVKagAtNUvAEZc+Qewzy3L2c+sPiOGJI0vD5Go3Dc1OOBe8CWLlAutmTplLBAhMCuq+pCxQYFIygW70+IcpA8fl+kOczDZgr9P48RMdS5NsZCNzYMCgWPMA4X7pbCFO5lJqcZDtFpdTRpHd7K8N953tVIkcOOefM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017547; c=relaxed/simple;
	bh=ymlQkqzyhQ/QPDDRJdie9S2n19N7122U3ZVfMyAGAeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuKO/vwNkCdE/kMu2HQDAPtB0vrZrlUl7g158tUx777p8KL7fsU8zmBGCgMK2J4pZSFcog1V8CGphSaBCtQqDkIP3l6bvmgYktQqAzYfIV8p2H1INqTt5aKKXLHg8qzxQeIMeJM3/jdH7FUS4MZTQ4zKNwiUX5cN2CZi19wHpFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=udFtX2Kf; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="udFtX2Kf"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c1818c394so1375124a34.2
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745017544; x=1745622344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=;
        b=udFtX2KfuM/4l4QHxIFTpwgORPJO614bo1G/e4+SFQracAmZdIR9rHpyVPRvntql/A
         IsPiWGHRAJfySD/zTXm1aXqneG3U0L4O0VmGI3ki3vBp3vL5hEqvCgCHP67ByRDOgNEV
         lKFNtiTbo+UqFvQ+kQHfF78UmrOFA+5oOChu+hDXCaDXbzF1G6KaLRdJsj3I7bKp/veA
         ZHWdpoAfrePzOK4Zv2RXs0JwhLkWUm5Wl1c3fUF0nvRkayHefDpUga4Y5j8FR/UYo0sP
         RldHW4frtcxBvi+1b5gIALb++AoE3yJowtnxEACHkpv7PPubyCHyD5BMiJlTRP8CUNFZ
         IWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017544; x=1745622344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=;
        b=pwR1VrYuRhP7VhG+xql8qOCFmRJL/hKt6nsITZy0BvUwtzSbuGrjPnlabrUsedNyK/
         Tdl/rS55z0MSJJ1kDiAVWvnHwpkhIXOHCW63tfFzee9MkvbWJAsZ/c1XJkxITo2qHzhg
         t5DN6KjySAB9OU+jydnWwiyflYX/R2YAU0Bv2B/aGRhYzoKQMSuysBfvc198dHuqbgdK
         yz2UKEzNnW8Z4QEstOA3v6bUba1l+IjPIjK7HTOJipJyvLd4bp1deBn8DUq/HLY3mQQo
         hYrilGEheQHKlY889yborm4XXxYAJ/8uBblz35g/PTTGVMkFY+qULfLZ4C402jLZM8N1
         ThcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9wrMKD6EriDkiWFGGm9FPgRubftGfbRPkDWa/mGnGf2uyR6fEzV0cL+zG9lOqnpkHeI4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2JsNderbLKTFMLEce3ooWKDA80DoDO+NEnF6yHwiSjWPRBkLw
	/yTM5tNDTmVDpWE1SgrpRFNoNAa9m4SqwHBcYMr88RGae4ogqJOurrMJ7ZMhaNk=
X-Gm-Gg: ASbGnctHNWgs/+nNNzyhBFGt+0EZzjskfvbSnM41SPLuxONLSqa20HxLfUdgz2SrDN4
	t99Q9qVBql5lggqr4OKiV/Jx7McdrpvuUJqJa/F46FC6LUbglRnyiar5wt7NqSt0klWEe6mWIni
	0brNw1uVJGzBGBXQvE8bCWMqULQbdutf85WFhjb3F9sL2rHjCoPKdbH1klaTv9LyAPszG4q+pSU
	mcgVatCSc+TNvx8XPfgF5ZvChllup3oRpHxY5U1tKrPIASCWtfe1TtdRXXAMjhWzkvXPa33jksl
	N7PJT4/J6EN/um7LK9NYRCFTzhogicV33Ad5Q0MEnhguFWQkXWtEBZ1XduUW3Qjf3nL3xuW1jvK
	HTSLVIRJ6oLCJ0FycXV0AbM0Ofysy
X-Google-Smtp-Source: AGHT+IFo3+CGCCjL/MDLKOL98VKpPnk7r+cnqZ8GYDV87Srf78OvwPE2vbzd7+9ZcA062oFaVEN0Pw==
X-Received: by 2002:a05:6830:3693:b0:72b:9316:d596 with SMTP id 46e09a7af769-730061f15a7mr2627791a34.3.1745017544135;
        Fri, 18 Apr 2025 16:05:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279? ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300489c6e7sm502383a34.65.2025.04.18.16.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
Message-ID: <abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
Date: Fri, 18 Apr 2025 18:05:42 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] iio: prefer aligned_s64 timestamp (round 1)
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/25 2:58 PM, David Lechner wrote:
> While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
> I found it very time-consuming to check the correctness of the buffers
> passed to that function when they used an array with extra room at the
> end for a timestamp. And we still managed find a few that were wrongly
> sized or not properly aligned despite several efforts in the past to
> audit these for correctness already.
> 
> Even though these ones look to be correct, it will still be easier for
> future readers of the code if we follow the pattern of using a struct
> with the array and timestamp instead.
> 
> For example, it is much easier to see that:
> 
> struct {
> 	__be32 data[3];
> 	aligned_s64 timestamp;
> } buffer;
> 
After sending [1], I realized that some (perhaps many) of these would actually
be a better candidate for the proposed IIO_DECLARE_BUFFER_WITH_TS macro rather
that converting to the struct style as above.

Case in point: if the driver using that struct allows reading only one channel,
then the offset of the timestamp when doing iio_push_to_buffers_with_ts() would
be 8 bytes, not 16, so the struct would not always be the correct layout.

As long as the driver doesn't access the timestamp member of the struct, it
doesn't really matter, but this could be a bit misleading to anyone who might
unknowing try to use it in the future.

[1]: https://lore.kernel.org/linux-iio/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com/
