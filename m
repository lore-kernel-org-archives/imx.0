Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289161;
	b=UlNtAhpyJa8FgSO9T7cMcEOnFQ/TUIlAbDQ8wtpUze3GdAGnPn5vaU8ea8aEjASEM9bh
	 xbq4/y+p8CrSP/nAlh7kN3QHST5jDB1nxNP5D38NstOOOOr3PIX00WNOOkEQ/kJ90SQG1
	 O3w+sKPTMBBrrY2rsoDGVpg/hLBaLPxgRhjVBBdJK4vMiZDL63oxeiWY97GiWeLiQ3baw
	 T6/CK1N64h5KmwEKBlz6qxnd7RJyksTZDQR6vglgxFyi9deH6JmJ0pdYgEgif4kYuM2UD
	 1fQ6ExrpfdxeZBfm0Kbq1dcsGCEM++sj5pA1hyei23mugEBzeoJid3EAq/Ivypp+RLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
	b=SKGvCEeyCD74A7rVo2VVAT756RyuBhDcLT5pCbLNMYOypN3d+/yOMb/X/2JIMlx6sR5y
	 4MSHDIdtJTjR8p40XX37mzw0bh9+80XRYuVifYk+4cAyZIMlRyxRwJJjfxxaQLAkFPeO1
	 Z7nP40HpJHKr+28WLnyjJROucf0GQYq0bKJm9nlGsXm9u7qGZg20HPG4tFMN9eXSc9jVu
	 N3dA8EQ42iHtrpRG5xdkoUpAG2P4yOig0pL7K+TV0YjAjlb9Z9qPMijOImKaJ+tP9lj3+
	 wCoUeZ0npdmASDD2pb81TVzs01w6iQ7tAKoRNYFi2RbQnS2YBpvEwYajl681pmU4uxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNXzfe6y;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD68606A31E
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 15:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD68606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNXzfe6y
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19623825e9.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289158; x=1793893958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=lNXzfe6ykVVBqMT74FByt/wF+FyYVSZ2Cw2CWQqkIhLZ3xBu0Bpz1EL4F7kV3pzCVJ
         tNpyJdjTTkQZaPxgfZPKon/CuDbLH9yZyNKKycdicibrJybp2d8LM7SKMbWzrghCXxqP
         rT1kgHFMp9zAjDFofLWfbbh4yIWIn6561O2r6SwQ8E0n0JGBzxmEJGtbppVE0lni2t13
         uSy6nQDwcOjhqFeqjfq3LA8+e3vvPSltW+Vm7fNBsJcP7hccsNd4rEGrGkvqOO7XhClv
         nerzj2vidFBWpdFvz1jSWAgaNSKfXI+R771ov0dG5Wuw3SuOZRq/x+oEW3sOYTKHJYw/
         C7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289158; x=1793893958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=h0ifU2oJvWk9IFlo/pzog//psKmbjy0fASPBu++5Wda4aWWYzmIDRVFCvJf1Vq9QGT
         FvFdtzGnSJMfQ2NtLPdh20zSYrXlUKfI/XvR5vTdZhKnfB8RsECvV/9nc1N0B+EJ/61b
         26H2IJg9BhjM+XIkRtfblqKWxHV6b/vVCkWr318NrYXlCdiV8NM1pEMLOwfsk+bC5ILd
         tRy2V+O8n3Gu2FKj4xRbtCyVfewOvX7Fy3+cnSjuJDCEQOki0aVP7SQi5bwbOGp/dV/T
         HiRt8EEBi8JJNy/yj5HNVpPiPc/ciSYxwmclyq6etz8FJd9mDXvBx36UifegEIahzwsM
         iDgA==
X-Forwarded-Encrypted: i=1; AKwUvBxy0+wKqArlJBCTO4ru0jRAGtuNUKUv0T75Rj/EY8r4/oOs/gABMfd0UgI/fwguH8tuTvc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJjGUkAq0wLuw/YuwwDTBZa3n6ZVeiuWI4ttZWg6R2sfWbzp2Wk
	iY3eFHB34PVLAXXTLVa1qVtL9+WWZtmA9eRJSvoY0yfjfM/lnNlWyvcj
