Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7C37147
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722118106; cv=none; b=VJPCRoNJLN4KlzNKxO6jFdFAfJ92hIQd4Wq8gNsGaGsMMGlRqbgBS+xzrlDVjbpdySkatlEW1DtdPUlcRBAR9L87FrJoI7uvUch0aHxu5cSFfNA2o2oi9oLq36hZ0U+EJ6TgtRDb1PMLaYzPbZKqquX0aixFn5xH/RCibkLJUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722118106; c=relaxed/simple;
	bh=HTtH6lIft5ZQOLIYIWCibqht64/060nP/EZnnBgGREk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGfNTntW7i7nwfDok+uiNUlRIyC18g9j9jEevYPl1HFjT4hDh6aRtDQMES6/YYEPZHwd7Qvt9yluw7nepdjZnD/o291xK63M04aA+tEHXsSUwImLgzEcL9fmJ2+rNAq9RhwFag+2g29BZNd2LaFdQm0yo6FYeZUZGTQ0u40rMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhoAOoJU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhoAOoJU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so5220130e87.0
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 15:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722118101; x=1722722901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwqWPO6eJP4Qec95t6HNVfe9KGEXFic++ajRHBM7iSo=;
        b=dhoAOoJUQuflkku7BC08YVCu0gw1K7wLuUqu0XtPqLKEAXXqAFOJbryBBI35y8CX87
         KubL9coGtbHj1DiFI7XOftcVGMeYrLX1Xw92OFIuNqP8UdgHYgpBGG7Rrt9u7n0OKiuo
         W54A8FaUmPH03Mf5REFes2rr3fNeDAVAjRX4Qdeur21zaLwh7Pi+yTlnzN+3Xt3QqcDl
         Ad9sP5ldWyrcegHqoQ8EVd2Ff3KctCdo1wmgR4WH3oYkmGOO8K3cqyoo5sut4l6+X8Cm
         oPVgfmXbfyiQpjiaGn54PfmYe9dNsLLfCOMsjmD4P3cqM7RuxhrwP3XyMeiBUdOq7VZM
         U3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722118101; x=1722722901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwqWPO6eJP4Qec95t6HNVfe9KGEXFic++ajRHBM7iSo=;
        b=Kut6lUfboqBPljBcoLuKVMkdXnNMIdSTmhD7x8bJXS61G7K4U8dZG156Zhgkxyd9ZT
         ACZzAnrvgUZa+Utg7bxQpBAqq+oc3eH6hl7yKEoq9IFgWL6m4UsACtl4YioecdiN1k07
         mRhr4ClNjnuAcF8MIQPe3mIAbtlNq+No2tvvoXZUJVSdXmrMhNlidpRM9pFO57VBCtRK
         YpW+TkZf2rkN40fJWmEChXQzhsG8kOCsWDARRhqsQpZAGziVmS8nSdVuB9MGit5Vw0RE
         F/iPwAgaQ33rLTe8J76PmZ9SH7boLr9k22hNJBLztMVqvkQm9xOgIMfEA41HWdKzZxPq
         B2pA==
X-Forwarded-Encrypted: i=1; AJvYcCUHYh+OEeNZ/9SHMgKd1Z0X8hIuw6Q9U1ca/Z2jQewnYzmv/3rH8hu8cYczE/orjnwtWl9uqvIBNHpqQcNHF2rsURtF
X-Gm-Message-State: AOJu0YwdFZvwoTirXYd2/EVcErQODgmA+S1Uc3SztezQM2pbOeJqnQQR
	IGxD3ZmaApBx5cMw8kGf+64oOoVNyBI7bskiCybUTp1oWvMDKunjhLpCg8NdAuw=
X-Google-Smtp-Source: AGHT+IEESjcuV3/3oS+Os1zyf2LB2n6lMR6DUHxbQ1nXgYeN+N3EfPjlTdSC2SKSZtLypC95ksepqA==
X-Received: by 2002:a05:6512:1296:b0:52e:933f:f1fa with SMTP id 2adb3069b0e04-5309b2e0b62mr2773797e87.61.1722118101176;
        Sat, 27 Jul 2024 15:08:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1292sm872881e87.105.2024.07.27.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 15:08:20 -0700 (PDT)
Date: Sun, 28 Jul 2024 01:08:18 +0300
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
Message-ID: <no7cgb4vfd4cxhsjoftfeizvzby4vfbq2okvneq4nbxs4ogwvt@ohplzz5bez4j>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <wky3mjl7fn773myatyrdsea6oc2xebkvrgmigmmoj36eswgqry@2kox5ad5dynl>
 <aba35ecb-2357-4c4f-8366-08d14e40d436@linux.dev>
 <zr2t6deyvwacawj7s36gols2vxu24fah25x6ofy7xpqyvc4s2d@luavybrlxpaf>
 <8014238b-2668-4602-add1-64a0c6e480ad@linux.dev>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8014238b-2668-4602-add1-64a0c6e480ad@linux.dev>

