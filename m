Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53672102
	for <imx@lists.linux.dev>; Wed,  7 Dec 2022 16:25:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id p8so29468987lfu.11
        for <imx@lists.linux.dev>; Wed, 07 Dec 2022 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nql757lIkNKMgh29KlchftDEO+8iEm6DjXp2cFlQuyc=;
        b=KX8r+idV8gUeTMX17Xo5wbujH3AatPmG1Mhjdaku7WRxMemhWzx2DwJjl+ykqYaaHy
         8MAQz/eFYWXafLnHduBmPLHfg3FmCNGEKUK7UZgSFlU+DvehtH63g7080VJhoCr3RG+U
         o8a22z7au3zktSz9GG+hpeIui0IVm0SXVEhBvakjUwt0Vvl9p1aaDTegVu6r/T3OEQq2
         dlok0Z/OqqAPz0Kkp9cXbYc9zniEkE/Blri9EDjM2mkxAx6JkIdhTmG/0OOlg4n33g8J
         i1tasp1sXJBNaKkBIQlAHbsd1uCxa7XDwI5Y6IsKbpyGL0c+AFlBnUwi9PTQ7rpNg8uc
         V8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nql757lIkNKMgh29KlchftDEO+8iEm6DjXp2cFlQuyc=;
        b=zE9z0jPRcUM/7waE9NMhGVcABA8ttnNuBvekA+P7KSoXBolPMQaFLFnKm9iriA99z6
         qmxwPpQeizJs0QlUm9bTbnf5AhJMN4yoiPg2t3GlWKs6G5lmN/Lp9sv5gSy2etId/Ly0
         eEYnehjlgByP2mDWs6YDZgO7BIkn0qEBNPof1B42ufTWDzN94WjxcfEgL/lkb3Fg9VKg
         coAT4cAtxNsy8KQiE1j6F+5BonVPxmCAu21UzhS3T1I8Rg8hjsEDDMnPjGocucC8kjjZ
         qVPI+neIhGqEwIk/Zbp1+XlJ2QT3V48LCxPluc3x48hxOxwFToMIp1TMoaN/xC8Qqf1M
         kNsA==
X-Gm-Message-State: ANoB5pnTg+Et1k3G3fNe82xqus0ddcxsAp5pzYY6M4Oqn+yoFkrhNlVs
	nAGuYwvOMEf7lfsCY8GK3PofNw==
X-Google-Smtp-Source: AA0mqf7zSxUgQldDjSaRbMenVAc7EZI4EGwgLXUNQixxMvoLyqaKo2PvuNPV54yH7409kWDbEOvPmg==
X-Received: by 2002:ac2:4153:0:b0:4b0:f505:919b with SMTP id c19-20020ac24153000000b004b0f505919bmr29155780lfi.306.1670430298851;
        Wed, 07 Dec 2022 08:24:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j22-20020a056512399600b004b49025f96dsm2918652lfu.187.2022.12.07.08.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 08:24:58 -0800 (PST)
Message-ID: <af2e02d6-6700-6cd9-7ed2-efa23715e2bf@linaro.org>
Date: Wed, 7 Dec 2022 17:24:57 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] dt-bindings: iio: accel: fxls8962af: add new
 compatible string
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Haibo Chen <haibo.chen@nxp.com>,
 Sean Nyekjaer <sean@geanix.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20221207162045.669958-1-han.xu@nxp.com>
 <20221207162045.669958-2-han.xu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207162045.669958-2-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2022 17:20, Han Xu wrote:
> add new compatible string for the NXP FXLS8967AF accelerometer sensor.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

