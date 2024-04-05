Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A916F83A
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712329794; cv=none; b=FVsJa6gwMqvdzLVuEVyDloHMZF7vEsgV/CiegG0cIl99Q+iujllz/+1KeF1iNNLB5uCxtp6r7DPc+LbgqsVftyKzlHhyB2d6y61GC4tBNG75cT70EZgctTZHSsfjNp4wRUvBoF2PmWzE/xokRO1OOgKdSTvFbGsn7lsh8n0Zn/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712329794; c=relaxed/simple;
	bh=MndKlRKS8QxV6sX6KBn3TevEpzcWoPI3AwXL7LRFoak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcDf7n2LmQKq245EdVcbFFV76UeeGJw+twKBehGDyl+CTkPRz3lgsgph0ejGP83NMFdqbNPOWqRybsMOePgYT75uq9OWA3vD8ABdsVCDI9mnqSV3vJIaam9uD5IoUIH/wQQIuFVAtidil5KdumFoMDTkrcMSGjydynEhukewgA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lj57lHMb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lj57lHMb"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516ab4b3251so2698235e87.0
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712329791; x=1712934591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJdX04IMH/Sr5fcTtZ7IsQwpDomVdtoarGfuP7SX06s=;
        b=lj57lHMbGIqRpfNFKjsKr3QsaL1m9OKHUEj/o0SO7JaDCYYPa3bE1wQs0ugwqH2gA0
         6kMwbHvTnouE1+bNln1AeA540oMZe9zVleXJAMGHB9hWDtpNJJ4tAVK2c9O8o3VSvXRq
         +WmS0uy5CSz6zeaxcI20AOXazPkzsqWtfchOjmqVTXFWkq2/mbTVbh84qBuWnnlSCLFy
         hjWbWNI5vTjGz028KJs8fYTt3LUFceWW5vPH6iiQMy1Tp7tycdrHBcr5zu++063tOTd4
         ILBY592iKT/FUuFIJLb0Ksf0m27azJ4Nel7vnwGeP/dlKQYn1W2b4I0BiWVgucO8e4cK
         tBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712329791; x=1712934591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJdX04IMH/Sr5fcTtZ7IsQwpDomVdtoarGfuP7SX06s=;
        b=d9huT4sEJJnGsa4DBM/O87Fob/dfE7lzP2H0Mv+kAckoFtXMS1gtuVuazeTdny/kCL
         ACD1/wan+S8iTljCTq1sQkkVGNtucwW35aQUt5CGh0M5fSrLDY5C1MQkkXOQlWm7i/dD
         vLGDR77BD43Up7ui4i2U+H972w33wUg0WHsMVxNItMhN9WiHXrDhfgKjoGXEDS/lofJQ
         f6IBeMkQqs9f7VMfGkQhrsrbxgJ5onGG3W9JxFFlO4Atu5WEs0kkEwA/bHsrDcIspboS
         iUG7yhoHYjN9dsUoK2DgqP/jl6MJhoBoS+y8zMaBrRC7DbXukLBZZW7DZnAKdNS11Q/p
         VLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYGWdw9WlTo1NGbz8InZEaYkrAHG6cOnkEucUSv5bnRZFHBnQQTppD4ZTV+NlcDdXP6km1A3+LA+ZyuCW9XqSaMP3y
X-Gm-Message-State: AOJu0YxaDE8dEVEQ/tN0voCGvGPvBpDDI9Q7JLMA7SjIO2h2BeL1jxMs
	k9WyzdSX3vfiBn2k7Yk+S3YzC7cabrbz33BJG25y1pBESVPHzXSrxSoF9gURk9I=
X-Google-Smtp-Source: AGHT+IHr0Gt4JNXkFtNyK4SoOL2Aljmp8TnDpiAo6jcvc0P5uChKtBqN0OC5YPsqfbIT76tBCMSLfQ==
X-Received: by 2002:a05:6512:44b:b0:513:cf5e:f2ad with SMTP id y11-20020a056512044b00b00513cf5ef2admr1527967lfk.60.1712329790930;
        Fri, 05 Apr 2024 08:09:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b00516cf20b276sm214121lfr.86.2024.04.05.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:09:50 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:09:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v15 2/8] phy: Add HDMI configuration options
Message-ID: <7uculhmuov3z6o4xgv54ubdmju52y4jw7qkjbnslnyqbqgf5ku@sxrkuw4uwavx>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-3-alexander.stein@ew.tq-group.com>
 <20240306-inquisitive-funny-bull-017550@houat>
 <ZhAJridEyhUeFVr0@matsya>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhAJridEyhUeFVr0@matsya>

On Fri, Apr 05, 2024 at 07:54:46PM +0530, Vinod Koul wrote:
> On 06-03-24, 15:48, Maxime Ripard wrote:
> > Hi Alexander,
> > 
> > On Wed, Mar 06, 2024 at 11:16:19AM +0100, Alexander Stein wrote:
> > > From: Sandor Yu <Sandor.yu@nxp.com>
> > > 
> > > Allow HDMI PHYs to be configured through the generic
> > > functions through a custom structure added to the generic union.
> > > 
> > > The parameters added here are based on HDMI PHY
> > > implementation practices.  The current set of parameters
> > > should cover the potential users.
> > > 
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Acked-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
> > >  include/linux/phy/phy.h      |  7 ++++++-
> > >  2 files changed, 30 insertions(+), 1 deletion(-)
> > >  create mode 100644 include/linux/phy/phy-hdmi.h
> > > 
> > > diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> > > new file mode 100644
> > > index 0000000000000..b7de88e9090f0
> > > --- /dev/null
> > > +++ b/include/linux/phy/phy-hdmi.h
> > > @@ -0,0 +1,24 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright 2022 NXP
> > > + */
> > > +
> > > +#ifndef __PHY_HDMI_H_
> > > +#define __PHY_HDMI_H_
> > > +
> > > +#include <linux/hdmi.h>
> > > +/**
> > > + * struct phy_configure_opts_hdmi - HDMI configuration set
> > > + * @pixel_clk_rate: Pixel clock of video modes in KHz.
> > > + * @bpc: Maximum bits per color channel.
> > > + * @color_space: Colorspace in enum hdmi_colorspace.
> > > + *
> > > + * This structure is used to represent the configuration state of a HDMI phy.
> > > + */
> > > +struct phy_configure_opts_hdmi {
> > > +	unsigned int pixel_clk_rate;
> > > +	unsigned int bpc;
> > > +	enum hdmi_colorspace color_space;
> > > +};
> > 
> > Does the PHY actually care about the pixel clock rate, color space and
> > formats, or does it only care about the character rate?
> 
> Nope it should not

After taking a look at the Cadence PHY driver, I share the feeling that
hdptx_hdmi_feedback_factor() should be reworked into drm_display helper
and then the struct phy_configure_opts_hdmi can be limited to having a
single unsigned long char_freq or bit_rate field.

I'm not sure whether we need anything corresponding to the TMDS Bit
Clock Ratio control. As far as I understand, it can be deduced from the
Bit Rate.

-- 
With best wishes
Dmitry
