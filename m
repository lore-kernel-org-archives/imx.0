Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3522579E
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033730; cv=none; b=TtP2mWCOJxjrwvhZZyJacGwsG8iFBPWtGOyaB8uJ7Jcyrd0mPKqD88O7+qRkJ0H8bWB5OEaer0s1Z/gfFww00v19uLatkjqDr3vYmpur1b+8RNEM5oy+QRjdx5ab9iyw3Si4mcUgCVx6kyTyc2fMyf78j5q1F4T0jOod/4WsSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033730; c=relaxed/simple;
	bh=hq8OhYoVjgMwCvfTsd84mhxUKz7zh9qPPjoUpGzRkNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D34yu5zXV92bXaXWGWLov/y2PFYMwiVi8AAWqJZJetmWoN/MChX05Fnrh5ECvrnlxjJbJS7aLTThM48vgn7jEPB/4pwtLwOT/tMnwx+54zAwWU7C/dNSFqyuaNOTbUlsAIsTFMZVSkpOx+HE/nkLS4iYQSO92ZfdMny0gCB3WRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=XwjgrNrV; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XwjgrNrV"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c523864caso6742447a12.1
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761033726; x=1761638526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=;
        b=XwjgrNrVnzeI3CE0D57ko492HwA/jrR5KXYSFXUBCa6GFvh9ov7ODhL94Y372fU1MF
         dg7F4Z7/6yr7I9X9pCzEZUQDGy29dDOppY0WX+Cx58G5gwkAUX0Yk/MWvznjbdQom14B
         ZwXjQwpMdS/dAYpqpw3ZoEUD/QsUTENlxCMV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033726; x=1761638526;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=;
        b=p3Xk+KmT0EhyEpm2P8+Znmr2+igK0Dchrn/OeU49xRe1R6hkz/nZK5SB70vbk5DeZe
         U+oZh/eiEHp358dtHbnfSudD1X8ON/T6BawQ70jzaGqvryKVGHS/r3QkxN8ouSPPxEP2
         GwvWJuSq2xucMVNIAiQXnbKQXqgv8XXDcvlo3LoEpe5RYSbVqyK3SWrBhJMu/YGWzkLd
         KL+uWUBofQmf08qsDJPJDkVY+VpgvMW4rDIU6JOfe/4CHxnIQbYCLuy2JleTgtTjUx3t
         +UT1iMJvagTW2mpoBhrjV9M9MlkrvNdrqVPGq+J1FJoY96g+60yc8xWHquouPbznhgc0
         DXSw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZdbizgbH1CCkdDvwbb+p5sjOYMpWts/8/W/ciAv3Hz7oNCyt9csNT30SIBiDv9kx1sY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBlRpxNdZ6M9I4JsICkPtQP9A56pM3ILSDzrmqc+y5KPuTKo44
	D3dUtZ7v/vbR7fsE120m2CCw5wCmKfLMYAck2FpSJxKZsRX8/S1av4GDCerKS45mkvM=
X-Gm-Gg: ASbGncvLHl6bx/Dg2M/X4oBDtH/CvKNIGIpeZuaLHjWt/SSHME2gqVeyBwRH5ypdWfg
	pkrzwdSvqIGdJdlxbesB8MnisDrgN0ZPzHtWH08JMVPbFUTyzUyMQPuMQAgj4BIRPOYd+tr4v4h
	QrjrNnlv+n7BCQWjLKRHkEJtWBuEC3atBbgPT5AkY2lWe0pVk8YVfQP6hyuCZj2X57B1oMbFaYB
	k0jRAQskmSZ4185X3yu0mZxo1ZPBZSPCz3mrsWrioFfZeIzX6Hse13knF4cnBjHPSU8MtcnntRx
	ZmmBkRgDIP+K4RKVVMbw9LGp5AjbiPOwzGzfhZTo6TObxmAWSVM8K2YDUH1zgX9L0y3ElDMv6+V
	DpaY7Hd8zb3LqvHgq8L0LUbMNBJGaxvcRrYQ+7xF+H6FGSr7zNb8izFNv24FNM7H0jEuOuaFH4V
	FVW1WzOtm5praEB+95SWMu0w==
X-Google-Smtp-Source: AGHT+IEQBbHU46zJp3I8qzuqYSyvo8c+5/g/4Db1HXzfzGIE1r78chLA2+YlpgeKvqwNE6fWnrQZTA==
X-Received: by 2002:a05:6402:1471:b0:62e:e722:a3c7 with SMTP id 4fb4d7f45d1cf-63c1f6345ccmr16006744a12.9.1761033725994;
        Tue, 21 Oct 2025 01:02:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c494301aasm8934112a12.24.2025.10.21.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:02:05 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:02:03 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-2-shengjiu.wang@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 

On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> Controller compose the HDMI audio pipeline.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

dt patches need an ack from dt maintainers before you push them, please
make sure you follow that for the next changes.
-Sima

> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..6211ab8bbb0e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,6 +49,10 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port
> +
>      required:
>        - port@0
>        - port@1
> @@ -98,5 +102,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..4f99682a308d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> +  Audio Subsystem to the HDMI TX Controller.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    audio-bridge@32fc4800 {
> +        compatible = "fsl,imx8mp-hdmi-pai";
> +        reg = <0x32fc4800 0x800>;
> +        interrupt-parent = <&irqsteer_hdmi>;
> +        interrupts = <14>;
> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> +        clock-names = "apb";
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +
> +        port {
> +            pai_to_hdmi_tx: endpoint {
> +                remote-endpoint = <&hdmi_tx_from_pai>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
