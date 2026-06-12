Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74639903E
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250843; cv=none; b=STDgMbSTla+Umj9HfdhSOTaw6tmMXMGRMHKKd2Rk9SvtLCtq3J5HWLVR02BQI35akXl/frfAVN1yuUvny0e7Lo+N2jOasiMGkSqvf6KEnDWRFJKYdwyQhSjwVT2Z5XX2S3F/MyEOjwk82EE/BBocJNMJTbmz7QI8Z/36B6XrTac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250843; c=relaxed/simple;
	bh=QBbXSr/c3akYemQ3kzkXquISdpepjP/Y0O5V7dwTJwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRrMvFdpvSkA0bS9noJmYMe7jRtdBLFuBhcDN/zhIpB4tjn9OzsOh1gBLnxG3tsOAt2wmIyyb8iJ9iGTV7UyR2Y/sLChR5XfyeHt9ojIrZSM4htgvtyAJtYR1qedMeNRGWQWs8tw1aOB04x3E2/E2hGin3v1OM3oR8TYFAvLLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zoCWF5Vy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zoCWF5Vy"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso235321fa.2
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250838; x=1781855638; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=zoCWF5VyWktRSlnCWiTjgwcUY1IXYJctAZ/HOml6wJKqKxSs0jcGnDEKBJnsjWBKA0
         kbGC1Amh3Jhem7wflxaNCZEC5sH5905m0eGC4zpMwDgu0kb5QFRYxDiLUxBtkID7Qo7i
         N9NMFCvSZpkw/ut7460UjETZrOwKX7do2k1VknE6eh+tFvKcIK6ssz7Wq2e0GUK/woKF
         U2TQCivCy92TmKhV4tY3L4gZv3KUKrJkY9cLMsUT7v8c+Ynz8Fw4sFbaztisrIrWLbMO
         D0co4ygwPlNY+GGvcP2NnwNsEViRQZNEI4hChhTmW5JSuWJmdUIo77dxhnFYx1RcEaiB
         HNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250838; x=1781855638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=DJrY505kmJwZD0IbVtNMVIzMNqEOFz7oVng/2ua107F20dcopfIzNwCWVkwcel0/qP
         VBPbMdJ+UcEuRwLoNCj/K5b7g/cQMFGd43DqcmQCjYGYVxfRUfGNZjsREWdOErVbI5x1
         28y+Tuykiamr48unyLZxjVIfZcy0pplVIWpLSjFtyc9wtJhWdhfOMimYQr6+3uhW7yQt
         sVvhweQfnV2C1bLR97jRKWreRGNA7xVF/1VG1TTk6oTfIP2Zf9hwWsGom79OD0xc/DRW
         UA+6ATBMvqVwAu8NLrSMYAxgYigNAKQjheNatVxHUSqeXe8PadV3Zd2g2VQe/MKMeeWu
         olyw==
X-Forwarded-Encrypted: i=1; AFNElJ+lypG0a3Z45WUY/LTRCnMDrC/DQtzwp5ggiPJqqd4woJB0IubrE7Wu6rLQkuOVjioU+W4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2uDL+RmZ07gBOJYxmYoorFA1CTdqybA+r9HJvxo87UkEzwT7j
	jjwkmiyAVtETssLjeEnwLEae7PkwstfQtZNXAyJLVcu/H+HxQFbSrtGFZc6iPwtODQQ=
X-Gm-Gg: Acq92OEE74t7dQbByY3vIo9Duh2v5b+UjQ1l5hIPVUZv3h36kUiPGGDVUiGa79aQW/G
	HTSUck8BFxK7y6ust+3wwdY4QTMiEBg6+Wz5n2JpLKU0EBA3/EczyfCvwefQOBGHKrGhGTN4PHO
	o7bcwnEbSYHAiy7gZThnHypSzo1pPaeFFPv/E6rjdYumLxWy2VkYCzSDFvtv1kK+6SpZ1CsF6zC
	XGZ+Ni/p9ko76bJhGP5WUbXpNtKN0VQX8c0Bzvrd6xXN07YTyZPom5rbfcgq+gL0B7cihIqZ2Tg
	oj/1Fe0WY2uBmgYqCf94VYzxeTL2hkjnCj1qv3+HdREp+qL5W8t9sX2KEVTE3PEjsHgQ9ryUYjm
	zSqOrn7vgdQ7H6J5Ayf+CysLoTdQMaBg4ncquJdnqYzqI0TVxV7aOvcS5yX6vuBfrjKeL26S92y
	xwm7Vrrg0U+8M8TpchSOPLZA1+KCNXzNqqbAwKxv0Yd9J8qxZ2skO+HhPMUgna+cOT1OnWWWegI
	aE0wA==
X-Received: by 2002:a05:6512:b91:b0:5aa:6fc5:642c with SMTP id 2adb3069b0e04-5ad2db715f8mr228537e87.3.1781250838480;
        Fri, 12 Jun 2026 00:53:58 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4516sm308890e87.72.2026.06.12.00.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:57 -0700 (PDT)
Message-ID: <ad62d09d-ea06-4b65-937b-6dc49581bebb@linaro.org>
Date: Fri, 12 Jun 2026 10:53:57 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
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
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
