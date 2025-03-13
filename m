Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7D1FBC99
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741880816; cv=none; b=o+2j06ZB4AOvAROfzFDXvi+SVL9KnndRyBhqEgvtH4UV268u8Yfggt6rPXhPWWCZCCQ6DBUdHdV9qtCy2/lSoW+t78/lJWDHaswEIL9RvUjuIsf+wEUXjWqrKSltVrRdN79uMqAW5tceeke4oatISR6LL7NGhp5SmiaT2h3GcfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741880816; c=relaxed/simple;
	bh=8rhT5K5h5si2y4Q7V7FrHe+5lvc9WpW5/QmzS2Xdq6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MypXz3fbSJ2d8HHQBcwFs8mEMQs/f58kc9HgotNBvW7bZ72UeEf2QB7WLpXrhO6mnM+Wa4aATvipISOBzJOfRxd1c1JE2f9ZgcNkWQ+i/jQ7eVtkdNBAiSd0H8Lr/nxQmBeW6inzX15WavnNBsv7th4hVxiRZ/zUekOBdkA9AyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j3QTFoYR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j3QTFoYR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223f4c06e9fso22121665ad.1
        for <imx@lists.linux.dev>; Thu, 13 Mar 2025 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741880813; x=1742485613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=;
        b=j3QTFoYRz5gfI2Dp9wbGBnIOAhSyG67r2ri+9TZxvKsGnYx7e5jeoBevD62NkNfgXL
         g3E1Y4RSmlJnXj2yR4F0AcBrWoQx2F0LA5Kj5HCMm1svd6QpKVq6d3mD6BMYpZqlcuO5
         Lo5Q92A8A0SCsDiv9u8kD1DME6sIySAQ4FCjsAY18sYgiBGX7GgGm+aFj0CH9PUZrfhB
         h/B3iH9p54emFuyKtvbQjqq+WdBwHz8Gd9fN7ZLdkPjvjKifOLpwbo3rrD/kk7rfDhxk
         46/Of8XuiE+YRnO1q7upSe7EGv84BGLNs+Rsi5uXvfXPwGvyYsLNRpqEmEA+DAj3Gk6g
         OpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880813; x=1742485613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=;
        b=eF14QeqC4f/Id7hYsfYfzRq8YjGg0hXBSdVNjnVM+Tnudgi6Cs/F/Ur6L+bwFCq8aJ
         /R4kgMGq1LbRr4UNwV8JpqIERfz+iloZbaMk7PnIZ7fynWb6ii/d1meFClYFMH+b2Weh
         NTnkywOcSqXmaglB/Mxe2Uk5HV62IbLPYsLusPSUqXyZ/ihbFTQleGFXNU9Gi5n+gpYR
         JoAguO0XBSW1omQyJX3wRphy9fvoQx9POygLQIGNId0XgbUlWR9gSmL5hOLbWN4N7Y+v
         ATIIzRrt/+IiDfPm4ZHPvzoMGw9TLNpcaWJ6aM80xYs7aT1Nnt+1wsd2a88wDVbyQxub
         hiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIovvLIWXlyWL3Bnj8qcCxXFOBvmo2o3KAW96YG7BmoIk7fLuq8CRd84PUqpdlAVcpiq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsqM06qaI9cAfYTq3wjGIKbUzk2BkDUmnkkC4TG1AfI5gFc3Cj
	LnSN8wjlYR+4aezjIzjJ8SSHofSzh4mhD4y+keUrflZZ7TNyMlz51mbd9fxuJUQ=
X-Gm-Gg: ASbGncuFqZXF3dgJRVbWt6iIWJZePrpLHjxL3kTGhQKGOCNTGcwBHMk+kHZDqV+O8nX
	PEPiltZ57l5bV3MlzcO1i26z/H8oW6+UqM97Sq5VLjZVm/nk33wJr6F+yE9zU4TSsPSus7ruI8A
	9A0U1rjiCMzqInr5/o+8K/AK09wmBtuv9UAgPHyK1t82hF+g164bD15VM+g2CpyK1NdTXlNZO9M
	dhi+yswUKcfBU8eQlYTRHJe1PdeP6ohfmi9vJsKjxRuV71BOhkAzJGtfz3K5cmO6prTTFgHgQDr
	6HEBAZyPwdc7bBwsZcU8cB48/HsfkL5MM6JeODEVDQ1mE7yscJxxu72PIMg=
X-Google-Smtp-Source: AGHT+IHmhKUWmuw5hxmGn5MltXhJp+mOVpY2OPHTTEaVO3b51JPFYbzscOBmXvFxMsGPCnOFc7K2lg==
X-Received: by 2002:a17:903:3d03:b0:223:5187:a886 with SMTP id d9443c01a7336-225c66a7cb6mr49221535ad.22.1741880813496;
        Thu, 13 Mar 2025 08:46:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:46d2:1635:3673:c3f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba710dsm14851215ad.128.2025.03.13.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:46:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:46:50 -0600
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
Message-ID: <Z9L96ssnL1S5z7rb@p14s>
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

Other than patch 3 for which I haven't received a Reviewed-by, I have applied
this set.

Thanks,
Mathieu

> 
> -- 
> 2.43.0
> 
