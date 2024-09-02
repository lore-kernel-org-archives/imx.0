Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5513AA20
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271327; cv=none; b=VMG9Apd0JbLxCvKr523stdh2ubhWV1e72YXpoz/W3tIgMLdYpA8BdUBLTugaDRU/Yw3kI/AynEWWZOaM1Vcy3r3jnYQlDzro9vBfeUtXPjtTqifC/VxI4eV1zVvHtp4zbzuy2mpdNMcBP08u1iLSwidLoVXMJ8WY527PkZZKC9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271327; c=relaxed/simple;
	bh=EBknvpDUrij4cpLfzBdffa1oujXZf/ajfnRsM0wrQio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJZuJY64geIEeznLAvPpOqfj5gAZWCCJposa46qKDn4yFR2FLp+GvO5fZh5c1nsCphLXCVE6Yb0YXG4TtQ5gxH4wbbAOV/hY5GKf1X6O8TK7wIb/71j/djbh/ZivwejOWp6vSTxQRAhqQD2Vpgmw8iYrscHrddu+5ZdIxMCyoGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4vEyWnz; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4vEyWnz"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c23c559defso359441a12.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725271324; x=1725876124; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=azCIJs0Yes3UGBt+MS43513CbCpSEhJdQPA/Vui0QvE=;
        b=N4vEyWnzP1TohLqFpwImJv4mFa/h4VUCJQmCrrWn8iIsy7uaVXbK+0Z3tOoL7XQDaH
         vf95cqQWoO8gsc61iDSmJJObxjDXS0RfL0tXVdh1qetvQQmdtaFWkdP7BCzQktYpvjmm
         WxsnIzHA/Y0mpmc7ZZZvKWHHEiTYCbe6dpKUFxeIZC+6sDgtdhZgUzO2fgbie6y+HrQd
         hs8xado+7riaGTOF+yMb3Lqz4B6u0hcb1HQJVaY4aP2GwNLNmQi/lVraf4/Sh7jsAN8H
         NFZuR4ck+dIYO2qthpR9/BiFTzuPULMTrtQN0B03zXltEVtQbRAXTcDDA748ZT/Yp0O+
         LMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271324; x=1725876124;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azCIJs0Yes3UGBt+MS43513CbCpSEhJdQPA/Vui0QvE=;
        b=RN7DP9dQBopA+9Mwh2t0z7qjjAywC8kX//q8EThyZgJww3HLcw4w8/ZDmRUYKPCYAX
         MpzRiFFwSfSpaP1QEb6p/tnsrwXaf7ojVblwkp4wXJR+zxvssgK04COOQdTMbLa2/W5s
         JQBaaMagWhzBZFRuv3iUEDCYgGhvSbchfud1n2G/rWN2L1tQCyTgL9ZMnrnNdMsjrfI3
         qpor1ip4HCd0rG+jaP8SA4p115AGyzxiZO8nh/Do7vo4IxLl+mFs62AXsPa5sL6T8oNO
         eZJM90uSKLwSR1hQP7GdtVf63Lv3Dnd7AlwPFrKvbju2+jSmyV7Zc/AMfUHrgfugWT5y
         vRBw==
X-Forwarded-Encrypted: i=1; AJvYcCUNrZhLvnxOjOYXzff6kz7N/ntQWYHdd+Fv9xmH0gtVVjOGOFpsDNCZeiZisOmUTsbkcKw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxetAbQs0MPkMsdisJn8VthGxsyy+Rlc5QAW1wEr3CJCI0pAhRx
	wg0X4obl90d4fA+WAQINDSGk8Uk35svxbahAyEGojvouuGuc2W5UUOZkYzRQJYQ=
X-Google-Smtp-Source: AGHT+IETNIV8jXmXuTCEzIyDws1SHg/IJcZqr8A8sztUFROxV3ILjfFsLc9fgtmtMi4l37rswX3tSA==
X-Received: by 2002:a05:6402:3583:b0:5a2:7cfe:2371 with SMTP id 4fb4d7f45d1cf-5c22f902d00mr3927077a12.3.1725271324024;
        Mon, 02 Sep 2024 03:02:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c25bcb46f0sm1414180a12.60.2024.09.02.03.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:02:03 -0700 (PDT)
Message-ID: <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
Date: Mon, 2 Sep 2024 12:02:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO
 hogs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
 <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
 <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 11:51, Bartosz Golaszewski wrote:
> On Mon, Sep 2, 2024 at 11:50 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Sat, Aug 31, 2024 at 12:32 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>>
>>> On Wed, Aug 28, 2024 at 11:36 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>>> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
>>>> properties would be allowed.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> I suppose it's best of Bartosz applies this to the GPIO tree with
>>> the rest of the series?
>>>
>>> Yours,
>>> Linus Walleij
>>
>> Ah, I picked up the GPIO changes separately. No problem, I'll pick
>> this one up as well.
>>
>> Bart
> 
> Nope, I cannot, this doesn't apply to the GPIO tree.

Hm, probably there is something in pinctrl tree.

@Linus, can you grab pinctrl bits?

Best regards,
Krzysztof

