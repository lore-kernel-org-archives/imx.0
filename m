Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C2A29
	for <imx@lists.linux.dev>; Sun, 19 Feb 2023 09:40:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id k5so2072458edo.3
        for <imx@lists.linux.dev>; Sun, 19 Feb 2023 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eiRUNfJEb5UebbP+bOsp25mzi4AWytHBppgtAtjhe2w=;
        b=PUGIP2XhQT6kZo6ICEXNDkJoudWnHqlXCqj+kG8jaHlhjQlLXpfsZBYA6q9CTKKvdT
         Y00o5xHWItasFXjsqh9wMLHePWQPQUEmu0Su2AwTLPO5ppgnMRkY1D3QAv2DEA7qT9f6
         eu6zXMAVA/7hYIqGtFtZIDWQ76XR5NOhTT0qYdhAahYmPuDa0VTERn6eb5mLmDVxzeBR
         y7Inmvyo946+AXQNP9FXIvVs/Rytv+8lwdXouSEsu0F4gEeN320XIIiohqB6Pj7Pk31s
         mu0j0Hjbd2vxmoYMxPGg5zYB9e3kdV2TDDt21nHAbkRV3bjl0THZtkn6uXs/FKlHWFsx
         3hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiRUNfJEb5UebbP+bOsp25mzi4AWytHBppgtAtjhe2w=;
        b=YxDzehOF3PH1MLq74YBGDmJqWl+4mBCa2xs1PtY1Abo9jEMKC06sExNZTCwZ5QjtDe
         40jAE3SRry2+jGq3nzb6AW7CqiPv4wGTKyZMs6uqlulL68Z8eDJCTB6SiyXRTMK+dcC/
         fG4zHREa5f0zp2W4m7OMDFeF2Xb6ZA2uh6L1gI3xLKsl17XGt3sweYM6oNXPvYq70DPj
         MEHRd/VUvKgIbNnci7cExu+tytz5+lWA5BHXchSU0QxmVrtLTAovqr+4rvkYvCB7YYU2
         U/UbKcEvNz8Zh3lq6Hbr/frszxh5V8ut8+Lt1nMNFpqzcj/57G28yCiqpCS6IWaGDG//
         RFRQ==
X-Gm-Message-State: AO0yUKUg9B6ad+YiGhIgY0ees05T0kWgvmQ7Mx4INMoCusrCnTex4Hp8
	5UyiY92iXOaiNur7rCopeAQ/Jw==
X-Google-Smtp-Source: AK7set+zfHOqkP6J7Y0PagVqwfRjFKQL6SmNPQCPKEOInkKp51K4Qf8OiL6hWIVSVatXKZi7DsCb6Q==
X-Received: by 2002:a17:906:d967:b0:887:5f45:d688 with SMTP id rp7-20020a170906d96700b008875f45d688mr4708961ejb.41.1676799644488;
        Sun, 19 Feb 2023 01:40:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kj8-20020a170907764800b008c0b8dd4cbdsm1527214ejc.112.2023.02.19.01.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Feb 2023 01:40:44 -0800 (PST)
Message-ID: <35ed22b0-6694-906d-823d-456871d8b9db@linaro.org>
Date: Sun, 19 Feb 2023 10:40:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/4] dt-bindings: arm: fsl: Add Variscite
 DT8MCustomBoard with DART MX8M-PLUS
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Marco Contenti <marco.c@variscite.com>, Nate Drude <nate.d@variscite.com>,
 FrancescoFerraro <francesco.f@variscite.com>,
 Harshesh Valera <harshesh.v@variscite.com>
References: <20230219031126.19372-1-laurent.pinchart@ideasonboard.com>
 <20230219031126.19372-2-laurent.pinchart@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230219031126.19372-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2023 04:11, Laurent Pinchart wrote:
> The DT8MCustomBoard is a carrier board from Variscite compatible with
> the family ox i.MX8M DART modules (i.MX8MM, i.MX8MN and i.MX8MP). Add an
> entry for the DT8MCustomBoard v2 mounted with a DART MX8M-PLUS module.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

