Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875B22F363B
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120307; cv=none; b=s+i8sc1YqYXTXccHgr4dUrMpmbj2K7gjgx0l5GVO/sjpu8JqZtfDFyxSVbhIY0jsRNJD2CTshQWK0yQqSr0Ja+KcFhyDaVy9zsWVD1KdSFiBrSRMEJ6w8cT5b1YXVqDTfuib6GpY0AYwSyV6UP9bnrBUG239g9+mZtYC6co7mKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120307; c=relaxed/simple;
	bh=ywQcEni6SI8o+em5+IBvHy5mC4J8/P3PUJQL8q+a57Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mjp+7MN4g+mjoH6cUE0S9n1cG8L33QRa+Wr1wXrkuHDwFmwk3V8fGq35jScWYx8Qze8JK2wIaMREoOKD8xL7zKzrkLZl0FlEoNbzA8ONXzu8l5JX8V+iD8VdmkNjFGOZ7okt8GPLEnG1mQjw+jyZ+ok/vuTvwvESse86Z99Admo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTqWR1lZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTqWR1lZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so745782f8f.0
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761120304; x=1761725104; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WaMW4qv+HWmxlbkGsY4zc3U/GseK6Y6yJUlRQosh534=;
        b=GTqWR1lZYteOP9EDKRej0kOWLkBbVjt1eMBHdgk1otADj4mYZ3rifw3JqDV6g1gfqc
         F6Ze6UCulRMZ+8NMC6Ajup+TLbmNLFzmR+herU/uz6BIlgwwAW7PJtkPJU5uDNJ7teUz
         /t+3fHNp54tqtL+kuRFkn8CcOTPFSMi5xFVtICvyQ5vmm5ByG9NdZdureFzAUTRvtcfK
         YHY2ZPjvry9LqOtasHh4i7eryj6ItSNVbbIUBAdwKVCgjDUt/eR/0tfvsGUJlcqjAoI5
         Kh5WmtRpI7NcMugGHrmQMukK6jOeAhO39KcXlJJnvCYlZBsupFTIwjulo3lijhbPK+jL
         7ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120304; x=1761725104;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaMW4qv+HWmxlbkGsY4zc3U/GseK6Y6yJUlRQosh534=;
        b=sfKj77xd4Bj+rhDT6HMJITaCvXWdPEY8J77fzN+06w7i3X4xGGj/oMmzffqN3Atn6A
         zY/ITg5JugmiREC6PKQQgB3vMkGmQVibNLUsV4IgHJVWdGKLie+fKPkV1SNjSNvY1Bk2
         BNNTb3SzjENNk/wb6wx64mLi5WKxevmXdI4/XX9FMtcBLThkR6TG1yNFD4l5Z66NfZzw
         cjPY/pi1opWj+i+RR4zP7xkI2i3vhY57nr8+URjPOCNknDAhjgFJDoio33XUckAfnyEQ
         Omcp1OJ3YmkEPGezCLDBrJQDq4xENmXe48fEb9svhM+S/F2+EgeoGLMYnQdd3oxsZwkl
         yI5w==
X-Forwarded-Encrypted: i=1; AJvYcCXrxTzaLoGY/NSE4f/DV4d4OknVhuJESEtZ+POoKRmHHDt/TVX2VhkP+Jwz86ZOm0njhng=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMS+qG4vlWIMbjnfjgOb7xQOMso0Va4cBZmMmSu6QPOcozR609
	yTnQy8UHCEG+Y+7P4auRqKxbBfxEKObKZrT8A4jEu0f3ajFcR+zygH0uZU78T6YbU1Q=
X-Gm-Gg: ASbGncsEAdeM5N6qBc0wAy2mKeywSlunoHOn1Z3PsSCl40D5lJXLTY3qfhCjX2bZDx5
	CfD1jG8CGNn9YxonhanUd/wJTjOz/1/A3W8mrmUP9+AhGg2z3cO2RcPe0/0+KhIMx3ADHl60Pu3
	5q2UZV38/lC7C6l4CICHNJ2zUXmux46w1U0olY5hri4laKHBz0viLvIVLgbVC2WP5xv+BnauEde
	RhmixRjdpZ2vGaJqmrXpg0g0cCmXmGIuzV2jqV5dFJRHUo+bSQ2QOMJQpVKd85A0jm4irtnpINp
	JtxKCpnHfwK7Xqj+8wxA8qLKIZraQa10RPbWKB07HvSNPk38oLWyPc5iMxNNHojT1Ic+G2QuTdk
	NA/WrRD6O57V4VCP6imBle6HP5/2RhtnxQepo7XusrWACCsGFkXvBvq9Cb6UBzj88MPxPQjkrXs
	Cxz64kKEANeXM5PrZqT6Ia7ilB6O/zfgI=
X-Google-Smtp-Source: AGHT+IEqZ2V8rN2mEmLYoG/mLkiuUl9zrLKcGvhWzFuap1o57wVT4lm2o3exaDnNV3aCI4TsrsKfHg==
X-Received: by 2002:a05:600c:c171:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-474e77e2007mr18842055e9.0.1761120303733;
        Wed, 22 Oct 2025 01:05:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm23751819f8f.17.2025.10.22.01.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:05:02 -0700 (PDT)
Message-ID: <ad8195d7-dee5-4f50-96a5-506de4cf15a8@linaro.org>
Date: Wed, 22 Oct 2025 10:05:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: Add
 "rpmsg" subnode support
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-2-shenwei.wang@nxp.com>
 <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2025 12:08, Krzysztof Kozlowski wrote:
> 
> On Thu, 09 Oct 2025 17:27:13 -0500, Shenwei Wang wrote:
>> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
>> an RPMSG channel. These devices may require corresponding device tree
>> nodes, especially when acting as providers, to supply phandles for their
>> consumers.
>>
>> Define an RPMSG node to work as a container for a group of RPMSG channels
>> under the imx_rproc node.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>       (no commit info)
> 
This was not applied, I just b4-ty wrong patch.

Best regards,
Krzysztof

