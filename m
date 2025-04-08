Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82D2690CC
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108616; cv=none; b=XXAmybHeHGV6iekZ7EwH7JZGwYU6KwwNuMIhjHE5kJmniWWTYx/4j9mL/mWGOMcrE7DIDkfkLNRdMsMEcpz3v/b295hBtB2Y6tin4tcccMyhnqB+4y9B7vZpylt/bSw7G3MrbAL6eg5FtlXrNEngAqClXfnwDEHiUaI6rBV9NSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108616; c=relaxed/simple;
	bh=wkOLFAUzhjnbM7Ikoz425nbv5U7OazSzqi4J4cwO0c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iidBHau3upeA9Z26/2tbcioqIKixTiQTLnvWsyQBVo2y5m2nditu99ZmsomaBQkWZIcTYnBRW55fwmZ1RBlV0iRQNTKCooISDhhPTkIu+zkjV90K/RlbaMW9uUtlwAukh2092HaDGz6s36x780ANsPE42Ek9DfcQE09q3+RI7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSWCyMI1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSWCyMI1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so42274015e9.2
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108613; x=1744713413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9PU6RaqZLEW0CeiqDaSWQKAtYrOqL2T0FLR0/1tl5g=;
        b=aSWCyMI1hpi75LC7KqNbLOliVVgHpD2+EIt51dsnYoFtMH8eyTdNagKZrAiidW++S7
         xMq3p0zQbNjZHJfKY27zhBZumz8rRXA6LYoEiZ5Rd9maty/7xGMWINCggmq4iICf+9QZ
         9DZrPBqAKuHMTF7YH7c4Ic+a1sU4U5LNxa0x/p9Jz/sJ6ebDUk8o8mxTeerSAh9Z/WRx
         UhHoksfHspMd9YEqPhCxP85KxHIKq2VVkchTZbHfDpRHltKpTFGck14CGQ0JX5+VXVoh
         sXZSgYhS+0YEacdRStwp4rWPVclw27GZU4aqFiV2Yc2OMGABKSMcpJRq/upc67+EI6Kl
         vnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108613; x=1744713413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9PU6RaqZLEW0CeiqDaSWQKAtYrOqL2T0FLR0/1tl5g=;
        b=QKSH+VU9MlaBoD8e01ZB4dsbhdmK0iFDFiWWw0E8D67T18X5Q+2W44mFDRDQzes19e
         YGIIWevEtHnYz5f4zqYGfN86hHQzatAHB/42jdpnXaQ1kKjrrMllWrYa4W89Z47JqQGj
         Tm7pDg8w5g5+ExLIar+HDNWqYpxWPlJKUEwMZazQ+YmyAasKue4u1Pj84RkLPyoT3CTC
         YQ6fKgCz/asyR+mfr4lpcSmoKdjORvz+HqOUZOH29mvygJbl5U2074EdVZmsszuEAjrH
         lOXgrKbnzui8H2Rl+EYmwFhBHHUU+s1aoUOJpoPRPUqQ4WgtufS4SD/XfsjwXE1vP4NK
         xtnA==
X-Forwarded-Encrypted: i=1; AJvYcCVystCkYWnmlxkaJxg2z+XxJNHnKu7P5enhYzbYMLA5vhjsE9Bnq+wEvrXJmAwBr88EYZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkOKvImXKThDlZVo+aenm5qU/UR2RD8L7NXdzxxrQNVy1IvCcK
	eP7NzGydd+mVybeQYl430uiP6ao26QAvrr2W2BTDJ+XtU1Cw1irpF7HnRsSD/5I=
X-Gm-Gg: ASbGncvcsy1y+20dKs5kgsDn3/d1HYMi+EP4hKY2VgRwDzqCe6f96VDXwOS/WOn61jV
	Uls7nKE9AkVhw2lgMnjlIJWvqORGgNlk4TDsdC1QdDoStQ7eEUnh/7tWkPzkXanuaqUj9QjvksA
	AKtdA0JXikG4ti6siKfQq/viUTLnYzuf+gB8ZzvWwSB1YrYNwjERg/p88jkHylfcchOO0LaNJCv
	jgkXiMirvM17CBT8b9VG2CQb2+mqIEu50F99jJL+NI6hpWw2hbHSzMwiPeFU4aoJLAIPtHr1YaM
	a94yMHneJhr1pQq5Etb8qecAvDhb9SyvGzJKhIWuPeMZp6UWLA==
X-Google-Smtp-Source: AGHT+IE5t903o03RamYyBBOUOtT0lEmSesMlodjULwqDkGqsFvnjjqyphRtizxEDeFR7TGxXwDEjLA==
X-Received: by 2002:a05:6000:1863:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-39d07ad4e86mr13874685f8f.9.1744108612851;
        Tue, 08 Apr 2025 03:36:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec3429f67sm163443095e9.7.2025.04.08.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:52 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:21:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <b85cd7c9-1747-4f8d-82e5-5bf734263566@stanley.mountain>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>

On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add Logical Machine Management(LMM) protocol which is intended for boot,
> shutdown, and reset of other logical machines (LM). It is usually used to
> allow one LM to manager another used as an offload or accelerator engine.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  11 +
>  drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
>  drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 262 +++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  32 +++
>  4 files changed, 306 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> index a01bf5e47301d2f93c9bfc7eebc77e083ea4ed75..1a936fc87d2350e2a21bccd45dfbeebfa3b90286 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> @@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx-sm-bbm.
>  
> +config IMX_SCMI_LMM_EXT
> +	tristate "i.MX SCMI LMM EXTENSION"
> +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> +	default y if ARCH_MXC
> +	help
> +	  This enables i.MX System Logical Machine Protocol to
> +	  manage Logical Machines boot, shutdown and etc.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx-sm-lmm.
> +

Remind me again what happens if you have both the default and the
extension modules enabled?

regards,
dan carpenter

