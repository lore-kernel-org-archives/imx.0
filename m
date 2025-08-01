Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A71F5619
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036594; cv=none; b=cmKzuOK7eoBS5hRwZq73zyUPAbz6t3MJTGTcTRreEWJtKn0z6A4Fe7VGZDkjs5hTTk2+DQqm5Mf+quybne5svZQsRi1acYAZh4ZIbzcOBaH2HMBDhBXllyx9NSHLHTH8OG7d0rae3lYtlE6tRbwQEHPsMdy00p4uf5NXfD4pIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036594; c=relaxed/simple;
	bh=Y7WQ7L71H57fDKal4CKiDxZgn5pcjDXeUkmROUcHIOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGTU/AsOmdfaBd5/5kB7UYu/5azOFdtu+ZCp2OnUlcU5fRHI//1U6hRBqoGOMFPp7LzELbNSXVigvbL9BgcKLLebrw2szidNi5tTIiVQNNklCNqza8L+pa1Nd1jf5XfI9ogLKcWCiPKLqR8MCq8svJZk6r/BaMsJPrJKZR0YjMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qkgSIX5C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qkgSIX5C"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso7207785e9.3
        for <imx@lists.linux.dev>; Fri, 01 Aug 2025 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754036590; x=1754641390; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOC4uGHuBV8wACSUSYr4zqb/AWSw2lkHtrho7jKDnI4=;
        b=qkgSIX5C/nnZJCsqfLKAo6x+5KSpnDagtzYmBmehB015pgNr7PBLm4KWMe+dggrOXw
         jcrusmAtbWv6KYbrii7ZfumbfkBdG6Z5sYaI0PAKXRC76zuEJbIEuKEjl33Dp/fukPwk
         Rnf3nU1C0p09GHIYKRgdTwx2/0UROxjHhPMtP5U1ydVN3pghjYlIC43AyoiLHrJKSB1I
         0e181A6QJMRhrloTqM37snL89C+8kt2vlNFgf6BvHspIAY0BoR04MXdJa6frdvrGHkFk
         NVGlFlpphYOZ5NF/lj8YLfnHsWdc7JRGtof3//13p6sBvPNg8N77y5TRvNCwgDFuR/tb
         qOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036590; x=1754641390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOC4uGHuBV8wACSUSYr4zqb/AWSw2lkHtrho7jKDnI4=;
        b=S1wu8LxwPrFWgYXhHDucKinM7nDOAQARMVaydSnbemj1gu0sEcjwGJrC1O8sT5c7QD
         04lCKldDESFCklI/nXgHiHS1wStF0MA+U1VwFxZ2bPAGRgK0Tz3u6CvNGAXdq0L6yJIw
         oD94lBkaxKgCRw7pSIXbBPICVJHiG4SzxVh476jR2qUsU68pYN8Qiv/eNvxv9YCDGg3V
         M4tNlEMD8G+6PwriOfaV7qAf2gEpuuwhWLir+YVgjh5xTS3PhmCAg9WjTCy4fFvyDgF7
         TUrPKBXiX+NSrGNjNIJqZkpOtFNEqZUZYiasHrVsfNAiHPnoS1Dl/BfK3iTnW5NZQEdn
         Nt+w==
X-Forwarded-Encrypted: i=1; AJvYcCULlTcW/ZJGYq78JpirH75eQwVeHtsfieAEyBB/jksjaZI8MCnl9uFo2vsAxA5NdlJzNP0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzMwTc+ufp5ax2pT+DfV01aiWIdtrtWR3mccKGqJCC7/p97cKc
	naOq9RG5oftIFOAn4Fu6SpZ/HvR9jr//y4G078c51YVBkxR9QHLLGcJ30zDa/bWeKz8=
X-Gm-Gg: ASbGncv7LVv4XFBmp4iq80gPN334X4ZtuN4svDp67Ln2ZS/x7RHJ02feS1mKhbCPYol
	FpSmTjvROLVci9jqjwIoSHrXDq6kRmCjJWcsNXS117Aj1TGT0yzYfTxRUY23WguxBGxrW3fctez
	bTld7y5fA/77qxhq7LXaFnqfWPObv6VF9u9wjfqdtcsjD4I9F7HXnK/ghENnP4n7HwjkFsqghe5
	UI5EG1WdjAUYat1nJ2MPRjrMeSdcmmokGqr2+Fy+bV1gGvlPlmNn/qKGAgVtRkqhfmJK9x1gpfu
	oKpv0j8ORnoxV/FuToVgFaO6AVPt9AySlaR6GeoH/O1BHBr2a4u1g0aPptw8BZ6M4tGp2x7C33l
	jkSy2JTzMTHI3wwbuoOlG6sJhg790dJyxRjIFgJpZL3hFj83+HuCQqyuJdfe78w==
X-Google-Smtp-Source: AGHT+IHFaN3+egakRXZOjinaJFG+r4LMkGjP5kelar/Ki6ZV3odXQ8ubCXOx4u3mK+PBxlSADMEjhQ==
X-Received: by 2002:a05:600c:630f:b0:456:18ca:68fd with SMTP id 5b1f17b1804b1-45898a828a3mr106806585e9.10.1754036590465;
        Fri, 01 Aug 2025 01:23:10 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4589edf5683sm56534915e9.7.2025.08.01.01.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:23:09 -0700 (PDT)
Message-ID: <4b2bd0ab-cc4b-4afd-a46e-60ccc8d6f239@linaro.org>
Date: Fri, 1 Aug 2025 10:23:08 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
To: Frank Li <Frank.li@nxp.com>
Cc: mbrugger@suse.com, chester62515@gmail.com,
 ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-3-daniel.lezcano@linaro.org>
 <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
 <87d40626-8789-4e71-8ac3-fa8fff0a7435@linaro.org>
 <aIv5hYGq+fNStRBw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIv5hYGq+fNStRBw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/08/2025 01:17, Frank Li wrote:
> On Wed, Jul 30, 2025 at 11:15:54PM +0200, Daniel Lezcano wrote:
>> On 30/07/2025 22:21, Frank Li wrote:
>>> On Wed, Jul 30, 2025 at 09:50:15PM +0200, Daniel Lezcano wrote:
>>>> Enable the timers STM0 -> STM3 on the s32g274-rd2
>>>>
>>>> The platform has 4 CPUs and the Linux STM timer driver is per
>>>> CPU. Enable 4 timers which will be used, other timers are useless for
>>>> the Linux kernel and there is no benefit to enable them.
>>>
>>> S32 have not ARM local timer? It is quite strange!
>>
>> I'm not saying there is no architected timers but there are the STM. May be
>> I can reword the sentence to prevent this ambiguity.
> 
> if there are local timer, why need STM for each core here?

Yes, I had initially the same question when upstreaming the STM timer. 
Ghennadi explained the automotive designs can partition the system by 
running a firmware and several instances of Linux. By using the STM, it 
is then possible to have the firmware to read the STM counters or to 
stop the timers when the board switches to debug mode.

Ghennadi can elaborate more on this if you need more context.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
