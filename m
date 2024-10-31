Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E81CB53C
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 19:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404773; cv=none; b=hVnTnpre7qf4lOtVRJDSebtx679YddxdHRGsjxhv8eHIliqNBU9EtUBOX8yRjNO3U2SgPzKMT2xmCtnxZ8Dp33Ohoxjquc6LEUJTNjWwLNRN96sxiSuVtv9JYcBOJe0W4RuBA5vQqlEFgE6AomBbAag9ycRnZ7QQSvaFT/vtXHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404773; c=relaxed/simple;
	bh=5p4Mk678GuitXuuECGJ5e05Cm7ocEQTQPS952K3CUw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuGGSmcG+eFDTxOjiO6Rv/nDHjgZPH9nrQ4qmLKZDWqopTPx+PanLwyRgN7SoqFVQPIIOoDnMuz4jpC+xM0Tj9p64kNXCUaW3vrL9XT6zwTgkdyZcJbzadQo0XUBUczjQpw6YDYZ25OS3NdheSQiAdzvAhe/5Jax82pBTiBBwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLwa1bJo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLwa1bJo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb49510250so14314071fa.0
        for <imx@lists.linux.dev>; Thu, 31 Oct 2024 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730404769; x=1731009569; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2xSFooj3LTMdkPz8EDCzvFWM6rUJZfX8/xlhCllXOs=;
        b=RLwa1bJo47LIn0QnIrDJVWyw+X1hp5fVaBSSyJ2tkZZQ7Jb6/uDKrnacA2vSK0t2N6
         AogpW+v4T7HcyAJ9aeXSa9OJoQFX3Nyg4drGT1rFjLM0Spk7eYZ4adb6lL/n1Q0d5hT+
         RWd2axx2jKhjOr5c3m/pgd4pMRSSGfhr0irG6TKoxpkSFE/+s7MTtN6X5FXeGoUX/kkx
         O9OQ4vLXFbN6QIYkri+iLWACtLckaL43ZO6bJ6v+eh9chb5/Cjr5xNtR3P6naI6uJNjj
         9RnTaW26AsDVe2f463DmBjAysyatyAbECrXwjyCPJD/aHH5Ej4zM2cjTLyoDPzQEsgEG
         1olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404769; x=1731009569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2xSFooj3LTMdkPz8EDCzvFWM6rUJZfX8/xlhCllXOs=;
        b=gA/CLJst5o6KjRlvYWHlvsbNvIfby5b767qjKwLa0xFLpBuZCaeVGGderrEB9cauXu
         A6nL3V5FAEgw6w2Kl1y0n3QCUgYuOLGVcva68LZ7onh5EiW1VTnRhqC9JEYFS+/fKUi9
         IWwsIThX2G4kgEYs1m6zN4/qghWii9XUrnvlX9DBuwvWJ7D9/k35wpNZT3yvi2NT1XK4
         CUzlPQ/w57Fga7A3kS9Tt8xjvJjdV3yqjBsIMI4g1hcEisTUZw+2NH4quuMHlPpxT57l
         riRTFbKuEdD6e5k2V904d0z2zFz3cnurdHOI6WOOiM7ntzS5KBKfol9kIAKMvIT0AIvq
         zMGg==
X-Forwarded-Encrypted: i=1; AJvYcCW/UsmBjgvZv6egAulGrTjwDhztUOOEQDFjvipcdkWK1652Sf1VI5IceFpFG6La5voyHiM=@lists.linux.dev
X-Gm-Message-State: AOJu0YynQ2WO7T8FTT9dzFEpMI5EYVyWJbQ4vW0+hKVM7euiTIpopz7e
	MT3hzlIm94un8CpsWUfFQ6kfEjfIShfXn3bosqfhFYomYHcgdVpBd0r9ilcwSEo=
X-Google-Smtp-Source: AGHT+IHDY9mv/LMyrOcAiV/L1FzFmSewuJQRy7gy5xJKrH90HggjEEuq5c/C64nK+qTpVwhpZjhxzg==
X-Received: by 2002:a05:651c:556:b0:2f6:649e:bf5c with SMTP id 38308e7fff4ca-2fdec726444mr22632061fa.17.1730404768964;
        Thu, 31 Oct 2024 12:59:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef3b8ed5sm3238001fa.13.2024.10.31.12.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:59:27 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:59:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, 
	Robert Chiras <robert.chiras@nxp.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031194714.2398527-1-Frank.Li@nxp.com>

On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> property referencing video-interfaces.yaml. Allow 'data-lanes' values
> 1, 2, 3, and 4 for port@1.
> 
> Fix below CHECK_DTB warnings:
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
>  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 350fb8f400f02..5952e6448ed47 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -111,11 +111,27 @@ properties:
>          unevaluatedProperties: false
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description:
>            DSI output port node to the panel or the next bridge
>            in the chain
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.
> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4

Why are they indexed starting from 1?

> +
>      required:
>        - port@0
>        - port@1
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
