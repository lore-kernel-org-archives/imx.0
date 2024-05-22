Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A81B210EC
	for <imx@lists.linux.dev>; Wed, 22 May 2024 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716403422; cv=none; b=anL0Saf23hFnrcdXtCKLg6Cesr2UzQq50Yn3Y1Wl4p2AAP82G0RLjJl9NXs5KNMUenQuvbdm9fF158TgQVbOQBQxrjv8WUh4QKfNN/d8mgAlrVbv8g0tt0jkRAg7tZK+88iu7S7ogfaY7el7IhJAEWK6GJPaAlfo8SQrGj8+gn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716403422; c=relaxed/simple;
	bh=D3Mc9dD9ZOhKmY7p/6kIkyWB2rwy+XPsptNUB2wu9gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLKFyk1whc/aTO0T8dpN4wQZEZwg3wSoJ/GRsgdH9T/IjaGdnM8pqNWZNF1YwsordUSl2Mv6SHQkTmti2uOgeQqpXagZU0bUO2MDgVEeb+Fum3gFQE3YRDe32FIYGrm0EMwv8Y1C8qWfQeIa3RIGlwuTsi3Ptz0CYcEJsmQiyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V63pIyvh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V63pIyvh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so10876949a12.0
        for <imx@lists.linux.dev>; Wed, 22 May 2024 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716403419; x=1717008219; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4X92RNyaocOQ9jeaX09e1iKmMV7MiGKGnZ+Dic7jjso=;
        b=V63pIyvhoX6ZJ8YlFGmTxBtNILvTUeGFnbT0eDJnmtYPVdXG3zyBSKVZ+m8aU8lXFT
         PJHRiNAfCPlUktmPvpC1nq2pqzWMF7NyO/7lT1+TDVxXmBufhxvbQJlBZY+JcxD9RMUz
         XkHe1wXJlAOvODlNdFmnKzT5bFXekJ3Cbr79Asp/KbvLU3ggieZRhG2/QF52H81hmOLp
         Oa5lNu7q3A/d0HVeK/zpiJCBjFGv5OXoG/qkM86V504AroDl2Y7otUXrHXDVoLx+1DXO
         LwMnx/wgOGEjKfu+Lgao9jmwkOXeueqWLq4M1On+lkWqEEkbVqArCDW7kpcmedkuXXY6
         eFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716403419; x=1717008219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X92RNyaocOQ9jeaX09e1iKmMV7MiGKGnZ+Dic7jjso=;
        b=KArvyUW6vqhD6UIGNe7x9JsJ4j42hB4wb3mbzmHa0GrjVWg6YOI3+RXA3xAseqd/Q9
         375xruakEAvQSqdOwqtjwpIiusJzTzD8EKMDUaam9QNr4/Y+HAyrMMlk8GZ5mpvBadNo
         eiZBDCN5rcO/jeuBdIoWe3iFAsJck7alPOn1ZXqegHm0JS1bwv3jmqGK5XxOenxLuyIo
         ykbhvrL89L4llYHP7dJwoBkDqegjRbaK1pVQaOvPhoN23DS6U1QUTC/o4uS7aqehBktL
         3lrnZrLn34T2OW95vfZo7qQkmPYk+3lhFpvYCq/YXJeQnlnT9zk01y7FS4pe3U1yCPtc
         3Inw==
X-Forwarded-Encrypted: i=1; AJvYcCWnLX1mmP2Lw4ccBx7vtyLOO2C58YCfRfp9zTtJJJRACvJ8N+JrR9Ap+UhbTYRAzb1OAVm2Pl6i9uWCCeNRREvdUOpR
X-Gm-Message-State: AOJu0YxTR76zT6VFlgOqujcBGbJ2L9P2YqHLUz1CCOlGYbYqIsA84M/c
	l5WBxSt4EBCeX9kfe1jU/GV5Ynzl9B98K2nDc0CFvQpRRkhmJOvU
X-Google-Smtp-Source: AGHT+IGN0pFDJpoxG2Grv/YFh/MhqqsO4GibeJdmlSjDyMjLmGY31Vxcn3drvjikcwZeQyVyTrLosA==
X-Received: by 2002:a50:ab0d:0:b0:572:664c:83f2 with SMTP id 4fb4d7f45d1cf-57832bee6c5mr2410990a12.27.1716403419377;
        Wed, 22 May 2024 11:43:39 -0700 (PDT)
Received: from ?IPV6:2a02:2f00:503:7c00:503d:ca7a:1fd6:cd63? ([2a02:2f00:503:7c00:503d:ca7a:1fd6:cd63])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57421480d99sm16875505a12.8.2024.05.22.11.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 11:43:38 -0700 (PDT)
Message-ID: <6b9b959e-9a03-420c-9f61-adaae05bc5eb@gmail.com>
Date: Wed, 22 May 2024 21:43:37 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: reset: add schema for imx8ulp SIM reset
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 laurentiu.mihalcea@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240516204031.171920-1-laurentiumihalcea111@gmail.com>
 <20240516204031.171920-2-laurentiumihalcea111@gmail.com>
 <20240517195943.GA2854624-robh@kernel.org>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20240517195943.GA2854624-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/17/2024 10:59 PM, Rob Herring wrote:
> On Thu, May 16, 2024 at 11:40:28PM +0300, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add schema for imx8ulp's SIM reset controller.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/reset/nxp,imx8ulp-sim-reset.yaml | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
>> new file mode 100644
>> index 000000000000..ec9a5c73e83c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/reset/nxp,imx8ulp-sim-reset.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP i.MX8ULP System Integration Module Reset Controller
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +description: |
>> +  Some instances of i.MX8ULP's SIM may offer control over the
>> +  reset of some components of a certain domain (e.g: AVD-SIM).
>> +  As far as the DT is concerned, this means that the reset
>> +  controller needs to be a child of the SIM node.
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,imx8ulp-avd-sim-reset
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - '#reset-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8ulp-clock.h>
>> +    syscon@2da50000 {
>> +      compatible = "nxp,imx8ulp-avd-sim", "syscon";
>> +      reg = <0x2da50000 0x38>;
>> +      clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
>> +
>> +      reset-controller {
>> +        compatible = "nxp,imx8ulp-avd-sim-reset";
>> +        #reset-cells = <1>;
>> +      };
>> +    };
> Why do you need a child node here? No DT resources or anything for this 
> 'sub-block'. Just put "#reset-cells" in the parent node.
You're right, we don't need the child here. In fact, the reset controller will never
get probed anyways since "simple-mfd" was removed from the compatible
list of the parent. Will remove it and turn the parent into a syscon + reset controller
in V2.
>
> (Note that examples for MFDs like this go in the MFD binding rather than 
> having incomplete examples here.)
>
> Rob
Noted, thank you!
