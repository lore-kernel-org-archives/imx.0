Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1BE1A76DE
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904509; cv=none; b=ANf2R2/3BD3JX8c3FS8jMo/xa1RhinoebYVUjCed6AVQ8ZDhw7AL0r8hS7U1BpjshW7CFkM9SJadqGOVeP/LscL1kDhfLnFIVH9GpxZPLKVLuv7kkka3gL5mshBAnEM8iwu94Rh7GIo1VMN5NFKISDvfRNNBayOi1W9wCiH2UMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904509; c=relaxed/simple;
	bh=yjaFqX6lxK+qHaA1KHYOZjsEanL1X2H4ahTvqSXxfmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lln3ZHIssYR20WyXp5bolo7vy1ejQO2FEUbKMwEZu16d4qG27bm9jQCJPG2W4kMHFUN4kPq/x9D7jGFMGeDuL7+9CYgl0ojDpZvurjUJRA9Hl/42Qn7wXgULJLoZy/jZt6DTpcyEchKeY24RLT7rFGLrMyap6m1IN+/OVVNuJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOSPYgu1; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOSPYgu1"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so4857945e87.1
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728904506; x=1729509306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1bUQlHCbT2dTkZPSuiC9mud0kneaD+Pw3knr/ZeleM=;
        b=jOSPYgu1qtwcDEGwARdl2OlFWJJrs5WK4rkK11Ac+MNmYAj/d75HpQphBUv/Tmoy/k
         oi65Z7YnALnmlaNzk5NEj/Jjo9bjC4JGcjqTT0sMN8tOWfttZyixUWphQKzZwK3zJ4Ck
         fUlTeNt0A83DoN2ZpOEHhPhbUdfaGljRnpvlFfp6MWmjaYdz0uXd3Bmf2E1wglhwy1jf
         xIVwvjiKyt05dsyg/wMdIJOfVP+4Z6d6Ae0jdWeg6DMbNvBK/ci40UNMx6v9e7QpHoIK
         N2QLWrow629KiwMuU3tm3rekm26Qb+fXalK+GFx62e79YYIpM4fdaTzIzOqb7IwBKaf7
         uAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904506; x=1729509306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1bUQlHCbT2dTkZPSuiC9mud0kneaD+Pw3knr/ZeleM=;
        b=NHpM/rVx6wXy0UqdLyyelLqK6akSHtLh+jTAbQ1Y8nYwQD7j71NpjveD/3SkXHjX/5
         FWlw+WPsccdZ5TqwV2Rh/abNXvdZmXa+hcThO32GvX8juGGcT/Bj25Tzt18JwxudTJWu
         AwW87XpHxU3WBgFESejlMXQLFx+CuXmChJia7Rzixs9YHRQVc9eV052mjYvx8H4MJDB/
         LVc0bAigljSSbhPej7eFiZWMlinuUeO31Y7FAp5VCsfqA1DMDkuFBTSswsSFQvW9WMxW
         LGA1aEs8LoyOl0CMoQKQysNF5+l/YTqwWarRj8VTbL82ECIqLkucwB6b+nJtiXTyhm4K
         UOYg==
X-Forwarded-Encrypted: i=1; AJvYcCXOM7UVb1AebuS3ViWFriBIFMAm8q6OBQRidcY5+PIw7ftZUFsxC4Q0dqndwPl1HXk5TJY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXtKhKuS+W1LfajVdyaCszN1V1Q80yLv/Sf9CWuyMsvgHJ3jm8
	QsJTBn+G+7GaRMs8bEag+0kW11eJZLWa4hjXjhn0QJlFMu/9l9b3i9ftud5o6co=
X-Google-Smtp-Source: AGHT+IFTmmVVdQwxohG9fsiP3DZsmMJAgt7EhHpkkkjFLODtZTAIQNhHKAg+QqqF6e3kl1afirCUQA==
X-Received: by 2002:a05:6512:10d1:b0:532:c197:393e with SMTP id 2adb3069b0e04-539e54d7ba7mr2649208e87.11.1728904505982;
        Mon, 14 Oct 2024 04:15:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f0ea9sm1625945e87.186.2024.10.14.04.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:15:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:15:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Message-ID: <wplt4txytz4fj7o6qzxualuj45rzmim3yfn6vvefrhoga6lmfk@5llfokdecuan>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
 <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>

