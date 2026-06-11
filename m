Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F53491C9
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781188584; cv=none; b=fvQke+4+AMuUZWo9JNRhjFm8YgkmPDoPM7iPZDmYvOwA7qd0lDnVsD2sCHvh9EmK3WKU3WIEMRlXMFILGJ6NbgEzEbfOk//qMrTkft0XMBuVgbI+nRv3ozDAKXDbGDQibGa2LnkPDuYCvyL19XNUkYO8WQPgJC2eE89OmMPB4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781188584; c=relaxed/simple;
	bh=qnv1fAGXCtLVIjll5OZjfkQjjlkL/oatmHWaQJUPthU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSpXWBlQzU0+a3g2ugJEQUeqk3/MbGa8LtxURzw1FJPEHxLhC8FHUXGpMxK9f1dNu1LwuyxF2y9nVMoPQcqT3ZhZTb1KMEGFZS2xL4Crh96npQeR8qOJO0cJLd1BleCIQNCYwgazu3zBN3btQr3yXGdI76cBNMcJPN8uHrOBOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7yFOoqZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7yFOoqZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bed19623d6eso1056535566b.1
        for <imx@lists.linux.dev>; Thu, 11 Jun 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781188579; x=1781793379; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=w7yFOoqZFZGq8219v4VQ29WunzbpvgxIysqVd9Ac10y5yLaM/SE2Y+o4COgN8RBRzT
         Ku9mpFZdWyzmFt52NEzCEQo/OLAqNIKXE/UkSkZ1dieWQGz4Vk+WOfgVtduRBt5OnRO9
         Kg/+LJOQBVcEJrtBIt5muc9Vu1FU3hA5QuZlWtawRWQU7v+qzlIBDCx3MviFc7SZ6O8F
         kkk4fXQXpWeCrUDITnUCTUrjaX2KG4ORWfRptJPuQeksKzd41S+dSRceLNR2MbVTuYLk
         z0OVTR3f5VGJxajlIWd+EL8Z15Cf9Anvl3QGOmo8Cv0u0vfGA0N77yntd4fP1xXxjKoc
         56dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188579; x=1781793379;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=g9vM9DWWlubibqW65KDeHYYcMPi/RHnqrTg5Co5yR58UCoUbg8pA0Qr9dQ+bpVoVF0
         z9nNQYC3NhwZa4bcMmJxPMCoMEkT3+rCcCeC7c9whxbQHe+mOt8EzUJJRC89a59YqyAm
         K9YyKe9S49+xWknkxUMLjwSS4W1WeTH52IeKQYTH1XvxmHb/8aAnCj+falsg9xEPv5lq
         zapjQDhcXDhWqENite5BCkgxn0ShRswYZujzlK0mztwkxk3rcle3nIYu+QN4oTO8STqj
         EtRTLnw3z3zYEqwwyK+S4SW4CFj08hXw+G2yZf3WuiRzfb4uHXudrs4lyGZgDQYxlPLQ
         Fp5g==
X-Forwarded-Encrypted: i=1; AFNElJ9GH6SWVCHaJoRlE/avk4sz3M+VqW69eYtlN9flKrJQdN2QW/Pt7rM7nKzWnAF3TODvdR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxFOeJJdsq8yj0cbUaojfqD2Z7dqjyjwg+dRoC4v3B/NwOBhDd
	r3MFLSAAIwIQxkNF7MzFk+is1LOktYdBzuJVU+g5mJCemyAJ8yVSDGWgUF1IGIR8mmepAYLE/bS
	JLcKGuoo=
X-Gm-Gg: Acq92OGjM0YiX58ShEsnJC6fBtMTEpeEWDNCO/ZFhfIfKnJlJVK9MK5zB02U5ZkyiuT
	9nkQ6Xfw1H5GMD/pSBSR+YuauEO/eoVGvFyyVVDjIcafG56Drh2TSSXIUlmehf2oO1nBcbeM9X5
	8cAWJmxY6Rr4FIdBz1CtTZsh/YS6l72lpnn8PlT35yUFkxaZjKTFtDWf/TNlGkLaAFzB+Z+4FCf
	d/aXfo8W3GE4Pp5u2wZ2pHd56gwUgmh/DpORWz8jfIdgUhNZP3xWb8K5PG+2duqGEGCzdQpxY2c
	F90/GU0Bds7zfiNAQRthl4dRsO3MWDmEMbOk/wlGxK2+SzMRhEz8dII1RQuZxF165EIEmKJV3z4
	0te366k6+asGRb0p+0QvsHC4fln/X6rPkbIBVeuK5IcFeWBhsTTIWP2vrT2wfvUiwCPxkZ4Fbqz
	+5PFYR/P0DM1VNQoLyyafnBVTgGo/+ISsWWcvIgZDxB7idww==
X-Received: by 2002:a17:906:6a05:b0:bda:8e57:5639 with SMTP id a640c23a62f3a-bfc85e9049dmr144570566b.20.1781188578927;
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm7011436a12.29.2026.06.11.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Message-ID: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Date: Thu, 11 Jun 2026 15:36:16 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-reliable-vivid-stork-f4ea6c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 21:46, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 07:36:38PM +0530, Nihal Kumar Gupta wrote:
>> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
>> platform-specific compatible string, using qcom,qcm2290-camss as
>> fallback.
>>
>> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
>> single IOMMU context bank instead of four.
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> @@ -14,8 +14,11 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,qcm2290-camss
>> -
> 
> Do not remove blank lines.
> 
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,shikra-camss
>> +          - const: qcom,qcm2290-camss
>> +      - const: qcom,qcm2290-camss
>>     reg:
> 
> With this fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

@Nihal.

If this is the only change you get asked to make, I will just fix this 
up on application for you. There's no need to v3 the series for this.

---
bod
