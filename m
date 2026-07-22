Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DF33D6F0
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712457; cv=none; b=sU+J+F+7/5ECLOlcoWqiPy0mFHU8UtFmY6U9ItPOgnarG8jacBfbFC6loEABLF8YTD1DMRDVqDSJ2b/Zfr+lrxL1vdvPJ2GCrGe/gCtSC8pn28hCs4cNaxfFplU0RoD//cE8G+1BLSkFqCM82q42oVUAKy7XDD+1tSwhkJy64VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712457; c=relaxed/simple;
	bh=aR/8udB1OlDt7n9BzDaDVl6vLg49c0i4wm7eL+Txmw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSG7yZCWIdSrF/pr0UXToggfdIWewzDyJnJBXXcH9mT5QS799AeAhEr5LuLB4EKjIPrbqPc/43/GCRMv+ZirUA+sisBomizTObVElFxWle8bOcM5PNwLvvUH5QTZ/4IfPOybS8TbuVFQgMVzrsy2oxvqn13tIZghxk/zUWEwrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN+4u8Gs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN+4u8Gs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso19055135e9.2
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784712454; x=1785317254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=;
        b=ZN+4u8Gs4QW20R/qdoulBOeQ7x3g0qJ7+XpdiohTt0IBzU4M4+DgmIgaewb3lnlBpW
         QJ8cvAP6z0iGTow0Fi0Iyt8kEWQfg+HpNeo6A9rfiD615UMrSbZg7jg9fwlaknBOUVqX
         oxgb8VEQNFZayynyyLVH+fAUPuj0F71RecreGqgTnaTaIOvmUlf6xypC92f9xVXW/0cN
         VDIdAz0M+ajy5ms1Zp0I5mr4FQWDdhDMXNk9Ryg7TLITNEgG+8G9OLsOKBYl6Go2tnym
         EG8CLfSiGnH2yDeQHfluGYLrk6SWbJYRfgSt8cewzdUUy9ynVusfkxfyDH4Eai0lpVHM
         lKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712454; x=1785317254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=;
        b=eNz2PHhntseJviIfaW7kDfnalb4S5z7ORsRnVfB1K/jlgJscPO6zt/d8gRWBbiDfEs
         dFmFPJMLrXZBy1FvAsC7jqfV4y613qATQnHcwfXo+w9q3NTDlusKksvm9Xawx9DZNZu/
         t+MCrkvP4yOZ70BP8Jlv4SYbaeiFIE4ZrVG27GbRVA5Co5w+mQLx7o2TfKxwSy4xHfky
         4Vpt6zO6zsnCNOOB5S1mm2fYEoILK15WUeON0gvXKBjotCSmvG9dXo1RVARg+DiArCX4
         Sp79o2M4ZhapV/w3OtbWYGFVZ0SGURO3IHpraRD5KTdc/vumDSwbZfk7XLpOlj3vIz44
         z1hQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOPZ/Af/p+RFpNIg3UtC02orsALOFkVLab/Jz7EdF5YGvaw74pLpT7YP5FN1dB9jWiwhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxP/9N6DgrT05Q+X407YzArMuuIVAkTgk+LKKaWyrQh77ynqZF/
	AB3FP1NDO+wZpbZGh3OCvf19wq4AxcxQf+LWE0NzueLMcq2oK4eTx3hX
X-Gm-Gg: AR+sD13dw5V9/U9WeAd3kcgvYe7KcJITyo//hhr2xcKRMMK+JVpZDMo60fgSdEG9bGv
	eLH4sJEjClSxFm2H85nS3uCBu2vGFJwGuaKZEP5DOjTOhCHp9A7um9eLukU4xArOUXKBe3eXBiV
	rnbPCVXfO4Yq7T9QxecV29fgop3a/5j+4CSEvO5ePMJ6T3ggBRtLWZVRc4sj2mXs2mLeTVmAdEr
	agBcyKiJd8mmwPEuxngncB+Jua9XCiMz3qML1wGz3iT+p1u7lIfcHBkripj02Bp2cFCoDB2vAre
	P/abT31AvwEscwKM3nWegFlEvEptOfWN+h6FJsj9JB2ievAD9PS9aBbp9Sk0Zpya+s1kOPcxAIC
	qVOumsBXygJQgJex9xFKo9JHk0cXbXCzZZOjiHrfG7O9qjOHOIz66gcNR4L2GFQQnmxT2Cw2POS
	DmDqUL/nJM7rTV8rfIbLcqw9sNlwUXY/PIXsdwuth7DNtyb3cAKLaL81w5MIGe1+zSAkFuBnIAu
	LchXw==
X-Received: by 2002:a05:600c:350f:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4954a3db7e8mr245764085e9.11.1784712453569;
        Wed, 22 Jul 2026 02:27:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f2453sm59985695e9.3.2026.07.22.02.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:27:32 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>

On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > camera module.
> >
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> >  4 files changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index c465aa19e526..ed3d678e7c5e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
> 
> Need not add dtbo here,
> 
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb can
> auto dtbo build dtbo.
> 
> check other dtbo.
> 
> Frank
> 

Hi Frank,

Thanks for the review.

Our desire is that these dtbo's are standalone targets that are shipped
for runtime overlay application. Users might, on dev boards especially,
want to enable or disable any combination of these overlays, and change
the combination between boots.

The combined dtb targets validate the overlay and in some listed cases,
provide a ready-to-use combo. They are not intended to cover all
possible use-cases.

My understanding is that indeed a dtb-y targeting a combined DTB will
build the prerequisite dtbo, but it would not be an install target.

Kind regards,
Ernest

