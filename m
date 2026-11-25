Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646933;
	b=NYzqvKCMWR/X3zCZmwl0QIRyMGG5rfFldsbh5x187sFqH9X2z/9AIqGzGlkg+Zpe1wZ3
	 G6cKxdDUObNmMSBMzg695F0vKruf1rAes6emziF6SasmO+5HWHkrbUo8KIS+PJk+zamB9
	 t/GqhmT1PI1ks8MhWR5Aatyt+LdBM/MA+eljRYjSuBP5L09BvyMnUQueNr5Rw7V4NnaDG
	 ADhCBXjkS2KI1abgPtOcPCvxIH7tpOHrIlAhalTsBKs0ZqEBzUuAKPJ+HlBFr2vc8x9Gq
	 IWCUPXShDI5yzslBXRaI5/71bx6BnX11f8WS+fHw/4Iz5DrhW90A1LZqKgVoDISp4Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YDsDCXLkXL3cNo22jNaL7+utbyOJuM3+sdQzz79cB1A=;
	b=IVqzRmRiy09VtqY45Z4shJ0BAPfReq4Ra/MwOm/h1ayzDs9lO/RgjfMngAkr5iTFL8EC
	 pNSEtJO2hesJAYfQQzgH5p37C/gGUDX7BHtfBajEH9e5jbA+lLro5DkmK1u9lx+ajEQw8
	 l4XlVhjpwlTyel1A28SWv1ch0ao5bmhRs/FXCurSIILTunqiCZCWHsO2fYg31jT0IK3iF
	 z8iUWlkynToDI/A/SsiCUFqObh0oUJ00buGyeCjzkzb9C7AjGB3+aUlDoTedeLQLF3QOS
	 OF0T+oZcaEaeDX1vakf2x4BS4cfNgZ83Bal+EjENWenP+M2YuZs1tJlxBirct2rmiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoTcxyuM;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4706606A6B8
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 22:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4706606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoTcxyuM
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so3505263a91.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 14:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795646926; x=1796251726; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YDsDCXLkXL3cNo22jNaL7+utbyOJuM3+sdQzz79cB1A=;
        b=FoTcxyuME9+S49v0gHi826OgA5EOZdhYMceoYPbh/Mw7kMc/1Ydi10KTHuBrNTE963
         PHzFNl9z+Lu8ugDhE/L3SlXkd1tzpnj504lJzMnU9VqRSwGvr57JXIixgF/JfCJEBa3E
         JiFReHMNH0JZ/C7GAN1eCNYzaRJIQIdagfBmDdP2sqlQTmmrhXErojxTolp+TG47Fn69
         J9L+1cHIQxDPy7oVJ7gNROA557FDWENVz3AXKwELvKA8zNOJAHTFxgMiXHPCJfby48uQ
         9/EJPHke+KEF5pTTJOEi54CqdaDsCZiS2xXzF5FmMp7aJ68EDu1aoMc1tRo4zfL07QOJ
         MCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646926; x=1796251726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDsDCXLkXL3cNo22jNaL7+utbyOJuM3+sdQzz79cB1A=;
        b=EbJVd4b4MRlGqvZwP3GS0VUGxvDOcLm5hF/w5CxIFFDGXrsP57jKebZ4XWITeAFAMy
         ifOtkm7Wkk2lXwuaZRcwtXjJTXxD/6/oi9LQ+Nx1m3W2qo6zyP7WE1FfaF+b1bNNgJNv
         Rnm/UR/pvCOU9G5WX240u5r3pIuvmCENRMsmqub6oDLHIrVmVtM3rN/YSejL5UCjpJIz
         LKYp17XwkidAcihfi7uQl0a60JYP/7fmdEe3RgffO9XaNDCp5dmjSRw3ZfSm6trdQL9r
         Mk9zQP2d0VcTh2CxOUud+A3mZkxJV/HIRZOBCpoYZlw8JIRgVOnX0enuC3Ga7/cJVZKK
         V12w==
X-Forwarded-Encrypted: i=1; AL+hErFpzBCvMHhP9Xmlu6ti7hb6VQAQ9im7kzbm6zD11sFjRkBOHt1LttZ/BEjjkAMOmql9U60=@lists.linux.dev
X-Gm-Message-State: APuU4Z/JcKIFmLnuq4k5pT1viX5s1FFDgHcR1vybippn2or8KWVSIjP1
	uP48LaGVJ5GjzCQ2RqmudmyciDOK6P5pAnLFiZSB6OODywQUD+GYEVHiyAmc2Kv2