On Mon, Oct 14, 2024 at 06:01:49PM +0800, Liu Ying wrote:
> On 10/14/2024, Dmitry Baryshkov wrote:
> 
> [...]
> 
> >>>>> My suggestion would be to add a single root-level property which
> >>>>> specifies which port provides even pixel data.
> >>>>
> >>>> That won't work.  The LVDS source side expects the ports of
> >>>> the sink side specify dual-lvds-{odd,even}-pixels properties.
> >>>
> >>> I didn't notice that these properties are already defined.
> >>>
> >>> As these properties are common between several schema files, please
> >>> extract them to a common schema file (like lvds.yaml).
> >>
> >> I'm not sure how to do that. Is it obvious?
> >> Please shed some light. 
> >>
> >> Only two panel schema files are defining even/odd pixels now -
> >> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> >> Maybe, extract them later when more schema files(especially for
> >> bridges) try to define the same?  I'd like to keep a low profile
> >> for now.
> > 
> > I'd say, please extract those now. Adding third is more than enough and
> > should be avoided. Extracting is pretty simple. One patch to move the
> > definition and descriptions from panel-simple-lvds-dual-ports to a
> > common location (e.g. lvds-dual-ports.yaml). Leave the required
> > constrains in place. Second patch is to add oneOf constraints to the
> > ports. 
> 
> oneOf just sits below ports so that single-port and dual-port
> are documented separately?  That won't pass dt_binding_check
> as the v1 binding has proved that warnings will be generated.
> 
> > port@0 might get the same oneOf + the
> > dual-lvds-{odd,even}-pixels:false case, allowing a single-port
> > definition.
> 
> I don't catch this.
> Below snippet is a draft lvds-dual-port.yaml.
> How can it be referenced in ite,it6263.yaml?

allOf:
 - $ref: /schemas/display/lvds-dual-port.yaml

Another option might be to use $defs, define two combinations:
single-or-dual-port, dual-only-port. Reference them from the panel
bindings and from your bridge bindings by using:

 ports:
    port@0:
      $ref: /schemas/display/lvds.yaml#/#defs/single-or-dual-port

    port@1:
      $ref: /schemas/display/lvds.yaml#/#defs/dual-only-port

(the names are just an example, feel free to come with better
suggestions).

> 
> ---8<---
> allOf:                                                                           
>   - $ref: lvds.yaml#                                                             
>                                                                                  
> properties:                                                                      
>   ports:                                                                         
>     $ref: /schemas/graph.yaml#/properties/ports                                  
>                                                                                  
>     properties:                                                                  
>       port@0:                                                                    
>         $ref: /schemas/graph.yaml#/$defs/port-base                               
>         unevaluatedProperties: false                                             
>         description: the first LVDS input link                                   
>                                                                                  
>         properties:                                                              
>           dual-lvds-odd-pixels:                                                  
>             type: boolean                                                        
>             description: the first sink port for odd pixels                      
>                                                                                  
>           dual-lvds-even-pixels:                                                           
>             type: boolean                                                        
>             description: the first sink port for even pixels                     
>                                                                                  
>         oneOf:                                                                   
>           - required: [dual-lvds-even-pixels]                                    
>           - required: [dual-lvds-odd-pixels]                                     

Also under oneOf:
 - properties:
     dual-lvds-odd-pixels: false
     dual-lvds-even-pixels: false

>                                                                                  
>       port@1:                                                                    
>         $ref: /schemas/graph.yaml#/$defs/port-base                               
>         unevaluatedProperties: false                                             
>         description: the second LVDS input link                                  
>                                                                                  
>         properties:                                                              
>           dual-lvds-even-pixels:                                                 
>             type: boolean                                                        
>             description: the second sink port for even pixels                    
>                                                                                  
>           dual-lvds-odd-pixels:                                                  
>             type: boolean                                                        
>             description: the second sink port for odd pixels                     
>                                                                                  
>         oneOf:                                                                   
>           - required: [dual-lvds-even-pixels]                                    
>           - required: [dual-lvds-odd-pixels]                                     
>                                                                                  
>     required:                                                                    
>       - port@0                                                                   
>       - port@1                                                                   

You allow both single-port and dual-port configurations, so you can not
use this required statement. Please keep this part in the corresponding
panel bindings.

>                                                                                  
> unevaluatedProperties: false   
> ---8<---
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
With best wishes
Dmitry
