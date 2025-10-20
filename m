Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0713E2620F5
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985438; cv=none; b=FRV/cwCpenvCiTPKSyh8qdQQa6l+79Sworx7hcMPZPzNWLpGv7uexiq7NF7coE+3layIb5taT2DY7PmNzR/32oUcqTzNLMQVudhJ44v1NgbQfo53ABvtjzBaRXrG30zDwaO2aMIqNvhRvZ5B+XWdRgY6hMkZHUXI/EcNdoSW4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985438; c=relaxed/simple;
	bh=1vFXt6XRVipPdMLkxRp5oxg38DR886N+xgXmYyeXzbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyNEW7PYwQDU9OS9YGQhgcIm+uLTyNhjG6nCqMllJrCLYEGFgosmEsP8uWQH9wdAL4l0yO75b3XxieKd4Q6Vt4MQ8DSxIkc6nriEsaFvPwKI9EqNmQm3HgC1V7hujUCu6MfrfX9P2KpRAsPkAeaAGCfHw1j41/pGSS9ntOI/Jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cC1AwZkM; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cC1AwZkM"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-430ab5ee3afso43382925ab.2
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760985436; x=1761590236; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jr/vYXNnHg5mvV0vPYpieCO6Isu4juKQ+h7apsb/fSI=;
        b=cC1AwZkMelavlQ1bnRu0Zp/m3A6vCiNFUp4KriGIEdBlK52RZQLLLiB8iNffVMhPfn
         NX/iyWGxdKi6HKizUzPKbUZMmkwxVVn36Ee3vJYJ2idc2MkOjSwKLZjyG4kLs+NJgyQF
         uhk+YBFI1TsWwZ0rFVhow3jkStAhU7qIhsrPRk7ZTOqt7eULsuXcQmNePhmrZPswHD63
         dYFocKxMpjDEPz0Ps0uQ3IAtay3ZG4ZdlcZrL04VOYGnF7krhiDmzAjCjXZuzLEZgOOJ
         v/UBZw2274UWT2HPjDgSF3qLvVLp8rMoOjTuJh4F+MLwQW/7kkIQM4FirncOtx3lh9my
         R1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760985436; x=1761590236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr/vYXNnHg5mvV0vPYpieCO6Isu4juKQ+h7apsb/fSI=;
        b=jCbBErChiq2n4lBzy4vvOi8zkcxg5/4h777vNRSVV31kZ60Y/1lraXNNdHPMgp3gzZ
         3kHq0xqByNH3RYrZDwZe78FPyNr2Ngi3q7aChzRUXy2tO+wLx0fFphXD80b6SJZVuFvh
         vrjeXC4ucQzCaVxzSuIETVnAeIZJW52b9lUWNwGzEhDKA2A6XjdQ5hVtH/s5MMVX+78r
         bbKFXMQhqMuP4uQBZp/US3KXzm3fSXJFgPoGJM/ZqN72CZLJEfG7KG7i60nu28YIjA5X
         YhciOM92TtGeU6u5m5depqYXdD5On8in25Dx3Aehk0l3/KWU0Fk8iIvVStmC1C8/gGAD
         vdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ycvwlX75aM+IFYFkhc0gy+tROSngJXhoQ0LkNKhH91kxbb/qKv9pcR8l9eBdxis+r0w=@lists.linux.dev
X-Gm-Message-State: AOJu0YySvv5om1gi9U6yLYhZYrj9ROev7NlWPOLDuH+IuyLNIVNZAxmL
	Drp8nS3f+qkNIBUP7zfqsoQ0pu/h4I4/CLZYLL/lCPo1CPw0xowIw46nqt2jKuCQL8k=
X-Gm-Gg: ASbGncuqHqFfvvyhcfiyG09neGE/QmI8fzpLvzhydY4uYop4HwXf3jaLQhvkC2N4DUO
	b1COGkuzZ9cC1x9M5N1+C0/fe88vZ1tYMB2q39p2wdxYDnEr4Y5nE5XsNcK03vdQkkyBufMJlm6
	oq/xJYAISpuqrEOHqEhXHWN7wNkSJKaxJ+o3sw+gYJIym9vAdVTgN2J6YPsR4u2bgiHPDkt0Ufs
	h5M5xDHb7/4oMnxRetYOZsQk0aF4pojoyHAXVrjIPD1tUqgql+gwTcAoE3nzTtQ++XNtN6+L72q
	vaYPXMRO61W1FzSzQDhQ/9xPzj/AlTGa8waIrZT3G4fPrhN/G4EFGI4I2Q2cpO8v1vVqMw+Tcf3
	2+4lT/h++LaanR+t3slupvW70L27jMcPYE4SJNJvEcIK6YmtpqqhdYs5mD+ALoPGRCgTD4knwBa
	HxsSDgimyutvNNa0mwLxi5pk0hdq28/oIN0JFjnqs+wZdBj7j3
X-Google-Smtp-Source: AGHT+IElNLjj7kkxLdaR/W624I/459FfOH+dYJAUUw0iEYH3D4Q87WRcXxpP//DJVpw9S08uE/P7Hw==
X-Received: by 2002:a05:6e02:1523:b0:430:a973:7e53 with SMTP id e9e14a558f8ab-430c5294ff1mr183507015ab.21.1760985436041;
        Mon, 20 Oct 2025 11:37:16 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d070ba35sm33475995ab.10.2025.10.20.11.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:37:15 -0700 (PDT)
Message-ID: <e40f28a2-960e-4002-8384-d99343b4fdd1@riscstar.com>
Date: Mon, 20 Oct 2025 13:37:13 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Mark Brown <broonie@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, han.xu@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
 <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 1:26 PM, Mark Brown wrote:
> On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
>> On 10/20/25 12:39 PM, Conor Dooley wrote:
> 
>>>> +          - spacemit,k1-qspi
> 
>>> Are the newly added resets mandatory for the spacemit platform?
> 
>> This is interesting.  I never even tried it without specifying them.
> 
>> I just tried it, and at least on my system QSPI functioned without
>> defining these resets.  I will ask SpacemiT about this.  If they are
>> not needed I will omit the first patch (which added optional resets),
>> and won't use them.
> 
> It might be safer to describe them, otherwise things are vulnerable to
> issues like the bootloader not leaving things in a predictable state.

I mentioned exactly this in my message to SpacemiT just now.

And yes, regardless of their answer, you're probably right.
It is *possible* that these resets must be de-asserted, so
it's safest to describe them.

Conor please if you disagree with this, please say so.
Otherwise I think I'll keep them in the next version

Thanks.

					-Alex
