Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8EF28EF
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 18:50:40 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id z26so6442535lfu.8
        for <imx@lists.linux.dev>; Tue, 13 Dec 2022 10:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qa0OV4UCeh7mnPYdpVBhhS/HNx0d/uYobaIishgPBHY=;
        b=nVhIXw+Am89dTVmJUfMnk3z/XsEWHPXBpRWzWdanqJE9gy3214PGySNffVgaI6kOKC
         Hlm7YYLHkAiItCxVLRt4MxZ8UuzNrtlUphjJh3UkLzVBBc9dLgCI6so/kc9CD1Zyx41r
         v+eocp2hcsyoKxAbMQgxE5LzRWFfT9aDPzVxoiaPKEJVfRLiMaob5xuZePmDTmbHB2f0
         bNHD18I1JqBsKIC0K0hrwn0zkw/srITnqZYdmJxQbI/UDcgSt9McDQmNCiHUwgnHRpA4
         cQzJtIef4lhtjAvw7cRxH4GMNAw/QYywcYLA7LtC5Jb1Ju1BLcUMVXKpmopPHi9aJfJi
         SvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qa0OV4UCeh7mnPYdpVBhhS/HNx0d/uYobaIishgPBHY=;
        b=BMVaWqulWq/pf/Af4JNXqeZMKGm80sHIxHPhlBv9wFOQbOYLQwcIVti2QOv8nlLU/w
         PgTufJQTtv8EpvqcFWG0GM4B8hd2FQBCk6/VKSOctXlGgCllZnjKPhwOukm88UtruBPx
         s34mpzMUMuPWbnWa1EPJfpg8d6W1q94jiDOixioMyR2qHZ4iyFYME6k3lJOhlBfqCKpI
         CHyHs5YAiAafEMoWVEOK+atUqzkTTzJ7GfNIc39TBmmIHXIhne6b0lpTU+8+Esnjx1KI
         rgRvnp+2YGNpUkFHsZSpzNku1fO3t2Rn8bsFTQyUv74y1vTcTPEly6OSKXElvxU4BzRq
         RGKw==
X-Gm-Message-State: ANoB5pkC/HwVy4SaDVByKNYC7E6ehfIpRjXyO0xVfe+twCTOGI2GyZvw
	gUEWREFj65GaoI4QelUUyPKlyA==
X-Google-Smtp-Source: AA0mqf5o+9gHUMjEEDj/pXHtCIRl6azEHGnycsoCuMVvtmms5LuepojUbajIAsqtQjgDvREJRaldBA==
X-Received: by 2002:ac2:4c49:0:b0:4a9:f2e3:3cfa with SMTP id o9-20020ac24c49000000b004a9f2e33cfamr7556087lfk.32.1670957438983;
        Tue, 13 Dec 2022 10:50:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c15-20020a056512238f00b004b49c3a4861sm472544lfv.77.2022.12.13.10.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 10:50:38 -0800 (PST)
Message-ID: <34a73266-7ef7-4d82-2496-86b616ef915d@linaro.org>
Date: Tue, 13 Dec 2022 19:50:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/4] FXLS8967AF and FXLS8974CF support
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213171536.1880089-1-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2022 18:15, Han Xu wrote:
> The patch set add two more NXP accelerometer entries for FXLS8967AF and
> FXLS8974CF in driver and update related compatible string for dt bindings.
> 
> Haibo Chen (1):
>   iio: accel: add fxls8974cf support
> 
> Han Xu (3):
>   iio: accel: add the new entry in driver for fxls8967af
>   dt-bindings: iio: accel: fxls8962af: add new compatible string
>   dt-bindings: iio: accel: fxls8974cf: add new compatible string

Where is the changelog?

Best regards,
Krzysztof

