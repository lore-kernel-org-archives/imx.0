Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914B79C9
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 18:51:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bp15so6412023lfb.13
        for <imx@lists.linux.dev>; Tue, 13 Dec 2022 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4caiTUPwb5yRD+BikSwZkcJjgHseuGfEKaaNJStw97Q=;
        b=XLQoG/VIsczeHkAcemrUqyZ5KHS+OICYwdB81xqVKZ7g6TLTVA93aLg1O3oZYS9HaV
         jFJmPqyriz9pTo80a6U6d38WPKaq6Id03Z8kl7eA3Uev7QAxe0sGCJ5cOEGPSzOqBbcZ
         onIVqKSRivPaUMZRa6DtcNjzIdjAudhbtEXgBFNmEZGYGKMPG0weDXZZcPJP77dnIre3
         iHFromBBXkEzLBP+ld+3388d9tKiMHfPsWVSayXgGeLoOucKRdL7gill9MyE19edOrS4
         Fm4o8Lqu0mQk30qYKiDKrRtSNFWcPKaEYvAxPmcAqdy2nXGA+jq3UFHuFvH7YnUtUI7g
         Usrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4caiTUPwb5yRD+BikSwZkcJjgHseuGfEKaaNJStw97Q=;
        b=jVt5gXzmkJF8TnsIGwyOviy98BcwNcTkBjUmAS/h4IU5DOtdduAedpBuWh80MvVCeo
         +WEnqAChJ8fHh2OCIqCFSJQSnu72F34jwu/OahfKx3qmUjpStUQR8onHy7v2DUlbuNFs
         IHPPRavH/jpVZuRj3VW+cjt8RqBVv638zd3HtZskTCh42wsE0glfW5uKgN6jWsiUofhu
         ePzjvUdoqUH8lTXYu/oDw9CWBpqyGvCn1P3G2Olqh4lmAa4v71WWDlVV8n2++BgzGvZt
         Sl0GmQl3iCzVX+IzBQScPazbMLP4dMrM2d6s9yT9OnRdehk9lUS/ERLTSikcFUd0baNI
         aeNQ==
X-Gm-Message-State: ANoB5pnCwJv67/W82pr5OHpp34qnj9jUD/yYdSjVwbZ+N5j5LGlwY+6L
	JQiLNYPnYJK+Rc+cbCKqRVj8GA==
X-Google-Smtp-Source: AA0mqf6E4/sjsn22TId8xaneNkrZpb3Jps/q1fT2KrOG3UfeG50TKQCREt68tsCkvMaIyJX4z583NA==
X-Received: by 2002:a05:6512:b9d:b0:4b5:8237:5c12 with SMTP id b29-20020a0565120b9d00b004b582375c12mr10602415lfv.15.1670957494496;
        Tue, 13 Dec 2022 10:51:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j25-20020ac25519000000b004a6f66eed7fsm473142lfk.165.2022.12.13.10.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 10:51:34 -0800 (PST)
Message-ID: <acbdf493-eeef-4eb1-508e-c3cc1a31c886@linaro.org>
Date: Tue, 13 Dec 2022 19:51:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] iio: accel: add the new entry in driver for
 FXLS8967AF
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Clark Wang
 <xiaoning.wang@nxp.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20221213171536.1880089-1-han.xu@nxp.com>
 <20221213171536.1880089-4-han.xu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213171536.1880089-4-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2022 18:15, Han Xu wrote:
> Add this new device entry in the driver id table.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> 
> ---
> changes in v2
> - change chip info orders

?? This is v1 attached here. There is also "iio: accel: add the new
entry in driver for fxls8967af"? This patchset cannot be applied, when
sent like this.

Best regards,
Krzysztof

