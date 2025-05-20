Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BBD25C701
	for <imx@lists.linux.dev>; Tue, 20 May 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732796; cv=none; b=MQFXjctNOtv+evhYTq3B7nBJJ9IWWkoFc4VOnWY7tatsRRlTZrKcJCjoHKJmeHH8SZ/2Sh9K3MOi+8tzsSgompYNkUonId36FoDqDx/fsOeqNYHYtahNvGka0WEj3QXU9W3g9HB0PMPk9QBgsqq9A5pq+jErZrnXnbAZlNaSPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732796; c=relaxed/simple;
	bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Au+UOxqOjWAD+mq3xIuJc14nKeOvBzyIA5CmsEGa3mHf/6pSZOct+EVv4tW0QAb4jXtEiC6DsD0Wtm0+EDs8krbzANc2lIJnn/D/sk3Jd4M2BTs8KJ8KqTMDbHrR+JxtvMcfO/0V1jXXKt5aAbuhO9rCRSD8zB7wLpK3B/JGxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGS9nYsx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGS9nYsx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a368259589so434787f8f.3
        for <imx@lists.linux.dev>; Tue, 20 May 2025 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747732792; x=1748337592; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=zGS9nYsx2uYpEqeaEgLcAIUgWuiOSECXtdbybZK02M3vqEWiTiCNinFm4V1MhPVGIa
         oYtZGQquVrJzmuiZnz8CZuLQ41h/X3uVfQEdY2FxIE0BqDyBZ2HVCBFgEjPNJw2wLU+u
         /T+0M1rzDp0wFN+2cVUmCQpWZe+VHUty9FyP/kFdQ+7fYhzEhSRAbAnx3dxsom68ixiY
         6rYFwd/IOPPwjNC7ZmI6qRhF0xrwc0kJf476sWGXLWd/v0uwEhcp7CvkVrH2ArZK9hKW
         EXSM9Gvj6ckyUq8pl8Ybk5jvMUDQa9eLWWmUDqVSYPVXhb3j15KE7YntEKLFpvpy79SF
         XDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732792; x=1748337592;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=VpQWgcxGwf1akgRGZWNMq1hFK+/b2s+xu5cgmcutd9Uqt60FpgcV9JOdYfIWqJzyc5
         v7cimQYJJXs1/jtT1kmzUUlOoQlvJJFvmHzf58Iw/BNP5WERGcCLu9u82ENFOjtVH5zA
         fWHrqZC+/M+yC0BniVbVC89MKy0G/uqIZA1m+yrRUAqWaCrsV6DNAuNa1fwP7JyhPCFi
         YRg+QygRKrDc8ex+YZoVKaY+6Zog0m8uVcUMr9+MnGduFg87MLeOvmLWdtXswhw4jJoQ
         8Ch6wRy5DY2EUi1UBpPNGndMcL621ywKIawNIfFlmkEZI30QSvI68XoVdMjj0bs7v++w
         mSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAnpH7GO7C8N1d9mD6TJMTQZirJ7RgBneOJRzcpRJCIOgVqnEAqM2eRVuqnyhNrS3AKBc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOgGScJ+pZpIYpEDZAeDRMr9K4F9HY1kCK7kf9EO5xaYPJErrC
	Rn74TVyKp4VkrCJdmrgnk0zPA/qR4ztCauU6fY4u2Neuujyd5aUia4033ecQGwrxBn8=
X-Gm-Gg: ASbGnctL5E4XLpRAy6NB0JY2XtBDmLCwxGit3IvF07tHg/RG8ILaDNLr6OTpH8VglqO
	E/QQd45ljcHbrmYfKLda24kJedFRmM4Mr7hCTunC5HiSYn10EsCRlwAT2y2JkosAVO90kvJ3unb
	OjSO530HPdeeFcKKfVgls42xZhEK8l406JwOY6sgRf/fdgmaUxW4MsCgJOOM9/JbZLeUcjj0O9Z
	VscAjgZdbWZewlLVww28pq8zcT/C1cNg3jmUSAcEnMwJitRMFIFIr407GeiiAoIVBC3YHzUcp7A
	H6XVCyXnmoGwvfwcj0F6y+HWyFwU1EIPiUHXfspnBbQduKykCeWa6cOUEMKh6W2PLGYLqkw=
X-Google-Smtp-Source: AGHT+IE0KhG7Byol3rqL9+TUiiilzPQtBPzROXY2nFHPpqSTCakEs3GIZmD5PTaPMzpGGdP9tjEfcw==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr48271505e9.3.1747732792584;
        Tue, 20 May 2025 02:19:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1825457sm24395635e9.1.2025.05.20.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:19:51 -0700 (PDT)
Message-ID: <eca8721c-305f-4053-8df0-0347cc869325@linaro.org>
Date: Tue, 20 May 2025 11:19:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, johannes@sipsolutions.net, perex@perex.cz,
 tiwai@suse.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jbrunet@baylibre.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 srinivas.kandagatla@linaro.org, kuninori.morimoto.gx@renesas.com,
 zhangzekun11@huawei.com, ckeepax@opensource.cirrus.com,
 drhodes@opensource.cirrus.com, alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250520091131.4150248-1-aichao@kylinos.cn>
 <20250520091131.4150248-7-aichao@kylinos.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250520091131.4150248-7-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 11:11, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.


I do not see any of_node_put() there, so I don't understand what is the
benefit of this and how this commit msg explains reason behind the change.

Best regards,
Krzysztof
