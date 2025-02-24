Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A512B1624CF
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407599; cv=none; b=CWJ7hkV3XH0wLi4F7XAuZXx8KtC50bFV8XQGWUaNR15U5xpV6xZiFJfBpTkt1b95IyO9MMFQEXTv+6cIiyR4/8n8ZLC9X504Wh+/0AVWQFWuHqbGFn8CNl+jXwYcxlWKSBvVmSdmDaGKB4XhEwqZ0D7FLvTBFRfPkniF6aqZcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407599; c=relaxed/simple;
	bh=wDbiPtUfE3pBD2ibGHCUp1eNQeURYMrRbZBQxQgN6Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRiMoWKXgubt8zQV4uHUQK5mTkQEZyubz2ZNqsVAB8TwY6AvLjzOdv6mqALEknSpyS4AFPsTUYWMkRVc7tZLiRevA48/NsMWHK+0w1O9z/p3CLbtBOo4nK4zT4W2stsBRYP7L2J+bT3199pKibWeG8r3GONZ5Tspb/EWBiV7aAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd8Bm7sj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd8Bm7sj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so6599479a12.0
        for <imx@lists.linux.dev>; Mon, 24 Feb 2025 06:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740407596; x=1741012396; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35t1hJFOdpa+T0AaHCGkVAi9es9mhFSUPTxVJx4I/9w=;
        b=Yd8Bm7sjOnd61ciXHNc0Gm/UET4VxWs7m/td21ua3RW4bDIi0SjQ/UjglgKblfJKMo
         yWjmj+/KCthwIO/mG2YXNWEOgbRhAyazCdZu4vrJkUOv7P6hr3Y6x6qc9gaz/p3Al3+1
         pqzxw3wZww9sKKN2yrlq8RZKjHDx8JpKKMGDbWmytZ+GMQK6oMlgldiNHUX9pIShudpK
         jVcS5HeuK82gmLNH564LcsLI7f12GnIdVt+Ti4RsYe1BGBiXTPc/qWrNb98b1ohQJ+WM
         2QubBXqVRB0g81bqOifsbjYwc6whm3m1iGHlfyR9hZVHkD9+2HncoOgoyAQNttLYPR/7
         /ugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407596; x=1741012396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35t1hJFOdpa+T0AaHCGkVAi9es9mhFSUPTxVJx4I/9w=;
        b=WXatvqa0uNthER5i+1SNW1KfYO48fKO+6oM9U5iQHRqEi+TonrW8B/5h4pT+5U9y+q
         VNXSNhZYmXA02BbFzrUPl9s0tqteiTxa9sLy/T3dJr1iOMyfjQt7b4J2pUoaEr/SR7gY
         XGX3h0XbamcpB9fic57J3zXoU/Zd151LxZ//PRjsay3ut8FVUla3EGqDxHQQuhu9eSWM
         HjMiM2Wbr5aSNDw2Kf4VLig/byRdPXrzVm5BJy4hW+Q6hOqlHF1DF9uKKjw8UmSXjvCu
         3r1dosS8LmHTXqoPiG4LBkTL2NbT2Nnjma2B6mI+E12119t9OmMbejtUhgVTuwgCvuMW
         K1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/xKdGRp26JuhYUbp2+ZNX/qF0TnZzO4UNda3E7nJvufGID2vhyI3bOc2xUxS1emWE46A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcuDsE74Tdl2TLLtWc+iLuQSJp1TxGtMilXhD5WiUbj8W2xTl+
	U5nVseJyi6Mf7eCawVGmSWkrkM7NBuBpAcRTZJoLzUBgtmPYstpt4RRRkFKY
X-Gm-Gg: ASbGnctLjKa1S2eGKEFatbPxKlQxqqJIPtUeJaPuWJlzDtUV+Xc5BwAd0WviJK0d3IA
	E7yx/SV0IMGy4AZaFmGIV9kKtxIiMNkk+Qccezqa9yjXM5iDXYzp9o8NBJTIxgfv24Y+gn4+O6c
	QJRTIRnCIRkMWrGr28/s594ze/ARXlCWgAaEjUwgE4ouNHu0QkXsTxDroQMPAC/27tSTa7hfv00
	rjrb44hZOb7ckrFUFA2QYU5P9OC0w7HKJZwItC8dnsDuN9IApNReZE2o6bYUPHFx/WE4eL3ALAd
	+gJrqjp31VCeGIODPh0pIl6xKT1UZOCbJgEGPyj2BtJLadxfaBQ=
X-Google-Smtp-Source: AGHT+IEpuzX6lyN2J9M4/ZBYAmLlIpNrQmbES6PeBLBJOGfxNsj0XhIs5KAuBO9sPVp0JF08jFkowg==
X-Received: by 2002:a05:6402:13c8:b0:5de:d803:31f3 with SMTP id 4fb4d7f45d1cf-5e0b7222fa2mr10839330a12.21.1740407595653;
        Mon, 24 Feb 2025 06:33:15 -0800 (PST)
Received: from [192.168.5.199] ([92.120.5.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2721d9sm18891253a12.56.2025.02.24.06.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:33:14 -0800 (PST)
Message-ID: <36451a88-bfc6-4402-8e16-890d524a9368@gmail.com>
Date: Mon, 24 Feb 2025 16:42:02 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT
 freq. to 800MHz
Content-Language: en-GB
To: Adam Ford <aford173@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
 Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
 <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
 <CAHCN7xL=QZHs5sD7Ja7pBOcXM8cWVQYe270EizDFN--CH_5+zQ@mail.gmail.com>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAHCN7xL=QZHs5sD7Ja7pBOcXM8cWVQYe270EizDFN--CH_5+zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 21.02.2025 21:37, Adam Ford wrote:
> On Fri, Feb 21, 2025 at 1:11 PM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
>> SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
>> applications running on the DSP expect the core to run at this frequency
>> anyways. This change also affects the AUDIOMIX NoC.
> Unless I am missing something, the i.MX 8M Plus Applications Processor
> Datasheet (rev 2.1)  has a table of frequencies, and
> AUDIO_AXI_CLK_ROOT is shown to be 600MHz nominal and 800MHz for
> overdrive.  I agree that it's likely not running at 600MHz now, but
> 800MHz may be out of spec for people who are using the nominal voltage
> instead of the overdrive, since overdrive requires higher voltages
> than the nominal.
>
> adam


You're right, this would not work if someone was using

nominal voltage. Do you have an upstream board in mind/usecase which

works with nominal voltage instead of overdrive? As far as I understood from

Lucas's patch ([1]) there's no upstream board using nominal voltage?


CC-ing Lucas on this as his patch ([1]) is similar to this in that they're both

trying to use overdrive clock frequencies in the DTSI and I'd very much like

to have some sort of consistency in the DTSI if possible.



[1]: https://lore.kernel.org/imx/20250204182737.3361431-1-l.stach@pengutronix.de/