X-Gm-Gg: AZFdTZflTu7uW2mKAoqWiszSDXo3S6i8Y2UXuFehn39NAJvWqojxRnJ97qXgGMWsA62
	1cXF4bhcbZajM2ctKMf43nJwNZwB4pADRH2Bu6wZLOW84br9GkZCqYEM2XUhW2fl3VRay65RIoF
	IFEyUCqmScpaQL3Z7A2+wpnUquHp6YPHp7XTp0BYZv8dMGxp03h/QYG6k8Eyl2ZRjlvJDcA6KF3
	Dpht3IlEEu5Id73BgFZ5biAEAP0Xl8xxvhAvr5b3loM90iqzMLyfBIVbc6DQOZFweQtsN6lcnY3
	yjIAgSgYMEgrogAJt6uIV0ja1aEscCZd+sWSGHQsIjH5TXTIkNcKjIaI8NaH5/lVRrqrFlNL/VA
	PVECH8d2nwVZcKAefRCpINKmfs+E2IVW4tnKrNlSEWuC/OQ/YVZGOe0bPZGDKjBmDALCEqKvKjB
	EvzD0+gVyleEs3HY4wNChAoDcujJAAUajhrkc5XSLr1kT6J+NgZiVxJoypcBqSroHq8B78KOV6t
	u4e0Sh6Yq+0wqr3aJe93wLlpqCvNwQlB7Ftj0VL7eFU6xJJIEmCfT/OckzXFiAhMF2qQg96bqhV
	xxK2LgInCyUcgMQfnPkqg5Z3688=
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr18868042a91.49.1795646925992;
        Wed, 25 Nov 2026 14:48:45 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm13819382a91.10.2026.11.25.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:48:45 -0800 (PST)
Date: Thu, 26 Nov 2026 06:48:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Niklas Cassel <cassel@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration
 PHYs
Message-ID: <awdjOLoxBpS6t1KN@inochi.infowork>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
 <awcFIJlCOxB7nXNz@ryzen>
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
In-Reply-To: <awcFIJlCOxB7nXNz@ryzen>

