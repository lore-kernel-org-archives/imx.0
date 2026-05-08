Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2955C3DDDBE
	for <imx@lists.linux.dev>; Fri,  8 May 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250196; cv=none; b=C05jyw3xoIXSCXDszpns7P+lfyduyMxEsG8y4pinQRsUi8QNI0DKApLmZ3/9c5RY+4ROsYQ4iiqABUx85zZhb9ruKyeXeLVlXZXC1Tv63bAvUQn0RpwY1mTkd9PSenYS2WjXV47QgMmUcaSCjW5bwqDdgPcuN39Tq9apYxmJjHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250196; c=relaxed/simple;
	bh=ManJat2Px3QZ0GJzd8wVC++psBG14jWrGPkE5Xc+QjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0y3/wJB+j3Oxg5zBdYCUws4grg4n26t6pcemOmszQN/Bl1ejQc1GP7cxc6F7gglScQ+oH0nT6JPhmYb8mOyovNE2Q5+XwBof29xneajomJ2FerVsw0FDtwbl/jCaTioSbIYn+w/DKRyc8l8GkJYPCiX85/SPoL+MDvOgSIuA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PraqGEOZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PraqGEOZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so3228820a12.0
        for <imx@lists.linux.dev>; Fri, 08 May 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778250193; x=1778854993; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=PraqGEOZ6QhGlfXTT3ISQUQ9HeI7+7Mhn0BRshIY39SlALj3Aj7IX6AQ/0ceZeqInO
         W6mtfb5nVU1An6r3jm5xyKFYAhgzLptQc7kYPQuPODYQARD4ic3/gnPovZ9mrT1Jpycm
         rfVhWnSpqzsUb1Fqn4SV+yT8t0pAL4lQfNhG8+/fnedK3cwPosPQqyDUxVpuLsnIWOHt
         Wy8MVp7WJbx/ePzWkdkX0nWQDsAE0j4w2c0HDkWj9/C4dGCH2L809kAeO2K7XeG0/Aho
         IsbRf6wvdU9M9C8iMp2uU/WLjfmJ/d0Snud/VL8AJr9fQzi1mq/mdboJa/7hgTWnDLiV
         nyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250193; x=1778854993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=DFMQzP6yZ3M/mCbuGUQtMpy7smlgth1xMf74DRONu/JCVe3psJ6MxoURY4bUuMzRc1
         P3zKrgHKlnei0OXLXWv2e7Fb8RvfzXpRI31pqcdHvNZ9rbLgndjYqIVWwHgKufDTlNSU
         0szmnxhMq51NoM2HS64NebDYx0dqdUxqz6ghfd6Yl+tg1t9m9y2z1tlclmRZFd9oJtK+
         Viyf38AGkJpAFUJ6m13NKZo9NjsoYMD+ckzYsWKu63+72smN4O6qFhWhEzpeehvEs6N8
         VD+jJJQ0/L6ImiLqJaLtQYHwhoGGKEUXWogDhmZWKW6gjnCPXYag+dgMWafPnFrW79b9
         c8hw==
X-Forwarded-Encrypted: i=1; AFNElJ8LtRz5VwLpblbQt4ZaYIrx5TUGGnQdB3dHHO4dkjlcO77964dkf3RLBJLX3Sri9Gi7Jrg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMZjpY7BT+zF25h87yTT1X+mhRcomNuqrSlI8KqcN1YTRYiYmK
	eAo8yP7NhymH1a7drUNy7f/0Mw0vxUkg8xSmKqYwE6PHMLtwXxwBVayybgO9ACPyk7s=
X-Gm-Gg: AeBDietS6GzlKtthDL1RCs7jQj2uk5ofyQ6m+zZbFT9XVO/i+/x5gZ5lwq5rWXzJWvA
	LkIWyC9Syw66Die9XjpuIJEeW/eKr/4Fx5qnAk1nHD6shAPIO3fuqzXzcsoAyQ8cUZ8BU0Pmnfk
	P2N1CNSEppxVxQHeG61Tbllnpj+fTnpwYpVR7/Tb+bo4z+8j/uEfj8nBsrt1T/NghD3O00fH8g+
	Egyef0Oj+m0WRBVxVQHfrbLy3MMaqNTsXJdgRo2KSoFleHPnwSeaFMdvyuuWBc4k7H5uc7DMtYG
	MW8OEG5i5iAnNhcv2n9KcDgZXr5UW/QR9bmgRrSwsp6qhborldp2M6aml6HKbsKoOisTQbio3q6
	snHI5ikg5TpJHnOkF25+dQY6HOqcdsuBGCHHIJe82DqnjTh+LOez5R8MDSmlDn6AModIudhI7j1
	gJssXsdP+xG+xgiu5fePd51a4KW2pex35cs3c=
X-Received: by 2002:a17:907:807:b0:ba5:2f0a:2f40 with SMTP id a640c23a62f3a-bc56aa45eafmr738018166b.4.1778250193349;
        Fri, 08 May 2026 07:23:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a648sm703741a12.7.2026.05.08.07.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:23:12 -0700 (PDT)
Message-ID: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Date: Fri, 8 May 2026 15:23:11 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2026 12:40, Wenmeng Liu wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
I'll repost my working version with the PHY stuff so I'd kind of 
appreciate you not posting an old version here, just wait for it to land.

---
bod
