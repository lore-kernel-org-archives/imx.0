Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB27F9C9
	for <imx@lists.linux.dev>; Tue,  9 May 2023 17:26:59 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50bcb4a81ceso11181921a12.2
        for <imx@lists.linux.dev>; Tue, 09 May 2023 10:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683653217; x=1686245217;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yxlpq7K/bU7lZnjiRmgqr2Ygu+qXnLZf5es9J2JbZxo=;
        b=DeqyNvkjgehdMSRPOcRr052TILwaNCPPa0NkJl2KSusfiApqkG7OJWmjttvN1TYfx4
         b6lVcaqGh07PbTq0igGHcshdrqOAiPO4vIg0E1SA0kYp3j59PyWsADpOXkRZkWNAP729
         +xvguaWkFxqC4IZXbmsfKF+D0acyJ7ZLRqaMa/nCKuEfwltEdVEaKv7CqUUsGPypHHLQ
         hNmde/S3BcUvF74Je1vymaDbQVRP67rqcxzvzRB0miWfyaurKNViWIwvw23DRSX3902t
         Yi0dGKz4jE2D1Bh2NJwUks+67NRvBv1wVX9G0Fa6BxAkqJDR9W7CmDUxglAJ+Xbt8JiT
         w2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653217; x=1686245217;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxlpq7K/bU7lZnjiRmgqr2Ygu+qXnLZf5es9J2JbZxo=;
        b=heeEpGEjcvyQHX/By/8dHPFPhJjvyfvEh9lqOWsQKLRfKQJqnaUPPJuwhLFD799ELw
         XKOuENnQaBNYsQRWDjxkZo/edvR4Dd9U2QE7SrWUR5O5mjtPAJasnxG8U3oOF9bizyup
         5Rm2/bVAewol4W1pWu+ye5KNNPb7w0p84ixslCjZBdfyLp9avnAy36Xi8BPbwaX5auP9
         tQpwtQH45T2k1DQOTxlySZlgL8MaJtXHxEdtPpW/ziKaeKSwkU5lZzzhegx7/qacfYAa
         UCv+/t4g0i31n1NfMjHhXVFBQpBWycJbCltXODjc+23TDkRhT7V9TwV2c1Vm8pxU/wRf
         VWKA==
X-Gm-Message-State: AC+VfDz1LVQD5RzgmI3XDcoPdKcXI/baDA+GWkGPP2HC2MGNfzkalUDT
	m59mBz5YBXJLi9uBu8Gyhsc+VEz0zEzoXOxdZAE=
X-Google-Smtp-Source: ACHHUZ4mYQim4Bq7wbUnWuh6MJfUB1Uy02jFLvYJtR/gmoWE17SyweBq4mewrZ6dVxEhXcsoCFWXfw==
X-Received: by 2002:a17:907:d86:b0:953:42c0:86e7 with SMTP id go6-20020a1709070d8600b0095342c086e7mr12933092ejc.4.1683653217263;
        Tue, 09 May 2023 10:26:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id hg14-20020a1709072cce00b009662de1937dsm1553651ejc.131.2023.05.09.10.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 10:26:56 -0700 (PDT)
Message-ID: <21a23f39-5637-00db-f778-a2e8e333d6b2@linaro.org>
Date: Tue, 9 May 2023 19:26:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] dt-bindings: phy: cdns,salvo: add property
 usb2-disconnect-threshold-microvolt
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, fushi.peng@nxp.com
References: <20230508131747.1933886-1-Frank.Li@nxp.com>
 <20230508131747.1933886-2-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508131747.1933886-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2023 15:17, Frank Li wrote:
> Add usb2-disconnect-threshold-microvolt property to address fake USB
> disconnection issue during enumeration or suspend state for difference
> platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to V2:
> - fixed subject
> - fixed dt-binding-check warning
> 
>  Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> index 3a07285b5470..be415b0a6d8b 100644
> --- a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> @@ -31,6 +31,12 @@ properties:
>    "#phy-cells":
>      const: 0
>  
> +  usb2-disconnect-threshold-microvolt:
> +    description: The microvolt threshold value utilized for detecting
> +      USB disconnection event.
> +    enum: [575, 610, 645]
> +    default: 575

Vendor prefix still missing.

Best regards,
Krzysztof