On Sun, Jul 28, 2024 at 05:38:37AM GMT, Sui Jingfeng wrote:
> Hi,
> 
> On 7/28/24 04:28, Dmitry Baryshkov wrote:
> > On Sun, Jul 28, 2024 at 03:10:21AM GMT, Sui Jingfeng wrote:
> > > Hi,
> > > 
> > > On 7/28/24 00:39, Dmitry Baryshkov wrote:
> > > > > Hi,
> > > > > 
> > > > > This patch series aims to add Freescale i.MX8qxp Display Controller support.
> > > > > 
> > > > > The controller is comprised of three main components that include a blit
> > > > > engine for 2D graphics accelerations, display controller for display output
> > > > > processing, as well as a command sequencer.
> > > > > 
> > > > > Previous patch series attempts to do that can be found at:
> > > > > https://patchwork.freedesktop.org/series/84524/
> > > > > 
> > > > > This series addresses Maxime's comments on the previous one:
> > > > > a. Split the display controller into multiple internal devices.
> > > > >      1) List display engine, pixel engine, interrupt controller and more as the
> > > > >         controller's child devices.
> > > > >      2) List display engine and pixel engine's processing units as their child
> > > > >         devices.
> > > > > 
> > > > > b. Add minimal feature support.
> > > > >      Only support two display pipelines with primary planes with XR24 fb,
> > > > >      backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
> > > > >      when necessary).
> > > > > 
> > > > > c. Use drm_dev_{enter, exit}().
> > > > > 
> > > > > Since this series changes a lot comparing to the previous one, I choose to
> > > > > send it with a new patch series, not a new version.
> > > > I'm sorry, I have started reviewing v2 without noticing that there is a
> > > > v3 already.
> > > > 
> > > > Let me summarize my comments:
> > > > 
> > > > - You are using OF aliases. Are they documented and acked by DT
> > > >     maintainers?
> > > > 
> > > > - I generally feel that the use of so many small devices to declare
> > > >     functional blocks is an abuse of the DT. Please consider creating
> > > >     _small_ units from the driver code directly rather than going throught
> > > >     the components.
> > > 
> > > Well, I really don't think so. I don't agree.
> > > 
> > > I have checked the DTSpec[1] before type, the spec isn't define how
> > > many is considered to be "many", and the spec isn't define to what
> > > extent is think to be "small" as well.
> > 
> > Yeah. However _usually_ we are not defining DT devices for sub-device
> > components.
> 
> I guess, this depended on their hardware (i.MX8qxp) layout, reflecting
> exactly what their hardware's layout is perfectly valid. It also depend
> on if specific part of those sub-device will be re-visioned or not. If
> only a small part of the whole is re-versioned in the future, we can still
> re-using this same driver with slightly modify(update) the DTS.
> 
> The point is to controll the granularity and forward compatibility.

That's why I asked for the comments or explanations. The cover letter is
a usual place, as it is an introduction to the series. The reviewers
don't start the series from 8/N, they start from 00/NN.

> 
> > So at least such decisions ought to be described and
> > explained in the cover letter.
> 
> Agree, but I see 08/19 patch has a beautiful schematic. I have learned
> a lot when reading it. I can't see any abuse of the DT through this
> bulk series anyway.
> 
> 
> Comments below are not revelant to Ying's patch series itself.
> 
> /*----------------------------------------------------------------*/
> 
> By the way, the last time that I have ever seen and feel abuse of the
> DT is the aux-bridge.c[1] and aux-hpd-bridge.c[2]. I strongly feel that
> those two *small* programs are abuses to the DT and possibily abuse to
> the auxiliary bus framework.

Off-topic should be directed as an answer to the original series. And if
you tried, you'd have seen the reason and the explanation. And a quick
glance around would have shown you the ti-sn65dsi86 bridge, which also
has similar structure for exactly the same reasons.

Nevertheless, the aux-bridge and aux-hpd-bridge provide a way to link
two different directions of the probe dependency chains: from the SoC to
the connector (DRM bridge chains) and from the connector to the SoC
(USB-C chains).

> 1) It's so *small* that it don't even have a hardware entity (physical
>    device) to corresponding with. As far as I can see, all hardware
>    units in this patch series are bigger than yours. Because your HPD
>    bridge is basically a "virtual wire".
> 
>    An non-physical-exist wire hold reference to several device node,
>    this is the most awful abuse to the DT I have ever seen. In other
>    words, despite you want to solve some software problems, but then,
>    you could put a device not in the DTS, and let the 'OF' system
>    create a device for you. Just like what this series do.

Thank you for your opinion. However you have clearly provided the reason
why these devices do not have a separate DT node: they are internal
parts of the existing device.

> 
> 2) I feel your HPD fake bridge driver abuse to the philosophy of
>    auxiliary bus [3]. The document of auxiliary bus tell us that
> 
>    "These individual devices split from the core cannot live on
>     the platform bus as they are not physical devices that are
>     controlled by DT/ACPI"

This is correct and two mentioned bridges follow this approach. This
phrase mostly provides a boundary between platform-based MFD devices
which usually have MMIO-like addressing for cells and non-MMIO,
non-platform devices living on the aux bus.

>     Which is nearly equivalent to say that devices that are controlled
>     by DT/ACPI have better ways to enforce the control. When using
>     auxiliary bus, we *generally* should not messed with DT. See
>     golden examples[4][5]. At least, their code are able to run on
>     X86, while the code you write just can't.
> 
> [0] https://patchwork.freedesktop.org/patch/605555/?series=135786&rev=3
> [1] https://elixir.bootlin.com/linux/v6.10.2/source/drivers/gpu/drm/bridge/aux-bridge.c
> [2] https://elixir.bootlin.com/linux/v6.10.2/source/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> [3] https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html
> 
> [4] https://patchwork.freedesktop.org/series/136431/
> [5] https://patchwork.freedesktop.org/series/134837/
> 
> 
> Best regards
> Sui
> 
> > > 
> > > [1]
> > > https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.4
> > 
> 
> -- 
> Best regards
> Sui
> 

-- 
With best wishes
Dmitry
