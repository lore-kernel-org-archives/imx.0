Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C811525DB0B
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509548; cv=none; b=c0eKkJjiAavGo1jPt/r0fUMFqCYE0r/obayTG/HakxFK7W+bVtPumsvTc8DLv4Nr7lXp9eNVrUpKpsbcNziLmD1zdNCSnySrkeyIF8FkNZIAncrMv683s8bBkC7bstw3CN7UvSnZxzSzOQB/BNUi5qy4X2qwNqQSt50cDW1cqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509548; c=relaxed/simple;
	bh=Ud5cVeqCrhSqByxBQEPlGgrKvjboJ0YYy+W542jSiCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pe6v/EO+fMWZv2kgcVjwpxMCv6SzuDs1UTDijppWz2sLgq06cfq/ceybrISBgagYabIoAGF9TigASvY3CNcZPHaWewCDXNfje5X+z6yP/fHiySlAdPxddtageSm2fmhH4IrcvalTieeVNc4XKCqdPtxk0krnGkTb2aQwMSAhP2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arwpo7U4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arwpo7U4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so3753163f8f.0
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752509545; x=1753114345; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzg/M3LkGVFpt8ELQhzn2f3Sv5jfT0EMwgEqK6jhlaQ=;
        b=arwpo7U4fTFqbaRlz2v6AdnqgKHXvpRE3u5r+bY2QxtfeEOnFSTC6NSL0J7/MGhWKd
         21g7FzNuKUq0RW/9pMXLrkLnQmlFte1HS5a5QxdJvroD26R9DAf71MaXDtln3cERIew/
         w2qyYHHYNKrz4trF7stvvRuLAQLEKaRnKe/o0KXKxabTzBUoGaM2S30S7O6BEh1+mNT+
         Qb4wvltwnL6M7i5lJaOpUXz9Z8EreWsmv29u1R9PYtO0M6XlSLNwLCX8w4DtVy89r4eU
         aBoOKTLCBYsly5J9Vw3m/6xfzv2Yg16YotFDSoKlwYGhC2tHU8aWjrgF0UgyCqF0edEX
         7zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509545; x=1753114345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzg/M3LkGVFpt8ELQhzn2f3Sv5jfT0EMwgEqK6jhlaQ=;
        b=UvCqm5gHjxEYdJcAJhBu0C2tFmlC/53ZoDowMsaPx+rHXYdWYpIQUxQ4oPfVJXnAT/
         D5XSqc8rV8KtIj2LlgS1SJsPerL3X36W8qh2sj+GiBP+xH0WTgBUcg30Zo5I/WzEbIw+
         SC1Ws1F6RPHZvzKH42OvPYcSAFH+jrQb7CbRpLqh57PEL8JaVdKFrT7YGIwRdr5Z1Jv+
         4TyOR19X9K119QpKKXd5vcPxGKqtbRh0Uao8gr4e2V0i9Y+Lr2w7CvcfFtDeqQhbrSi+
         ISOAEY02G+mDqfyE5kHfvLIQCwi6/eTBjafMWZLJzqALN/KvVqyzgfPCBia3lEo9oQEH
         Mm2A==
X-Gm-Message-State: AOJu0Ywu9YlD52L5bkWm5kN9xdLfgya+oAbjuwYGEdhYB0G99Jxs6Kjo
	DuPqQ6DY3rJ3nuJBZHzY0yH/44TzFbgiENy1pJ0/+3jDVvgz0VEjNhL4p47JVX9L89Y=
X-Gm-Gg: ASbGncsemN5LHf2QIqWKnJCZryVf0LZs5zXs0vWPcklbQ/mJiw2gqJNPDhowdrfipsV
	mXm09x9SfqqqCkeI39E+6zhkr8x/pHF5rRoO1csf4wLGekVVSZIVWpYgDHbuEgLxC1FMBU4OVR/
	UqP93blgTSaNy50T/sG/GtyW030ZyBOj2YkgyUe9hmW2dRyFZD8N7SUWa6GgCkYBGNr06M05VoP
	+4I8Qa7YukCgFh5KvLOxx+9ovt8+sB2fxjMf88AgL1jT/InpSo7TjC8PVGJF2Xcp+bdTHW9HVfS
	UlX7XuQquN0odcX4bPc1Q3C7cxKcrP4xFq8OP10Qd0whPqTxGr50KnpL6+yc+0Op60t1tHi4b0X
	6npXP3pSTzEroFla5bk5aVpZU0tGaWTho6n2kq0rBm3FKFwshnuV0Hno7+VA7uCDbZrwYjo6lGt
	3+7QXBYA==
X-Google-Smtp-Source: AGHT+IFVO69NK6TLVDV9V9ARXGldGhKQ7IorXlDR8Y5hpNvYSeqRuAaCbC3iULGdQkY9+PrDjKAl7g==
X-Received: by 2002:a05:6000:2181:b0:3a5:52cc:5e29 with SMTP id ffacd0b85a97d-3b5f18565a3mr10560074f8f.7.1752509545082;
        Mon, 14 Jul 2025 09:12:25 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:151f:275b:ea0c:492a:7f48:847e? ([2a0d:e487:151f:275b:ea0c:492a:7f48:847e])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1fd7sm12606620f8f.26.2025.07.14.09.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 09:12:24 -0700 (PDT)
Message-ID: <ee1dd7e4-c34d-4c94-ab44-b2425adad4e5@linaro.org>
Date: Mon, 14 Jul 2025 18:12:21 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: timer: fsl,ftm-timer: use items for
 reg
To: Frank Li <Frank.li@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Animesh Agarwal <animeshagarwal28@gmail.com>,
 "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250523141437.533643-1-Frank.Li@nxp.com>
 <aHUhLSDQ/vdrg3hX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aHUhLSDQ/vdrg3hX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/25 17:24, Frank Li wrote:
> On Fri, May 23, 2025 at 10:14:37AM -0400, Frank Li wrote:
>> The original txt binding doc is:
>>    reg : Specifies base physical address and size of the register sets for
>>          the clock event device and clock source device.
>>
>> And existed dts provide two reg MMIO spaces. So change to use items to
>> descript reg property.
>>
>> Update examples.
>>
>> Fixes: 8fc30d8f8e86 ("dt-bindings: timer: fsl,ftm-timer: Convert to dtschema")
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Daniel Lezcano Or Rob
> 
> Krzysztof Kozlowski already reviewed. Could you place pick this one?


Yes



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
