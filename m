Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256944;
	b=O5HByRWZWfVWe9hYXVG6f5GC2+01UM51MqvBBLABIMRykKsBPCNgu6q7Fx9oaePxT7WJ
	 T1F0x72JHi+heok8VrcIGvhHtDOKuqkBrQBW9uATcJ/UJNRyErTQu67hMhclkk3MLsMUF
	 UEmjhYDyGsupd+ZrPXJrv8ZW8VdQ9bjm46aUXOMo3MinqXvBkiTlyHki4ykNBPuUbgS9H
	 xBL0FIPAkRSQApztT33gg0htW9/EDT9KdADFiIcUlnggItP002oq1lTfKilUSn5OQpbye
	 ZOV6lVjh0l4a2UCTywc9Cr7ibiQedtaO3tKuKdFQ5A75gMcwUdFZlNOM0EYiLlmASbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
	b=On/oAbSxMU2nZB4H68TJmrRgpK4EHct6eMhePCYOwRtZP3+4FrCIO6zdmwEUDwwEyDih
	 GRdbi2bzrTN6ATR0eNhxeIDAZeLeZ04fhTo42wkXQibUy6Qlv5wqzCX+wh1ZbI4ql7SiW
	 urSbCGqDmx40kMwX3niu0ouvA9T8O2cnJasW9N/hRwdI9o7ooZMqs/f+pZi4xLi1osh6b
	 Oa8s8PLOsbDZO2/L+wPWvWGG8tuUfTG0v9FUfBmSv2JhwqnFSqdJRC1CVbJC+BflIguvO
	 dNN8OkKQuYZpm8FYSJFR32sA/WFMhgu02tQ/WUml/mbDiUscI6k8Ek4m6TI3lBpbfzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymcWRidY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74123606A31C
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 06:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74123606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymcWRidY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13895755e9.2
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256943; x=1793861743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=ymcWRidY4yYzBVqnsHcEfeAY+SVPAIIlBZIwp8BFbdn+yPyDGQAQMvYs+Lf5W8RRu0
         FRFxuQqhOu2OpA4BCergOIutfZzYGtsNDatZos6c8UzFZeKB8wYJfdVdUh0HyP1kxKsr
         awe8n9lFoWOXaPuf3z6eYyEmbGAs7DAo85ZA8IYVi51viSDAiex5Hw2r1wiyXusi2cHr
         TQPRFtJpM2ix/SYvSkvAxJhilL+ekbgYZk7Bjh9yWGLug36L0dLmFSOhwnrAFnsHszhT
         NlwfUpawM2QvI1vuOhOCO5vwJvqea91UU3NEfsIX5jLEY9l+rQixW/o7LCgjND2JEfj3
         P5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256943; x=1793861743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=1MV/fC8bpyBV75i+51/vefSf+h4KJLQFMMyYYqRBIP+LicuTwisBYPwfSHui8AJBYQ
         aqtUyzhDXZn2o4kWvNQz35di94jQfCsSsuKjbpG6HpJd3IYmDIVOUxh0BKFzGknPSZ+F
         OyS61/RCJmvCk8QpbpDLAtqIS7yOSVQMcNFxh1SK9SlN8HCs8KNUiWf6+skgze2IcMdt
         8MLMMX59G5ZRx6llbQETKCLUGM4pO/rqt/LcoZR3AHSbMllDtfhM00ze6GSe3bykz+TO
         DrEcBVmTkc2MZDmW8b81C+C7KZZDKVR/bqcfCRpNMy3OpMmWaGyag3jJlp8Jrj/BmAw9
         xQGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUHra5o6oMQmkdsBo4EHIywuDBqlxv/S/pOff0GB7MpZFwYV947Yfd+cGQvRUDaGsx6DM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ8noiwOdshS42U20nyxr4lb4wTxd2UjystH4+mM/Op3F+hddjw
	muiux9a4EqXXZOlaSwHVIe4mQAR60cjUs0mwNnSwxRe43jRmtAUG+dBX
X-Gm-Gg: AYBFou3sozaCfiOaGHcE23Ua+nPRq7/05XioHa21oGMz3owCs3OA9G0AbKgfk7ouGco
	viypXt13Lgu4qR/KnMFGw4AufhpImjYbzeknQOkukgtUSW69imEy5SxtUKY4v56r0t2vuABYQnJ
	QqBzMVt17akBF3YOR88Aovd52+7Ro6EbsNw/+p+aXgoLIyr6nwlZrRipIVwjXP/vvNdrb5cgO5C
	Ki6AfTQhp2pmbL+dujd2GLVuy4j85A38WT7EWdfowPiVnGN58FYRwIDrN7SSV++uc8KU+ZQUTsV
	ZSPGXKe0cpwtXvjd9Mhjxhq/ROBH9WZTwhOAlC8Eky1A6T6A/tg1Dlx+Tc7bL4oEva5e1M+ZcXr
	/pXt5F0g4AoZ1LGqfHvd6wlUWkD4HmicwtrjXpFCxUkstgbt70AP1WaIoDmfsjI4/KTvuoI3CVD
	0dOZKZPczcjQiRFwoGLm240HAGylDru5Cji6D/xpQGvXjiWwgktBTHYhiFV9Hy6ot50mhHAVrSc
	U8ibJWI6PIqQg+rQooeSOA4/Jsc/UQWvTY1qmfcQF6e17o6dx038SnTs7zs442MTtJcet6YJw+A
	jpjiiENrOFi1/a5nhhts607Ntwzqtyad4gZMhq0dyJNyzDGyduUDK1FzQRIwBQCSeLtTNSND1+v
	oQ3LijPfxag==
X-Received: by 2002:a05:600c:34d6:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a9660b54e8mr101112445e9.6.1793256942680;
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm87590825e9.1.2026.10.28.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Message-ID: <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
Date: Thu, 29 Oct 2026 07:55:41 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/28/26 22:05, Frank Li wrote:
> Does it only impact superspeed? High speed work?

No, it's not even enumerated, on the Dev board.

> 
> Thank you report this problem. Suppose below patch should fix this problem.
> 
> I have not time to test it today.
> 
> 
> Frank

Tested, it doesn't help.

xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
of_dma_configure() and the new code in of_iommu_configure() is never
reached.

Emanuele
