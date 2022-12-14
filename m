Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD5610D
	for <imx@lists.linux.dev>; Wed, 14 Dec 2022 09:54:44 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id c1so9522808lfi.7
        for <imx@lists.linux.dev>; Wed, 14 Dec 2022 01:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJHzz7Cr6mZdLR560syNh/uSUGyL1AkyOrCtyL2Bvwc=;
        b=BZ8KWJbhZI9j9mmLKk5E0+GIQCI5UAqUlqbIyZY21NQCbE8ZAWeM/JQrKgwesdRT3P
         3akYY+u69yNw6ES0KS9n0rRG0nKkyV1fTai1qJYAQAG+wwOwBSlpz2xXYuj6P9O6s1uX
         MyE8snUQvLBh2d+v2QVBORATzoRtvTQJN0s9BMr3yWdXH5ymDN5TWzNHFQU6UOkVgH3D
         lxk+HxEEFrZgdnalGqbO4u5xjtWKiJMM0muohPvg0PxDxv3ZZuJIEit+Yt0i330mnH9X
         77mb0rCgxwcR0OvixPmnt79xXE5faLsBohdBmoX/+WG34TPVUovrlz2DoBYSGImvs6Ub
         fWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJHzz7Cr6mZdLR560syNh/uSUGyL1AkyOrCtyL2Bvwc=;
        b=MbKJJdD/Mu0iZRACXrt8B6Q3zBYXzWmootx70w0QgU3pXPy8+q6hFXI1uwjEBZ3B1N
         Niauc2U53CVi+aOOjetqyLY+K0V/Db9EhDDi56kRhPPQuzv1NHrrptnAERw980xGu7C/
         HQLlVqXTq06zu1L9xHA7l63nKUCN7Q6tgXGHG1w1sGfHkhJiklfj7plU+hFuSe1fIcA8
         v7iDXwuyJW6oYsyQD9a2CHHyAJckj1NJ+ysA7sEGVhLIYgmVrF1aGbUAW40xlaYldIsg
         VTY8Jvm487h8pXGf0tqxVrDo5h8k7BjvEWKb6PlcMNbw0zW67Af3egv1yTXRJY22593h
         RPXw==
X-Gm-Message-State: ANoB5pljVJwK9ibq95/x/aCz+3Rnf+8hIAtE4ePKvmUVxGnIRxVseBlS
	zNi1FswVpFeucGNBsL5d0mpNTQ==
X-Google-Smtp-Source: AA0mqf5+dPoClAGr/fcvhHv5/BoMUrcqY4rn7Vn3amkoNIZ0rTphTBFbZ5NlYEfynFQHbtVFlqIfOw==
X-Received: by 2002:a05:6512:2110:b0:4b5:649a:9105 with SMTP id q16-20020a056512211000b004b5649a9105mr5804481lfr.65.1671011682872;
        Wed, 14 Dec 2022 01:54:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c36-20020a05651223a400b004b55da14ba8sm734743lfv.291.2022.12.14.01.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 01:54:42 -0800 (PST)
Message-ID: <2e9e84ce-97c6-77de-6fb2-40c91fa81e51@linaro.org>
Date: Wed, 14 Dec 2022 10:54:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 4/4] dt-bindings: iio: accel: fxls8974cf: add new
 compatible string
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
 <20221213171536.1880089-6-han.xu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213171536.1880089-6-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2022 18:15, Han Xu wrote:
> Add new compatible string for the NXP FXLS8974CF accelerometer sensor.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

