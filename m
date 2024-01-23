Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9193BB38
	for <imx@lists.linux.dev>; Tue, 23 Jan 2024 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706046405; cv=none; b=Q9mvwmtLpFZyjXcCrc5EdMrk0nLSHuvraxyycOfKZERiWORw9VILNsItxODAyl0q6ZkvnimFp3wBHDddq1TzmDGDMIGBe8gXFxe102GoTFgdJIrn+XY0t03EVoRhC/QEE5VhSYeKU5ChRiov+ZQ2D1Z4E0cuZgvdWeQD5pkGYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706046405; c=relaxed/simple;
	bh=aN4pPExrA0pcXmC/wmth0D8JjPy7LHeuNi0d+Ufs+Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jG1EU69G7Qnpb3UrWodQPBckv3CkQA+wJ64LN+CA5bI/tRzG4rf9MVLRGHID7GR6JKc3R/1JDnQdClQ3WxdaTqmaXH5ALqaW72g6Ndl/zpUgH1aptzgm++Y4udbEH6mTJrYoY6K0/PhYLdPAbiiLG2dXqfFa2OLJfAIU+Nzh8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6JyK2IG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6JyK2IG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-337b8da1f49so4245903f8f.0
        for <imx@lists.linux.dev>; Tue, 23 Jan 2024 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706046402; x=1706651202; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eetqzD8hoLPJnsv0+oWykLmBW6Ei7KC2UVl+wqojJO4=;
        b=L6JyK2IGQvuS+W1FFAO6QlhrnlaXatzrd7N/FdLNjGTJReONQvrDfDiD1BwOaeh44G
         UFpXW6x9Ecm7V5imDwNRzTs2OVjBAp9FwNiQCxumiEHiVXmhgn9tHqmO2rpMrOqT5fc6
         expobSSPxYawUJiFipskuOgxHu4fLsja3Dzf3gkTCFguLQEwSK6FpgxIRkBrAt7Jdo1q
         /TvYJlaVoL/r1cgA1pqqtwTzjMUquCTG8LO3/V1yPzieh4pUPP/E/MdiQv92DYM442Jv
         kbDjwlKGKXpnKXtKSFuth8vCFSb8bqTWD36M8dOHhLyW5xer2Z0Y+S4NFTK2hgxqirIk
         MwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706046402; x=1706651202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eetqzD8hoLPJnsv0+oWykLmBW6Ei7KC2UVl+wqojJO4=;
        b=cEgISaJa0mhvXiD5ZRFH5bVDtH6QGpwjAmAYA6jjtrK6q58Cg/wJyM8Te1HaJu643w
         5N5RtzNZCa2MIyEyMwAvNq1PHdS3GyYM6o4DMuG7oslU13mw4t9uk7jx5rFyoUIhYD8S
         iuY+J1uAssUCZXKpxbYe8HI+4w/JcEqUEevBDmEF7nzl4ODY29RiKlPhhcuewfuC7Vl8
         REErOBup/KNvQAApVKgDkoXuu/o7xJJtP0w5WSjpM8yqhLaD0DHTOnbwyHhYQyyj3qx7
         EV7BHZF7if1+K7gf/R2sdOmzBZVeiooNpjwCpByAlxyD+fpI0ueiBpjcpj8XotjvHLTT
         MfyA==
X-Gm-Message-State: AOJu0YzYHLcMEkuctXF9CqFS41NbGfbT1vHZgveK7hvMl9A+eIEei/CA
	U44FXKORHv4/mvdZXFG2pdYmI8dtZV7nwieXEGXiGnmg2s7wvvTBvV2kssiomag=
X-Google-Smtp-Source: AGHT+IGAD7FoSnl7Gvab48FlQfOvLPHehWCIr0ffXmkZEDPiIcN32RgC9y9vkVsgION0bJcxhwr6JQ==
X-Received: by 2002:a5d:634c:0:b0:337:bcdf:5928 with SMTP id b12-20020a5d634c000000b00337bcdf5928mr2063680wrw.116.1706046401821;
        Tue, 23 Jan 2024 13:46:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h5-20020adf9cc5000000b003368849129dsm17135403wre.15.2024.01.23.13.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 13:46:41 -0800 (PST)
Message-ID: <46781012-2678-4f6c-9aee-b020cabcbb28@linaro.org>
Date: Tue, 23 Jan 2024 22:46:39 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc3: Add system bus request info
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor@kernel.org>
Cc: thinh.nguyen@synopsys.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, balbi@kernel.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mark.rutland@arm.com, mathias.nyman@intel.com, pku.leo@gmail.com,
 sergei.shtylyov@cogentembedded.com
References: <20240123170206.3702413-1-Frank.Li@nxp.com>
 <20240123-poking-geography-33be2b5ae578@spud>
 <Za/8J8MDJaZEPEKO@lizhi-Precision-Tower-5810>
 <20240123-anew-lilly-0d645bdbfb30@spud>
 <Za//LX9U6QG5A5NW@lizhi-Precision-Tower-5810>
 <20240123-nanometer-atlantic-6465b270043a@spud>
 <ZbAR/NQvjUnf2At+@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZbAR/NQvjUnf2At+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2024 20:22, Frank Li wrote:
> On Tue, Jan 23, 2024 at 06:42:27PM +0000, Conor Dooley wrote:
>> On Tue, Jan 23, 2024 at 01:02:21PM -0500, Frank Li wrote:
>>> On Tue, Jan 23, 2024 at 05:51:48PM +0000, Conor Dooley wrote:
>>>> On Tue, Jan 23, 2024 at 12:49:27PM -0500, Frank Li wrote:
>>>>> On Tue, Jan 23, 2024 at 05:27:13PM +0000, Conor Dooley wrote:
>>>>>> On Tue, Jan 23, 2024 at 12:02:05PM -0500, Frank Li wrote:
>>>>>>> Add device tree binding allow platform overwrite default value of *REQIN in
>>>>>>> GSBUSCFG0.
>>>>>>
>>>>>> Why might a platform actually want to do this? Why does this need to be
>>>>>> set at the board level and being aware of which SoC is in use is not
>>>>>> sufficient for the driver to set the correct values?
>>>>>
>>>>> In snps,dwc3.yaml, there are already similary proptery, such as
>>>>> snps,incr-burst-type-adjustment. Use this method can keep whole dwc3 usb
>>>>> driver keep consistent. And not all platform try enable hardware
>>>>> dma_cohenrence. It is configable for difference platform.
>>>>
>>>> When you say "platform", what do you mean? I understand that term to
>>>> mean a combination of board, soc and firmware.
>>>
>>> In my company's environment, "platform" is "board". I will use "board" in
>>> future. Is it big difference here?
>>
>> Nah, that's close enough that it makes no difference here.
>>
>> I'd still like an explanation for why a platform would need to actually
>> set these properties though, and why information about coherency cannot
>> be determined from whether or not the boss the usb controller is on is
>> communicated to be dma coherent via the existing devicetree properties
>> for that purpose.
> 
> Actually, I am not very clear about reason. I guest maybe treat off power
> consumption and performance.
> 
> What's your judgement about proptery, which should be in dts. Such as
> reg, clk, reset, dma and irq, which is tighted with SOC. It is the fixed
> value for every SOC. The board dts never change these.

Then it can be deduced from the compatible and there is no need for new
properties.

Best regards,
Krzysztof

