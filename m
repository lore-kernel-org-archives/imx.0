Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08F13AF8
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 19:30:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4bdso196901a12.3
        for <imx@lists.linux.dev>; Mon, 28 Aug 2023 12:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693251047; x=1693855847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FF3uWcCF/fBgcKyKYxNsxhAz0t2E3t1fA13G/6hVqE=;
        b=WEEl2jADfaEkZMnwQHrnA1kfCneRgIh7ji/YjnBUeF0qSyiwTFRa19bkGzczgTWQPu
         YAI+ASpbvsAVvg9AF3d4lXje4x8ZTlqkqr8yGmz01jFYVdqYUvdCDAJBSphkK3F8sVsr
         4oI1cy7A6KefK+HFJ92pGJroNIlakD2oKPyTDZQ86VGmJGQbv73EIiuMTrLP7tuqpjoR
         zyaHDvMAjfVLbA8m0Jf65GftzmQa/kvaOXGKmcIJ2AJSRXUN77U08wuBdauzgr6uENt/
         0os0OO4SHMceKiPHCaujMPJbZFGrN3vmp+8buPKqqQgOcXK7gDotT8KdN9esZbaumi3J
         8F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693251047; x=1693855847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FF3uWcCF/fBgcKyKYxNsxhAz0t2E3t1fA13G/6hVqE=;
        b=L36Rw5Radx1zoRYsnoPevc4wNDF4tIqklDDUDXA+PSKUIRTb8sNsxtdWkRdfQNWydq
         JjTjFIBhGtZb8ekYq76Xen5ysJyeb4q3UDkXxfjFAM+T9yswDxom92W3w8xc9czyZV6+
         hCJVtcsZQZz0HvAyn4D8MyauVqrREeCmTWRXZFjflKnnMDmbCXXJjJKABHeVEOiOxTFp
         KI/RZY5QNorGFGecqwjIv5r5DWEDigP8QbKikhGmF0MbpM5ehF1TvK61bG/VbPPc71uN
         tj9ZLE9OxsM+sjtBbAzQHjwvasc4YEKVIHDwskSzDfloBAXIj1s41CZ5vshXoT+wp0Ow
         YXNg==
X-Gm-Message-State: AOJu0Ywl751LvMDJr9b6DZFnmCv5+oXSAGQFceGOEhi0fjeoDJ/rt3fu
	cbSuOz9s3E9iyPDeAE1Wqlwlyw==
X-Google-Smtp-Source: AGHT+IEKG5tzShBpR2V6RQtN9mM20TxelL4ewWN+rJjWEoIaBql1h7z0FvNmPsb79dAbg0aOhovkIQ==
X-Received: by 2002:a17:907:778d:b0:9a1:d7cd:603a with SMTP id ky13-20020a170907778d00b009a1d7cd603amr12300358ejc.58.1693251047351;
        Mon, 28 Aug 2023 12:30:47 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906718700b0099bcf1c07c6sm5036313ejk.138.2023.08.28.12.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 12:30:46 -0700 (PDT)
Message-ID: <2bd01950-20e0-51f1-91d2-88c9ee2e8dc0@linaro.org>
Date: Mon, 28 Aug 2023 21:30:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [EXT] Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml
 file
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
 <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org>
 <PAXPR04MB9185957B729588D3E7CA3A5089E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <51fe3126-16ba-ade6-b106-e3683f96ad26@linaro.org>
 <PAXPR04MB9185DC79721E78E631F9889589E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <154b36de-652b-3931-96e6-04e99253a09f@linaro.org>
 <PAXPR04MB91852AD4E5242306B57A910B89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f3e89479-14ab-d1d0-ad87-6f457f313c39@linaro.org>
 <PAXPR04MB9185D87525AA88A8C3543EEA89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <465e61a0-895d-54b9-d1b9-424265c82855@linaro.org>
 <PAXPR04MB91851302EAB989EC8261AEFD89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB91851302EAB989EC8261AEFD89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2023 21:23, Shenwei Wang wrote:
>>>>>     reg1: regulator-1 {
>>>>>       compatible = "regulator-fixed";
>>>>>       regulator-name = "REG1";
>>>>>       regulator-min-microvolt = <3000000>;
>>>>>       regulator-max-microvolt = <3000000>;
>>>>>       gpio = <&lsio_gpio4 19 GPIO_ACTIVE_HIGH>;
>>>>>       enable-active-high;
>>>>>     };
>>>>
>>>> There is a chip. This is the chip. If you have there only GPIO pin,
>>>> then your DTS is just wrong. Drop it. If you learn from wrong DTS,
>>>> then sure, power-domain- regulator seems like great idea...
>>>>
>>>
>>> When you talk about the chip, can you please be more specific?
>>
>> What to say more? The device node you quoted above is the regulator. You
>> brought specific example and now claim this is not a regulator, but just GPIO.
>> Please fix your DTS.
>>
> 
> The fixed-regulator is a virtual regulator driver that uses the GPIO pin. 

We do not talk about drivers but bindings and DTS. Why do you bring
again drivers, all the time?

> You claimed this
> as a hardware chip.

??? Sorry, this is getting boring. The DTS-snippet is a hardware chip.
If it is not, then drop it from your DTS. I insist. Srsly, third time I
insist.


> 
> The regulator-pd driver also uses the same GPIO pin. 

Again, what is with the drivers? Can you stop bringing it to the discussion?

> You now claimed this as a software layer.

???

> 
> What's your standard?

I don't think there is anything more to say. You clearly do not
understand what is DTS, schematics and how the actual hardware looks like.

I am not going to respond more to this patchset (which is a clear NAK
just in case).

Best regards,
Krzysztof

