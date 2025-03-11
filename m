Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83925FA35
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710452; cv=none; b=gip5f44wblH+MMSL63wrAtrCF5ZdFBBOeyO2VjKdMHrlRJNtl3/Kwq2juGNGwk+8mLhnc4khBRF7ZDts2x/MdhIYwz5USnxjChEN88vZiMowNTHsBAfICpyA1AIZqOk0dcX/Y1coJvq0OLg73EBILvjXHaFD1VvF+nyUY1chp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710452; c=relaxed/simple;
	bh=0mCyXyj/1a5L4Ssc/7ltee11X6K/OBjhBSlN18FgDDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3pOO24yPQEr/yGXYSnt8vtjAt1Tj+w+RLqFwxr1evKjmCXZLt4eV3VE4pc/hXbuirlkLkDww1QtBBO5PtEFEZO0fx9wC81Z5jtXmwxWE3KzuKPukSd/wDJ/2kcWPtZ3zcJeZwRu0OfueY2JD/Z6JeaaYVDZOk4S+HtkLLKSp2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LodSV0/y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LodSV0/y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-225a28a511eso11706725ad.1
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741710449; x=1742315249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dl1JWfYJOg72EaaV3ldWA/0rrmYP/fUTPGuYqr0ndJY=;
        b=LodSV0/y6mGzDWUC7EL22mqXBPJyqQsKwJ4SfL3rS14IMndwaiO2OouVGhgwzRFTB/
         2vZTJWxqy4163AZhODlgyf5hIH/nuiCDEX+R7b0cXvZqwq0ibGSe/SnaFxmZ72QjxH+n
         c0Ief/oN8vsma8sxgy3RcSwH/7ElrA9Ho5/6Drjwnqe7wPC95hmQtvJsGTTgldGW1vxm
         FITj0KPQ+gpV5hRMHw/kqy+2r0j0DSZgms9vh0gIVTKB0AW1wnp2gZpS8Bgume9ZeNYZ
         iw15PXNnnsNbpiYuA8dMz+cNplCdaaXdLZStzxw1sSVbL4zsmSPpRwiKbOKJEnfvfU4P
         rZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710449; x=1742315249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dl1JWfYJOg72EaaV3ldWA/0rrmYP/fUTPGuYqr0ndJY=;
        b=Awsa627/9z8euUlOZ4z5ip0/Yx9gu42bQ6eaGdQVBEkH3h2hY0LFUm/TIvhgKJWlAl
         yQ+gFrhLkISVnq983C2HjtqWILhLxm7zijvxcdJugGp2/BwFDwWSmlD8VPpPSrNEOVHy
         grch+D+gxQFQqWUAHPeZ2wjJ10aajZSLs2yRI1vJd3pTw8n8If78rwKZPYtKW9fGJDT7
         grMCKAuHL1IbucdvaonUJcwjd+543BG4Zww4MpmCh1WGO4RzJdig9eh0bcU48RsPbBXp
         LXZ0j5oNyfy137ON4j6MoQE4PakIIyD5C/7p+Oxwg3jvynZB1ylNMishl0z1zBN3TA6u
         KxTA==
X-Forwarded-Encrypted: i=1; AJvYcCV0DQIY4KnQVuJe+qfPXT/cw0EVDJhfK4Io7RQrB6uwCT/GiNpSTf+EyHRs2TdXAyS6lVs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA1uiaaXFBf8mZhi7lhFT7RQU05YlOYNnKolD3J1UmMMCMmlLh
	s4IbVnkMoblTIH0864PybTFJoMvqM86SqRRb28jLGQMgWEjjqS8dDE0Hba3dFZo=
X-Gm-Gg: ASbGnctD+pu9Hkh3KY0VqtM53terePLvvA2wwjEd/a31a6b6hMybpWkmDieJGSMhAoD
	dRpEcjbQP2m7ttLXjMooBOb4qaViaDReAuu/AngW7UI03Sv76qJ6lAYiXalL5XFj281/TNKw6Yt
	sJJk0Xm9lpsEQbDH5XeJCMYZiFoVqdzX9K3bKRJkk0okW0shjhcfAAHGruGmAxKea/chy7qfHiU
	llvIYSBnuUY09XyBXAigXyNoSnykQYG095IhLINe+i0GGCe24CGUInsp1ET528hjveXOXgd0wtd
	7dX9ju4YjdXSR3IHXcog//vTcHiBhkvWDqs3KoZyCX8QE3j4
