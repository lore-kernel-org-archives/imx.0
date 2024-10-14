Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1EE146A68
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893056; cv=none; b=mm4S2IaOyq62TuOZInzelpagG+e5aGDpIH/QYqHCaDS3/iRMLH8DtASrlcyD8q51qk8jthy1f9wM+J3iBh6SeUOzZ74SvLAv87DbXITqbN1lM6/5C0LTED2ALmyNa671THuWRNTNjVG/NmikN7AYHtl4IkKVXMKAgujx9U9JPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893056; c=relaxed/simple;
	bh=z14LnEzbw8ecnz2pepCIwD/33XkeC75KpcnYPH7d/W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGJ3NZkaO0YQz2nB/5yDrzHHFRyn1+lLK2J53DkgI+nI2YvW4njJdU1bEJYKZ+mpRxokku/o33nbtnwddjjwfXWHeOwPFoqerabXX096XVW2XONoSaold8Whijl+CkzP/EeJ60eL76W5aeEu+XyBJoABWr1Fjik188mOaao5hSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgfsXq/I; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgfsXq/I"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539983beb19so4215335e87.3
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728893051; x=1729497851; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gRbPdgNIVrqSTf/1E3KOMlBjVq1ghJobEnRvorOgv2Y=;
        b=CgfsXq/I4Zy2QOtsDH58KIpBp/q1tdxIgSmnzOhtDMhNEmwBXb/eUY4gvlQmux44O5
         jqFQAt59XypmUp0c3cPRNu7cvEB+LzdxIskA9pOlDvmfBKKnHs7zAGxoPocaLuyqzrgD
         C+BKzImnJkEAWnzsnWnowS0dA3wkU8yx6ZZYgVXN18xLrhNPpdOpJeJnDb/Pk4LKyo+p
         2XUV0J1jt7WDQCuarHgj0/1kKezncPfhI/Csh9kNYdaUUzFWqJJgdRspFHAxVjwDfAWQ
         HxEjHd+5+DEFvYNU+d5X45WstXul49AZL1XeYb927MN2CqRY3o99d7bpKUWoovUtMGW5
         TL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728893051; x=1729497851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRbPdgNIVrqSTf/1E3KOMlBjVq1ghJobEnRvorOgv2Y=;
        b=sQu0Q4kbZ4CgWBVIoYSl78SNxAm54jkRC2GJksfSQaXD1uVTKSntj2nWuL8rnSppw4
         xdvyW0PgXsW1tGnbTh503kNPCHeMQwFAOFHhAOGYSS6XkHjeo2mIrTBQ1hDzr0R1XZYl
         d8DxZKMBZvG63bkevG9IVBj4e2J4Ur1iD38LEHVF6VHDZavqwEtQj4mMiwnnWxo3x72H
         6UJKANtW1DMciLRJk/VeR0ipgU3lhw1cvlzGEClG4qoKtX4zxtCm4SbwfCpe5yEt23lH
         vqMEno8fYxY34WbR6NvzoCf87YX4I2wMwOoMZfGwCkUdID1Zed8ejEMZFjHFblrKFoDZ
         m1ow==
X-Forwarded-Encrypted: i=1; AJvYcCW1EX/Z/4bsNsZBpCoa1KdOd5YUM5KfEuvHSkfCN7ZQqdMFzrgjqZfYnQTABi4/1exa00k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQjEzwvq+MthlvKne9zRkRyyKl3nwnfpSpujuJiUqO4CDz61c5
	caXaMEdZmEEyQLl8lBFndV3mtiABIG7tKno/yxYsTK02RmU6uCn8uvAwsYlcABU=
X-Google-Smtp-Source: AGHT+IGMVMiVX34iHP51EtutG0xflfB9SX3ApfsR35FJAr5dmbDQdsvuJ7+4vRPFrG4oPA0bt0o7Hg==
X-Received: by 2002:a05:6512:114f:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-539da586e45mr4472475e87.42.1728893051314;
        Mon, 14 Oct 2024 01:04:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e9b46546sm738844e87.301.2024.10.14.01.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:04:10 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:04:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liu Ying <victor.liu@nxp.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"arnd@arndb.de" <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de" <y.moog@phytec.de>, 
	"marex@denx.de" <marex@denx.de>, "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Message-ID: <ki7zj2qvf64oi45kcnxl4maoxfvxtawko3vcdikg7dc5q6gw7u@5obyfvyylb3w>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <TY3PR01MB11346530A53C8085561713B6086442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346530A53C8085561713B6086442@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Mon, Oct 14, 2024 at 07:39:16AM +0000, Biju Das wrote:
