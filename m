Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40BC1C9DFC
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408142; cv=none; b=YPwRvUaEbSnfJ4WFCza/tORKg7vDt5Z1qmP12/3n4XwMnigzoh+B1wzsmwRh3bqB56+LHZcZbh6E47U/uTwahcb2z3JT0IK9t30kugNAmhFWTt5oWIYVF1GEm6SFTfIlyk4LwVhLMbNukpW7AzpIipjL5nTRVU2xCIinSLi+Ijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408142; c=relaxed/simple;
	bh=5QF1GfxDyoWq5h+USFwpYEnKgfZ8PnsYLlMZFcmmpNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUgF/onNvYMWTOvF6Hq7/eNttIX87GQdMNYxW4Gi3joKGycYcelLTau70fblD0ueZ+4gV6t0G/GUNBqtz8n3WQnwxky90ABRBd+BPU9FG1OGyxPh0fEPQX1y3L+4O7ww2vEyrtEvuAfdU8scSV4+supWrrCt2hFeOiAaCNsDq6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENxBXIVQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENxBXIVQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1700270e87.2
        for <imx@lists.linux.dev>; Thu, 31 Oct 2024 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730408133; x=1731012933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h164uvathdh9GwUZcWXqlrzCUWdwa05VF7nF2pa0Pnw=;
        b=ENxBXIVQMqv8VTLsqeoovJZLTtj/AvBtRMtFxv/zBMP/8qRvYTX3mg7YOgqMMVdK+I
         9CrFgT/u+MSJdkGAd56hUcxvYNDbjayi7RImseOAplszU5r6LFFpbW//Gtg64UEHs8IS
         omQWXFUWEH8YsGpfD3Bz739s+pJEPbfNl7BruM5SDRyTNg2j8IWZivf8U1Yhi52ldvWK
         /UoixbZbl6T3paM2BmjS78MhspV0gjf+SYQAzC32kUkjdnnw5zYnH0LS8Ev7ywsbVpfD
         kNr/cyqWtR4Jj5OvC6gBW90mkqvkqYrzK6DUzvzO3qqGxKNOay0iuLrhQJvaoeDO6HWV
         3mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730408133; x=1731012933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h164uvathdh9GwUZcWXqlrzCUWdwa05VF7nF2pa0Pnw=;
        b=JLaLJ1ZeCFT/vavaKf9imhJgAUq5alhcmwApg4gQk11ZXQLRkj4wLYGeeI100w1S5E
         mqps/OdYWl1GEEw/MwTUXTd1z/y/KeAbuidEJhPRh/pQsAwvDyYZ+sU9N/A19J3UHqcp
         kecQmOTb3oTwfuAqt7Sf2aQtv3p+vQn5eyO+mcMyBzr9cU6M5tHbocSJaq7zqYcruePh
         nGaCWRwhXb+eJM2jxe1UQkde5wcmqp2hAP0isnvtNaHyKp2S77HBmOXhkecc06f5T6Lz
         CXBTWb4dza0OPiyMZOO/njFIdnvt8nnsQEXk4jAi0zs0bFj/eM/whcOZhBU7/T5YJNU3
         4EdA==
X-Forwarded-Encrypted: i=1; AJvYcCWw3l/8G7oy7iELCL9Xtd+ppwVqTZLJQKGuZU8Xl4HngCHhG0KMyC88Wfc4BjgZqP4aCJY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMQ7qNaWyH6Uxk5/eYR8mt3I3sG5nh0I5qL5EP4ZcVk8n5HAEz
	GQt7GTTXxP/EF028m39sfMcDIhKA0w1zhf8WmmbMBTQrvMmwlqC97/MQaXNfCv4=
X-Google-Smtp-Source: AGHT+IGJ+tWCwIEDayGEBAeK10meBPh3PGgEPOw1Qyld1seRLcMErL1vcpY7qkKPYdHBp7JrKlK46Q==
X-Received: by 2002:a05:6512:32c7:b0:539:a353:279c with SMTP id 2adb3069b0e04-53b348d8f6cmr11419018e87.28.1730408133014;
        Thu, 31 Oct 2024 13:55:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbcf6sm320927e87.194.2024.10.31.13.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:55:31 -0700 (PDT)
Date: Thu, 31 Oct 2024 22:55:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <jfvvw7rnkxp4xbcmcikyxyfmisx3bmng6uqc7yqsvkzhc3hhgq@arfzqn6raxcg>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
 <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
 <ZyPmeippTU8SQLkH@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyPmeippTU8SQLkH@lizhi-Precision-Tower-5810>

On Thu, Oct 31, 2024 at 04:20:10PM -0400, Frank Li wrote:
> On Thu, Oct 31, 2024 at 09:59:26PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> > > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > > 1, 2, 3, and 4 for port@1.
> > >
> > > Fix below CHECK_DTB warnings:
> > > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
> > >  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > index 350fb8f400f02..5952e6448ed47 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > @@ -111,11 +111,27 @@ properties:
> > >          unevaluatedProperties: false
> > >
> > >        port@1:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > >          description:
> > >            DSI output port node to the panel or the next bridge
> > >            in the chain
> > >
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                description: array of physical DSI data lane indexes.
> > > +                minItems: 1
> > > +                items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> >
> > Why are they indexed starting from 1?
> 
> Not sure, git grep -r data-lanes Documentation/devicetree/bindings/
> Most start from 1. Not sure latest DT team's intention.

They usually start from 1, because just before the property comes
'clock-lanes = <0>'. Otherwise in most of the cases the lanes are
indexed from 0.

> 
> Frank
> 
> >
> > > +
> > >      required:
> > >        - port@0
> > >        - port@1
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
