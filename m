Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A312E71
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444446; cv=none; b=OPHqfzgfxGbHY7FobXP/K6UgN43JxhAZoai5PX1Dm+q2yIx98SSTiZQEQOPqxkQL5gQ44i5F6aDPtksHCHeZFQQTHp6vwtBRFEMkPrgbwCK6XMIZHybGhW/h9fWdfzmeuz/Op8rdDiWC7Cd8Je1U6HFImMeHe3360s/vUl1JxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444446; c=relaxed/simple;
	bh=ns+m5sBGOsc+xV6bVd6vI8caudqeY3gv11EbyVl+W0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm/nSe4q8wuMEmV43G57ucWNH3YNNr15G3ueLpodI3t5DMsXkU+CKi23+RSqNHVM/BOTEllQLEeO1ov/nKvLSimjvgD7lef+7VZ8W8dSABR+03q2JSHbQL6cQrNvdVxQiVOONtStY9zHLBqbK7OrEh8P6naA/xHPUGtzqCKXVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzeZvOkv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzeZvOkv"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so5594308a12.0
        for <imx@lists.linux.dev>; Tue, 26 Mar 2024 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711444443; x=1712049243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkZOXYkAE9iOGn5hAd1Ui45j7SFP54iM6pKPed3Bge4=;
        b=JzeZvOkvVyLlVwbPCr/WL3wzPiCF0514aDvEOhHKwApLAoYJz1gLi+eATSIPqSRbxx
         xb5JIMMjcr0WYWnhyuAtdFiThbDyGg/i21fcfSN48mXfsz/Q5ajeWN8IZMwiTH004D+V
         c926Zqxj7yM56YYQ+InsEEFZcPIJ5ovbWQOwrVFLCcGj0yKeAtvNFrqwYTEs26SI0Rvq
         NzlH/ru94iRNoCsuBnOe2rvNmuHPFiF5czR99/ZopbTbVH3VV1RnFP64+uSvpoWhdxmH
         bSKGprJ3QPsZIfZQSYXtbPCTmlf5WRR7H7gqqkL0++K/he22dtgXqNBOJCdMryMcVRxo
         pjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711444443; x=1712049243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkZOXYkAE9iOGn5hAd1Ui45j7SFP54iM6pKPed3Bge4=;
        b=CSIF8fh6F8JWr752E82b998Al1guAdpQ/8QvYNsv/vB+FKXGOUbp3wf3uuRlFdfL+3
         YY7FK6eJxJq0odmewovsivus5b5KK1vNMg6KUpMXEHpq9QTEovSD3oiaqZOsImxUkwMT
         Ludi5RJxEsAQbcaQIAtzE6IRG45LU8YFMrVzIDryLL8QeLX7xjzXyNgUYLhNZkzmAJNO
         fq4xDXlJ8ohpMmDU0TodlMGZ8vBDdR0yxpEweMlilvXq/5tHV6iJcO6BxeFApoFprZtu
         g1N5ox+dKP+oGx6zZs82QnW21M+bKK6U12/mgAsGXh3b2oISOqz2uQuM/P4XEHdkNmF7
         /rCA==
X-Forwarded-Encrypted: i=1; AJvYcCWCAXGcolAzH7A1xV7ZXVukIl+L23WGKUErzb7JBgpHD4guELRNuJiMGNlPAz2VKeyeSScIGMdVHVBaupyIJdfdCBuY
X-Gm-Message-State: AOJu0Yx5mx8dYv8jtR2uOuCwdUASO+qAyZeAV81SQvxgmFGvOPiTo7rJ
	fXAlFZnmLgDY8pbI3XxFJnsw1d1+Hp9Pj3BfEBPab1s7MeBzvWAt
X-Google-Smtp-Source: AGHT+IGr2s/mEz4UE0baOahUGNeF8qNja14tSi6th+awBG0zaVYu2NirebKexudRl4KswKxgvAQtwQ==
X-Received: by 2002:a17:906:3b02:b0:a47:38ba:d24a with SMTP id g2-20020a1709063b0200b00a4738bad24amr6299188ejf.18.1711444442910;
        Tue, 26 Mar 2024 02:14:02 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-82.cust.vodafonedsl.it. [188.217.49.82])
        by smtp.gmail.com with ESMTPSA id hy8-20020a1709068a6800b00a46c0191306sm3988446ejc.213.2024.03.26.02.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:14:02 -0700 (PDT)
Date: Tue, 26 Mar 2024 10:13:59 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	aford@beaconembedded.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 0/6] soc: imx8mp: Finish support for HDMI
Message-ID: <ZgKR18zbZKV9p8tP@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240227220444.77566-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227220444.77566-1-aford173@gmail.com>

Hi Adam,

Thanks for your work.
For all the series:

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Regards,
Tommaso

On Tue, Feb 27, 2024 at 04:04:34PM -0600, Adam Ford wrote:
> The i.MX8M Plus has an HDMI controller, which depends on several
> other systems.  The Parallel Video Interface (PVI) and the
> HDMI-TX are already in the Linux-Next staging area 20240209, but
> the HDMI PHY driver and several device trees updates are still needed.
> 
> This series is adapted from multiple series from Lucas Stach with
> edits and suggestions from feedback from various attempts, but it
> since it's difficult to use and test them independently,
> I merged them into on unified series.  The version history is a
> bit ambiguous since different components were submitted at different
> times and had different amount of attempts.
> 
> The previous attempt I did used the wrong starting point for the PHY,
> so this update includes a newer starting point with tags from that version
> and fixes from various people's feedback.  I hope I caught them all, but
> I apologize if I missed something. Any tags from the previous attempt I
> made were intentionally dropped, because of the significant change,
> but I kept tags from the newer version I grabbed from patchwork.
> 
> Because several items from the last attempt were merged, this
> series is only focussed on adding the HDMI PHY driver, and enabling
> the power domain, irqsteer interrupt controller, and HDMI pipeline
> in the device tree. The version numbers are a bit strange since
> these all got pulled from various attempts with different versions,
> but I wanted to push them together as a series to complete the pending
> work.
> 
> This series restarted at V4 based on the version of the PHY driver and
> the other drivers and power-domain changes have been applied already.
> 
> V7:  Patch 5/7 marks the PVI driver disabled by default to prevent
>      EPROBE_DEFER errors.
> 
>      No other changes to other patches in the series
> 
> V6:  Make the PHY driver depend on COMMON_CLK to fix build errors
>      Make LCDIF3 disabled by default since it depends on hardware.
> 
> V5 primarily updates feedback from the PHY driver itself, but a small
>    adjustment was made to the register size in the device tree.
> Adam Ford (1):
>   arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
> 
> 
> Adam Ford (1):
>   arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
> 
> Lucas Stach (5):
>   dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
>   phy: freescale: add Samsung HDMI PHY
>   arm64: dts: imx8mp: add HDMI power-domains
>   arm64: dts: imx8mp: add HDMI irqsteer
>   arm64: dts: imx8mp: add HDMI display pipeline
> 
>  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |  62 ++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 147 ++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/phy/freescale/Kconfig                 |   6 +
>  drivers/phy/freescale/Makefile                |   1 +
>  drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 720 ++++++++++++++++++
>  6 files changed, 937 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
>  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> 
> -- 
> 2.43.0
> 
> 
