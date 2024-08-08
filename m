Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155B14830A
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 22:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723156832; cv=none; b=jeTzdBy354ckjtwPs1YzM11GWm8MTiMh8FYcPJ1TQFl5jBdLbGHwqBKfVCwUZCiKVz7npErS9aOXokG5ui9x2uSA3rnvpv2IAo3ATjbbDTutqkMWZl1Xx9wWBPxhOIywOWB9IeXq2Jq4oQg8IvFYx3Y+qqvRUeWc/tSqEJCc7uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723156832; c=relaxed/simple;
	bh=7/Yd8Now2RzaC2ZgU+e9VQMlAhXQP/Qjwowv4hiEQSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uj5/qjiIHJYLOf668f+/RWf4c4TgVCf2NuO9zGpPiAURDfty0UlGa2Y7JYxagC62pZrpPTMGwVGSqGdxMWibxTuN2hCyyEgC75xFrzv0QL1lRbNSfdSmlx1IVY2mqE9ZET64JDJcDwnq0VYIeo4a7MJyLlTUrWRv8OJvIi28YKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bUxj3v5W; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bUxj3v5W"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc4fcbb131so11590415ad.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723156829; x=1723761629; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=bUxj3v5W4DctVJXzCeIwfVtcGZcWEEXIVgv9/QoTyRRWP1RmvMBgE+OU+LgPzcCbXE
         H/fHGwBP+2h0Y9U2WVfiIdtOIP4lDKXMXGYzmxz1ett9EGtFaG89KQMvB4rGV4bXuXAx
         kNnYuv4MbwRDeAXXpf1rle9bQBHKWo3m4btl2VVlccUqQcvOi/oQEYa3OFh/qFgLP07g
         GIZO+u0lvhVOxjo7gKCznSHeuDTQWHZdLouQbBCz9T3FdUQkKHjQvxA2iY/8CuOeAnPK
         dcSs05x1bCXLD/shuP5WGiHj8MtDTux919q5R2RPpcuTJhKYI1oT1VsrEO08AEFHxSCK
         BKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723156829; x=1723761629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=LGEoEL31Xj26k5cF3cUwUv85L73DHzIkpgMToz8Z/vO2EkKfWHSZmCjWibOVHZPkow
         rDUAjpFmfMtzGq7KZmM2SHHIRag7LJJW+Tlv78bkWbt8UfIXKV9Su0xKlVXth03OoGx+
         2hzUIdPJF3WEy8Z7l9CI2QulCG5DAQku7+sjUfJUM7zyqXgAaOpOaBwff9wNhEID4hTM
         xvAuQKn0GIrMyLTPUGVYwkXzn7Q5CSa19wjjTQ6cHZffNAZIwxap0ztxvpSQ1ewCcGJl
         bYj9OFpYPTF0Wvpc4oScOaHD7rk0YUqmdwoPZj87RgHw8VrpeCoCcEdJMNLIkHwl2VEK
         5cLA==
X-Forwarded-Encrypted: i=1; AJvYcCUMqD3DD12UCtfnq9pl/sycviUuRQObjsdIcKSHcKPEfp2nUwzyK/16tPPAfy9T9s83rrqKYXvuuaOuCO66UZvyQV1Y
X-Gm-Message-State: AOJu0YxZQbFzVVNlzI51lImuK8VsaXq8IepbDF6IWytQKkRqrE+I9PXt
	zd90P+D8r3JZbjejxUjFRxhiO8HMUWwV5DWbJLN6Nqcw0rDFO0WXromsQKLT9L0=
X-Google-Smtp-Source: AGHT+IFuozGVpD2S8JcbyZGe128XhqnFMQbDl0tXLzyrxRy3snyF4waOTyuxeRGS6PqrGLYA3KLmIg==
X-Received: by 2002:a17:903:228c:b0:1ff:4d4f:d819 with SMTP id d9443c01a7336-200952633e7mr47633515ad.34.1723156829035;
        Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm85768725ad.207.2024.08.08.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 15:40:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren
 <tony@atomide.com>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
In-Reply-To: <20240808164941.1407327-1-robh@kernel.org>
References: <20240808164941.1407327-1-robh@kernel.org>
Date: Thu, 08 Aug 2024 15:40:27 -0700
Message-ID: <7hcymir63o.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Rob Herring (Arm)" <robh@kernel.org> writes:

> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>
> "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
> the closest match.
>
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

[...]

>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-

For this one...

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
