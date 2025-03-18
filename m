Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B6F20E711
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311362; cv=none; b=M9jcUg3HM0IovhsmiGZ8pnLlIaEPhlD5mf6WqgrZQRkiR2pEwE7jL416OBFRMBLF51IW0EB0g/61FiQl7QbQZLAeF/dmU2Vi6Y12XJK72o5bGw3mNKmkWFvCsircrHa6G67eDZ97aMPJPr05hVExaYppV5rEQ2LTFs9gQs5xSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311362; c=relaxed/simple;
	bh=davtiVsXx98fsThB+WUnDWoANTiH8sILlfY6buOJYAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXJ9+8l1D2tdH/sSgJTXBGqAJL829AHN9cn4aTAbfU/IHK6O1eODRa/Kx5KQw2uh0ogoOvbnrk0+nO/Zohoaw9mQSBAKAY/RJ93XDSyQSMtC5HZxNGtVVNbVZzNNTMJuw+eSgf9jHdjA8wItIAh0MwsNO4IgvvhRJSvJsOvcAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpS2mfWd; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpS2mfWd"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso4148766a91.3
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311356; x=1742916156; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b1O+uLM1JS3SDRUPJkFsjl9GIuvpMT2cD+4v/3zBEAA=;
        b=XpS2mfWdCrgU9aqfo7ItCWMoE/hNqpZpIQQ4W1t23x+qlH2/vsadDtwCTsm2NLeV01
         q2lSQaD4UoURSH5+SBmUb5CYZs3yl0nsSRWEUSjbbWmT/G/ai1OFB1RWCwBOHGzgYYJt
         y9Dh+ovSB/IGiwtiDLBvU4agpAHVpsi4cpjI4i+X5Npljb60twPqr1FsFyhX79nZHtcI
         JN12p9AwoW7g8IPBkNvHBsfh9KZ+VgFY5RiONXlQvtIPbxxxwfc31Dym1IdtbLnwayJ0
         aLqWqRR5u0XQE4bCFIzlzWD91uqrPORRjHNI8T4FQcZqG8gHerZvrIPW/LBX3t9p5rRv
         iKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311356; x=1742916156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1O+uLM1JS3SDRUPJkFsjl9GIuvpMT2cD+4v/3zBEAA=;
        b=TEsXEg88UV7FiAzIAQIJgHaRpl2glWt7CE7Z2CwwsyBz4qVg7u+gSYaIv/ldl4Y7hE
         I22bY6nIfBFjFjQcS48s2+aKEmFotD88KxIQnl7pLPRrjBs09g7AJiid6XhoGVjGL/LC
         YBpesjxd81jw9Nj61tnrYP91pXjUaHXprKoKbgREvPJPEWRoE4dn23Tv+hzKx5IvCntl
         E0qqbR5E0cfRhlIyyCCZd/ITuwpwY9nFKu0nXV5AYLcKk2WalOx0dF2YOUzqMXNLtgye
         3yHcTnOnLOiRbkx+VBTvtDFbEFleSqPIwk3fyqTCWLZ4hthZdVv035fQjuo9CqTOy9o0
         hPhg==
X-Forwarded-Encrypted: i=1; AJvYcCUwuM4HTv4uo95PWrmLWmGvBfJAzco9hrDCtwpXPJ4DYk2IMC9VwBKh0+Z44d6u/xfKdjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeaPdHUvd0jGBtSE2BCVi+5ePrFvdvaGeacnJ6zxXMQddjeKQP
	z7Zj6B8ywEJvHWjip2ZHK78ckLa2yfzuPr6fKwS9DfW5/HKMByzl
X-Gm-Gg: ASbGncvrekvUyX54qwqe0vgRRIa7Eh9agTrFh8HcUZWYzoS/SFvhHzsZc0Y/9eHTmRk
	EfAAX73NfAD+y3Y+/avFxlOLtUo5MHZvNTOTGHsGVA7UhgIKdY7v5HkMbF0Ls56VDuNwr5YbOxW
	CK0AlJ9KKG7dSEtBIrsf8F/PWwnByD4+whhrLYgxV2l1rn8JJXfbvWoZc9N99yH2a7U2NdG/rm2
	vMNygGxlWVTVUQ5UDjinj2TdcmVzdHlAIsmTZf96nygKnAMmkdycXFHSkdAgHuIbi8XwIxKHcvc
	3pmfex0WWc0Uyq/SfpIIq57t5JBzpA89yEq8TdYE3AFruvzVtVQnv3rmKkK2CPbZLBNWq3AZDlx
	muHQUoM7rUvRHaqBRZZacJnMe4Dz7
X-Google-Smtp-Source: AGHT+IHGHiOrC+gOvwxsNgQjXSm+TIRcVXspSDyBsDPgTboUtiOiWHemH4dUn+FSAC6hrpVwEjhvPw==
X-Received: by 2002:a17:90b:1d48:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-301a5489ee0mr5080905a91.0.1742311356544;
        Tue, 18 Mar 2025 08:22:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301a39efc5bsm1492988a91.0.2025.03.18.08.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:22:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
Date: Tue, 18 Mar 2025 08:22:34 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
To: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com, carlos.song@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250318085444.3459380-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 01:54, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce yaml schema for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>   .../bindings/hwmon/microchip,emc2305.yaml     | 113 ++++++++++++++++++
>   1 file changed, 113 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..e61ef97e63af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2305 SMBus compliant PWM fan controller
> +
> +maintainers:
> +  - Michael Shych <michaelsh@nvidia.com>
> +
> +description:
> +  Microchip EMC2301/2/3/5 pwm controller which supports
> +  up to five programmable fan control circuits.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - microchip,emc2305
> +      - items:
> +          - enum:
> +              - microchip,emc2303
> +              - microchip,emc2302
> +              - microchip,emc2301
> +          - const: microchip,emc2305
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#pwm-cells':
> +    const: 3
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - cell 0: The PWM frequency
> +      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
> +      - cell 2: The PWM output config:
> +           - 0 (Open-Drain)
> +           - 1 (Push-Pull)
> +
> +
> +patternProperties:
> +  '^fan@[0-4]$':
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          The fan number used to determine the associated PWM channel.
> +
> +    required:
> +      - reg
> +      - pwms

Is it necessary to make 'pwms' mandatory ? The current code works
just fine with defaults.

Thanks,
Guenter

