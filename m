Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117CD505
	for <imx@lists.linux.dev>; Thu, 24 Aug 2023 09:27:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50091b91a83so3487497e87.3
        for <imx@lists.linux.dev>; Thu, 24 Aug 2023 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692869241; x=1693474041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6zPKzgSts8Q/FDkxiHJwwyN2uApuU5now1q6IOWDgHw=;
        b=wtAtorKCE6qSqEMpx/IVho0A+zLc2LjVI8bPp+aOUVWNRGnEYzmuiOwMf3I161jd8D
         /7qw59rojPVLbPwqz5Em3IhABcUPPiNZ8NyDCwKqE48O/x6t9zaNnR1xhIO9atTucrDh
         KB/XzB6uXxtniiNfCuRhPBfy/sVixshuc5MzE1IskLKiCypMd7XUuGg9VDSAqS13bkgg
         s9cY6iAV5zQdLy5QRjmr//eyUTxd9OnF+AENihBTxiM08a/uAkHRj/zUNa+iIeGF12wj
         4CJK5upo2GCu/qWJArWGZorDNgl3iLq1iHapMx8DdUW6FiMnTM6cZ7t3PT5rNz1Tk866
         EAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692869241; x=1693474041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zPKzgSts8Q/FDkxiHJwwyN2uApuU5now1q6IOWDgHw=;
        b=fbSJV9P12Keago+bydfCn1SYqji2OH4RBRBG+LV7k3r2HUqzn/XtTixWwP6nfqPsqo
         W4wXlZ5hCDPxlWCHhkao9SYPr0L57lhV8NKelD2WpRWpxo70zBcPNniT9x4eyQjElWy1
         40YpE4wKqO5TDCIBbkO2AaW0rz911hCUyrbyz9f2Jkmv4v0LFwLQx3YOFqYdf0I5e+S/
         J6QS7uQKGALOeFjguvPFPp9guaWAlo5UWbZ00f8vE/+5qy2/sVa/4R1oZS5AFcWcYp9D
         KRTNsQ3bJx2hPpUf9B07YACFURNDA3Bw28pfAwAjsx94C5UK21YzDSqPsLXHu7yeHrHh
         P+0A==
X-Gm-Message-State: AOJu0YxbF87Q4e98h/NjgO4GNuxGUANhcR9LIobX2GUKe2QJf+e8mblH
	P3BSPqMRDPUHiOTE1gu2GogJm0I4i4RoH3RGq1L3MQ==
X-Google-Smtp-Source: AGHT+IGyQSRppeHoZcGDkVVB4Dg2v0mdSsMwHodWyyPfVktwb2GR3M4IIKB/jlE5Y8cxDpxSY2H4r6LpW0WzSY7hy/4=
X-Received: by 2002:a05:6512:39c1:b0:4ff:8b28:7b22 with SMTP id
 k1-20020a05651239c100b004ff8b287b22mr10749853lfu.68.1692869240834; Thu, 24
 Aug 2023 02:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
In-Reply-To: <20230818153446.1076027-1-shenwei.wang@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Aug 2023 11:26:42 +0200
Message-ID: <CAPDyKFqsn6kVjPFUdVyRxNDiOaHO9hq=9c+6eAK4N-v-LVWUPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Aug 2023 at 17:35, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> Documenting the regulator power domain properties and usage examples.

As Rob and Krzysztof already pointed out, I agree that this binding
looks a bit questionable.

Rather than adding a new DT binding, why can't we just use the
existing way of describing a platform specific power-domain provider?
This still looks platform specific to me.

Kind regards
Uffe

>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/power/regulator-pd.yaml          | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/regulator-pd.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/regulator-pd.yaml b/Documentation/devicetree/bindings/power/regulator-pd.yaml
> new file mode 100644
> index 000000000000..181d2fa83f8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/regulator-pd.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/regulator-pd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Regulator Power Domain
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description: |
> +  This describes a power domain which manages a group of regulators.
> +
> +allOf:
> +  - $ref: power-domain.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: regulator-power-domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  regulator-number:
> +    minimum: 1
> +    maximum: 100
> +    description: The count of regulator to be managed by this power domain
> +
> +patternProperties:
> +  "regulator-[0-99]-supply$":
> +    description: The regulator supply phandle to be managed by this power domain
> +
> +required:
> +  - compatible
> +  - '#power-domain-cells'
> +  - regulator-number
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    reg1: regulator-1 {
> +       compatible = "regulator-fixed";
> +       regulator-name = "REG1";
> +       regulator-min-microvolt = <3000000>;
> +       regulator-max-microvolt = <3000000>;
> +       gpio = <&lsio_gpio4 19 GPIO_ACTIVE_HIGH>;
> +       enable-active-high;
> +    };
> +
> +    reg2: regulator-2 {
> +       compatible = "regulator-fixed";
> +       regulator-name = "REG2";
> +       regulator-min-microvolt = <3000000>;
> +       regulator-max-microvolt = <3000000>;
> +       gpio = <&lsio_gpio4 20 GPIO_ACTIVE_HIGH>;
> +       enable-active-high;
> +    };
> +
> +    power-controller {
> +        compatible = "regulator-power-domain";
> +        #power-domain-cells = <1>;
> +
> +        regulator-number = <2>;
> +        regulator-0-supply = <&reg1>;
> +        regulator-1-supply = <&reg2>;
> +    };
> --
> 2.34.1
>
