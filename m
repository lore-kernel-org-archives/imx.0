Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326E1371
	for <imx@lists.linux.dev>; Fri, 12 Aug 2022 13:33:50 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id u1so1378256lfq.4
        for <imx@lists.linux.dev>; Fri, 12 Aug 2022 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=z4AiGXr3REDL7GqtsJx8F6rnRjSDdT6RG1gWREQhBcU=;
        b=LNiDUfWcQ1zJEDigf9MHidZGHQZEF9w2jrTfHHie35FEIQd7SFr6eKZDbUV9Fd028I
         HoPige8CFELxe298FMaQQRHvmZIjIDTLdss/3Vk8Rk+D749uIJVDR5Tb5C+sich3ipPI
         J37PHl1IJYaNBCQsCJMpr3ilGc4JgWQMW84RKhUq/633snvu1oBjVpbXypMdOyfZOmPL
         I9F9+jK164lpYZjdJg5TrLawHtxvDZWWvSoYoCp9VMTZjwcJeJR/DB7fzSoHIFvBT8os
         vptZ+TkErC2Jx5lPe0+Fkg96I4aDLZYlKZwIj63Ib0Dv9PE7cUxHu/YrGjpVQShdl0OE
         ordg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=z4AiGXr3REDL7GqtsJx8F6rnRjSDdT6RG1gWREQhBcU=;
        b=lxBJcvY2jXSZ+nqL+z4ThjLEo1yILSA1Yr+bNbAX6+pZU0rsgzyApzP4hyTigwR0Yl
         bfeniVgExMw/B7OY2S7eKoE3/n4MXJ4AWH0Wkr3jVGbYyhZ31g18RPsUbEZGl7Ca5vDf
         kKiON/6/8zAQM99xs77MhMD1dE7eXGdvatGlPW2QVXwEIevf6EuFOCKJlKXYUKuhrfYi
         p/Li+S3XZ7mIyJCwK7VttaJyPIiOilie1w0WLH1aC7a94Pg0ontlkfi3U/ew0eDr4hzu
         fLpT0RJKGD2yXkVN4D4BnDrL94SdM6Jp6pDJ4im+WpgFHS+8JtjZuy3/dzjs6daPZPy9
         w2kw==
X-Gm-Message-State: ACgBeo3TQQImomifjb0biMqWh2MkHGaDN1vx2zcKTj81ohDN0o4go8SZ
	fZlkvdRJrEuoA54X+EtvuJiGTw==
X-Google-Smtp-Source: AA6agR6dcnjIyMjXY7sw25RY0+ACHWmwCBnp0P8UXC5ActW0pLzPbQcX4BL0V9dI83AkFguHOGga/Q==
X-Received: by 2002:a05:6512:ba4:b0:48a:f185:db17 with SMTP id b36-20020a0565120ba400b0048af185db17mr1191578lfv.107.1660311228578;
        Fri, 12 Aug 2022 06:33:48 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id bg25-20020a05651c0b9900b0025e4e2a5bbesm365108ljb.1.2022.08.12.06.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:33:47 -0700 (PDT)
Message-ID: <fc1fa817-d17b-2cb1-cd9d-b31f79753e70@linaro.org>
Date: Fri, 12 Aug 2022 16:33:43 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 1/3] dt-bindings: gpio: Add imx scu gpio driver
 bindings
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20220812133012.7283-1-shenwei.wang@nxp.com>
 <20220812133012.7283-2-shenwei.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812133012.7283-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2022 16:30, Shenwei Wang wrote:
> Add binding document for the imx scu gpio driver.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
