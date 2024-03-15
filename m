Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03C17BC1
	for <imx@lists.linux.dev>; Fri, 15 Mar 2024 20:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710535684; cv=none; b=suvQj7bBnF6TYZZm9PH51d3X9aq1oq+/oyFyRmI7Lcpww+KQZQFAs/obmYgp62CYA1IiTzvNM1KW+LoItlmXE9nmw/BfqK/uR8LJO54fo1Lo8OrpzT76Uwy5Zoe40ShsMm9oWwny3F8vwfYPbd8eT+oSF/0t0KKdWbAnDNLcT6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710535684; c=relaxed/simple;
	bh=bnLNQp/2A/3d+Zl+u+gjN7LL9ZxliA6JhxylMFlTEmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtbUcyiH8YMjKPV9WWCndDL4diVPye8o8d2yuxLyGwD7VkupGsW84mC8NB22rKVHDyHzN+j2M+E/Kv7gXURwsLO7wTfdK5Kc7eJkhrir7QmbkvPH6yPnz1S9eJxcLt0lSwxZOMIZ3o2zR7SmygWDMVhnZ7mS6MvBzQjC3bzi3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwdcDvFQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwdcDvFQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-414025406d7so5812185e9.2
        for <imx@lists.linux.dev>; Fri, 15 Mar 2024 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710535680; x=1711140480; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4NvgV/CSC+904+msOLgfpBWx/0mbV2VCj5TZRcU2mg=;
        b=hwdcDvFQ4BT5+O2RnbyT08UL7EexNxsW5uAWSbFIbhbHcEJu8rvCbRlC89WqzJZO3p
         3hVYkqBolF4it92XF5g3mnZKeCF0sm5XbRu9mG8+7WXBRDWllNehEIUVYO48NRjjrNNd
         5NX+/PfxeRyuJPDrDVDmCBghcd3ui5F5cFSWt2GTy+vCpeAmMosqpD6iYrbYLgJWaAQL
         5AGSqdfgg7JBrT6XEvbCsIzJpJixfqfOGo47qp9Ju0Yd53LV77HGj8jyb5/7u78gyYoX
         2DU4AGHkZILl0LIpabXdyklu9Y/tc6ghdZtijGp/yq1+8p2Mpy0hvbkCXBnyNV7IoqRd
         pbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710535680; x=1711140480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4NvgV/CSC+904+msOLgfpBWx/0mbV2VCj5TZRcU2mg=;
        b=dlqu7XpXErgzm0+YUsrZXuKO1STabS+uweZQScEv1ZE1shBXUYvvCSLX8J3p2x+ok6
         CJupRwAp6IS3Men4J10nGb7tpTwXDhDfiEqxT+pGaGCO292x9+AO6z/0Vrg3rYamhs8Q
         xP1/SplEB/S4sTOxCsvP0ZW2/DbFX60ZOEN/Nf07aBBruRW960lMX6/5k85HV2Oj/WdC
         fBrhN3BF9i83RTVvDgPqwZpGk2/eMqHaRXE3rpP5fFqdXfCd57eO7xDsGRY6mAE08+Ae
         TtAkVe8pQgYiUbPYBH3+Yj223IpNIa2xPiUyFYUmnyG1Gv2Ic4XuIChwY68UT25ggV5r
         cSpg==
X-Forwarded-Encrypted: i=1; AJvYcCUhn6HneyJKtOKa87anj3WRLYAyRjoJ6eUWXTEFibUfC7sR8SKD/TMbWABthXL5mNQWpip2k9lzEbnwPMMcVDcOGevk
X-Gm-Message-State: AOJu0YzkH0KUjmdqCMda9yofabwIssZmrzHyPCQJKlD1Xg500cWelbIy
	paIt/DKbA/ZY9OA1Q8bGLMJBHHovK3vgRf+VPF0tEfVSnYx/jS9vi3OX4jqO8G4=
X-Google-Smtp-Source: AGHT+IHaudt0n925u7j5cWjm5faGrXJkVr8MamYLArcOjHOC5R6h/rfCFuGnSsLpcuvgTvjKlrf/2Q==
X-Received: by 2002:a05:600c:3ca8:b0:414:273:67d4 with SMTP id bg40-20020a05600c3ca800b00414027367d4mr1809453wmb.30.1710535679868;
        Fri, 15 Mar 2024 13:47:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c350a00b00412ee8e2f2asm10091282wmq.9.2024.03.15.13.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 13:47:59 -0700 (PDT)
Message-ID: <99b72931-0007-4ab5-87fb-9b4c3021c1c2@linaro.org>
Date: Fri, 15 Mar 2024 21:47:57 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindindgs: clock: nxp: support i.MX95 VPU CSR
 module
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20240314-imx95-blk-ctl-v4-0-d23de23b6ff2@nxp.com>
 <20240314-imx95-blk-ctl-v4-1-d23de23b6ff2@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240314-imx95-blk-ctl-v4-1-d23de23b6ff2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2024 14:25, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX95 VPU_CSR contains control and status registers for VPU
> status, pending transaction status, and clock gating controls.
> 
> This patch is to add clock features for VPU CSR.

Fix the subject prefix. You mess with people's filters.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/clock/nxp,imx95-vpu-csr.yaml          | 50 ++++++++++++++++++++++
>  include/dt-bindings/clock/nxp,imx95-clock.h        | 14 ++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-vpu-csr.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-vpu-csr.yaml
> new file mode 100644
> index 000000000000..4a1c6dcfe3f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-vpu-csr.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nxp,imx95-vpu-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX95 VPUMIX Block Control
> +
> +maintainers:
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nxp,imx95-vpu-csr
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See
> +      include/dt-bindings/clock/nxp,imx95-clock.h
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@4c410000 {
> +      compatible = "nxp,imx95-vpu-csr", "syscon";
> +      reg = <0x4c410000 0x10000>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 114>;
> +      power-domains = <&scmi_devpd 21>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/nxp,imx95-clock.h b/include/dt-bindings/clock/nxp,imx95-clock.h
> new file mode 100644
> index 000000000000..9d8f0a6d12d0
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx95-clock.h

If the header is only for clock IDs for this binding, then keep the same
filename as binding filename.

Best regards,
Krzysztof

