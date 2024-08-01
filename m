Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CCE15885A
	for <imx@lists.linux.dev>; Thu,  1 Aug 2024 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722512979; cv=none; b=MOuMSR31H2DxC4GCiG8EqNfi7GYmdEljlRTJPimZZWZIcT2RkQvC+kXt9CG4iI1Gw432LBgXRpF8eKK4VKN9ct1+sg6phGl9txgIm20n6c9zxGs5sW0wD/ncRuMIG0xB/bmq+R4UuDZ0jLamGOhmLfcWKBstFTVYl8FvmE0kUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722512979; c=relaxed/simple;
	bh=voQL+RgQ/DCu+XY1zsYqJzegt9t4UFkI6SjdFRsKwG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLGMw6Ez/JBfnLElY/Hs9P8uEvO4yv9k71dxklhKZeQK9J/9xeqimOFQYQKJV3SAIiKx5nBjUwP1C5EispKQd2bjLhhxRf2s0Hm3Ie4/1+tYOLYeqGxrYTl/4phF8kW4kkjn5ADbMlP3JM995kN84W1qYZyo2IeP5xlDvmvCzKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3MBc9OW; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3MBc9OW"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so86353441fa.1
        for <imx@lists.linux.dev>; Thu, 01 Aug 2024 04:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722512976; x=1723117776; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h1PUnjPeUDvBy5a/qGAVD2LWs0NJbDzW/+TnH0NDKJE=;
        b=P3MBc9OWg7hCHj7bIAhVndW6t1y+hDtqTUEJ7BFgE5bfJwYufzx0cn/j5avAb6ZG/c
         XYwbQxeoadnJLK1dYJPIguxHowxM9XV+Q62inB1FU5nn4E5FaRJEjG8RHeSRJI+X0iyn
         BuizU6HzbAB40+ZERz7PO/x3G2oSvLMu+navxlxX2kpV/hraKiyUiTyGKaDY8Bq8heZ9
         ybjiaDraYhCvZzakySb/gB9a6lTYxo/Yib4soNyaV4Hkx0szZVNyk1vn6GIRfR7/hV1B
         g8po8Q7iNJqjcXLeH2UeRM62L+on3+GCUHi4s9gYhL26fgFXrkdiQMKG85jcunTUBm01
         LJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722512976; x=1723117776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1PUnjPeUDvBy5a/qGAVD2LWs0NJbDzW/+TnH0NDKJE=;
        b=AZzId/88Y7H8dFmOV5X5mjxkK6sqtyyjAEAdwwQsBoF4AZhEomRGA1EOSoJ32qMAWL
         zdKkbcuJokArY1rbE3AxiFLX5uxp+l9yN8M6gWafsme6DhZ0B14GIvvH5AmbNgD22ZLZ
         puj9A8/+IHYslTJnO3FKSpq/jzniRXeIDhpVq8vhfFU4yic/G4MYf4EidZ4jDWYWzX39
         2XZ/n5Z4/K6nMIhn17j7JFT3klZN1heDBjB3E+If1ARmZZ+p126SBFtolEIYnDCoadCU
         OSFjfQpR/9pSe+7NkNK3CqW0d09zoh3V9vJmIiUpm93ASb+DxZ7ckptbyP1YgGi7fPxH
         PdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxyPaszj3GDFMfc8Y5Xg/MfRy3iAX1X8bHs35faCLeCcsS3PvogWaPGrkz4Z4mpNozIx/P+BgALnkHTuZQbT1Qj5eJ
X-Gm-Message-State: AOJu0Yyqr5Z2z9tD/Bwn22tKZ1fy+ZSt/2CagW19Pm/6n/Aa5GB70QVO
	ZvGBdrINsDjgg1FPNYXh4e2VnHS8yYukDFf6PO8P6FH7lK1qkuPkCxrHuxV8mgI=
X-Google-Smtp-Source: AGHT+IFF1i0H7BZEZYcDcfJ2MYDCmYQ+0hwVe6QdDANHb1J/F4Ii5xva8aot+Gve+rt+MROR8D0bRg==
X-Received: by 2002:a2e:6e12:0:b0:2f0:1a8f:4cd2 with SMTP id 38308e7fff4ca-2f1532d3db9mr16940521fa.33.1722512976087;
        Thu, 01 Aug 2024 04:49:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d04e02dsm22968451fa.84.2024.08.01.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:49:35 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801064907.3818939-1-xu.yang_2@nxp.com>

On Thu, Aug 01, 2024 at 02:49:05PM GMT, Xu Yang wrote:
> Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> used for connecting, disconnecting and switching orientation of
> the SuperSpeed lines in USB Type-C applications.
> 
> PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - add Acked-by tag
>  - s/SBU/SuperSpeed in commit message
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index 8a5f837eff94..152849f744c1 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -20,6 +20,7 @@ properties:
>      items:
>        - enum:
>            - nxp,cbdtu02043
> +          - nxp,ptn36043

PTN36043 isn't an SBU mux, so it is incorrect to declare that it is
compatible with the "gpio-sbu-mux".

>            - onnn,fsusb43l10x
>            - pericom,pi3usb102
>            - ti,tmuxhs4212
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
