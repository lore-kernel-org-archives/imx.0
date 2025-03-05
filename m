Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDDD16CD1D;
	Wed,  5 Mar 2025 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215843; cv=none; b=EsWhRYMmUKgMQw0kNNXd6o5Uy8iOpM8F0Hb+qsRUx9CuP8KIh8DJaWx6cGI2WKLWeXBcOz/k7CqQ17J5u5VRBO0QvLzIeYFGF2MHG1Yh9vHYGm0/4/w3vCPTPJd3JDQ7AyO8AENcSwcAAj3RUPP6tNpLzXo5bbWRxIz7xMNuIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215843; c=relaxed/simple;
	bh=VcksP8vfLKbAiPpfgWERhqZafM4BZ0Xbg+XBI83YkSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhPvddx1+x+rFx4mDeeLI8P8VwKhkiyRkZEF8bWNXoaGoEoGJTGr8IeG3REcO3eEnGmjerF4ajygelsDRxVdDhtdRQ+XGjFCi243XSmSQM3o27ACazG7R5cSUP8W0vwsmueKZdcMguHqKLV/Uze7y2Rr3O/k+E6/Jc2LWDmJYi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abafS1iL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abafS1iL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2239f8646f6so86922645ad.2;
        Wed, 05 Mar 2025 15:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741215841; x=1741820641; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
        b=abafS1iLAHQ/zjW6E963MT47R25El/G+XyW+CB6SI/G4i7l5KaXSO2T6QKYYDCMaoM
         hPc1jlpjz02DqHbFLe+1OeEHIwOP8cu5n1ELBAgWaP5RVZ8UUX/zusqpzPp+H20aJZdG
         fBz6krJuwBLrRIkJRJl0t5172czJzlT2sckJUfVlDDLdsaBJ8qi0U1FtkF0+oWb/dah6
         JM5nhgW2ANt9ygA0ThPxe7fVWkUu5CrQoDqS0iuQWb3BOykmn5EKerwH11QuWgvmzAI/
         WTvmlpqwgZggkIekiPrr3opF1V1Fxcn0x8gjIxxNYd4hoAFFEjqLEK6IpBFunMl/aWyr
         Ay6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215841; x=1741820641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
        b=YKw4STwMZBZvAfNkgv2fVfu8L4NB2Dxj1PQLT8Tox2AzeYqQgxj8BZ5qi+I5cg5og9
         wJ9lqgPubiL9h+gR1YfR+t0aGQM4xlm1E/kOKOcXA4eulnbh+9vctb74R/63fZQlfmjB
         M/tcuN/hXN0qU7hIIU6J7cj3fvuearvw/0V8wp4BmFTHYC/1wEF3o6/udDFjrvqx/0Lt
         v268QtKjyigTK7nqq3APPT7CBjE6TYBgFPk80trnJ7XDFLcZQCVTIsf6K9DJY3yK6aHc
         faPBLVNhDwV83ZYQBCQtIdsX2jncUPQubm+J+KpklWEjYMPhZ4p410IojOhxcWgzaNwm
         2GKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCfERBKPajhbw62KQN3NzrhuKNnQEG7EaJGsnaHkko0PBnkTUbu2L9pTr6BH49hn+KDbLADBP7Cpe7qKOqUco=@lists.linux.dev, AJvYcCXg3ymwzFZ7os9nQshRqIIz/AoTXIXyQk8IEWPNAbs0zzwM2O4cRQiI5LO8s4Feg+A7Nidz@lists.linux.dev
X-Gm-Message-State: AOJu0YwTueC/GMkCXMiLLf+LC6ZYl6pjGeg281yJuH6melDTDoO/ovJe
	vqJA8/Ez7QmcO5GaakQ4aK2daPTOzfRXb9vTrNoT/cSxWJO9bcaw
X-Gm-Gg: ASbGncumVvNnfnLYPvejXrtHXuuQbTOVUBLxe2idmLXFsLuhLvFOEXdCkbCE09XsQ79
	qFwKI4u+PRdZhcafkCaR3GU84evzGGcbqrUaLh6XNQgRR66hExZlRTPCeU1xbZFv+6h3f0cpt0C
	xHLfPcM0Rhlm+ApUjS5YyZ3TcZ+r/qBO0NURVPS/dpw3lTpkPSuIaAZiyIU2C3loBslJIKcSOjb
	E9MPtUvhb9WYBscYKKXLKnsjQvtUFPhPxHSf8JNdYjpEJg57fBNiRloJF9blhPTQ+ox8wrpTjNv
	rrC6x9oXodY+0smGpgBy1jCS6eKHxoKxPFtJV5jTitMjUz1Ud3hsMkgFfwdAjXKMKYoGjIt3upY
	+7YrNnlK+qbJki6UkQw==
X-Google-Smtp-Source: AGHT+IGJ8wMSqYZlSJ4sp1Cb8aQxAnqhxcIrS7MZKZh23f2DOaW2c7kOg1mKVHzfXB47vtWWZXhcIQ==
X-Received: by 2002:a05:6a00:1397:b0:732:5164:3cc with SMTP id d2e1a72fcca58-73682c8bebamr6106502b3a.19.1741215840704;
        Wed, 05 Mar 2025 15:04:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm7432847b3a.83.2025.03.05.15.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 15:04:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <35c97316-1e40-45ed-93b0-7e4f7dbce56d@roeck-us.net>
Date: Wed, 5 Mar 2025 15:03:56 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>, wim@linux-watchdog.org,
 jwerner@chromium.org, evanbenn@chromium.org, kabel@kernel.org,
 krzk@kernel.org, mazziesaccount@gmail.com, thomas.richard@bootlin.com,
 lma@chromium.org, bleung@chromium.org, support.opensource@diasemi.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andy@kernel.org, paul@crapouillou.net,
 alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp,
 romain.perier@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 02:10, George Cherian wrote:
> A new option flag is added to watchdog_info. This helps the watchdog
> core to check whether stop functions would sleep or not.
> The option flags of individual drivers are also updated accordingly.
> 
> Signed-off-by: George Cherian <george.cherian@marvell.com>
> ---
>   drivers/watchdog/advantech_ec_wdt.c | 3 ++-
>   drivers/watchdog/arm_smc_wdt.c      | 3 ++-
>   drivers/watchdog/armada_37xx_wdt.c  | 2 +-


... and many more. Sorry, I didn't expect that this would touch
that many drivers. My bad.

Let's do the opposite instead: Introduce WDIOF_STOP_NOSLEEP,
and let drivers opt in instead of opting out.

I still have to look into the other feedback. I think someone
suggested to introduce a callback instead, which would stop the
watchdog at runtime if needed (especially during kdump).
That may be a better solution than having a module parameter.

Either case, please separate driver patches from the patches
introducing the new flag. Since the flag is opt-in, that should
be ok - drivers supporting it can be modified over time.

Thanks,
Guenter

