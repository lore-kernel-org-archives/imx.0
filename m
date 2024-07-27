Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC32629D
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722112089; cv=none; b=e6mIXwqVnhLxsSCVR0Jlh9Fe5apfpu2JM+5/owunwn7n+em4ezPTGk3iz9x1l8a24ldruO76rgieOJfIFP0IAQrypNKbCOoXbdoG4QCDNsgI53YTqvStLRtS43tRQ+4UIaH0pC8Nw11xGIXXSyR8jXZlxRIbJc0f4qw6e6aU0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722112089; c=relaxed/simple;
	bh=5Iq+hQdX1Or4aYNR2qZjlxumyuiILNoE8GDhZSLDlAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7CkyaTo2F5fInfgGkwA9HVdyAS06RIR4l6AWSsogbHeVrO78yROSBf8b+qnF3CrDenc//lR/3vi/HL9NqHFVk7T+XIHAFv59++vlsdOisQ5lNzlWO6ZretMroD6YZeGPnBodUQgEHMPNN6IPQ8GhuYRiY704O9pajHUDzl1Uw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4f2Cm9i; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4f2Cm9i"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso34864931fa.0
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722112085; x=1722716885; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5TCSE5IQPZmg5+Co6Qb5Q76qkbbdisagHTdBaE0Lw8=;
        b=i4f2Cm9i08cAvUeElQ27BKfiBHYwI7aHNo+74EWOzg8ymKrTVMMzrfLKRaVXbjGh0M
         aAgI9EsThwfKjKuGlHfsHQEQ6BR1zHoNvKMdIvse7G/AmdseysA7D3xH4qmJEND7LsNh
         kdPnm0cRIZGjRp9G29JGtNTRD2GPJ5P7f3lQvpocdLqn05ZrTbkSm8lMqcytGvTA0ixV
         t7YQkH5hGRF8JGvB57OPnzgKt10/9gPslUxe5Rr7e1OiEAEn68ARND+fErPKaDklKmhD
         Aizg5Wz5+EIeL/thDydVlbdrWFg0ptwMcPHpFUxJen8bB5n6/ed3yzdE/3vcqRzQtq8V
         AW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722112085; x=1722716885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5TCSE5IQPZmg5+Co6Qb5Q76qkbbdisagHTdBaE0Lw8=;
        b=nEnLkwDrn1C1YPjKDjywyJNJbEU6h4MUW5/Q1dNj55T8Iyat1KUUiFVehmddqIh8+A
         MxRixP5VkoHZkWEW6tDEXXFSB1ol/WaEjMWguNACoULRlVCwqoQ393c/9IXn6jiqkZXk
         PXt23nFsZKhaFMsbcTOQEd6L094QjIvD2FjGGF2fEBBRcLSUfoY4GRFCEmEc1D3iZd/h
         kVvXKlq9ljO/A0u2b0X3HM2LUTDxMCkX3KtH7qJXOHLF6tRSyrNmbTnLhv411I+TtJNl
         KZeR5Zu1k9prNqk5F0Adf3jL6qcUJ/kJg6x1blcrGK397vSsYiZRulqvVOKm0eIT445/
         kIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQpBjbrD+0VNBPTIk7zpbWSeHDsEDqj7HxwVZdWSRYQ6VeRnvyWAROilEj4Y+qJ+/2hv0YQSgAVPPNIcK6ydhnv4w2
X-Gm-Message-State: AOJu0Yywc/miJSaB07zPC5HfN16Ne7Kh3sFRjX4KYb8BvYQrmjiYfcbt
	clAp90OJAOB4jyBn3Jj4r5gKkCJsMgiz1IXE1p1ME8I+Rhk6waSXgFLpx9sNGsk=
X-Google-Smtp-Source: AGHT+IHk5AHyaj6Kn7pMIySWcR20lekDgoIkBhN1ucGkQo9nR7bUmFlDSzTzDXUXY1CP8lJJ++NOEg==
X-Received: by 2002:a2e:b5b1:0:b0:2ef:2555:e52d with SMTP id 38308e7fff4ca-2f12ee6342bmr21991621fa.45.1722112084809;
        Sat, 27 Jul 2024 13:28:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d074ea4sm7683151fa.116.2024.07.27.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 13:28:04 -0700 (PDT)
Date: Sat, 27 Jul 2024 23:28:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, 
	frank.li@nxp.com
Subject: Re: [PATCH v3 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <zr2t6deyvwacawj7s36gols2vxu24fah25x6ofy7xpqyvc4s2d@luavybrlxpaf>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <wky3mjl7fn773myatyrdsea6oc2xebkvrgmigmmoj36eswgqry@2kox5ad5dynl>
 <aba35ecb-2357-4c4f-8366-08d14e40d436@linux.dev>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aba35ecb-2357-4c4f-8366-08d14e40d436@linux.dev>

On Sun, Jul 28, 2024 at 03:10:21AM GMT, Sui Jingfeng wrote:
> Hi,
> 
> On 7/28/24 00:39, Dmitry Baryshkov wrote:
> > > Hi,
> > > 
> > > This patch series aims to add Freescale i.MX8qxp Display Controller support.
> > > 
> > > The controller is comprised of three main components that include a blit
> > > engine for 2D graphics accelerations, display controller for display output
> > > processing, as well as a command sequencer.
> > > 
> > > Previous patch series attempts to do that can be found at:
> > > https://patchwork.freedesktop.org/series/84524/
> > > 
> > > This series addresses Maxime's comments on the previous one:
> > > a. Split the display controller into multiple internal devices.
> > >     1) List display engine, pixel engine, interrupt controller and more as the
> > >        controller's child devices.
> > >     2) List display engine and pixel engine's processing units as their child
> > >        devices.
> > > 
> > > b. Add minimal feature support.
> > >     Only support two display pipelines with primary planes with XR24 fb,
> > >     backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
> > >     when necessary).
> > > 
> > > c. Use drm_dev_{enter, exit}().
> > > 
> > > Since this series changes a lot comparing to the previous one, I choose to
> > > send it with a new patch series, not a new version.
> > I'm sorry, I have started reviewing v2 without noticing that there is a
> > v3 already.
> > 
> > Let me summarize my comments:
> > 
> > - You are using OF aliases. Are they documented and acked by DT
> >    maintainers?
> > 
> > - I generally feel that the use of so many small devices to declare
> >    functional blocks is an abuse of the DT. Please consider creating
> >    _small_ units from the driver code directly rather than going throught
> >    the components.
> 
> Well, I really don't think so. I don't agree.
> 
> I have checked the DTSpec[1] before type, the spec isn't define how
> many is considered to be "many", and the spec isn't define to what
> extent is think to be "small" as well.

Yeah. However _usually_ we are not defining DT devices for sub-device
components. So at least such decisions ought to be described and
explained in the cover letter.

> 
> [1]
> https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.4

-- 
With best wishes
Dmitry
