Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4BD3DBD7F
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250812; cv=none; b=hcjerSa1+MruuTvjwuuCz/mmWRaEu+cK2o75oz9nuMexQaVtTBSX3s0DWbJN3CZESuCgZXCb74oY05Uaym8Ripirz+2WfivdioovUCnTgM73jBB35J/1u9S1ft0BX6hqvSUiyDZE2fToD73oX/owASuAh4kEQ7t+bNBLe0/ZjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250812; c=relaxed/simple;
	bh=/oZQN6CLyIMffYWm3DYjqjp43iZSlTeBEiYorOde5DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WADTtmhSGpQ/K4mxBudaX6MJLkou+J5FQtRKy4OMDR2h/wUqBguC++CmCxH1vb1x+Q0meXgKAjt9caKHCjlyQ5Gil3uPlIbecEbG4gJ45ptX77xbPWARNu25Hmo+ZMlzNMjxL+4ZpZx/Qe1UtBgz8iMtaWvLUDz++9p3G0EuLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YWRme+Wk; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YWRme+Wk"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39667fd6773so226231fa.2
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250809; x=1781855609; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=YWRme+WkLf4hujQu/KroSw4tcUN9F87G03U1+7GNgSXqj7J9UT2quNctn4oQXC3feW
         AygXuSd2f3sJnB6H8eRZJjP9/743AFSGGpLjXMTn5CkSOgSUwm4y0TDP7D+kTaDOiRaU
         tJ3gY5sCCUyrPh4oFGoUwfKXscTxpYoVGrXRf/ZC0XOIjPdBdwVkz+Bl9Zl3eaikTFas
         CP1JkOwYXAUT7Ar830pYLDbyc5GcEYFQMqpp4oQDWeCfPP/h+Xa9hWYNCRx5a2qZp6bb
         IEhx3kOtrsg4wI57kwSBgxW2uhy40dBC5vlNcvBy/hypON4+99OpS7qR3MWi6hzZr02+
         pFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250809; x=1781855609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=N9+pNE0e8kAczuE6cNuMogvVnGTiOfyKK7kstc8y+LvhdcxhVkR6HR48CjWZA0xx5T
         VtqQzqum+Y1Z8eW6Wfznu6jIQWSE4kaanoQp2dqN4DMK7ibejOE4ZCkP85hZ9US8pQDb
         wU5s4WPFWebuAFySyJZwrHAec7wAwVtwbNFOpJq4NTBc5/V7Cs2KmRQrb8OanP6tF0By
         ucZBxviCoLfNtC3Qj9ZC5g8zQwTqVRrfDUUOK9Y2UWC46AfUa/vmRXAAC5+mPczLhvG/
         sbvXVzSgvIPQcIjcGk3BAcuIAyzmHXwEXOcvJo1LKHkKKebSISS5Y0SkvrhBMwk5NuWL
         F2Qg==
X-Forwarded-Encrypted: i=1; AFNElJ/iga7cyic1TEK11rAnoUDV6etYtCwdbW5h1VrtkpQyx92SwBzv6uYsKtHDe/L4G53JMTA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1X1h7r7vcH9PWgUm+VszNZW9L9nrzocIklawyU2HrxL7EDgL3
	lnsLH6EGi0OOqS+iCWOGc1BEMPtG6RBhrmKjvbc6HBz4sIinOGcYZ8CnO3iw4ZNNDRk=
X-Gm-Gg: Acq92OFVaBYSXAbtVYNtP2v/UBV5LqraFlyhRwBrlelC4IZKrnTialBKPRjs3bnZvvG
	JeyK/pTh8tbSFhihc6KqFAZRLAtca9+sliInSvShmk1f03jIgwNHffBgAyvI0RaybGlY15nSUaq
	pzqNfM4yR4eZNQYtm6sIJs9juWYs1YfOIdLKWbXmN0Sy1zKDOMB6mDMgSawIYN7SKMbupeKCiGn
	EVVykVwlKtEBAaBm7U42aPjnv1XceefWsVhvJzlvVs4K51LNa5RPDGi/0k/PrMUypEGeIUwGU8w
	xjUhLim8G9UNnSlAz/YJ+X9xFeSWxbKACnl3JWC1u99VaaiwzyQSsRDH786rKnEbeUt2GZUj6cW
	GrUzjy/eIPgB8XlrY6EPFq80T3Oal4Zyvz54X/GLFKR9ceiMUaGZCL0PW4RtLBLz/Fl6rrR9PND
	/Oz1eXxHANcVqdMRQNnFYMzh7HnOpifca3aLWo1iS08k3+GIoEyBzwyElvPoDsR0M+r6234VF3/
	UmAuw==
X-Received: by 2002:a05:651c:890:b0:396:7fd1:f574 with SMTP id 38308e7fff4ca-3992b03d73emr2255821fa.3.1781250808762;
        Fri, 12 Jun 2026 00:53:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1891asm4038351fa.21.2026.06.12.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:27 -0700 (PDT)
Message-ID: <a63182bf-ba40-414b-a630-511e97938529@linaro.org>
Date: Fri, 12 Jun 2026 10:53:26 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
> platform-specific compatible string, using qcom,qcm2290-camss as
> fallback.
> 
> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
> single IOMMU context bank instead of four.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,8 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,qcm2290-camss
> -
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss
> +      - const: qcom,qcm2290-camss
>     reg:
>       maxItems: 9
>   
> @@ -76,7 +79,14 @@ properties:
>         - const: sf_mnoc
>   
>     iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected
>   
>     power-domains:
>       items:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
