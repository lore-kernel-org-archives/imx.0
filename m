Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022C71A0BC9
	for <imx@lists.linux.dev>; Thu, 28 Nov 2024 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732804165; cv=none; b=bLeEpzZqLV422j2VSGDtLD8k6D/1Mu4Z4QjYSKXmy4vjumQJ9NPwOiD3m3thTrQx5Ydhwir5RyyqYpYq6hn/Z0ze/bpAUAEjMbyc/SsCsJLJU4Nh6LSIpUQJhqtNbgaomJ8/Iv5cr2HhnxeH9YGegHNAlYgbVqqMPZ4fTm4/JOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732804165; c=relaxed/simple;
	bh=8C+LvW+PEHBuKL7Wp5/gkI3vy4HHAgxioycokK9zAWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVAwelrb9hMLRpr2uIpApWdMnmK//RfBe373dllYYy1EWmJNZC1RVDMvjBFT9v5Ns+29/2H0MkdjBR9ITr7SQ6FsC7QqkkZ84C11QtaSqUTwdo0sMxbFe31n4WiFu1Wdba+A/t/aK0Hp3PWIJJX9VlzQn3HFgsgOrD+k4k3+7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rU+fKXdp; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rU+fKXdp"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso7522141fa.0
        for <imx@lists.linux.dev>; Thu, 28 Nov 2024 06:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732804162; x=1733408962; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=;
        b=rU+fKXdpUKMSlfLVqPN2CMg8GctMhAqxNNj7zMTS3q5kBHKtSr5Z9jOiqqknbRfgg3
         pI01GOb3M0scRNJ0zu0nXxkVH4qVTZiq2/IgeNHEOf1ydexUqXDoA3zCvX6hX9idmDkX
         u2+dQZstnA88Sqj+S+Bu6LP25ToUCGvsr92gJdWX18I4upynFx4SJYMqEbRFZxGdZcxx
         0QLrEGQ2zGoavYjpBrAjSST/l6A/m/8OlcrCg2l3DH06luJYG1z7RLxO+1gysYZaFgCq
         cBR1ce4cYGA3nYb/k8jUzgoEbMgQLAwIP+es7vZVhv/aLlqvaT7lxJlKUOH7+qPiMQqI
         wzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732804162; x=1733408962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=;
        b=DKabMhxUosR/PainXO1E6g35IqM3gQGqla5gYQwuyHLPzQpkcMWL0qstfSyVSn0FcN
         Oke8oZHnaNguNSdAHoLni8iy4KNmn0LoVvyXsVGeacjaa3oV6rudLbG3GFQg++45d50N
         2FWbK03AM0AUj5+CSwrm5E7aa+/SOF2neMy4an/2KL29pU/3JaPmOO7Dzqu58jAFVupZ
         yhwi2dmNzKgevgqzfzQ0Fl9/9SA6Up+wLSz/OC2yW3kEjtO4ynpGNfaBrtCT1tM3mShY
         aH1qqT2shXnlQoOVqBjdZgoRdWfeM3zsYgEc+UoyxeoMzSEf8koBIm2/3yZugB5Pchtx
         tnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVLF7uO8tipBDFllsoMt0YuWjz8ULGmV+D1z6WBuhFDgV9z6MLs/uUlQ8Cnvip72h6YC4=@lists.linux.dev
X-Gm-Message-State: AOJu0YylqY20XIsresOSOtfWLRn2x9uAMeP8VNOLZfFsZLXDEDp9Ps65
	akIxwHvLokp52aCaxB0oduSmBxTJ0FJ7p5JgEWm2Qyasa7dXUOk1Aur0qaKKfKQ=
X-Gm-Gg: ASbGncvXqvfq7rZmI5SSRVCnBKZDRHnDd/wirodxXSQ1IUg31jfX03D1JflRQZKufGz
	FQRDNTTeun6VUnbkAz0EPs0UvFYPcJz9GmYIP1pIWJhxFlk3PunnQ9Y+yArLacXGb/Bqvy4SpMH
	l+5qDbnldWuOt7CvZMJ1cPvv7Wi3fRjzea2BH/fIUQ4nCw9uE3KMNvkKXY7EFTlAu6NjmAZKJLO
	VHswnpFl7NJ46rIBc5WWg2kIiFNwObu8yUzZ1T1QAZQpH2lhhCi91f0IFgAyuweXVY6PlrM6yEn
	kbWVmmgsKZXEFDbrn1UD/r77rX/BQQ==
