Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9014190664
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338761; cv=none; b=SVqI5egFpca/LgUrQywtevBCWiVyNeJcHI5Y25ccGMd+c/da302dVx4cD4X9naeaascz6yyTCVvDJROipzs56LKLjLWxN6j0JxJxQXKDDw5IekVFxRSafTKypXhfUejeDXHBFnm1Aux33beihssflFyGhGy4WGUCftThepX7c8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338761; c=relaxed/simple;
	bh=l2wuy6uutmjlMwmvqqU1Go/FyQ3viVYg51+dLSMo4CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANeq76Ox1LgkN7vHGWpHYCHmTWAdKMBOgXm/DjTi7sec8fJNeptSRiAkEdIjvn7CIQlHDdFwnr6ID10BYTWjTKdNHfOgfYCRzARDwFjVrjcwXKZOoE/Cbo1knDkKBFEK7PnINEbQo2KWKU8K/OogsOKXvp2I89WqteKxzshjYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIqOZi0D; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIqOZi0D"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4998095e9.1
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736338758; x=1736943558; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=;
        b=YIqOZi0DlIADXsE6kuY21QUTLHaSLsMdYaqW1m5S5AeL+v5cGE3GaoI4Fy6Zc38t1B
         vrYMxCtVcs4jj1761fjdrh+ihKSb2KhJ6Rr7iBmQNyKzfjP5XGe2UavA8NYmM8FlRqDn
         F5Fzjm5TYm7h7/94Jh6vvLj5bCNZaJcQbI+HP9JXfDElZmkmo0KO1lLvtYgXT9+sb8qF
         1FKL9ng+dLci/Fwf1PpDuJdmDW1YK1SruEfBSQWlKQJbIi2gMPw9A9Y19aQsZ1ynCtEt
         TKvEgmm3X0IeEe1B5H43upBWpKmilpvMFSvHBWEeStLxl7TG1wYVPHflq2k+yd2DAm9T
         hh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338758; x=1736943558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=;
        b=hsMm16s8j07UAfzjaqURh/k1ds8AMhCpivEPhDDG8QOfiFQmwlehQinRNWu+P5cp4C
         1pmMxkZf0UeiOjYyzedu+kYLdLOgYHU8BQWfL2z3w1oLvQEG8pxwH+8IwzRlJwHUM/Gm
         nulpl0wycO6XjnQNDDxqDT8/qBdT3xzuhpJAWgqDPWG9HWuN+ISJqragdT0GUDKe8OHP
         poGjzZQoFBkSqJbg5LyDc0nJ1rSvn7HXmM9ABgH5XHQ5GJ4YkGPBZvRZKL9cj2a/XxWf
         BSRiWqeQP96BnYeadYvYkRZ3T4q4CskcEF+Xf2W5rYNSVmfVCszX6X1SG0vuA8AjMREf
         go/A==
X-Forwarded-Encrypted: i=1; AJvYcCUisCbv6c2Jxudrmb33MbYcyD+0i7kYpONrUUGVrCZAmg3mxdjclSGfyTr/woT1tB38Fb0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywudhp9nSzxXToCvLsalLQBehOz7ktZWO5gZbRfrw6FRm2zg1Ia
	iwJCe59+GFz7jIHUBvvC9NlNvSAChepXSxKiJUZAHuVpugUgSmAT
X-Gm-Gg: ASbGncu6DDYL2LkLCpu1+zqUMiwW3WEl1dq+yKDUbJlb4mxz0YL0VzbsfDjgLL9DGjS
	IsRouGxE/ES+I6bp04TSkA5ECPjnp+Q2SirkprrEXSmRcxqQkgfFMBnLVSox+1+GxnALXvBFfQL
	L5pAPpBxqHMHufhO78+ZcWgypbOU+7/ZRG6nNNvuUVocEzGqk2ICV7nstpBWldGLDp+VOF5DhqC
	NHqaFusxqSqRpJKwh+pmkLQBhgW1WMEnQuWb2L7JfEsqa+xcBRrXcKCUm7WcI7ckIE5UuW5q7jZ
	NJpH2Q==
X-Google-Smtp-Source: AGHT+IEZ2TsyG7bFlOCK2TmeGPogWLKZEqI34rc1uiTT2N6nITdoJEt+KA1su4EcHw8h6jyV9z9qzA==
X-Received: by 2002:a05:600c:510b:b0:434:fb8b:deee with SMTP id 5b1f17b1804b1-436e1e4ae91mr23270555e9.16.1736338757809;
        Wed, 08 Jan 2025 04:19:17 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27008sm19375005e9.0.2025.01.08.04.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:19:17 -0800 (PST)
Message-ID: <e5665b6a-c2ad-470f-8a36-b7adc05c1cf0@gmail.com>
Date: Wed, 8 Jan 2025 14:19:14 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
 <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 12/17/2024 9:07 AM, Krzysztof Kozlowski wrote:
> On Mon, Dec 16, 2024 at 09:50:37AM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Introduce the 'widgets' property, allowing the creation of widgets from
>> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
>> introduce the 'hp-det-gpios' property, which allows using headphone
>> detection using the specified GPIO.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
> I have impression you are duplicating audio graph properties instead of
> referencing proper schema, but considering that the bindings
> audio-graph-card and audio-graph-card2 differ only by number "2" without
> any description, not sure what is correct here.

Please correct me if I'm wrong here.

As things stand now and based on Kuninori Morimoto's comment on this
(https://lore.kernel.org/lkml/87cyhw8lg5.wl-kuninori.morimoto.gx@renesas.com/) I'd say we can't
(or, rather, shouldn't) directly reference audio-graph.yaml here.

Now, I wonder if the "proper" solution here would be to take the common properties
of audio-graph.yaml and audio-graph-card2.yaml and create a new binding that can be
referenced by both aforementioned bindings? Would that make things even more confusing
(we'd probably end up with audio-graph.yaml, audio-graph-card.yaml, audio-graph-card2.yaml,
and audio-graph-common.yaml)? Should this be addressed as part of this series?