> Hi Liu and Dmitry,
> 
> > -----Original Message-----
> > From: Liu Ying <victor.liu@nxp.com>
> > Sent: Monday, October 14, 2024 6:34 AM
> > Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
> > 
> > On 10/14/2024, Dmitry Baryshkov wrote:
> > > On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> > >> On 10/12/2024, Dmitry Baryshkov wrote:
> > >>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> > >>>> Document ITE IT6263 LVDS to HDMI converter.
> > >>>>
> > >>>> Product link:
> > >>>> https://www.ite.com.tw/en/product/cate1/IT6263
> > >>>>
> > >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > >>>> ---
> > >>>> v2:
> > >>>> * Document number of LVDS link data lanes.  (Biju)
> > >>>> * Simplify ports property by dropping "oneOf".  (Rob)
> > >>>>
> > >>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
> > >>>>  1 file changed, 276 insertions(+)
> > >>>>  create mode 100644
> > >>>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> > >>>>
> > >>>> diff --git
> > >>>> a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> > >>>> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> > >>>> new file mode 100644
> > >>>> index 000000000000..bc2bbec07623
> > >>>> --- /dev/null
> > >>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.y
> > >>>> +++ aml
> > >>>> @@ -0,0 +1,276 @@
> > >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > >>>> +1.2
> > >>>> +---
> > >>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> > >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>>> +
> > >>>> +title: ITE IT6263 LVDS to HDMI converter
> > >>>> +
> > >>>> +maintainers:
> > >>>> +  - Liu Ying <victor.liu@nxp.com>
> > >>>> +
> > >>>> +description: |
> > >>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
> > >>>> +Spectrum) LVDS
> > >>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
> > >>>> +transmitter,
> > >>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> > >>>> +  The built-in LVDS receiver can support single-link and dual-link
> > >>>> +LVDS inputs,
> > >>>> +  and the built-in HDMI transmitter is fully compliant with HDMI
> > >>>> +1.4a/3D, HDCP
> > >>>> +  1.2 and backward compatible with DVI 1.0 specification.
> > >>>> +
> > >>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S
> > >>>> + digital audio,  with sampling rate up to 192KHz and sample size
> > >>>> + up to 24 bits. In addition,  an S/PDIF input port takes in compressed audio of up to 192KHz
> > frame rate.
> > >>>> +
> > >>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI
> > >>>> + specifications v1.3 is  provided by the IT6263 in two interfaces:
> > >>>> + the four I2S input ports or the  S/PDIF input port.  With both
> > >>>> + interfaces the highest possible HBR frame rate  is supported at up to 768KHz.
> > >>>> +
> > >>>> +properties:
> > >>>
> > >>> No LVDS data-mapping support?
> > >>
> > >> It is enough to document number of LVDS link data lanes because OS
> > >> should be able to determine the data-mapping by looking at the number
> > >> and the data-mapping capability of the other side of the LVDS link.
> > >
> > > From what I can see, data-mapping is specified on the consumer sink
> > > side of the LVDS link. This means it should go to the bridge's device node.
> > 
> > Then, I won't define data-lanes, because data-mapping implies it, e.g., jeida-24 implies data lanes
> > 0/1/2/3, see lvds-data-mapping.yaml.
> > 
> > Please let me know which one you prefer.
> 
> Assume a top level use case where a user changes the format from JEDAI to VESA using On screen 
> display or modetest(if some one adds support for lvds-mapping) then setting of the lvds data mapping
> should be dynamic.
> 
> Maybe for initial version hardcode with JEDAI or VESA as default and provide a way to override
> the host driver and bridge with requested lvds-data mapping dynamically later??

The ite,lvds-link-num-data-lanes property should be removed, it is not
standard. I foresee two ways to specify the number of lanes used: either
the data-lanes property or the data-mapping property. Granted that
data-mapping replaces the data-lanes functionality for LVDS links, I
think it's better to use it from the start.

Frankly speaking, what is the usecase for specifying the data mapping
dynamically? What kind of uAPI do you have in mind and what is the
usecase for it?

-- 
With best wishes
Dmitry
