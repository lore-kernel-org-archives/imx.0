Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358214428
	for <imx@lists.linux.dev>; Tue,  9 Aug 2022 16:05:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id x9so9767236ljj.13
        for <imx@lists.linux.dev>; Tue, 09 Aug 2022 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QHTTec7dUx1qXt74vHAdnoKvJ0Y1zKM06sa4DmhXaHA=;
        b=EDDrvl3OAxEnD1Qgo1+kDKdAUSABexKsnTCYrgEOsdW+6i2vIdxTj3MUC+obJFw1wp
         oJJ+NlcE2AL7371IPf3cWVBp8EJnjRa2WksXyrfx3FDVQRfYxk68uAJXcepygOXu318o
         dKang7QeTvM9HJDSGov7nrI1qw5p/4KBK9FjhSKo3B9Bpvae+imaHxRMZ90eHzGUPJrA
         rQFFt291MLIZfB/Ssl+6sCtS80TEk1xr+cBn2wYoHQ01gr4syWNmxrgxa7k3pmplgawu
         uD/8kRw5K/626ucV8oQRkVwRMPpe6LHunidN/qydLrktq7pFa3RSAjPFd7QB/kY42PKG
         KGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QHTTec7dUx1qXt74vHAdnoKvJ0Y1zKM06sa4DmhXaHA=;
        b=QQvthLvo4YmA0GOflQ3/1xxrU/JYZOcxKGOde2c8OlO3EROzYb0hyZBgmn/t32Z/5B
         FjnSZIZ6bhPsxyW3H7O/20Cd3COCRGWcrHjfqStNr3yzxdndjX+3wcuBPGJ1XTIWY1oY
         rFdkw+G0Pmun/hFj2EOa8jRk83gDoBbbDSkU+4HJiCkvwhOd9ZDsa0GThh+sgyljJuS+
         h6kfvuzS0cX/YN42yjJoQMXbfD/e0d82gXAzuT2Z5N9IFRZpXk7K8nnl83T0jd9OmeaB
         rgTdmEqf/VNFcHSTOSLYYqYCpJbPjnP92DbGo+lWIsv57GnzLzrSZY/rA25RcvwlIw7j
         xz3g==
X-Gm-Message-State: ACgBeo2TPccqbMA5mbZmoedvpsmY0mmm4ftK+Jf1DyYxWAWDmnL/mJWU
	khuwwL78kbRnmGHfdvDCIXCLOlbCSN4n6+ik
X-Google-Smtp-Source: AA6agR5MIRBOqhcN3ewSqfA/Lm0LG7LeU/Vh3UY4uRjwwjzRwM13ZVe1fK5C5PbSVgsHwmxTKy0//g==
X-Received: by 2002:a05:651c:160a:b0:25a:62a4:9085 with SMTP id f10-20020a05651c160a00b0025a62a49085mr7734006ljq.214.1660061140257;
        Tue, 09 Aug 2022 09:05:40 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id i21-20020a056512225500b0048b18fb378fsm17292lfu.119.2022.08.09.09.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 09:05:39 -0700 (PDT)
Message-ID: <7a375a37-dd6d-45df-0087-eac04e4c5ba4@linaro.org>
Date: Tue, 9 Aug 2022 19:05:37 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] dt-bindings: firmware: imx: Add imx-scu gpio node
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20220809143105.17967-1-shenwei.wang@nxp.com>
 <20220809143105.17967-3-shenwei.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809143105.17967-3-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/08/2022 17:31, Shenwei Wang wrote:
> Add the description for imx-scu gpio subnode.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
