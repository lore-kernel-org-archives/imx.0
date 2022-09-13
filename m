Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8E7F
	for <imx@lists.linux.dev>; Tue, 13 Sep 2022 08:44:51 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c11so19552597wrp.11
        for <imx@lists.linux.dev>; Tue, 13 Sep 2022 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FZVlunLlsLup+p0bI6QeJ/RYwaTVchuEcmhidvQoejo=;
        b=kGbIXxFn248s5nHz45P6zHNJW7wMKw4UuALZcV4uPLjbNXuN5nj379TTa5FLLkyNsf
         q2wrH6TX6hyS1BksUxlPprxthHCwrvt7TR9BRePqeSur77r6cEVFSZPbQomcezasWWgf
         th24b8xfsFYpSfaPNqL8uHGV1UA3yLH2ZKhLh4KHfYZZretdGgkhVNUBEvd38XI9WB91
         wEFcu0TTwNgwmDC2z2/HtY+7Z1wEraLgP12icYpOyEPmpVCcpFBftXv20TE2hdkTQu/s
         1aw6W1Et6FXYyFCJEibOe5XmJvU9fqWcxqkD2ypK6W609SU5UJxYCLbtAStHKKDCaR1S
         CIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FZVlunLlsLup+p0bI6QeJ/RYwaTVchuEcmhidvQoejo=;
        b=LdZdGnVDTd8KdTDyHqTOUzKuej+GVaiBRHnjRhWbcompWtlw37T2NN38kqvQvNeSOq
         ajc6QraUbZmIpolg1+9xj6Jh/Do6PdHz++z6GK95o8aY6waqGCyocYgd1x9loZhNeO0V
         RvB9oaI5cTRSCBmnDelji9ve3Qyz3YYo6aE0lzelDnPWCTOJLse/lpagPXTpu0xZqMLJ
         SjPbCoXEBJWny3U8UA//WC4IjTVwpSKwNSIhCnEXJHJl+/aNVexQOp/aLaj+lickZFI8
         NoS32IRStkwVvJx4wlEcacxU5R5u43gdlQLbXJp8poEvVOk8pa3Ece8pny8fRxyvOpDu
         bqvg==
X-Gm-Message-State: ACgBeo1iW3OzdsEsPaDBJ05/Rz7z11oUzXDA9F6tw2+59whQQVlwmzzj
	/8VvTVBTknODsGyZhtREDusTwQ==
X-Google-Smtp-Source: AA6agR6WhtQN8m38UaEkj0ux7abtkAZ4ZImaPmtJ2jpMlO+urIKvzCnDHmVTHBa4/sB4bFG4oepkgg==
X-Received: by 2002:adf:e4ca:0:b0:228:d8b7:48a7 with SMTP id v10-20020adfe4ca000000b00228d8b748a7mr16964661wrm.300.1663058689956;
        Tue, 13 Sep 2022 01:44:49 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c359000b003b486027c8asm7322640wmq.20.2022.09.13.01.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 01:44:49 -0700 (PDT)
Message-ID: <d318a618-350b-22bc-13f2-586fafe038ea@linaro.org>
Date: Tue, 13 Sep 2022 10:44:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support for
 i.MX8DXL EVK board
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan
 <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
 <20220822175245.222691-6-shenwei.wang@nxp.com>
 <20220903034819.GF1728671@dragon>
 <PAXPR04MB9185D243324279DD80C371DB897E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20220912081649.GR1728671@dragon>
 <PAXPR04MB9185F52BA6FEC47E6412EB3C89449@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB9185F52BA6FEC47E6412EB3C89449@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2022 16:35, Shenwei Wang wrote:

>>>>> +             gpio = <&pca6416_1 11 GPIO_ACTIVE_HIGH>;
>>>>
>>>> Missing enable-active-high?
>>>
>>> No. Enabling this regulator to select the fec1 interface instead of usdhc2.
>> Pulling this GPIO pin to low is to use FEC1 interface.
>>
>> Then the polarity cell should be GPIO_ACTIVE_LOW rather than
>> GPIO_ACTIVE_HIGH?
>>
> 
> That doesn't matter since any GPIO phandle flags are ignored in the node of "regulator-fixed".  The final flag is only determined by the property of "enable-active-high".  If there is a "enable-active-high", the GPIO line works as active high. If no such a property, it works as active low by default. Right?

No. Your flags must match hardware, even if bindings also expect
enable-active-high.


Best regards,
Krzysztof
