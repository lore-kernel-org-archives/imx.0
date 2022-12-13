Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2E33D4
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 13:17:59 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j4so4923181lfk.0
        for <imx@lists.linux.dev>; Tue, 13 Dec 2022 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sK9O9xDRdOK1WrQ5YzfOMAm6QizVb9/TslMyl19cgSA=;
        b=BVCrhwkqYbbCuxBTv7OoVEHRERcVU/L6uLQgylYEGogZprgZX7UmHWxbHrzHadMUkn
         WGs2dtiWJ2Fymvt26Jg4+QEY+x/rSvdDd7yzh2GxFLk2zT+6ouPC3YgsKLpFrMrClctb
         jiMR3uqoHGM9Mvi7EfYZ34D/PJTiJSeLmL/6CFxdxBqqrq5sOyOORguBeQAxO0qNWMos
         XoQEbDSDAq/fsBWH/Ldrxw1q88e0aA6jgLLA5LRrRX7W/4aVQZ8C4P7su+xsBaxHXlJg
         v8iE6q30MHoJueE48XqotAVaeW1ODviMJgZ0XTciVAhwjg6c8FxGkCv4Lr0fqqqDfeTg
         wIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sK9O9xDRdOK1WrQ5YzfOMAm6QizVb9/TslMyl19cgSA=;
        b=s550YNbLI8H9g2HOE2KuncXS0k1KsSUxIg74fXHjKHcjZeY60oNstsgoGdkrZXAaNH
         q5VuVOWfNf3Ips23dyGpVXqmhuHCA7ffqFIVx+fYRlT6fRFfuv4TPc0OPmzrYfAPltHb
         ZdhPpGv8wRB2O9pT0zB1iFNVWyDXmGLcuorIem7usetUI7VrWMp39PIbRgnPm0/oc+JX
         oJG/J4qG6VGOXo2CpyLZbLUV3XIhdkGIj2WaowFx4ozLNNc19fSs5mP78oHoLsqfBjbp
         TBzToQNPpb+chYpgyMMVa1EQ3azCsiIGkHTaSa7eMwwf7vWTg46ilfB8MP4hGNhCKON0
         WYgQ==
X-Gm-Message-State: ANoB5pm+R70UGMNexl6z+qaoXWFnXo/PgtDDrtxc6sdyJ16E0Glwc5id
	fPJsONRHppOsOQ/moq8ksKhkaQ==
X-Google-Smtp-Source: AA0mqf7u6xb7o7rg8pb4eSeKln0JmVaxnlIohuM03qO9ciiH14OYqKqk+YXSJLGt/om11bkytJp99A==
X-Received: by 2002:a05:6512:2293:b0:4b5:5dea:ec68 with SMTP id f19-20020a056512229300b004b55deaec68mr6841531lfu.44.1670937478168;
        Tue, 13 Dec 2022 05:17:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u7-20020ac258c7000000b00494603953b6sm366089lfo.6.2022.12.13.05.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:17:57 -0800 (PST)
Message-ID: <e6a5ef70-0fb5-67ed-f023-8a31fe2a6239@linaro.org>
Date: Tue, 13 Dec 2022 14:17:56 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/4] FXLS8967AF and FXLS8974CF support
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sean Nyekjaer <sean@geanix.com>,
 Haibo Chen <haibo.chen@nxp.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Clark Wang
 <xiaoning.wang@nxp.com>, imx@lists.linux.dev
References: <20221212220716.1829183-1-han.xu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221212220716.1829183-1-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2022 23:07, Han Xu wrote:
> The patch set add two more NXP accelerometer entries for FXLS8967AF and
> FXLS8974CF in driver and update related compatible string for dt bindings.
> 
> Haibo Chen (1):
>   iio: accel: add fxls8974cf support
> 

This contains some v2 some v1 patches. Please do not mix it. The entire
series has one version. Your next will be v3 - for entire series.

Best regards,
Krzysztof

