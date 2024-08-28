Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334EB1A38C1
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864790; cv=none; b=NiANZkdVeP09Vbl4AxQU09qfddS1tM0SR8un4miccXE1xj9DHlpy14tw3+nl8qQvJEHqFpuJwXhGT18jz4KCwWsoqS9VxjOO7nmK/RjYK2KD07UaTQ0vaD2KcKH/sdgQhIHkBfzMzUS0IJsUPXUUFr2uRxPLQzGdcitRmimGUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864790; c=relaxed/simple;
	bh=jURjNKStXWs2mHKbeWUwd2VF8RrqZ1h4iMwdaIyEwhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAM32aFJfs3HQ56X8/Gw5X5Kt04out1/V5YlWRuGtWPsB6zYtlDSFGYJzDDAOJDuiUbIqCEXuyQmjkZ86Jxis3QMiaUL/ZoJ+ET3zmKMknIMRS2jNrR5wV71J5cuyRTfXFtae/jXMr5/TfYkB7GCMdGdsRpj1ZVf1LQzctzVPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHgtBQ2I; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHgtBQ2I"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-714263cb074so4957222b3a.1
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724864788; x=1725469588; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mWwXKQv4RLPvt5ylzj8HbeQu7Eevm+FTVYxl5BPQnXY=;
        b=dHgtBQ2IMf+WbNNaNTuCDFy+OMlnfAVXKtIJR1Q3F4kXl+IY0mTAN4JRdT4WNOuLb8
         l8AFC0Nu+6Ckb9Rl7qjMbIfbTKHai3GajoaWUX+SGt0P/UnxUO5X5L65cQnJ9XTs0uyV
         gaV1c2osvwFZy/NiDp0dt86i+3k1WOF4t6LZFXW5wVn+++ShM2m8AnBDX1UyRNczJBLy
         uYdRlA9Tzf/O8woX4TQPftZMng35mfZTBGrLl6idFwRdPQpPs6maQw4yVNao14uPbaUY
         6fJjwA7nhLSD4DUZHzQPdx6BdhMe5VB2WnQrCPNilpWa+UxDanwZiJeIQoqCspoY5btm
         bDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724864788; x=1725469588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWwXKQv4RLPvt5ylzj8HbeQu7Eevm+FTVYxl5BPQnXY=;
        b=Re9j7OEDHAeNnXHUBc4/e0FJzDoNJTfI+pUOHoWor/sw9/wHW7il665Hh34qSKTCqm
         mgcvzX2Eb2obtmsQt6qtAXRCY5JV/DVsp6i4ePWasPA6QsMQgB6l+3+X0OnnFeIOzKqO
         4FgApUoWMhV0YuBIJPRGDJ7IZRfZHEkt2WlZq6uR/4dNPKoV8PqKYqcWLwpILAlo9L15
         0TrXsIBgCHLrPezqdAer5egZAYEA6rvpZxrD7U4saxHdVvVuChTtcogodPZNz20roJzC
         jsDzFYJV5e/dsT00rzm3U2THWPrsU4so2n5kmP34OQ+kLEh3yIacJOew+4manZVnt6dS
         ARVg==
X-Forwarded-Encrypted: i=1; AJvYcCX7SzN3VSnrqxyOLxZrbOzvQ/fl5AGiUU98xeYAyje/FVixRSHoziLZaQHO8p/gFWl9fHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyftlXSQPYncRvXTrUZr0JwEKVSeVuCM2d3lQWd1pkhooqXjR0x
	1roZFlRah2a8CEloOsNyU5Uh7MNsLt6arLE87rhufNLRBW1wMr6K
X-Google-Smtp-Source: AGHT+IH0eUbABNLY8tlUI6E4avQTIqdldUFwa4EDeKM1jMHG6UKRY3WhLuumv8C/EVewh/BqI6adRg==
X-Received: by 2002:a05:6a00:84f:b0:706:284f:6a68 with SMTP id d2e1a72fcca58-715dfca51bbmr131208b3a.23.1724864788315;
        Wed, 28 Aug 2024 10:06:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e0dfbsm10355017b3a.114.2024.08.28.10.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 10:06:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54243e7d-2b54-4934-a530-173ac06180ef@roeck-us.net>
Date: Wed, 28 Aug 2024 10:06:25 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] dt-bindings: hwmon: Convert ltc2978.txt to yaml
To: Frank Li <Frank.Li@nxp.com>, robh@kernel.org
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, jdelvare@suse.com, krzk+dt@kernel.org,
 lgirdwood@gmail.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240828164133.1131959-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240828164133.1131959-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 09:41, Frank Li wrote:
> Convert binding doc ltc2978.txt to yaml format.
> Additional change:
> - add i2c node.
> - basic it is regulator according to example, move it under regulator.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c:
> 	failed to match any schema with compatible: ['lltc,ltc3882']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3 to v4
> - keep under hwmon directory.
> Change from v2 to v3
> - put my name into maintainers.
> change from v1 to v2
> - maintainer change to Mark Brown <broonie@kernel.org> (regulator maintainer)
> - update title to (from ltc2978 data sheet).
> octal, digital power-supply monitor, supervisor, sequencer, and margin controller.
> ---
>   .../bindings/hwmon/lltc,ltc2972.yaml          | 94 +++++++++++++++++++
>   .../devicetree/bindings/hwmon/ltc2978.txt     | 62 ------------

I still fail to understand the rationale for renaming the file from ltc2978
to ltc2972. I can see that 2972 is currently the alphabetically first supported
chip, but that is, in my opinion, irrelevant, and it will change.

If/when support for LTC2971 is added to the file and to the driver, do you plan
to rename the file again ?

Thanks,
Guenter

