Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D9E15C2
	for <imx@lists.linux.dev>; Sun, 24 Dec 2023 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihKlN3Qa"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-554473c653aso2444815a12.0
        for <imx@lists.linux.dev>; Sun, 24 Dec 2023 01:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703408990; x=1704013790; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ahUPKt92hONYigUcgDHyggf6b+R+BYkSbn9Gja+1+U=;
        b=ihKlN3QavL/XUufv839FSlgtwdSjyzXdAqTiSOyb1NAuSvGcrn6UJz9KjMiPwsAbat
         mxSDhFYOrTrDbgUWnT8oYdEFuhFJRCpEviI7sNhOa9EhYPsgm8ep/D/TvOVRakfeYqX5
         iyPwxVPYLiBUV1uz5XgfDsmX2JDq258ds0KAI9mBa18I0Kr78Mllaiini6Fqp8bCX7Xn
         iPbg1Rf071MOJO+ktonO8tUbDYpe150WtNaiQ6BxYI3+gA3xaL4gt4ndjftfYhayZAeB
         3vaHl05xO24kG4NnZ87CbxASfzISbQCWwduoiqwUQOc+fhsSFtVrpU5XATffrLjmqlY9
         pUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703408990; x=1704013790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ahUPKt92hONYigUcgDHyggf6b+R+BYkSbn9Gja+1+U=;
        b=puoobiUsT2Zhd/fS86DpuFnaFTUbRIyVlxF09BLBkSqO60woKPxypYp7yOvVr86wCr
         c/9VIwlEAfIA+TGhg8R2J7MlR/Uwh53IVgTzlRAeidWllwsr2kpEPERixFM23ERJgqpK
         lnV1GyQYJgUPenn9AqUvqSSWNFo7x1uG6NQpRJmH1B9/ezgucNv3W4cLQYTEHl+UaEI9
         +kz1NvBJ+Exs/ElAdPNC8rE8UFLX3N3ZFxmF+9CzBlQ02qLw0DMBD2BGk42ER9wr6d+i
         Rp2Es0gKc3/Sk5YZBMTgmJF7Go50oWGdhRBm6Iu0UDMzGSpWbxlUKzKi7ooy0DmyWuZg
         IuWw==
X-Gm-Message-State: AOJu0YztIqzkSBbRgWeZ29cPHT9HUC0SdJPEFeTFMDkHOOanimjv6Tc0
	s04ee3sivsNpCgsyRlX3bCZVvKE3tePabQ==
X-Google-Smtp-Source: AGHT+IFet/WmYMfv0IiYS+M4ysfiZApvLfjMgkeLl/ZfzaAdQW1ngYenxiwU3fQGv7gG5P8CIgxt2g==
X-Received: by 2002:a17:906:217:b0:a23:309b:e0cb with SMTP id 23-20020a170906021700b00a23309be0cbmr1830456ejd.155.1703408990725;
        Sun, 24 Dec 2023 01:09:50 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id kx26-20020a170907775a00b00a1f65433d08sm3858248ejc.172.2023.12.24.01.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Dec 2023 01:09:50 -0800 (PST)
Message-ID: <5676cb8d-c1fb-4b01-b0e0-beb76f2b6ca5@linaro.org>
Date: Sun, 24 Dec 2023 10:09:48 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] dt-bindings: imx6q-pcie: Add iMX95 pcie endpoint
 compatible string
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
 helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, kw@linux.com,
 l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org
References: <20231220213615.1561528-1-Frank.Li@nxp.com>
 <20231220213615.1561528-16-Frank.Li@nxp.com>
 <8fb359da-2d35-4cea-8a62-199fde1d9a29@linaro.org>
 <ZYe30jb7dxRxQ3hr@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZYe30jb7dxRxQ3hr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/12/2023 05:47, Frank Li wrote:
> On Sat, Dec 23, 2023 at 07:44:30PM +0100, Krzysztof Kozlowski wrote:
>> On 20/12/2023 22:36, Frank Li wrote:
>>> Add i.MX95 PCIe "fsl,imx95-pcie-ep" compatible string.
>>> Add reg-name: "atu", "dbi2", "dma" and "serdes".
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>
>>> Notes:
>>>     Change from v1 to v3
>>>     - new patches at v3
>>>
>>>  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       | 52 ++++++++++++++++---
>>>  1 file changed, 44 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
>>> index ee155ed5f1811..be9ea77ce8548 100644
>>> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
>>> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
>>> @@ -22,14 +22,7 @@ properties:
>>>        - fsl,imx8mm-pcie-ep
>>>        - fsl,imx8mq-pcie-ep
>>>        - fsl,imx8mp-pcie-ep
>>> -
>>> -  reg:
>>> -    minItems: 2
>>> -
>>> -  reg-names:
>>> -    items:
>>> -      - const: dbi
>>> -      - const: addr_space
>>
>> No, why? Entries should be defined top-level. If you remove them here,
>> where are they defined (in which schema)?
> 
> See: pci/snps,dw-pcie.yaml

OK



Best regards,
Krzysztof

