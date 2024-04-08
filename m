Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3B38F96
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562942; cv=none; b=AjjJoxrGTMpjOoV5bh4HI3ViSYgktt3vmfOXnsP7e+Br+vP6f0turL5Wc6G39q9VnlgXtwiB4jv3Z93TM6HBFitdwfnczLLDRhCiGXTdC8UTnfHlsxeg+Gy7oBW6HE9LOHh200AWLJUTYia3js1q1JiM/E3N3sokQ5ExPLCO6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562942; c=relaxed/simple;
	bh=bOYdvGgOXEu+B9DwkxPE7PclZR6s+7HiNzNdrJ6GbiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=osAVPWbc58hdG4oKYP4tW3Le60koRCDh7+ZG5BE98WyLeQBn495wiVf42nW+HgC0VRkPK5Kqftj5cm9Yuzf4ZRcgtIJ4qhdigdv66cgTqkjsTfYhS51775ZFbsfTvfkwQNmfGf/TAzqsVwAsLruwJqhM+np0BuX77Vn2JMIVtoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EArpcwO7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EArpcwO7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d82713f473so70816821fa.3
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712562938; x=1713167738; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGVKRsfzElZhuiOUBPoS8tlbXX9PErhVKCskk8TAVI8=;
        b=EArpcwO7BqZU7iUBWdgVmgDR61Mh60R658dvYaNo4w9hOsG4dF0nXnaWo2ahql1TIh
         j00IlKZjKoL5sA8nnS7CVKbXh5OxMICtWZH3xUlf0giRMvLO9qU2nAd2P5L7iJa06WL2
         HCz4z0Ow8HWw/ob5b4mZPYWQJ/Jb5ffPvxULqK8XCl4n7abFtzmv/nBevQ4MI2LzJSGA
         N6wa6InBBpL3918iJ3YBfzuJH27HtrndRvOU+JV8wXkhSsx18U8prYUlTlYZRVSBh4SJ
         LORXm9dV+lq8E/dpGveBPP4cbEIwAMgdsVePLiLqxgZ6REf/31edZribl7RZqaXDMqjf
         wLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562938; x=1713167738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGVKRsfzElZhuiOUBPoS8tlbXX9PErhVKCskk8TAVI8=;
        b=veawy1B0gvTFxfy9gqEp7VTQi0mwO0ypYGz6+4veOyGsVma9KVu0uXrcQu2kpgjS2a
         MkewWSfIWpwV7xedOeRntwfXIT4dLa/Hd8kuXAebAy6/VQ6U6SQBchmQTCrj1gGKzyfN
         mfuYp3Uyxtlj6/O7ME8uUJ/rBxwDZPhNxTz3kEr46dxR+s0XVB6LIyIAS/w0jVxQ3R1J
         XElJF9O/LsFWT7sy37cfDIwhSU1auDtPO9kXmOnRZ0YRBgTpRWxRz1rKtLkb/oA34oIk
         6+c4lEPRmYTL1zDaONcuPbs9GOi4SBE60BpCWA/usEqN/jDNuJ7queWZHkWu69tTWgab
         59lA==
X-Forwarded-Encrypted: i=1; AJvYcCVLtszl+7nD0CvJvDH9v8/V9h33d67hkh3PjXwLyqOWZOxtYSGRhsQPGZGYkzIFDgk6POtSFzHXae1rvCf/6SkilFQ6
X-Gm-Message-State: AOJu0YwJwv0Xb0WnS/vt+WN7mrYfH7EyvJfPVT0WvD2dAb3wVPzZkvNc
	Vg0+JykY+wmhAwMCB7MJNQOpw4mRQwYsNf7yU3MEdN1nW3S2GUuor0mdEbJJ6xE=
X-Google-Smtp-Source: AGHT+IG5fj7ZFdIyyAiLxezuDJ3duVyM4elViQE59ai+tbpBGEttaDRgy40oJg3eCLOBiZ24ZzBUmg==
X-Received: by 2002:ac2:489b:0:b0:516:a6b2:f9eb with SMTP id x27-20020ac2489b000000b00516a6b2f9ebmr5761546lfc.69.1712562938010;
        Mon, 08 Apr 2024 00:55:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id z16-20020a17090665d000b00a4e9cb0b620sm4109828ejn.158.2024.04.08.00.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 00:55:37 -0700 (PDT)
Message-ID: <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org>
Date: Mon, 8 Apr 2024 09:55:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audio-spdif: convert to YAML
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2024 09:27, Shengjiu Wang wrote:
> Convert the imx-audio-spdif binding to YAML.
> 
> When testing dtbs_check, found below compatible strings
> are not listed in document:
> 
> fsl,imx-sabreauto-spdif
> fsl,imx6sx-sdb-spdif
> 
> So add them in yaml file to pass the test.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - change file name to imx-spdif.yaml

How does your compatible look like? fsl,imx-audio-spdif, so use that.

> - remove |
> - add anyof for spdif-in and spdif-out requirement
> - change example name to sound
> 

> diff --git a/Documentation/devicetree/bindings/sound/imx-spdif.yaml b/Documentation/devicetree/bindings/sound/imx-spdif.yaml
> new file mode 100644
> index 000000000000..beb214b51a50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-spdif.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/imx-spdif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX audio complex with S/PDIF transceiver
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx-audio-spdif> +          - enum:
> +              - fsl,imx-sabreauto-spdif
> +              - fsl,imx6sx-sdb-spdif

This does not make much sense. You have mixed fallback with specific
compatible. I suggest you to fix your DTS and submit proper bindings.

> +      - enum:
> +          - fsl,imx-audio-spdif
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  spdif-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the i.MX S/PDIF controller
> +
> +  spdif-out:
> +    type: boolean
> +    description:
> +      If present, the transmitting function of S/PDIF will be enabled,
> +      indicating there's a physical S/PDIF out connector or jack on the
> +      board or it's connecting to some other IP block, such as an HDMI
> +      encoder or display-controller.
> +
> +  spdif-in:
> +    type: boolean
> +    description:
> +      If present, the receiving function of S/PDIF will be enabled,
> +      indicating there is a physical S/PDIF in connector/jack on the board.
> +
> +required:
> +  - compatible
> +  - model
> +  - spdif-controller
> +
> +anyOf:
> +  - required:
> +      - spdif-in
> +  - required:
> +      - spdif-out
> +  - required:
> +      - spdif-out
> +      - spdif-in

Do you need the last required block?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {

That's a random change...

Instead of sending two patches per day, please carefully address the
feedback.

> +        compatible = "fsl,imx-audio-spdif";
> +        model = "imx-spdif";
> +        spdif-controller = <&spdif>;
> +        spdif-out;
> +        spdif-in;
> +    };

Best regards,
Krzysztof

