Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D789222587
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359693; cv=none; b=O7qDlYHaw4kgawruMyEvvpDN0Pfo3dlNszf8J52hVG7/Vw/5zVIY/VFQ7RP9HNtlfvEC8+Ue+q60C6jig7FSaFSqs/rawRGgQJc2BKZOrI07rheNlPfTMF3L1McIn3Ta+tqRKoB6svvnyy99NLXQAclyDap77+UdYQ+hlowBWY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359693; c=relaxed/simple;
	bh=998bCQ5vVclaoJfJBg10iHBupkkwTUVT6piNf84yOAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C79GVb03geKrRgxUuZ7xLpygWKNuD48df7aD1r12/p+wdSWuYW5bIGb9dnQW3VyJWFBPKhGGtXeQDWTtpTeDlz0bFfyNq2lLzReHVVjP2Not2KgEd+WLEPzjY1WzKJeBVj8nt/xftnSVN5LYRfMbKhAWdVrr93ilU7jr14iETAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+V/DDZa; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+V/DDZa"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso7819632a12.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760359690; x=1760964490; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=;
        b=T+V/DDZasrXFCXz3kF3lydLi+JPhDNCBlJpxcaFyajs6ZeXf1eaxo3sV9/YpPkX/cG
         88E3GxlJ2RwH7sLodmKs3Cpr18mkyIJEMjCA9YUVYpCyW974xIL09KnFS4f2zD/Icv1g
         1IzPr+I+4vOfgPyDa6cIAcf1JAOII6502UItMzf0sBS2oYCNcPdd9sHgdsOsKZvyGSl0
         kzazoIgKjz3yFTrVNHj74yslbd8wpThIixTQpBnsxXbxpzbWAAtsacy+2jiML0GT23c+
         E/nwyx8tu3Dyzv5FLrlUPHSsClUU5jVbHsvXZlsMXtTr3Zm3x0ck2bYcBjkyYmmOeT0a
         RH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359690; x=1760964490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=;
        b=ryqnq7+NZNBsPMWmZ4qdhZxx/IfHiuBT7ai1txLUMPqoKjozeXfnLNVfwMtrKwXc+3
         xqx4/4zF/LA0cYjZsYc72z6YLHq82f3gIMxcwWcRU2WqOKq2CfFcuxsglEX8O8g8XtkP
         aVecvGG5rNsSggCGS/P7qJb+HcrjCekzO5ddxf9eHLECblC4aNkBUv5GvRB+JKgZl38P
         lY3fQwkh3egnYW3lHk83jSU1MrOBf+EFFUiR3Zd+NA9/h7u+/uSRPPDHpojM6kGAg1QM
         nOK/roHCr65ufnlWwOQKX+HrMcJNll36M05w5djUt0OnZnlzx+NktsW3FTQLVw06dBWD
         80wA==
X-Forwarded-Encrypted: i=1; AJvYcCWWugDwmFqs3FPihnkRknkYeu98Uh3KswUZfOKbwZeqXRznCmpyF89zMK54APAqq1ItcZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbXUt8yF8bBSJQurvNZc/S5WsdbNG5SJTaZcRxsYtw7xveaHCF
	LltVM6L5A/64o8DwKAPtpCMss7e8BfufK2goHNwUTDAAmZc/0DcW+Uy6
X-Gm-Gg: ASbGnctVnU1kyyUS9FQHPlbclu49veqwJW3ioynZWlNx7MfJSNRSiSmc+OF8rq2YXMI
	yMfLrMqdYh+Ysin8Ix9yknxSf66Fc8CkyNtn2tdyo2lMtUUMxgVvhhIU1lNLYR0jO1m2oDowssT
	eJsLtR31V+bSwhxzP41L9zwg9tcoC/PtDnCr5Iy69H0ZBVRAD8Q28day2GOSjJIjBF/+tRMUWp0
	1aPCGQIGO5+O1Pi1fjRmFub4WlbPlLUmuyVIi99QMvK7ZRcbEoShb77cOGpkjXkCONJE/2RJYgE
	bIlkXk5ALENoW75JJldCEXchZlRg4nhNY0RqnPjjPcCZI82Aa4BBlH/YX0vH9htxHrU9KQ8frsG
	PixJJi2u1HG24hhbdBL25LQfDO6IJOOxpdzf2eFjXw1GXJR1As3G6KgBasvYqvYiUFPSR7m7V0B
	+qvH9L
X-Google-Smtp-Source: AGHT+IGhsH9Jko1f8FqT4pidOms6fn00pFogStN/Ol9Z3CUMb20PsGcKDB/1u9de4k8QmAJ4VfkJ0A==
X-Received: by 2002:a17:906:4a85:b0:b55:c35e:e533 with SMTP id a640c23a62f3a-b55c35ee5d6mr1063241366b.12.1760359689360;
        Mon, 13 Oct 2025 05:48:09 -0700 (PDT)
Received: from [192.168.4.55] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm916644566b.5.2025.10.13.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 05:48:08 -0700 (PDT)
Message-ID: <1ad36baf-83af-4ab7-9f47-dd7f74d4749f@gmail.com>
Date: Mon, 13 Oct 2025 15:48:07 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: clock: document 8ULP's SIM LPAV
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
 <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/5/2025 10:03 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 04, 2025 at 11:54:03AM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for i.MX8ULP's SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 69 +++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>> new file mode 100644
>> index 000000000000..ef44f50921f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP i.MX8ULP LPAV System Integration Module (SIM)
>> +
>> +maintainers:
>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> +
>> +description:
>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>> +  line assertion/de-assertion.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,imx8ulp-sim-lpav
>> +      - const: syscon
> Why is this syscon?


because of the MUX child's progamming model (i.e. "mmio-mux") which needs a syscon parent.

will get rid of this by using "reg-mux" instead. There shouldn't be a need for syscon anyways.


>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lpav_bus
>> +      - const: hifi_core
>> +      - const: hifi_plat
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +    description: clock ID
> Drop description, redundant. Look how other bindings write this.


ACK. Very sorry for the easily avoidable mistakes.


>
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +    description: reset ID
> Ditto
>
>> +
>> +  mux-controller:
>> +    $ref: /schemas/mux/reg-mux.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
> reset cells and mux controller.


I'd say the mux-controller child can stay optional since the driver allows it?


As for "#reset-cells": unless CONFIG_RESET_CONTROLLER is enabled, the driver allows

this property to not be specified. The whole idea was to try and make the driver more

flexible in case, for whatever reason, people wouldn't want/need the reset controller bit.

In hindsight, I think this decision makes writing the binding a bit more awkward (since the

optionality of this property depends on the value of CONFIG_RESET_CONTROLLER) so maybe

we'd just be better off with having this property mandatory and modifying the driver to remove

the aforementioned flexibility?


>
>
>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8ulp-clock.h>
>> +
>> +    clock-controller@2da50000 {
>> +        compatible = "fsl,imx8ulp-sim-lpav", "syscon";
>> +        reg = <0x2da50000 0x10000>;
>> +        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
>> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
>> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
>> +        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
> Incomplete node - missing properties/child. Post complete binding and
> complete example.
>
> Best regards,
> Krzysztof
>
