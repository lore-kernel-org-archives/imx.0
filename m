Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6902D781E
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932413; cv=none; b=Stpg4u80P1qvptnZrxhYT2MFvAb4m8d6FxoLWNmMxP8wG8wzlLy4XB8fkMb3reeo8yk5mrW02h3f9zsbP0yPkEeN/9WbVVpStu/+LldCypTd4H16eXbKCCfZZWaHVuMle0tBt4hZHgrgra+lLDK8Tfmbe1VQ9nQlm8xK6ZX7nvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932413; c=relaxed/simple;
	bh=1T93+sMv5tPAVfplzHfP7R8MyhMUaOzEKPRnkR9FHMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb/6ww8cjKOaQwH2eItz2k72YvxdVSAnK1bvBD1kLuJRKV7ZU2wzYp3ra8MlQXw5c+gZorudrLvFbePl2cqq0oipfaCNV1etQry7FMkt9CZMCGfnoexj9t4mXGu5sgA9n3PCmkthlyGmGykb+3gsd9iUcmtmjVeE1npsFSdCbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=a9fdDKNg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="a9fdDKNg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so513661366b.0
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761932410; x=1762537210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
        b=a9fdDKNgcMLCjPwr1/tjVZhWfjy8lDtWdTijg+vlEHqcoTu9pxr3prmdD9laOnvNIv
         NxdQD6rf5KsxOOK0QYL85rX/luBBIKcaD82QkV9vnqymF1dCmDr/QV9tpxPX3GdKNt5c
         EybHSO9bIxF6evfV9oWatRpwz+uoU3S6xl6ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932410; x=1762537210;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
        b=QaepVw1HD4rOu5ROtOwUpkdxI1lNHrZJMkvFkknYufY83q4diC59BxPt8MuptbScbr
         3UHmrjTPNY/v62KikHW4jfiGuDt0y+eso6ytjm5aIlZRuq24sDH444TZFhAp7895hmcn
         jIzFk4vQlbZ8KRK7MFxRybK2ReQRxnSfYcv8V32ofsaB0WNaZm2ClZzOZy/aRwSM0X8m
         MthvQH8uoNZ8tQpUUui0H4dpo16ZA4NHeCItmikkPEqxBplrc0I8nSz7ermvwbdXUix2
         JdFim4f8hDq2akYXvu6CgkwVkyRA55ElQHAcy02AE6hQfmHu3uTlRmQO2NUZ33YbA1QU
         ZEIw==
X-Forwarded-Encrypted: i=1; AJvYcCUaoc8fT759AqGZA5dVwxVLi6X/fOqPbVLsmW6/iUDXsY4fb/lb9N3iS71z5bHWkVWP9nk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLhfBqn95T94rhxOWOGl9bySR8NdBprZ+YC+RoKZPgQbzevZaj
	Plsv1LecK31wHNztMHNkE+69GPDZ/eRnEGCWFAyNCwZpi78ufTD6i+qhF5y+FBRhd9c=
X-Gm-Gg: ASbGncuPelIT5zN6Wnt/BphmNnl4y1qaM4A2/88kasxYRANw3oDHAt+9TvdkK//Q9j9
	rRMJrw/oXSfgTteg3cUhcpK4vPyhr9KewdjNdK1vaeq4rj5tInDuer2Tm9WXH1pe+94iysJ5wSq
	2V2MymzG5olnVvclwhRIXkKc0YgXD0nnnBmcli8LqOU0IgIaxDlHj6pYX8BXt8f32Qzn0j9PoaV
	fcaEvltX0r4X3j32YezfPubnJ8aEddPhgDxoqSmSYVl6Ew8nLD6w80CpXROcKdXRXCFrNfLYeAI
	3aLL+7WXlte/XD2Qio9f8w36k7VXqqdOF4A71MD/E9Olw1xgoc3hpXrXlSaxkdsyYVb7/w/LGTH
	HSQCWsCg50oRp+aEqLH5UsBqMhL/kedSvpadX6OaJLPHWPlI7CdjYlcFr2OspsSPuEJpEFCiyaJ
	mNI2XsAf0dEc8ejpn41MEtCw==
X-Google-Smtp-Source: AGHT+IFbOBwf98bBMLnyAAZrOMm+hJ35dRhtFe2UhgAlTZPlhjoRrNX+iSO04sWdZ50B8Ps8qRcs4g==
X-Received: by 2002:a17:907:7e8d:b0:b6f:198e:c348 with SMTP id a640c23a62f3a-b7070630cfcmr467732066b.46.1761932409693;
        Fri, 31 Oct 2025 10:40:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c82ef6sm227660766b.52.2025.10.31.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:40:08 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:40:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <aQT0dlZ88jDVptLF@phenom.ffwll.local>
Mail-Followup-To: Liu Ying <victor.liu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
 <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
 <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 

On Tue, Oct 21, 2025 at 04:51:40PM +0800, Liu Ying wrote:
> Hi Sima,
> 
> On 10/21/2025, Simona Vetter wrote:
> > On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> >> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >>
> >> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> >> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> >> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> >>
> >> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> >> Controller compose the HDMI audio pipeline.
> >>
> >> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> >>
> >> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > dt patches need an ack from dt maintainers before you push them, please
> > make sure you follow that for the next changes.
> 
> Just want to make sure I may follow that correctly in the future.
> As Krzysztof is one of DT binding maintainers and this patch has
> Krzysztof's R-b tag, need more ack from DT maintainers?

Sorry for the late reply, caught a cold :-/

No, that's enough, I wasn't entirely awake when I processed the PR
containing these patches. I only noticed because of a a new check in dim
for maintainer actions like merging a PR, which misfired on these two
patches - the r-b should have been counted as an ack (even though strictly
it's better to record both).

Apologies for the noise.
-Sima

> 
> > -Sima
> > 
> >> ---
> >>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >>  2 files changed, 81 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> index 05442d437755..6211ab8bbb0e 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> @@ -49,6 +49,10 @@ properties:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: HDMI output port
> >>  
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Parallel audio input port
> >> +
> >>      required:
> >>        - port@0
> >>        - port@1
> >> @@ -98,5 +102,13 @@ examples:
> >>                      remote-endpoint = <&hdmi0_con>;
> >>                  };
> >>              };
> >> +
> >> +            port@2 {
> >> +                reg = <2>;
> >> +
> >> +                endpoint {
> >> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> >> +                };
> >> +            };
> >>          };
> >>      };
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> new file mode 100644
> >> index 000000000000..4f99682a308d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> @@ -0,0 +1,69 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> >> +
> >> +maintainers:
> >> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> >> +
> >> +description:
> >> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> >> +  Audio Subsystem to the HDMI TX Controller.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx8mp-hdmi-pai
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    const: apb
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description: Output to the HDMI TX controller.
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - power-domains
> >> +  - port
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8mp-clock.h>
> >> +    #include <dt-bindings/power/imx8mp-power.h>
> >> +
> >> +    audio-bridge@32fc4800 {
> >> +        compatible = "fsl,imx8mp-hdmi-pai";
> >> +        reg = <0x32fc4800 0x800>;
> >> +        interrupt-parent = <&irqsteer_hdmi>;
> >> +        interrupts = <14>;
> >> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> >> +        clock-names = "apb";
> >> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> >> +
> >> +        port {
> >> +            pai_to_hdmi_tx: endpoint {
> >> +                remote-endpoint = <&hdmi_tx_from_pai>;
> >> +            };
> >> +        };
> >> +    };
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