X-Google-Smtp-Source: AGHT+IHyweCAzP9pLJO4NLISzRUT/iPlUo6AXMrkwOg8DkwU8W+NduHNwNsOOPQzb40Ox1rkWfW9sg==
X-Received: by 2002:a05:651c:1607:b0:2ff:d49f:dd4a with SMTP id 38308e7fff4ca-2ffd60293b7mr29667881fa.21.1732804162195;
        Thu, 28 Nov 2024 06:29:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbeb8f0sm2073581fa.35.2024.11.28.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:29:20 -0800 (PST)
Date: Thu, 28 Nov 2024 16:29:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, marex@denx.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <3jojqg2auvktifilp5qt7tcppsfagk3zrlrmjxlnwxnehd6fwg@y7nxhhtp5t6y>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
 <20241127151630.GA3515396-robh@kernel.org>
 <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
 <20241128-mottled-nostalgic-oriole-be31ce@houat>
 <56f9bee2-74bd-4150-abab-fbc1459d7e36@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56f9bee2-74bd-4150-abab-fbc1459d7e36@norik.com>

On Thu, Nov 28, 2024 at 11:57:16AM +0100, Andrej Picej wrote:
> Hi Maxime,
> 
> On 28. 11. 24 11:29, Maxime Ripard wrote:
> > On Thu, Nov 28, 2024 at 09:46:33AM +0100, Andrej Picej wrote:
> > > On 27. 11. 24 16:16, Rob Herring wrote:
> > > > On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> > > > > From: Janine Hagemann <j.hagemann@phytec.de>
> > > > > 
> > > > > Add an optional property to change LVDS output voltage. This depends on
> > > > > the connected display specifications. With this property we directly set
> > > > > the LVDS_VCOM (0x19) register.
> > > > > Better register property mapping would be quite tricky. Please check
> > > > > bridge's datasheet for details on how register values set the LVDS
> > > > > data lines and LVDS clock output voltage.
> > > > > 
> > > > > Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> > > > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > > > ---
> > > > >    .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
> > > > >    1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > index 48a97bb3e2e0..5b2c0c281824 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > @@ -58,6 +58,12 @@ properties:
> > > > >                      - const: 2
> > > > >                      - const: 3
> > > > >                      - const: 4
> > > > > +              ti,lvds-vcom:
> > > > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +                description: LVDS output voltage configuration. This defines
> > > > > +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> > > > > +                  details on how register values set the LVDS data lines and
> > > > > +                  LVDS clock output voltage.
> > > > 
> > > > Constraints? 0 - 2^32 are all valid values?
> > > 
> > > Not really, only first 6 bits, which also means that this can be uint8 then.
> > > Will fix with other issues.
> > 
> > Also, generally speaking directly using register values is really
> > frowned upon, even more so when they match a value expressed in a
> > standard unit.
> 
> Yes, I am aware that this is not how devide-tree/device drivers should work.
> But setting this values based on wanted LVDS voltage will be quite tricky.
> Matching a value expressed in mV would be quite hard, take a look in the
> bridge datasheet [1], Chapter 6.5 Electrical Characteristics (|VOD|).
> Basically both:
> - LVDS data line output and
> - LVDS clock voltage
> is determined by the CSR 0x19.3:2. So when checking which Reg setting CSR
> 0x19 should be set to both conditions should meet specifications of the
> connected display. Output voltage for the same CSR 0x19 setting differs
> between LVDS data lines and LVDS clock.
> 
> Anyway, I'll prepare a v2 which only sets a part of this register, a
> bitfield (2 bits) that is responsible for LVDS differential output voltage.

Please use mV to specify the value in device tree. Yes, it's not easy.
Yes, it is still recommended for multiple reasons.

> 
> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F
> 
> Best regards,
> Andrej
> 
> > 
> > Maxime

-- 
With best wishes
Dmitry
