Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2B2E7167
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818649; cv=none; b=gXVaKtjF1cGWcN1HUJurvAOKtGNPmK5vrUmIxUC/2Hk2lyP66e096OYBFsdnCcBTWzh7g0Pb5w/fxiwQ3Y2UCzllwi6VeimqIJsrgJDgt2QQNTY0weXTWSW+HEOnEAyxZFgp1mgKNyTs1rplXw5UV1OJYluzVsDnf1tbTyLI0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818649; c=relaxed/simple;
	bh=Bbu5f3ekraU0UTZNwEa5wKqb5Ak3IfFXpXp5DIw2MRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8jaj1wMtbKbo5IF82LL9IplsOjBywZsVa1Wfie6bJ+pgJNm0q5TEohyk4zxWJZ/3BIDcK9BzIR9NtZTXVCgi5da/d8Qc8rs2QX2gJ62nOqk+dsU22TT/4P7WNNXSfvFEOz3BnWFNiByUVHmJSE4pAnslvgttsanxWdpEQHfEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8agLYTO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8agLYTO"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a0d3d2e8aso9136601fa.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 03:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761818646; x=1762423446; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dauqN1FImNWy4rwXPKxul6Sk7/dfHFTeFablnNaeE7s=;
        b=d8agLYTOg+GnDuc3f4vQTfCpVcWR/mkjwou+gbHd/aWt9G0dFkJzvAR9HEeE0NoFyM
         P2+uidPvGzGtC1gDcxrN8JQSsEidpetbaU1g40VKUisAVLfd37Wrk96VbtkSWW4xjXiQ
         wqNfOvBNJjct568BAXedaAZvh+dt70ZodKSTb3WVVZ6m8JUVFEIpafU5TsdL2Z2Ogucn
         pNOh9qbzyjXbREfoRFazML36N2osuxpRrdWNMyycVYGlnmh5djLgsHyNvc0uv/NcwNtU
         j9HHSF3IswdunOO+IbFNyb702d3OcE6xwJCCMTjxAtw7+lpJLGN3+ljEubIJ03nLZP7y
         BkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818646; x=1762423446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dauqN1FImNWy4rwXPKxul6Sk7/dfHFTeFablnNaeE7s=;
        b=vccFCwaYd1HXv0HiTb8zFn4Zc5xJL6lCA55IPaLyLLMf34nreJwyMWyv+aNtglsRf+
         YbY60xR6RS8L5g5bsj6gfI0T4IixvhXErYCfYETVF9N/Yp/2EdV/23PxgAbeYScvdAln
         x7vTOefbGK48/gBgS2FF2WQv1uTaf49rfCXC1HuiFaVDfC9jgSH246sZUjT3xz5IqmbA
         trAEFDip7JIut2VkL1Tf9JSCsJIH0FFHQksVYuSRUEtwZhyy++H9pJnJmxGJ4N4r5gxy
         qju6dQA5PsnIBXYbIN//Vf6YpdLFXCxFGSILn+K5IsKI7Wj8rqwswuYL9ALyUso9UkL8
         aCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU96xHxp5lIGd5PifBPat0cojbnyhyXDLWjidYFZYVwn63iuJZ9tekm5OUlqXqrfL42af8=@lists.linux.dev
X-Gm-Message-State: AOJu0YylNRuihG1cjKbvOQVBWKGViXoLZVQxIX8BUC1fWNHcnQyb1JGR
	0WGiLc/fAWxgHcSQ4iMKX9PVVq+9CLlUo1gUbCEqW6h9bHfJiAnNHK1i
X-Gm-Gg: ASbGncsbl7U/wvZFGI97w2m6i6xeJHp9nGrcE2OKnQ0iK2OWCAWOkmKlJeDu0YejHEE
	0GAQUjLnvVlmvFURaIePL3kZy+vQUxgSWcqd5W8RXnPPzbQloPbiyYCMtH6N/3SKb+pBUiLG3lb
	Pwfhcvu34r9POqhs1IW78aj0Mwzvx9B/HvasdEPUX7OEOwDh38Kmsy8MJc+iNPek0IGEDbMhYlx
	Yn0MR7rnn+w1xTW6/p+X8bfTB9yIIYX3l96bCetOCcjCF9r4ZVxfY2OJNs1UMGh561fqUs+X5Vy
	AOWBSaXzmdMZ/xV1EpSifmdP29qrHe0L7sAtujbwO5kndKr3zo5X69ANlqUCV//ZRd/UIt+jIRJ
	CWh42esAQBCudvPjiSe1JAzFt6gilOIR9aioYG4d6YGmHcQDDoz35ckZIyu4vrJW26JYsqR1e97
	DwPhHLbdBMdGPBLuHEZxk4JQ35gJjMvAC0jjJh8lhD9Y7C1ve5lqxbCBcmHQ==
X-Google-Smtp-Source: AGHT+IGyCpQSfbBRdEYvu2lNdOmyrZXNNZuheExnuJl6d4xQSCtQI8cyPqqgwbNtC67LbnCVinYQhw==
X-Received: by 2002:a2e:a9ac:0:b0:373:a3e2:b907 with SMTP id 38308e7fff4ca-37a023b0b88mr20842611fa.10.1761818645333;
        Thu, 30 Oct 2025 03:04:05 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0bc2aasm39339011fa.24.2025.10.30.03.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:04:04 -0700 (PDT)
Message-ID: <bd938b24-59ee-4a61-87bc-4416b1a0e55a@gmail.com>
Date: Thu, 30 Oct 2025 12:04:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
 <20251030-mini_iv-v3-4-ef56c4d9f219@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030-mini_iv-v3-4-ef56c4d9f219@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 08:35, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Ka-Ro Electronics tx8m-1610 is a COM based on the imx8mm SOC. It has
> 1 GB of ram and 4 GB of eMMC storage on board.
> 
> Add it to enable boards based on this module
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
FWIW: Looks good to me.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
