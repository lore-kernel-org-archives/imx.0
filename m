Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60707244688
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162411; cv=none; b=D5t/XyM9BYBqKzyrhPBO2KrmOsiGL3AnxhU1AfR4llSLi2Y1lsQNhenN9euL6qQoMPkgUkxKIgWTbfs/27Jq9IIu6GX0Zy8xbhDRSD8U7x/fDRtW4xsF2nbmjghA1xscj0Jx1N/UsKai4ULBineYpxK5uYnJ164OuHf526cN+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162411; c=relaxed/simple;
	bh=sk5MkTgT33G126yLu0cU6kvmDkC6SSCYrqJIAgQRCfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwTMoaVe5zoNIeRIjTrvtoRMhhNxAnnFgDxB0Ae2EX6fFzT66Z2E16k4130/NJtBcatEV4DuPLjtcEra55d1z3XdWTR3nGrjpqUH9kL2DTpBjoejTCMoGQpiTlz0r5GsHo1GfriPsgt6OP5iUcVrXJ+SYqIBtVym3PN4LaM+/h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tlHfMZYy; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tlHfMZYy"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ea65f5a0easo802950fac.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162407; x=1752767207; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxqC0ATm8XXXx24MpZdy05ScJSWmhlnLQqeCjqghw20=;
        b=tlHfMZYyQwKuIa1nS07q2579MiBInrHinMq0txDoC+V7LfxyaQvFB12SofarhgwXYp
         3cGUjLmeXWv2p5TiEmXLrZCYHKeytxG55H46mJxVhlbhe78MgW+e3g3XJwim8GqVpSkJ
         lnkQ74t5SCX4eUVctF18w8RiAWSbYzQryCmg29nqiGccV5pGLzFUGeb3fmOrAG8b/K3Y
         qq3W77uWwcMbWXwTSNVB0wl5SYHmr/rwHAc4pWICM8H8XTdYs7bvTFLrCbnuXhU1DGB/
         oyP52WQlvTgHNt0V/c+pQOzklNW7qP5bMFUc0dS2maosfh4WkdFObI0MXdQ3W7rijJXo
         6WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162407; x=1752767207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxqC0ATm8XXXx24MpZdy05ScJSWmhlnLQqeCjqghw20=;
        b=WCLA8g14vZ1oEp5PEp9/Z2z2ffoPGZ+Imhxqm5Wa7heuO8f7kwr7DtdXoHZoBJQ2Gd
         Su3n907d1WqPpZ/ENvDxf3VuMEiaB1SwSeZWnGTRfaCmPLShDP6tyd6hpHPxYkI+i5Yx
         QaNwqea+DFka6CeM3YE7Jlc69azLsocyAXTzqA1lhQEHG5U2cAjfFVgApAcoFlZ5gps/
         NGQbe/pRFhUhZ3alLUS9L9LCzNORnBnf37yAcD+pNT+GGmu5SIVaEP9sv/nuYmAXKEAv
         CafvTbd5JLDLqNaZfqfKEZ9B93UMBz8/a6B/9jHsTpwzeGtWshVrTvuOMxNBanJhD/+m
         ZGeA==
X-Forwarded-Encrypted: i=1; AJvYcCVHy84XjosF65nnjyjzBkilAaHMdpVOgeq8SDNaJxDi/cW1mUX1WBKjaSkWzrjx6jm80mA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyOX5fEAGsZHhrgWHsVSQ2krhACKOp7XHf+G2k1gtvJ4Et8yEv
	zK96+z8+mk7BrF9/rVWN2HE2ALJz+57TIVBcY3+RFqHoVDAHcHZEGdWLDSNU7evqVoU=
X-Gm-Gg: ASbGncuhP8+D6iCkAaP82dWb8y7ZFPLGZGc07L5OXhG0h30H13Xt861icXUYyAXVee0
	aHPEvysPjHQyrL4VDKE1HIYPnCD9cXRuriGxYCXc7uxPFQlbyqn7Z+5TYnwexI8pP5WONQSF8uM
	kh+CyGU8rdPrS4DF3jKOoyHut+hlDXfRjJFQ71QGAjqMBxida6Qw76dyg5/JLMhFKx7e1I4HCvi
	jbs+jNH88TjiFh0RqiPf7vu1DouuT+oR3EE4jDMzUGMfenHdxNkc68WdS5NAVuBukpZCQzJ5RRO
	R1vpUEySE5PBuCE8BqkJ4GcqnmrH+9+RXUaWMBhWljhwHaqqLZYmKEJTiyLXYnwHuvspBXbMeD7
	agN7DozKggs2MTfKFQGpHgS1AewQkYgTKBySoug8=
X-Google-Smtp-Source: AGHT+IGGnNYbfg3tRijwYJsTHxFrHe4ec9V4WbLcn63Mw2V3gA0rhenSRI8xr6ktDmmz0UyeTDfVCg==
X-Received: by 2002:a05:6870:7053:10b0:2eb:9fe5:d06c with SMTP id 586e51a60fabf-2ff0c5af786mr2100280fac.3.1752162407230;
        Thu, 10 Jul 2025 08:46:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:6f38:cf8f:abb1:34f7? ([2600:8803:e7e4:1d00:6f38:cf8f:abb1:34f7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116dd664sm343870fac.42.2025.07.10.08.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 08:46:46 -0700 (PDT)
Message-ID: <2bcd758b-c2d0-488a-8ead-ec7fb39f93e2@baylibre.com>
Date: Thu, 10 Jul 2025 10:46:44 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: imx93: Add calibration
 properties
To: Primoz Fiser <primoz.fiser@norik.com>, Haibo Chen <haibo.chen@nxp.com>,
 Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de,
 andrej.picej@norik.com
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
 <20250710073905.1105417-2-primoz.fiser@norik.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250710073905.1105417-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/25 2:39 AM, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Document i.MX93 ADC calibration properties and how to set them.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../bindings/iio/adc/nxp,imx93-adc.yaml       | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> index c2e5ff418920..d1c04cf85fe6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> @@ -52,6 +52,27 @@ properties:
>    "#io-channel-cells":
>      const: 1
>  
> +  nxp,calib-avg-en:
> +    default: 1
> +    description:
> +      Enable or disable calibration averaging function (AVGEN).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +
> +  nxp,calib-nr-samples:
> +    default: 512
> +    description:
> +      Selects number of samples (NRSMPL) to be used during calibration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 16, 32, 128, 512 ]
> +
> +  nxp,calib-t-sample:
> +    default: 22
> +    description:
> +      Selects sample time (TSAMP) of calibration conversions in ADC clock cycles
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 8, 16, 22, 32 ]
> +
>  required:
>    - compatible
>    - reg

This seem like things that should be set at runtime rather than
in the devicetree. Unless there is some justification on why
these values depend on how the chip is wired up?

