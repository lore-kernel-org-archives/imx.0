Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B59320E
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731111093; cv=none; b=lnIpC4DhhtCRAUP7NT1Zrwl/EBRdoFUYiGV56uLmt/424z145HGy2u73dYqujwANooxLBkWY/jQatJgHX91CEnRYMjQuIjCEHDjcDW6NSryyjC6qHX7MTLeEuEq4w7LAm0bNvTMIduO/XNdwlWK6KgS507LbebA4XWL+dUwpGak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731111093; c=relaxed/simple;
	bh=9NwaDc+sH59d+cHFwqfcTVbsIdXs0neqNpY43IxGzbY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cAN9ZuOlOvt73T4Uj1JVoTJsS9CS59gz1Byi4rgiTF/3of1U5nttnqAXW2+3M1f6z9+Pxtk2JR6fWJ4xUci181et4HGeyEkERClZcfwp84BUZuki0HZ/tdcGYFqkMzo3e1HqAlUxazzyK24BsHtcbEVVrnVfbkrjcRA6SIScrtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+BUui8B; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+BUui8B"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7eda47b7343so1916133a12.0
        for <imx@lists.linux.dev>; Fri, 08 Nov 2024 16:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731111091; x=1731715891; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3IZGLZAVK1oqGbVkQTDsgw2qviq88uDM6MYfmQbYgOw=;
        b=m+BUui8B5FNZOBxLruUT0PWsWJ+buYuByHn5kCiP8YWO9U8LBkDe4DpBCd1Qedz8fX
         I/5F4xvdzOWoMOfMJv0f8TPaOG3tHYeAjeRE3BJzEl/nLSap14vPB7xVqJgBSvxTUxKi
         TuQdMEc/f6Y8fvBI0AQbbF3WG5qHuwetNGn2nXirFkPbfwWQWOTlB7TC2nMlPnu+3M7U
         PSMgYZVLP+Bm+AwOeAXsasEP9htmY0/h7Qai5gUrxTsdjde44CbduWG8CQX9aSsZPCUG
         4HbLV9OmxjaBgnEaWDSvW2hP/NCOGbgJ7W9eRD9kizV8hXEhN0HbrVNGbv+HkclWpzh+
         PXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111091; x=1731715891;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IZGLZAVK1oqGbVkQTDsgw2qviq88uDM6MYfmQbYgOw=;
        b=NRCzVlz2/7ygaYoF+MrkFiGP00nifpHA1rjk2abIcGzGoL0mb5hgCOq/7TMre7uiz8
         bbLiDbdcIfpFuwYM1wQH+HPwtYt9s5QRA8Dgw9axeHv/16PmOMAIseIPSut9daQn6C0S
         Ke+tTTZ3cm71eccANvgo7a/ESJJLdHFmnSS9UDNYlsO3etlbNp5RP5niZ1qEcs40Gdyr
         xpf9+kkGeddvnPPjAisEvYsj3LecsAtHg14Iq4x8Zp022bUz8TmTBKTO0LB4DOT6TCdl
         DcYjCR+9Nor2zaD+r8e1zPPTd75Am5SYyuMtG+hgSHGkdm3vWTJeoaI8UgbxGnn+o7Pc
         7Few==
X-Forwarded-Encrypted: i=1; AJvYcCWzcgndu7uGDljjcY5jfwGOIDhZ/uqHBGruSR0jW9ft1Q8ohjy3lQjl1e2I1ZzTc6LH1yg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0TmhthVYlauHPFPsm3zh5zUxcqjYFttEny9pSiheK/53JNs7E
	FvWNYymueAlMat3eZ2D27ns7mQ/Kqe+JJjR5eG29JW3bDIt046wM
X-Google-Smtp-Source: AGHT+IGuXcqZTQ3uvvLT9UskUYdxGCdtqXC8QEEu9t5fHd+ir4QXBLBtFwW74giJKCVZUtxSJ6Qjqg==
X-Received: by 2002:a17:90b:314a:b0:2d6:1981:bbf7 with SMTP id 98e67ed59e1d1-2e9b17947a4mr6159364a91.32.1731111091548;
        Fri, 08 Nov 2024 16:11:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f8f1dasm4677556a91.25.2024.11.08.16.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 16:11:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b262ff19-dc57-4a72-9395-25d81e48a476@roeck-us.net>
Date: Fri, 8 Nov 2024 16:11:29 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hwmon: tmp108: Add help function
 tmp108_common_probe()
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-2-6a8990a59efd@nxp.com>
 <c1b77ef0-f01b-4926-8259-e387166d0750@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c1b77ef0-f01b-4926-8259-e387166d0750@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/24 15:55, Guenter Roeck wrote:
> On 11/8/24 14:26, Frank Li wrote:
>> Add help function tmp108_common_probe() to pave road to support i3c for
> 
> help -> helper
> 
>> P3T1085(NXP) chip.
>>
>> Using dev_err_probe() simple code.
> 
> Use dev_err_probe() to simplify the code.
> 
>>
>> Add compatible string "nxp,p3t1085".
>>
> 
> This is borderline and problematic. First, it is the one functional change,
> and second, that functional change is not mentioned in the subject. At the very
> least it needs to be mentioned in the subject. I would, however, prefer two
> separate patches, even if that is just a one-liner.
> 
I forgot: The additional chip support should also be mentioned in Kconfig and in
Documentation/hwmon/tmp108.rst.

Thanks,
Guenter

