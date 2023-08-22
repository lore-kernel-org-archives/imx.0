Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC818AE5
	for <imx@lists.linux.dev>; Tue, 22 Aug 2023 15:25:34 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-500913779f5so790075e87.2
        for <imx@lists.linux.dev>; Tue, 22 Aug 2023 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692717932; x=1693322732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5CLA2KNaAWPxWmHn3gOeMHV9Mij34aiTzhvlGQZaYA=;
        b=gULeZIZxM1UDkuR2e7pdWHGfHRhZ7hVBNnziyChiJpXZtA8T3Lqt+zNhR6YmWG8Lwd
         QWBDk2Z+lS01O37XqNHRJSstML1IdWhRdagmgLmOh8F1UVKj2u6KdJIhaVgrLGJ62cu9
         9l+hB8Q0CMROKXQboZwHmJvR4FbuIk4gKvAiSF9Ui4hRAQq1m9jLUcBe9fr+z+i775In
         +CKEeno8a3QEIhXyeR+jl+I9E/QS0akU0BwMO4UTivyi19E07TmPdEoreD0/IzdVaf2t
         atoCkHSiJtBC3X2vkbFGITe+xTv5Ohp06mrMnm6al1e0DQF5lRpG18xOjGuZOihQOZl/
         RxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692717932; x=1693322732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5CLA2KNaAWPxWmHn3gOeMHV9Mij34aiTzhvlGQZaYA=;
        b=MtkRFsPx1dXMyGL2MKZ5ec5MvapvkvEePugDFqXOtul186HFc02WFPiJAea0LDx4Tk
         ELXZ5o+qwZW93wAlvgDRSdED8RfsYG7z2l5uzmqJHEyUzXKOEpO4qzWrOkxQaIaJqasQ
         V2yc0ByjkKusk7FPXIBe/o3D/gnlGpBtmfxi8Zh6uyqj8Qm8SpzxuFGWdb0rrD/ZvAY6
         94E6/D77oobAMmhfOHLBolIxEEGaPo6SVTE8HUPx1cIhkJ3lMWmFv0Ns+5DrPZ1BGV6q
         8h2MCwiXGM7FBfbGXeXKjzkCGKei5owscIqrzWfiEUdPBAVMEMz51ATf59uz1nq6V1rC
         l4Dg==
X-Gm-Message-State: AOJu0YzsV8+9GqCM+X5EFXXJ8P1/B3yS0IfT4QyyKpZCnJ3fk4sc/oHq
	NzPFM/g9/GBKVkTYJpSYAi4X8w==
X-Google-Smtp-Source: AGHT+IEZBABvrUJyOnUqIjt8DQpu4/Ght7kXWGlnDfbg74DLs7ajvH75DORb8rvzSwmWJ5nrCs9TaA==
X-Received: by 2002:a05:6512:39d1:b0:4f8:6625:f2ca with SMTP id k17-20020a05651239d100b004f86625f2camr7199083lfu.61.1692717932388;
        Tue, 22 Aug 2023 08:25:32 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id l2-20020aa7cac2000000b0052239012c65sm7794477edt.82.2023.08.22.08.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 08:25:31 -0700 (PDT)
Message-ID: <51bc0ccf-425b-5f16-b8f2-94d7cc979fae@linaro.org>
Date: Tue, 22 Aug 2023 17:25:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Shenwei Wang <shenwei.wang@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAL_Jsq+XA_P-aRK9_WuGPmJ0_xJgsSr9smZy4BRbKZbmVsMQBQ@mail.gmail.com>
 <PAXPR04MB918539A19B8F817F623BBD1F891BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <9927403d-6dd9-3e5e-8f9d-f38e6640f95f@linaro.org>
 <PAXPR04MB91850D8807CE374BD7C30CC5891EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAL_JsqJ3dr7gxq+D5DYG8oQ=igzjARz=beQoYL7rrydV4SwDTw@mail.gmail.com>
 <PAXPR04MB918567C378D420DB4830B869891FA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB918567C378D420DB4830B869891FA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2023 17:18, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Rob Herring <robh+dt@kernel.org>
>> Sent: Monday, August 21, 2023 1:50 PM
>> To: Shenwei Wang <shenwei.wang@nxp.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
>> Ulf Hansson <ulf.hansson@linaro.org>; Liam Girdwood
>> <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
>>> Thank you for providing the link. After reviewing the entire thread, I
>>> still don't understand how to proceed. What is the conclusion
>>> regarding this commonly used use case but overlooked feature in the
>> upstream kernel?
>>
>> Overlooked implies we missed and ignored it, but the same concept has been
>> submitted twice and rejected twice. What use case cannot be supported?
>>
> 
> No offend. :) Sorry for my poor word. To provide more context, a common use case 
> example is using a GPIO pin as a power switch. The current implementation operates 
> as a fixed regulator, which makes it difficult to control the on/off timing without modifying
> its driver. 

So it is a problem of a driver?

> It also lacks power management support. 

Which is not related to bindings but implementation in given driver.

> 
>> The detail that power-domains get handled automatically is an implementation
>> detail in the kernel (currently). That could easily change and you'd be in the same
>> position as with regulator supplies.
> 
> The proposed regulator-pd driver follows the standard PD driver framework, so it for sure
> relies on certain kernel implementation details. If those underlying implementation details 
> change in the future, this driver as well as other PD drivers built on the same framework 
> would need to be updated accordingly. 

We talk about bindings which you would not be allowed to change. Thus
your case would stop working...

> 
>> We could just as easily decide to make the driver core turn on all supplies in a
>> node. That would give you the same "feature". Why would you design your DT
>> around implementation decisions of the OS?
>>
> 
> This DT properties are proposed solely for this specific driver, not to hack the OS. This 
> is no different than other PD drivers like gpc/scu-pd/imx93-pd.

I am not sure if you got Rob's point, I have feelings that not. Argument
that some OS implements something some way, is not an argument for a new
binding, barely hardware related.

Best regards,
Krzysztof

