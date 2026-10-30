Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348668;
	b=Fr9asFGNV50DMG+Lwjp2uO738r87+4dvzi4EYdjzkDAFJAEDX3ymL6yypelnPmnUadUJ
	 VZ9BbFnwYn1qcpt9aUrv8DAr+1GVt1vSP+cQW4ZsNcLZ12JudVLBqzfZlJQuq0V/rsQn7
	 CTr8qWL/gOE9mH/vNzhc6d/cqkPx2+HAGdkOQ2BkLMMViV6unRhOMcAVBUBDYrTlpqvLm
	 OQ03ZfPnCBJO1mOY9jJiWLSpdaKCIEotIeUVzxTYOTtWbadp27ICh2xI5qovaZz3o/oiu
	 kbAdCMy/StNv+8dO1d7HX76rdgOhDo4N6umOfc5Po/5A3KnDaGbW4mGFegAzKvE5tMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
	b=yM92v9/EDK5//LDQiY2XjYztNp5vTBI2q2Epu8KDZwHzgaDdpxNcGO19rG2CifZ+j6hI
	 ghyHtrrsUoupdRa34vnIPsim5730pQDv801iYT2ivnw6qByJzbRAxr9kMvTlYM6Gt9BjE
	 5e/Ry8Xac6mSxy0IIMdWVb77+cHZAeAuki0tHKXGdQlCG4YMbmruxWdlc4tDaR5ZwZKeK
	 I/DKlXSK66qhl0qWFhzUkJaHhMi/DmH7pA255YHlgQ0U55SOH7KiN0hffbk11UqHbEg5q
	 IxFBkxvV97HjAoLrcz5Jm2a9vEhdZSOddlrhHMXiTV1j742cctSv4ugHO2jHBhJl9sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjO6yFIO;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F2606A321
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjO6yFIO
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso420061e87.3
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348666; x=1793953466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=xjO6yFIOT7d4LyBkRvFgqzQ5xdAb/RNe6U71ZyIpfutzFgQvt6HXl6a8fKcyvnp3E1
         lTTkwarsncuMlJsNVyOR9hhP3TX6msTFV8GvSexmsP+ocybcdGkqklkg8pJz6TDAkZlO
         yWlNs3gBquW6qDEZYWc9zxLcWlS1tcjcIvoP2tut5zzm10cbp5rsiwvEOBLaSMzAuc77
         O3if0XgK7ycO0+0Rgtb3bHNOwMFxAL4yT6RGHyrKO6w7VctUhtk6ECbwozRkjk39F/7Q
         W6qZ13Uf9GAa7uSxKTF2sFaSwIfBja85JaNRsOP7j6GKb4vJaQOcsLM24pyr+ltDP05o
         jX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348666; x=1793953466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=BXfqm5bOe3+5Vzuaj2Sker655w+bIx8VUPFbstkBJM7KYmI32sQ9+0E8E/xdqz5P8z
         SUOAnEqAVMo+GsrC15N7HzzGiAQ4Pgvt3h46S81UrnVqpwpue8vakJxFTQZH9Rv1Dnxs
         ynxGCjRpNLF1YjEQb5kBWoiLsZoq5YkOJjas3UZRv+6IDtEHiIyH2kRlKAIJya2CMKKH
         dPZMtIuN1NIFFO+Du0T00nICZEJm1sOm9ljCQIx5Of6Ed/uPLeUroY5oFaszAOfdaJuc
         ZXnDi8fTzWBqz2ckEZP832VeSlqyfv+nIjvJ9J8LXUkMwLm/AqHZfppRnKPb9fjgZGpE
         vEyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/VtMqt2bVirME6A047qfPQsIvMJ+n+oRSmXP88fdsqHOOtwbwOTub5yWrj+8GOTInLl0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIF2A3B5oi1n1clcLod7dRxLcW6z9qV2zaE/pmya2hs04NJ4eQW
	i/rWXZR/ZkwBHZm60Fgp9MRcNcjehPFSjBufqHpF2SOUlzeAL+EnPXnv
X-Gm-Gg: AYBFou1E+blq+7LXeScorBu/tOU/zYyj/HoKvMjKw4Si5ExSc6NpnXsnGNCuM7RBi+6
	SFrn9Q0mqEl1B2euspYE9ZvZ5uPy67Wf4PtaIsJ7Ta8bv7yHnH7GpGnBGnhiqXzVbxTZ2GVX2vQ
	AiE4nTVl5cDvWmibCwCUqobJAbFx4BaECEJbpwFWwu+/agzBDrpdIJS9f4Y0EdhjxDQ8EBpHX0u
	9fixdJp6M2A4hCxhLw959HM6R/A9gKNQCL3DKmtZ/ZaBZ1RKu6+GJKcD/eYXor7driJ//+zuXQp
	QNOXGNyQ7P8/7MTgY4XoTtA6SmpTDXSLzyKQb/oNrIBvWBG3ycXa8bxtzQ68hqaYDa71YD+/1kp
	AdRIlEP4mX1G75XfENL08WI7TW694MaAzXmeE8FCKQCr/dMsNLEn3jGCZmg8WNJr3CvL4uP1xEB
	EuaT81E8xdnKuL/e/LzEb3JYkK+WiFmMmW54rQmjQPj5tI4O/GS9P/inmoD2jSeMGCEuwaC02QU
	rChcO83gdMCHJCLD+kcngDd4CAxY4Vl1EY3mzt+O0wlr/k0LCMa9gt29T9n6LsaJkpi/Omvy+JB
	gwO4IcQ9BQJGpTW6qecOtonZUEebgAgqpdkIEA==
X-Received: by 2002:a05:651c:1a25:b0:3a9:a2fd:5932 with SMTP id 38308e7fff4ca-3acb7a651camr3189241fa.5.1793348665744;
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf3f762sm1753921fa.39.2026.10.30.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:24:24 -0700 (PDT)
Message-ID: <a83ade5b-b119-44a7-a5b3-3a7ef2d4eb2c@gmail.com>
Date: Fri, 30 Oct 2026 10:24:23 +0200
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 09:11, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/mfd/ac100.c                   | 2 +-
>   drivers/mfd/axp20x.c                  | 4 ++--
>   drivers/mfd/cgbc-core.c               | 2 +-
>   drivers/mfd/cs5535-mfd.c              | 2 +-
>   drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>   drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
>   drivers/mfd/max77705.c                | 2 +-
>   drivers/mfd/menf21bmc.c               | 2 +-
>   drivers/mfd/mxs-lradc.c               | 6 +++---
>   drivers/mfd/rohm-bd718x7.c            | 6 +++---

Thanks Krzysztof!

Took a look at the ROHM stuff. Looks great to me.

-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
