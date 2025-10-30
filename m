Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB932E122
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814514; cv=none; b=qjYD8DFo2hVYxBiF2bpF7DWO92BjTmfdN5oAh22fdJ0pHNN0XTemUHN6tpRdqZ6UiTEO9Bg8wgaoh7o4hMQdvINZlio1PH3JMf7/jorEhFtKDPsbtbnkcLYxYJvYKlCN2xGjw0PlWCZ0D0K3U8Rj7FdnCX3G/DEVUYum9tQkogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814514; c=relaxed/simple;
	bh=gCe206Sd+n4icVwxXqzoKWpmtTKswWt6dHVdlGTXLL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXKHITAHlI8nb6i8l2EconweQvF+jPN/X013FyA24qOdFg6eZV0+GJNmBwexM+SLcRc4x7kiLnA32nHZ9bw//MPG4/edz5F8HUGX5vASFzV0rvQUdkgww33t0J3Vxg2UvcdDnpRCoq+hdDKfnKTQMQf8U0FPbdXtzubyXE35+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvkmh8CP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvkmh8CP"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57992ba129eso1017372e87.3
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761814509; x=1762419309; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lz2wxKaeXnztSBPHZVxZj1ui+100tXbJd+q75YbpezI=;
        b=Hvkmh8CPn0Occ6gKRa9y2upSulkFJp4tgYuGpCCm6xGvLwQpaKPowtb2USz91dsjYG
         hYKY28zMSD/isFI7Ufk6zRoalb76WsVjvZ4bsQ7ZzTvTjP75X1Okq49++H6FHZox1qnJ
         +v0QTQlKgict2hhfcugy7f7QIR7ZYH8QuXAsy9LtRDpU7Zdr0Kj/7TAqLyvwo+aBNLfe
         dT+pDSIpoKJnmdWQU5K6Qmf1t5d77OzkgT8bCkvlLNxMtHG+8IsXZx5wGkn2Ij7JFHSD
         AMGxBlzZWd85PRSCAlfno4Ik6Z3xxuk7yzQwXRGD3qzIooz85tP8jAfcs4z23mRAt5+f
         kLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814509; x=1762419309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz2wxKaeXnztSBPHZVxZj1ui+100tXbJd+q75YbpezI=;
        b=tWACFyklWfIynZRc3kFKMndCjjolmmEjSvzQV1ChrG1AtBxazBVRPUO7ZTekPLQJ+t
         JQghEYdNSVSzJy5FnB8k7T6oYC8D9vFflvzDIQXN6Yq2eqz2eByAqKjy/2pmizjVbD+e
         9heZG7fHChgGak0v1F7QEaDdAaD469wcBnhpwWM0cPZFCOIdWg2vgoahc1mZxbVFdgaM
         6o8KnIJPh0PY8+KQyekFRKwb0K2abHEgDi0DAXYKiHTo8iui8lMAwUeXlyPgqc9BHiEp
         S319lwIT2XVsA+DEPpGAcAcvEgkPRtwbNZRas7WsHIsi2UWcUce+YJcJ7mO+XCcb/9Pl
         sJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUh5Hep0BL/obFdmTdNR5Ke/X5ACljTWA8elgM7lmLS+g+1zjiKwZgZvXRaI6qVXfsl0tk=@lists.linux.dev
X-Gm-Message-State: AOJu0YznO5MPoj+uucA6GQdTUk3ogDzNbt/W7lcO9IVM5UM3hcT2+t/d
	F5R+dr6o0cw51iGFgy2ZONS5o0tssIbntAsCkrDIQoKYlxhAfO5mxQj0
X-Gm-Gg: ASbGncuPsdMJoOum7F0VUK6y6rvA6LL85qJ5LiV7AziuopbxwC9tRhR9g/JOPt2CbGe
	Ur6ChSMHSBh5z06rUMgBJ54Yl/H6ZQnZCLPSDFMpX6Sj6iMUSis6cu+X2/GAH7XdTuyenejYv8g
	Ooe7kjidG8QhDgZb5V6RNqErOF0hyuJqjoQOGvF2fsqS2vdv/M72fgDguI9w2KNzA7Ureyrp1zG
	f/dWzPrDusWl06p2upN/0RNSNEoaY+/QpHZOIndi+mXNYiucsdp0hshBaEHl0em8+ESA7CPw1ul
	CBEpWcXAbzbDGApPdfSRy3pkqbOg18NYSFlSMg/Mot3JmS9CuPpFBZ6rI8J40LsXwuvLAWIihKK
	aOYEpjYq9lb4LcaUaSmO1UvRIVPWX6ojcEIo8A0unqLR62XtBEaDIRI3XwXjz4Fg4txBuGZSUXc
	V9otQkJgS/YbbEwuV3cnspZBLQC0wMAvCvksx92WMH0Sb27mYqP1ql1u9Ysg==
X-Google-Smtp-Source: AGHT+IGxefDaDMkvXf+C6MInrLdPPOS2BAZ41RZb8shvZ6Cg4IwpRXpVQvrD4g2MHSCgteFU4nxUAQ==
X-Received: by 2002:a05:6512:b8c:b0:584:2746:c6d8 with SMTP id 2adb3069b0e04-59412c424b5mr1969364e87.29.1761814509186;
        Thu, 30 Oct 2025 01:55:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941566452esm866246e87.8.2025.10.30.01.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 01:55:08 -0700 (PDT)
Message-ID: <8fb5a1a0-96a5-4830-a9f5-4e624ac806cc@gmail.com>
Date: Thu, 30 Oct 2025 10:55:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] regulator: bd718x7: Fix voltages scaled by
 resistor divider
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
 <20251030-mini_iv-v3-2-ef56c4d9f219@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030-mini_iv-v3-2-ef56c4d9f219@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 08:35, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The .min_sel and .max_sel fields remained uninitialized in the new
> linear_range, causing an error further down the line. Copy the old
> values of these fields to the new one as they represent the range of
> register values, which does not change.
> 
> Fixes: d2ad981151b3a ("regulator: bd718x7: Support external connection to scale voltages")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/regulator/bd718x7-regulator.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
> index 022d98f3c32a2..ea9c4058ee6a5 100644
> --- a/drivers/regulator/bd718x7-regulator.c
> +++ b/drivers/regulator/bd718x7-regulator.c
> @@ -1613,6 +1613,8 @@ static int setup_feedback_loop(struct device *dev, struct device_node *np,
>   				step /= r1;
>   
>   				new[j].min = min;
> +				new[j].min_sel = desc->linear_ranges[j].min_sel;
> +				new[j].max_sel = desc->linear_ranges[j].max_sel;
>   				new[j].step = step;
>   
>   				dev_dbg(dev, "%s: old range min %d, step %d\n",
> 

Thanks a ton for fixing this! Very much appreciated :)

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
