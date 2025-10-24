Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A614B06C
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 02:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273123; cv=none; b=cymiE1mMWOQUKd6MGrdvbtDyIBlvN1vnM+IDdA99/SHZxduIE8AE2J6qVBjY1zEk7KDe+I8uIP0KYd9ipnjN0eiWiZ8ig3WhuCqQsUFWo7NvjsBew9E/i8t+BV+s1f7F6apbxUN0XZJXMmCeuLWtALsDuMuxHDdp6zyfG4mHUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273123; c=relaxed/simple;
	bh=55IQUxzDMcQ4mCOoGJfMg/Ei4ih5BPWUSJBpAl+kkgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjJZw3H2HFb/X2BCpp2JssRpqlb7JrE3VUsqn9DxJpZ6O31xmuZVwFrsDrY/KHQ2/sciZss6o2VGoGuVhZ4AU9GUwo/ZJoDTraupUGD1DqJh0RPveiWyfUbBEXivjjI5UoSTZ5J6gVswIUgt5Gcwxcxz974dBDGZ7a4RtkbPThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=V78dIAOG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="V78dIAOG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-290cd62acc3so17762645ad.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761273121; x=1761877921; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzKUpWrMzxlp8IP1Hn+gGsM8P9oC4CEs0ABcpzIqxFU=;
        b=V78dIAOGBgz/0pSd4oOyhzZ1Vorv+5REnkOfubNjkbap4B0p6etbWV4AgXeSBfFO/c
         iCG25N0Hx6+npjwJoL33h8LANVhVqbriAbHBaj+3EPtGoXRWLEYSSuSLXMIAKK/7jpok
         m5iHjimI5N5MG0Qzq+WwY9/aX8ifNNGd8UauZl8FFnq7+jNaySaIEIwX8hdcFhy03amu
         nbK/Swoib2Fx2xrhBJrm46bIupq+2FNXXtUsAGXm1iRMzWHAlb7+Ggr2ig65vrgXfT7U
         m81JPwCP/6n1/h5AYKsPSzPanctGzpxEOKX2vBJd1TsjvEUbPkEK29x+fsoEm3+SMP1L
         WlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761273121; x=1761877921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzKUpWrMzxlp8IP1Hn+gGsM8P9oC4CEs0ABcpzIqxFU=;
        b=AhZhCYUtK+XYiPujSNozXZDgqBY8Uk4Vl8+29RIcuqIuzybbwb+Cfg+RnZqG6+5YGX
         PIH+B2hdxw14yEUNqvtAW13u+zXDh5A6QLQgOT9CQ1c8C/SY6NxrNxx4hYuhPJsQnPai
         eh9QgguhSFWbjej32onMCdTptXF2lzQQl5xfzs9VTvm7VirCxpG5LtcCWOs+vbCsyySu
         5FgkUVjDAHQx48fEQxodjsoCBUeoX6aREqz8Gc0lR5kSuoiKhIXP1O+JcmQZmHM0G3v1
         Cvs5Rin2gf1nTVoFCETA9ap0F5ALaHy+5qU3nU3Vkb0VRArdyL8PKLpQH2m+kBkt260A
         ONSw==
X-Forwarded-Encrypted: i=1; AJvYcCV6wy/gureBme674VltnDgrHA55NMuuae/y3OA2aUjtnGBbT/VupnEAwAZ7FZiUGDoXoOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YylhThTUno4Nn/vqXHEEqy/E3yKVw5BzEhz2S+n7+1yY1j+emHy
	NGEVPNbBpzNQbV/+DTgQmTIDFo4M2TCw7lG8g/pY/yGfYpDRBUPzp6x9kc8K4Cj6J9s=
X-Gm-Gg: ASbGncuROpvsCkZC1kGe3obyg3clbCpAHng5CzHGPfMOTHsWqRurB7X16ePW7tZUPfT
	geWciCLN26syUXh1aKpr7g7GsYZOO6S2cWOF6jh07QBkxr/bJmvnTAJfXaXk2pxoJetU32ekU7t
	3WPo1Nws76cnRRAi7SkgSolBzslVG+8KxCWN3F/C+l0G9QDRgWbHQw/jwOei6J5kMufU8quen3H
	Bf3qgT81Ft/H0NFtE95yMvuArFJwaAGtR/Fg9vNDMuL/aGNr/3j12/rDtbkRi+FWRPW0rMQlykd
	DSgbJpB1nNCKBGLDgqaIrP4JFBYKsFBn1mbqtW3108Cp5U2aqpIeeBA2DEcL6BiPEricdqOKI9h
	VMg4o9psHaYx1VsJbkfY+UE7xm7g1QkquCbnOxQlT+IOpt3c9VyrnZeoFX0+BVd1lVyvCzHavC9
	i6XEt6QkpKXOsnMs8=
X-Google-Smtp-Source: AGHT+IHA/K4QUyGTpQDn9ihnxw3kPWzudC8RYPggiHagQ4ZXS400Tm4j9rYxGD5oYzwHu+DSEJUE6A==
X-Received: by 2002:a17:902:cec6:b0:290:ad27:c1fc with SMTP id d9443c01a7336-2948ba7ccdfmr7272505ad.55.1761273121331;
        Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
Received: from [10.211.55.5] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0ef2fbsm39193715ad.79.2025.10.23.19.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
Message-ID: <ab1fae69-cf2f-4417-9f19-6383c648e4d7@riscstar.com>
Date: Thu, 23 Oct 2025 21:31:59 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
 <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
 <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 9:07 PM, Frank Li wrote:
>>>> +static inline bool needs_clk_disable(struct fsl_qspi *q)
>>> needs_skip_clk_disable()
>> OK.  I was trying to avoid the double-negative:
>>
>>      if (!needs_skip_clk_disasble())
>> 	clk_disable...()
> Oh, Make senso, needs_clk_disable() is fine

I will leave it as it was:  needs_clk_disable().  Thanks.	-Alex

> Frank
> 
>> But I'll do as you suggest.