X-Google-Smtp-Source: AGHT+IF2UG2Kdovm4QQZtJqBjJbgL9SWkVL1VlYQjoRQyWIygr7zZtU2BIqigowT+nJo0KVbHMcrnA==
X-Received: by 2002:a17:903:32c2:b0:224:1074:6393 with SMTP id d9443c01a7336-22428bffe92mr243601665ad.43.1741710449034;
        Tue, 11 Mar 2025 09:27:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff32:9486:a333:ba9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e948asm100400365ad.75.2025.03.11.09.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:27:28 -0700 (PDT)
Date: Tue, 11 Mar 2025 10:27:25 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	shawnguo@kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	Frank.Li@nxp.com, peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Subject: Re: [PATCH v5 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Message-ID: <Z9BkbVHlx60VFD7q@p14s>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>

Thanks for the re-spin.  I will wait for Shawn and Sascha to review their
respective bits before picking up this set.

Mathieu

On Tue, Mar 11, 2025 at 10:58:03AM +0200, Daniel Baluta wrote:
> This patch series adds support to control the Run/Stall DSP bits found on
> i.MX8MP via the reset controller API instead of using the syscon API.
> 
> DSP found on i.MX8MP doesn't have a direct reset line so according to hardware
> design team in order to handle assert/deassert/reset functionality we
> need to use a combination of control bits from two modules.
> 
> Audio block control module:
> 	- for Run/Stall control bits of the DSP
> 
> Debug Access Port (DAP)
> 	- for Software Reset via IMX8M_DAP_PWRCTL register
> 
> The current implementation for IMX DSP Remotproc driver and for Sound Open
> Firmware driver (already upstream) uses the following approach:
> 	- maps the Audio Block Control address via syscon API through
>           the fsl,dsp-ctrl property of the dsp node.
> 	- maps the DAP address space using directly a call to ioremap
>           with IMX8M_DAP_DEBUG macro depicting the DAP base address.
> 
> The both approaches are problematic when comes to describing the address
> spaces via the DT:
> 	- for Audio Block Control, because it uses the syscon interface
> 	- for DAP because it hardcodes de base address instead of using a dt node.
> 
> This patch series aims to fix the Audio Block control usage of the
> syscon interface and replace it with Reset Controller interface.
> 
> Main advantages of using the Reset Controller API is that we stop
> abusing the syscon interface, offer a better probe ordering, PM runtime
> support. Main critique of using the Reset Controller API is that
> Run/Stall bits are not reset bits (but according the hardware design
> team they are part of the reset proccess since there is no real reset
> line).
> 
> Initial discussion is here:
> https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/
> 
> Note that we can safely remove the fsl,dsp-ctrl property usage from IMX DSP
> remoteproc driver because there is no Device Tree users.
> 
> Changes since v4:
> https://lore.kernel.org/lkml/20250305100037.373782-3-daniel.baluta@nxp.com/T/
> 	- picked-up R-b tags from Frank Li and Peng Fan
> 	- reworded commit message of patch 8/8 as per Mathieu Poirier suggestion
> 
> Changes since v3:
> https://lore.kernel.org/linux-arm-kernel/20250225102005.408773-5-daniel.baluta@nxp.com/T/
> 	- renamed resets ids as per Philipp comments
> 	- add boths resets (named them runstall and softreset) as per Philipp comments
> 
> Changes since v2:
> (https://lore.kernel.org/lkml/Z7ZNngd3wtJ5MZgl@lizhi-Precision-Tower-5810/T/)
>         - picked R-b and A-b tags
>         - use run_stall instead of reset to refer to reset controller
>           instance
>         - remove 'resets' description as it is a common property
>         - add correct include in the yaml dts snippet example
> Changes since v1:
> (https://lore.kernel.org/imx/20250219030809.GD6537@nxa18884-linux/T/)
>         - addresed comments received on v1
>         - picked up R-b and A-b tags
> 
> Daniel Baluta (8):
>   dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
>   dt-bindings: dsp: fsl,dsp: Add resets property
>   arm64: dts: imx8mp: Use resets property
>   reset: imx8mp-audiomix: Add prefix for internal macro
>   reset: imx8mp-audiomix: Prepare the code for more reset bits
>   reset: imx8mp-audiomix: Introduce active_low configuration option
>   reset: imx8mp-audiomix: Add support for DSP run/stall
>   imx_dsp_rproc: Use reset controller API to control the DSP
> 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 +++++-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  3 +
>  drivers/remoteproc/imx_dsp_rproc.c            | 25 ++++--
>  drivers/remoteproc/imx_rproc.h                |  2 +
>  drivers/reset/reset-imx8mp-audiomix.c         | 78 +++++++++++++------
>  .../dt-bindings/reset/imx8mp-reset-audiomix.h | 13 ++++
>  6 files changed, 114 insertions(+), 31 deletions(-)
>  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
> 
> -- 
> 2.43.0
> 