On Wed, Nov 25, 2026 at 04:56:16PM +0100, Niklas Cassel wrote:
> Hello Inochi,
> 
> On Wed, Nov 25, 2026 at 12:36:39PM +0800, Inochi Amaoto wrote:
> > The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
> > impedance calibration. Store these calibration PHYs in a bulk array
> > and acquire them by name with devm_phy_bulk_get().
> > 
> > Initialize both calibration PHYs before powering them on in lane order,
> > then keep the SATA PHY initialization, mode selection and power-on
> > separate. Use the bulk helpers to release the calibration PHYs after
> > SATA startup and to unwind failures without repeating power-off after
> > a failed bulk power-on.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/ata/ahci_imx.c | 57 ++++++++++++++++--------------------------
> >  1 file changed, 21 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
> > index 6aaa18e29abc..18faa033e44f 100644
> > --- a/drivers/ata/ahci_imx.c
> > +++ b/drivers/ata/ahci_imx.c
> > @@ -25,6 +25,8 @@
> >  
> >  #define DRV_NAME "ahci-imx"
> >  
> > +#define NUM_CALIPHY		2
> > +
> >  enum {
> >  	/* Timer 1-ms Register */
> >  	IMX_TIMER1MS				= 0x00e0,
> > @@ -66,8 +68,7 @@ struct imx_ahci_priv {
> >  	struct clk *ahb_clk;
> >  	struct regmap *gpr;
> >  	struct phy *sata_phy;
> > -	struct phy *cali_phy0;
> > -	struct phy *cali_phy1;
> > +	struct phy_bulk_data cali_phys[NUM_CALIPHY];
> >  	bool no_device;
> >  	bool first_time;
> >  	u32 phy_params;
> > @@ -428,30 +429,20 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
> >  	 * Initialize the first two lane PHYs here, although only the
> >  	 * third lane PHY is used by SATA.
> >  	 */
> > -	ret = phy_init(imxpriv->cali_phy0);
> > +	ret = phy_bulk_init(NUM_CALIPHY, imxpriv->cali_phys);
> >  	if (ret) {
> >  		dev_err(dev, "cali PHY init failed\n");
> >  		return ret;
> >  	}
> > -	ret = phy_power_on(imxpriv->cali_phy0);
> > +	ret = phy_bulk_power_on(NUM_CALIPHY, imxpriv->cali_phys);
> >  	if (ret) {
> >  		dev_err(dev, "cali PHY power on failed\n");
> > -		goto err_cali_phy0_exit;
> > -	}
> > -	ret = phy_init(imxpriv->cali_phy1);
> > -	if (ret) {
> > -		dev_err(dev, "cali PHY1 init failed\n");
> > -		goto err_cali_phy0_off;
> > -	}
> > -	ret = phy_power_on(imxpriv->cali_phy1);
> > -	if (ret) {
> > -		dev_err(dev, "cali PHY1 power on failed\n");
> > -		goto err_cali_phy1_exit;
> > +		goto err_cali_phy_exit;
> 
> This changes the order the calibration PHYs are brought up in.
> 
> The commit message describes the new order:
> 
>   "Initialize both calibration PHYs before powering them on in lane
>   order"
> 
> but doesn't say that it differs from the current sequence. Could the
> commit message mention the change, and why it is safe for the shared
> calibration?
> 

According to the document, there is no initialization order requirement
mentioned, so I thought it will be safe to change that since the
document shows that the calibration is independent in section 19.3.3.5.

> The cover letter mentions that the PHY timing requirements were checked
> against the documentation. Has the new sequence also been tested on
> i.MX8QM hardware?
> 

I does not check it on real hardware, the only thing I find is the
document.

> 
> >  	}
> >  	ret = phy_init(imxpriv->sata_phy);
> >  	if (ret) {
> >  		dev_err(dev, "sata PHY init failed\n");
> > -		goto err_cali_phy1_off;
> > +		goto err_cali_phy_off;
> >  	}
> >  	ret = phy_set_mode(imxpriv->sata_phy, PHY_MODE_SATA);
> >  	if (ret) {
> > @@ -465,10 +456,8 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
> >  	}
> >  
> >  	/* The cali_phy# can be turned off after SATA PHY is initialized. */
> > -	phy_power_off(imxpriv->cali_phy1);
> > -	phy_exit(imxpriv->cali_phy1);
> > -	phy_power_off(imxpriv->cali_phy0);
> > -	phy_exit(imxpriv->cali_phy0);
> > +	phy_bulk_power_off(NUM_CALIPHY, imxpriv->cali_phys);
> > +	phy_bulk_exit(NUM_CALIPHY, imxpriv->cali_phys);
> >  
> >  	/* RxWaterMark setting */
> >  	val = readl(hpriv->mmio + IMX8QM_SATA_AHCI_PTC);
> > @@ -480,14 +469,10 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
> >  
> >  err_sata_phy_exit:
> >  	phy_exit(imxpriv->sata_phy);
> > -err_cali_phy1_off:
> > -	phy_power_off(imxpriv->cali_phy1);
> > -err_cali_phy1_exit:
> > -	phy_exit(imxpriv->cali_phy1);
> > -err_cali_phy0_off:
> > -	phy_power_off(imxpriv->cali_phy0);
> > -err_cali_phy0_exit:
> > -	phy_exit(imxpriv->cali_phy0);
> > +err_cali_phy_off:
> > +	phy_bulk_power_off(NUM_CALIPHY, imxpriv->cali_phys);
> > +err_cali_phy_exit:
> > +	phy_bulk_exit(NUM_CALIPHY, imxpriv->cali_phys);
> >  
> >  	return ret;
> >  }
> > @@ -839,19 +824,19 @@ static const struct scsi_host_template ahci_platform_sht = {
> >  
> >  static int imx8_sata_probe(struct device *dev, struct imx_ahci_priv *imxpriv)
> >  {
> > +	int ret;
> > +
> >  	imxpriv->sata_phy = devm_phy_get(dev, "sata-phy");
> >  	if (IS_ERR(imxpriv->sata_phy))
> >  		return dev_err_probe(dev, PTR_ERR(imxpriv->sata_phy),
> >  				     "Failed to get sata_phy\n");
> >  
> > -	imxpriv->cali_phy0 = devm_phy_get(dev, "cali-phy0");
> > -	if (IS_ERR(imxpriv->cali_phy0))
> > -		return dev_err_probe(dev, PTR_ERR(imxpriv->cali_phy0),
> > -				     "Failed to get cali_phy0\n");
> > -	imxpriv->cali_phy1 = devm_phy_get(dev, "cali-phy1");
> > -	if (IS_ERR(imxpriv->cali_phy1))
> > -		return dev_err_probe(dev, PTR_ERR(imxpriv->cali_phy1),
> > -				     "Failed to get cali_phy1\n");
> > +	imxpriv->cali_phys[0].id = "cali-phy0";
> > +	imxpriv->cali_phys[1].id = "cali-phy1";
> > +
> > +	ret = devm_phy_bulk_get(dev, NUM_CALIPHY, imxpriv->cali_phys);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to get cali_phy\n");
> 
> phy_bulk_get() already reports which PHY failed:
> 
> drivers/phy/phy-core.c:phy_bulk_get() {
>     ...
>         for (i = 0; i < num_phys; i++) {
>                 phys[i].phy = phy_get(dev, phys[i].id);
> 
>                 ret = PTR_ERR_OR_ZERO(phys[i].phy);
>                 if (ret) {
>                         phys[i].phy = NULL;
> 
>                         dev_err_probe(dev, ret, "Failed to get phy: (%s)\n",
>                                       phys[i].id);
>                         goto err;
>                 }
>         }
>     ...
> }
> 
> so a missing cali-phy1 entry in phy-names now prints two errors, and the
> second one doesn't name the PHY.
> 
> A plain "return ret;" should be enough here.
> 
> 

Thanks, I will fix it.

Regards,
Inochi