X-Gm-Gg: AYBFou2da0kZ7F4Zh+oJX+61ppNuOG6B5b4HrJRLJ1RYwBYAQwx4uO7osg0g9+qT/Sc
	pTg4Gq3q7zae1O/S4NCSLcLc992dQ9RIXgieU8fFrpFOtlWEc08iAQN+SUsudaVxLGpr1xEGJR1
	rQm+H8TXqkvuZ9jNR2qly3lSHiGhJvGkWDWog17NVvP2yOhpiZwpekZ7SaUDwYeAHUWuAzHefxi
	Oy4UYLxoV3FR0vVRCrqma3N67+vVLZLg5XtwJ6MGdhdXjIQPCGRpKzWiN9DIuCWowyXVqOvuWmy
	IuFUkRb9gjlUiEZtA7HKQjZtxYUFC/NOtckp4a/xVlv3c6l58GdNto3Shdw64yGvRgKhC8bHcd0
	18YZAjX4pKQmI2xSIPNPSt22eK/Dr9qhaPE9k8rUF501CQo1Slsj3UvyXeiNHK+nEw3mmJkXKgB
	hFqiapf4mejee0fCtBDOj+wb64/lNqr8SS2Yi06vQU9BMCWWDYnHF73OI+yPE5pMyEwUnLgHfpG
	bVJzgQUZ4YWCK2PWhu+PbpZjGRVSFK/0MueYrnxCLTPANlRcq7w299tIrOi4XGIZR4TGq0FM9w/
	/lQTQKV/sQ4Vh4m1cEtC2n4I4diSKxYmTQRggCBtIAvykkH9rKmYLZp2bRBLSjiYP2ezPtkLUPk
	ncYjXZ0xXH4aXsgaJLOsl5xPUrzTJLYVlH5Gao+C8c4FDqn65730UDQg=
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr144690445e9.12.1793289158295;
        Thu, 29 Oct 2026 08:52:38 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-d3e8-e0a5-7e8a-a15c.cust.swissbackbone.net. [2a02:1368:6200:2fbc:d3e8:e0a5:7e8a:a15c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm36538183f8f.36.2026.10.29.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:52:37 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:52:36 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <dmtpajvbw7cfrda4msnjvorjt67tycvu7qbsio4irvdydsbxny@mxxqqwht7mzu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
 <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>

On Sun, Oct 25, 2026 at 12:43:20PM +0100, Ernest Van Hoecke wrote:
> Hi Frank,
> 
> On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> > On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > > on this interface.
> > > > >
> > > > > The mezzanine can route the camera control signals through two jumper
> > > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > > camera description remains independent of the physical routing.
> > > > >
> > > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > > single camera. The alternate positions permit simultaneous native and
> > > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > > >
> > > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > > module uses 24 MHz, so provide variants for both.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > > >
> > > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > Both camera modules have their own oscillator, and the native and
> > > Mezzanine connectors have their own supply, so each overlay describes its
> > > own clock and regulator nodes. They also use a different I2C bus, CSI
> > > receiver and connector. Both overlays are applied together for two
> > > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> > 
> > Okay, I see share one imx8m-verdin-ov5640.dtso
> > 
> > > so their node names and
> > > labels must be unique, and a single .dtsi cannot be included twice.
> > 
> > mezzanine actually connect by another connectors ? so it need new one files
> > because current nexus node's limitation.
> >
> 
> Yes, the Mezzanine has its own camera connector, wired to the second
> MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
> connector nexus of their own, defined in the Mezzanine overlays.
>  
> > Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> > use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
> >
> 
> This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
> because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
> The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
> module-specific pins, which another module could wire differently. New
> labels in the SoM dtsi would become ABI with these overlays as their only
> user, so I would rather not add them. If a future Verdin module shares
> this connector, I will add the labels then.
>  
> > And avoid dtso include dtso file.  Now perfer only include dtsi file.
> > 
> > Frank
> 
> Okay I will go back to only including dtsi in v4 of this series, and
> also for the next SMARC series. Thanks.
> 
> Kind regards,
> Ernest

Hi Frank,

Just a heads-up that I'll be off in November so you can expect these
changes in December, together with v3 of SMARC iMX8MP camera series.

Thanks,
Ernest

