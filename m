Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763481;
	b=Dg8rFPPBioCoqTThsGDWuHMGkXcYpGWFVgCodS/eCoZSkysUQ2i41WuaU7e6BWa02oYc
	 oS5kR40d4heq3xLysJLYYI/4aIOzoNOQJTALwuhkdpopK/eCHpceUG6w2178hl57J+ocO
	 kYb6sz/gp1EDCZdeO0PD0sx7/4cjRVHtkJl/IwAmE2SK04bhv2ekPHYfSpsaoWnc80Knj
	 YLYHXLetcYI29gnt8QaO/hVG/gqD5mPFywgdd8Y2V1tKvo8ttyfJvAtt1ovXGjEiX+gPy
	 SdN06DLoyv10XfHluoOz+74qcaTpkQ3TgNeJq5QyB0J1+ALacmJ6HwW26nbd2PUWhvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
	b=rFzB4k6Wh2fy7p6FQN8zd7iWySNECg86A3vLd49RfBQioC9dNoh0GBAwKmHnCFI3npJJ
	 T7w6s6YdOjfrfvN5tltbZor35YtIR5n+Il6pS7ETmsNTYHsXQZg10zWdqTpnPBOJL8nm1
	 uuOBwIvt+IslVz9Yhs9i5+HVCgyjKAC3xcKECHzbY+PyXX+mGVSa4JAYskmRCvn9w8jr1
	 eoNRzbCcpw7HPZHXvnSsyWeBHiW1pqDnBiJ5lrqiVGLb34O4oU52YyBGzOU7og4tA7VI1
	 D3o+LCjl7MrEzQKMIN29eATmyaAlcXnaOzwyPeO6Me6RJaoKd2E4F0Zh0xLfzPL3eyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fHgluEav;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274C0606A31F
	for <imx@lists.linux.dev>; Fri, 23 Oct 2026 13:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fHgluEav
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1410787f8f.1
        for <imx@lists.linux.dev>; Fri, 23 Oct 2026 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763479; x=1793368279; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=fHgluEavXPqse/GOLe+XQqFdCW4RbpERe0/ZKwQRfKBCPlb3gHKa2xGODkt3+gw9IS
         HjH06DQSyaYFIUXef/HTlZmXzPr+82NqR9GPLajdIZdUIoYrBFNyXO8NVtq2jB93o66D
         Hoi9Y8YBh/SI/03M6dHT8wC/Xcqtl7iaWkTqa4b0AwvM9dbJMlJMM5KSTZ+Zb6l2j7Jy
         7oUaoZwRQJscMOP26T58IaotLOgWHKqyD5j8mzDsEQllkEokTPD3BcPyYo3VAb9z0bLT
         rfLzfJnYMDt+xyYyDIu9HbDpgIA3jLEhy/kI1xRusO8p2ZPv1g6XQELRrOQYot0mulgh
         qsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763479; x=1793368279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=I+OfQgprgVQHulG9YPF9FVqbZ5CTpsyaTL7hdGan2fcKbEJG4kTR4yK19MPCK/x/L4
         ukvLTfSh2EMGvGb3ro6PIQ/p6NuLxYDo4WRnkHyQJvBa3pqgl3Dd99faHCptKRXpNdB6
         XogDrjcaYMaeMNBNz+IdQH4cXEzgWpLVM9DRcZk5fH4aTuI2tSAyIS1mad647HmG0KeE
         iE/C3ozxmkH5m4nERpsNQR7JhFvFfWfwDmXEZmc4p83urGx5ckltOmS5kCLn3rlQcoVA
         l8i7kWQcXiwKgc2ZAZhVqxAsew1oLlbr2zU2i3Wuc9Oh0TpttEU6DpdtG4lScv2NIumk
         gW2g==
X-Forwarded-Encrypted: i=1; AKwUvBxEnImbtRz8ppF19oBzq9Afp4cZZobULw3YzG6gp2dp4+wUYMpqqdZ5Lyg2IqeasZrLgh8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJSuBSqFM22rZYBYslM00exPwGVEbFuvjNp/sxfyJxLhXPCIz47
	bdDZ4zp3gOYpf0X+4fl8ZnJiDYHU3IES3bzFEiNDQtDinrG8XAe0eq0k
X-Gm-Gg: AYBFou0j2gZOmQljJgpLmVerAjKsnOeled1fxzzstc3K3WL6k5gQJNSByx/wJrCFgF5
	uD6ZvBnJ6lg8CEc21kfd94QvvbOH7bkNhmw7uhF0MkWVJVROHH5BtShH4Lbz/JZO476ucBiupDs
	R7GQfbr8Ct6y+4ye0cuc/rVSqQl70Kp/lbTkhdJTYIfIPXWd38whJZGX8p2rjZRfeeiFQkZXwtJ
	S+13YivaiVC+e4Y0fR5aTNtmB5g4Kn6G9TR2ZfjBXAMe++pzXoKKAX0eaEa6zWdYgiB7G21vyTq
	Cf9kZC4+4ZhkC8aOUVWqLhOkFZ9KnrAtiADClcKA9m8iskspCXeW1j78/Hsrq4NnmMEcGd29BuZ
	UOS+nh7EQWlCC0jECGnSnb1lzMa8hc6cz80ysXa+A1RPyuAVSQ3FCdpfcmPrMB/0hOpkjJlt/NC
	N+nBmk28oqzeOSAlMYjDlUBC42Pu4DsGieYAb7EP0BlyogQPyotcl6gCMoOsSE7hg0ub8GoH28f
	EV/MGNaKrau1aeWjndhQEskJjK8WtV6uB+B7dDf4R9k3vY9kLpswAE0olEvTHyn8XjB2HTvukle
	va2nO0qcBMsl6hg/FU8XdKpsgd9clMUITlQP2Dg06oQ4kIUck6GNYA0=
X-Received: by 2002:a05:6000:46c8:b0:48d:f3ec:e818 with SMTP id ffacd0b85a97d-48e2d1430d7mr7952493f8f.7.1792763479100;
        Fri, 23 Oct 2026 06:51:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380314a3sm4401217f8f.27.2026.10.23.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:51:18 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:51:17 +0200
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
Message-ID: <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
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
In-Reply-To: <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>

On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > on this interface.
> >
> > The mezzanine can route the camera control signals through two jumper
> > configurations. Describe each configuration as a GPIO nexus mapping so the
> > camera description remains independent of the physical routing.
> >
> > The default positions share the native CSI_1 GPIOs and are intended for a
> > single camera. The alternate positions permit simultaneous native and
> > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> >
> > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > module uses 24 MHz, so provide variants for both.
> >
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> 
> why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> 
> Frank

Hi Frank,

Both camera modules have their own oscillator, and the native and
Mezzanine connectors have their own supply, so each overlay describes its
own clock and regulator nodes. They also use a different I2C bus, CSI
receiver and connector. Both overlays are applied together for two
cameras (imx8mp-verdin-wifi-dev-dual-ov5640), so their node names and
labels must be unique, and a single .dtsi cannot be included twice.

The connector nexus makes the GPIOs independent of the routing, but an
overlay still has to name the connector, bus and receiver it uses. One
overlay for either connector would need the target to be chosen when it
is applied, which is what the DT connector/addon work is about, so sadly
we have to wait for that to make things more generic.

What is left in common is a few constant sensor properties, so I would
like to keep the two files.

Thanks for your input and best regards,
Ernest

