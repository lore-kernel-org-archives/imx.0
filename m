Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4901DE3D6
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295628; cv=none; b=G5NF6v/aMhapnNws8Q77hV+LzN/xUzQC66u/0ydGZ4eusjbU9hWYOWdHZrODcpAHNY6ICkU2Oy5cF9p42Hlq2FjJSnAwqXdh/ARcQXyPdi8ds/JFIO4qHJRRVX3gEtmDRlq6TT97aZvV06XkbFbDMOOy+DCVv+xneyJPG9gcyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295628; c=relaxed/simple;
	bh=9Utb13MynaifzSiCb+13ADGTdToHf99pkQJS+1gzmyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7/tS0wwXv9aqU6qpmqUP9tfdics8puQPJycj4HHN7pnZ5VXKjoPs2vMzuHtzerEmqb5lI/pZ9MeCeNRZCICr6VCUILzCriJxWKK8icehdtAF+G9ydTHMhcDktY3oGRZzrx2BU1wuLlcLDIBsGizHG0H0dbATU2Z9FAcswgarSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nih0WYMv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nih0WYMv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724ea6a8cfbso570606b3a.2
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295626; x=1732900426; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J3Ifp0rGPbm/e/7rhcYVsj05S6iHCWRwu0XzDIJa52Y=;
        b=Nih0WYMv/2FPtFF2vjLb0vxW8Bb5CbRdWJnxUeMlb9JXWLc8iynd9qsMZbAGi2i6jS
         ew5A3JZEIaOIphhNB1CIdjQmS0rREJ8PcoODuzWhORc11CXeTThbEdqcq1GW5aE27s0O
         pCR4gIvEmWNTgXEHHZitQ9vZEaYJIdeAgCm5ub74DWkOHagYuESkQyPbQSIHzPkcl36J
         NAQrIjAIdR2c5d7aRiBqigYkl8PsUXipy162aeIVBNLvq/iytZJVvG01CHNHhTGI5Cky
         Cw3V06Q1+G4yfb9T/M1ToC4S4hfdYs/jptwl1LGcM7CGpfmx9n4qJAMk7WNwd9IsIxUm
         CsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295626; x=1732900426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3Ifp0rGPbm/e/7rhcYVsj05S6iHCWRwu0XzDIJa52Y=;
        b=s1ajsf4WbnceTo2U79X4UBMtRIx3yOa0W8cjBMfJRLhnGLBaP0EJokOEbFjaAyJsyS
         nAW9nvI8jQZl3urWIZstT2y8t00Uuhedzmf3Vw/EuqCQmFC1TvLifqLlY/BGeJHFNm5c
         MBhl5fN84g/p3hOR9emze8NAyslm+j6DdiVScTYsX4Dlq6QMaU2iUcFGml+hN/dlfCCL
         gcKdiVDWVLKMzjK8Zp+UAemDQASDzI9R6j121vtH1Ru4EFLbfmV63ukFKfFlY1U6YIpm
         shAZYWZFegyJia7kAZ2Tfz4wvc+tCV1kHyFsgwzYWcJdYNqcgUTBwci5QMRTpIIyo3FW
         AujQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxO1YEYyvVBpEBbHegNZppjFnD9LUop+o4fZ1OReScdLlBLiAL4ILeh/JqUB6yiyLv1SE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr1x+AO2GBZ5MAw2ObPeVVwHL8cBWvZOxG0qpMJIz0ft5fDoNd
	XUlDAm9MrbZ0nIIay9rxomzCXx/zs3cG9jlbzQs6N2KEzMfGW3Q6DA2MVbtF9h7U1VELfHFJOxs
	=
X-Gm-Gg: ASbGncucxxUCJrfllK36eomEWHFRv42Ud9+OaHQeuOWGe9M5iyP9UR3ECZLqUEBnGcv
	lYAGEea4YRA1CwutccWk76psidF2ocVmITeLBUizMtYp3XUVtV8jGMsyXPvbRs6/vobUQVncp17
	dbNzzM/abkYEEIR1eJoOB9fOvCVUn6FDzUKHCOS9D/0QychQlJXo0/zyMKNofvn4VjtamXAkPbu
	Tv1QjIr9MLPPEy/O6zbWmcdD3oo4AbzEegbwOAWwWDvW8z92UgejvhHj6JG
X-Google-Smtp-Source: AGHT+IFSLoW5PIBSR6LBkAITjbzrM29xeBOvFQPIeej5XJi4ofiDVZntpwn9iotOelT7YjAqhB/X7A==
X-Received: by 2002:a05:6a00:a8f:b0:724:62b3:58da with SMTP id d2e1a72fcca58-724df5de418mr4726297b3a.6.1732295626152;
        Fri, 22 Nov 2024 09:13:46 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724e0fca304sm1684411b3a.175.2024.11.22.09.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:13:45 -0800 (PST)
Date: Fri, 22 Nov 2024 22:43:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Message-ID: <20241122171340.4uwlddrwadg3vyz4@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-11-hongxing.zhu@nxp.com>
 <20241115071605.qwy4hfqmrnaknokl@thinkpad>
 <ZzeE0lR8DGG214qq@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzeE0lR8DGG214qq@lizhi-Precision-Tower-5810>

On Fri, Nov 15, 2024 at 12:28:50PM -0500, Frank Li wrote:
> On Fri, Nov 15, 2024 at 12:46:05PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 01, 2024 at 03:06:10PM +0800, Richard Zhu wrote:
> > > Add ref clock for i.MX95 PCIe here, when the internal PLL is used as
> > > PCIe reference clock.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 18 ++++++++++++++----
> > >  1 file changed, 14 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > index 03661e76550f..5cb504b5f851 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -1473,6 +1473,14 @@ smmu: iommu@490d0000 {
> > >  			};
> > >  		};
> > >
> > > +		hsio_blk_ctl: syscon@4c0100c0 {
> > > +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> > > +			reg = <0x0 0x4c0100c0 0x0 0x4>;
> > > +			#clock-cells = <1>;
> > > +			clocks = <&dummy>;
> >
> > What does this 'dummy' clock do? Looks like it doesn't have a frequency at all.
> > Is bootloader updating it? But the name looks wierd.
> 
> dummy clock is not used for this instance, which needn't at all. Leave here
> just keep compatible with the other instance.
> 
> Some instance of "nxp,imx95-hsio-blk-ctl" required input clocks. but this
> one is not, so put dummy here.
> 

DT should describe the hardware and hardware cannot have dummy clock. If the IP
requires a clock, then pass relevant clock (even if it is a fixed-clock).

- Mani

-- 
மணிவண்ணன் சதாசிவம்
