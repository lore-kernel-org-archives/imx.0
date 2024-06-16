Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53326BB26
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718573401; cv=none; b=YinbCh8d2ER2Y1y1LjTg+C2m5Sq1chx4KNyAp30VZfi9Si4d3pKeC5pKoXDk3UDiiz7ldMPg7MSxpXoPaijnUR807NfVCv/LUpcur6NuuWYoozMhsEHN4lCg8a8dwd7iPLOq+iGjVHS6ZpLdAWHG5IqUZ4QShNu53dq3BrCQHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718573401; c=relaxed/simple;
	bh=77qTZ2/jNB1s3kvHZeR23oY3xoIE8oX+Pbgo1oPSZVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rxq6rjjdtilMK0D/Khcpri/pKIf/QAo4+GecYzTvJYmadcBHgZlit5OVvsCWMsSdkoP37B14/nmLE8hC/QiNPowcW2Cj5OgB1fVS86+jhSYiMBH79ZuoYeZtSmivuaQB7MTP8l/WuMVd2UXMwQ3hzQ9IrGCSGvggLaC/kMStFM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2Hj3Ftr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2Hj3Ftr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6269885572so838290766b.1
        for <imx@lists.linux.dev>; Sun, 16 Jun 2024 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718573396; x=1719178196; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmVQxJoiRRnVxUmJPLxuy9ofoBMY/z2Ox1ZWQdCQeiQ=;
        b=C2Hj3FtrCc0qSHpcYcIkfTffVd0q9++bplUjPbjljnn4XSvvb8HQ4U4h/KHSJtFzcP
         2XR/29ZryFZdzqENr5HW5E2spYm5AR6CH1xx07k/w4HbKLtQmIx5pXhsbyyjA0Y0puH/
         6d1sA9A8H6FOtiWOLwMsuYzpsuP3J7Q7M/adbR4A+/8k9burpqjuw2nItwMllXdOM4ur
         W4CTnXGqEQ0v3SSzghH2aUv+icXcuOzf5hdT54CyoZglIKPzs3HWQV9Ab06dBTnIRmXy
         1MbbuJHTfs5PiTya2kwHOpPlJmloC4VPX/H6X+EBLK3YiFEpd4GVqHBksn5wTkoX33wj
         gQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718573396; x=1719178196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmVQxJoiRRnVxUmJPLxuy9ofoBMY/z2Ox1ZWQdCQeiQ=;
        b=uHN77zvz2yQloG7XM1SfWcpX3pDaRjDLEV82+nblh+kl4TQ0MmhwutK2cSBYS0Anuu
         9FpG8lSZ90tK6Spc6tLHQjXL6HhgxRUZ80mR8GSGsOxkMhiNOHBrLfcDzZ9xaA12jsug
         U/a/fSenIWcBboRZjqr2zBJ9fR27lXfgN2WMWzrzzmAZVoXeRKMP0TjaFijEuzq3/anH
         Eudyqvq+eUe2oZdpWcsQz0F5FwrAxAHI9xcfj3eoyVVg9fD0vY3GcH73sMfsyvmT5gYz
         vGKlxKy/AAB+XAPXML3YLVCtOJb3fLsB2oFRzfjiGBvUahWFmprV4akxA2SfXi3Gti7e
         Bo/g==
X-Forwarded-Encrypted: i=1; AJvYcCW/q5KjgE5Fa8Mc7T5LXSLPaGAVnv6GbbPc2n84KPY9x2rMDP0+tRbPzS1JDt4sSMZwy5CW3QlV10kb7W8ZhVZAIODI
X-Gm-Message-State: AOJu0YwamzkUxMRDIz9yXtFyaESqry3IPVDwtTWgFIkpLjLdnbNLToAz
	UpAbax6eBUCZguUkecPkCGBLJwqlCCYLHviQl2ViqsqSc+WaFg/mi1soR+81cPs=
X-Google-Smtp-Source: AGHT+IEvUS/odyJPhKK7Glqf82cIjEvLFIs9anp+ZsBOp8SFgZaTIpP8nTwgP28wMtCwtrwni3h6Dg==
X-Received: by 2002:a17:907:c302:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a6f63371be1mr650604966b.27.1718573396000;
        Sun, 16 Jun 2024 14:29:56 -0700 (PDT)
Received: from linaro.org ([188.24.162.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5f1c8d6fsm384984166b.0.2024.06.16.14.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:29:55 -0700 (PDT)
Date: Mon, 17 Jun 2024 00:29:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <Zm9ZUWpievH+P8Yc@linaro.org>
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>

On 24-06-14 11:59:27, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
> 
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.
> 
> Add IMX platform maintainers for bindings which would become orphaned.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> index bae4fcb3aacc..74cfdcf1c93b 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Freescale i.MX6 Quad Clock Controller
>  
>  maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Fabio Estevam <festevam@gmail.com>
>  

For the clocks, please add me as well. Don't mind having more help from
the others :-) . But i.MX clock bindings usually go through my tree.

Thanks.
