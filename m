Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479932584
	for <imx@lists.linux.dev>; Wed, 22 Mar 2023 21:32:10 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id h8so78588537ede.8
        for <imx@lists.linux.dev>; Wed, 22 Mar 2023 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679520728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qen8xenv6ibJ1yxc7O8FeAPEdE/IGhe2CAZbDoaA2Yw=;
        b=pJWBm365G0ucmCXDtomGbsOzkhD6dfIOt8XNOXsVEOdz6Y4VWo8u3NawA5Ah0fdyeF
         uRSpcpgnKyCLYIqOFebVa33d9Z724INYAjCtzmi8yqxAz7OSoA8cOiMq4KiUfbqexCKh
         ABYnl38ogwmYHj51zXqjZJ7g6vD2zSb6qvWlc561k4J7rL7GZL5I4BfggBUfdCe2wDOu
         shFaAgKrRrS6JYWa8FX808m4HbU2XnqXFfR8gxzQFtlQcx8sUocybMvbGy34iaLBKLnr
         ULHXD1WXnEXjArdF1JRP3d3yauWupC/LBzr6ySskDfIMguEsAk3IN+dEW/CrejyZBeU4
         5Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679520728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qen8xenv6ibJ1yxc7O8FeAPEdE/IGhe2CAZbDoaA2Yw=;
        b=deK7ibxEGR42MBmGqF7lsPtyspqPOgzyddoiYtSvuVoa5QCKUfO0LW/MRbek7TggMa
         xeSMCAUFU0xQwDypOQ/KVU1m6xfTsxKA0MAvXGbzwcf9mlv2qM3Mf3zN4WYt0Bls4z5T
         jYLrjJooJjc93vSCQj/lH6GyJ4OQ2+EVeBhxJTs+N/EuyIKne8BF1CXlTM9rouTG9Hwl
         LDS/uTfzCPITB9uYufvKwbglo+C/+5ihPN/O20ICAfYVintfpENKnPf4EBIMES6JHSJY
         lkc+E+cajnYse6V9AwnDn4s1BQ1gGEUTLOQtjYf2dw65jrjIkBXAvUU6VfUw/rmzsgiX
         B3RQ==
X-Gm-Message-State: AO0yUKXIwAO1XTagJ2rvfLkZR1H9pTmzUnmw/kCTPVhVs1XKbXenHTI6
	9eTuQhXEPw8AFLKRKdH7o8pJvg==
X-Google-Smtp-Source: AK7set9EsUaVSM/lV0gHtIylqldE7j/M2EfDBQIekAYutAtxNexPVmBPKPopYckUm1FAXEtVd9mcmQ==
X-Received: by 2002:a17:907:a042:b0:92f:2c64:9d43 with SMTP id gz2-20020a170907a04200b0092f2c649d43mr8641755ejc.68.1679520728264;
        Wed, 22 Mar 2023 14:32:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22? ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id a20-20020a17090680d400b008def483cf79sm7640395ejx.168.2023.03.22.14.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:32:07 -0700 (PDT)
Message-ID: <b5d67af0-ed08-e243-2c0c-92f1f002e552@linaro.org>
Date: Wed, 22 Mar 2023 22:32:06 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: usb: cdns-imx8qm: add
 imx8qm cdns3 glue bindings
To: Frank Li <frank.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
References: <20230321151951.2784286-1-Frank.Li@nxp.com>
 <20230321151951.2784286-2-Frank.Li@nxp.com>
 <1ce3bf91-6bef-b4c1-1ec9-3a345518efeb@linaro.org>
 <AM6PR04MB483828FC1083E3C98930DF6488869@AM6PR04MB4838.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM6PR04MB483828FC1083E3C98930DF6488869@AM6PR04MB4838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2023 15:34, Frank Li wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, March 22, 2023 2:32 AM
>> To: Frank Li <frank.li@nxp.
>>> +      - const: usb3_aclk
>>> +      - const: usb3_ipg_clk
>>> +      - const: usb3_core_pclk
>>> +
>>> +  assigned-clocks:
>>> +    items:
>>> +      - description: Phandle and clock specifoer of
>> IMX_SC_PM_CLK_MST_BUS.
>>
>> Drop useless pieces so "Phandle and clock specifoer of " and name the
>> hardware, not the syntax.
>>
>>> +
>>> +  assigned-clock-rates:
>>> +    items:
>>> +      - description: Should be in Range 100 - 600 Mhz.
>>
>> That's better but I still do not understand why do you need it in the
>> bindings. You never actually answered this question.
> 
> I am not sure 100% sure the reason. 
> I think difference system target's  axi bus frequency is difference,   
> And just one time work, needn't software to manage it.
> Following other driver's code style may be another reason. 

That's the reason of heaving it in DTS. But I am asking about bindings.
You do understand you define here interface?

Best regards,
Krzysztof

