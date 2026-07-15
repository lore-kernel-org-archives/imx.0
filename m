Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CB33C1F43
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100293; cv=none; b=DaVG4UYwUN9UBl6TWBF64TqKLgYz5KshgXJTzZ4iSwn2J2+kMbOVt5COiVnn/MO3QHN02R3I+F5YvPDIPmEBpj8vwfTxWY53uEN8MKAsIlN3Ec+3ooWlQscL6LF6VLSsk3kE2kfErcl2SwNtyh3Qd0SHdXMJcrllEzq7hpTofNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100293; c=relaxed/simple;
	bh=eyt/WlPL0LI2FAzHLg9AQ5Sm9BpWJ/iIcql29xhCpVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjAJy/odZQh+IWccZeTXFoXSfLJGLs4m8aa1DV6z98ss6TLBD0yPoa1Qqjo6G249XAZa40mW7wsm6z3TyqtAMi/iObS1GLUr6/OIDCFOnSFlzIPxiSR0asSa335FclfUFdIuk3wy5WQ8Z1KDA4Yh5WPIG5sW7b8PJYf06PmGHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZTbKmoFI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZTbKmoFI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BE23339;
	Wed, 15 Jul 2026 00:24:37 -0700 (PDT)
Received: from [10.57.2.177] (unknown [10.57.2.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 016FC3F915;
	Wed, 15 Jul 2026 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784100281; bh=eyt/WlPL0LI2FAzHLg9AQ5Sm9BpWJ/iIcql29xhCpVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTbKmoFIPkSrMVjEIwo95kUFeJa6ywv64O8aATJcVd/+EMA5QbcsfDYhZ2xU+tc5H
	 HIOHYer5BiUl6AsOJFLKNZEagseeVE9GKJwjgOPgT8tyigHKB50b4Ozkw/0/zfQC4m
	 cAX7nscCs6/Mw/Hyzjvq10OAxOC3LL/w9o6VYI+U=
Message-ID: <6ca90bbe-677f-4519-8c34-0600bb5e4696@arm.com>
Date: Wed, 15 Jul 2026 08:24:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: thermal: imx: Document calibration
 offset property
To: Haoning.CHENG@cn.bosch.com
Cc: linux-pm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Fabio Estevam <festevam@gmail.com>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
 <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-1-d54d8690e16e@cn.bosch.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-1-d54d8690e16e@cn.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/14/26 11:28, Haoning CHENG via B4 Relay wrote:
> From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> 
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
> 
> Document the optional fsl,temp-calibration-offset-millicelsius property,
> a signed offset in millicelsius that is added to the calculated sensor
> temperature. The property is optional and the existing behavior is kept
> when it is omitted.
> 
> Update the binding example to show its usage.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> ---
>   Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> index 949b154856c5..44365aac8115 100644
> --- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> @@ -59,6 +59,16 @@ properties:
>     clocks:
>       maxItems: 1
>   
> +  fsl,temp-calibration-offset-millicelsius:
> +    minimum: -20000
> +    maximum: 20000
> +    description:
> +      A signed calibration offset, in millicelsius, added to the calculated
> +      sensor temperature to compensate for board-level measurement
> +      differences. The range is limited to ±20 °C because a temperature
> +      sensor with such a high deviation would be unusable. When absent,
> +      no offset is applied.
> +
>     "#thermal-sensor-cells":
>       const: 0
>   
> @@ -109,6 +119,7 @@ examples:
>               nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
>               nvmem-cell-names = "calib", "temp_grade";
>               clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
> +            fsl,temp-calibration-offset-millicelsius = <(-6400)>;
>               #thermal-sensor-cells = <0>;
>           };
>       };
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
