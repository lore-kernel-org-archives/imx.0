Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654B93A961B
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 18:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487395; cv=none; b=tppiqPadagupYIPCpiZ7aOrljLu0/n2CKYDqYU1S+UM8sJpqVBrE95h4uD5SqCOJblS4RICZGwPiujA1jXbh7E/QfNeETSUcbmaip3rQ1AdTQ4sV+v9bC9pWjow0gDkpgpeEBmGPEP1PCj+Ec1M3qZDdcJPz5A042nC1EDakqks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487395; c=relaxed/simple;
	bh=zxSj7HWQqplcThXZA0nSrk5rmztonhayWGc8TPyLzE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHPvVMRGyoHMcpcwOK4TLxDzZeole10VAdSmJVWAttb6r0z//k9SlABHhEeYgRPSyA96gLEXaXJxj8CmlHz3MllPLH/uHG12BwVcibNrea4hq/v5fg/r8GfBhL1xj8SKl6wApRKg19J4D0oFXexUayHhHUEQIlfqDeQ7z2ybxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVxKupcn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVxKupcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B343C19425;
	Wed, 29 Apr 2026 18:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777487395;
	bh=zxSj7HWQqplcThXZA0nSrk5rmztonhayWGc8TPyLzE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YVxKupcncnqs2q5KaEvuUkt+SqZtIAeybL6OwMOEt+2I1KybLqEoy3UWB+d0tO3al
	 kteE0piPqFBb9wU43PeaHMBsppqER9TMRvV3x3jSkHIGolIjPkHdV9Fva0Yop01NoJ
	 z/DgxnZu8voAwrHwHZhZgfWrvQROfCKPftMenVNAhVrmu5TGLMCCpemgdUVd4sz1Y+
	 ysaI5NjpH/JUGk+jVlsGGmAnKPT9eYLhIC4OFl9XrosgY0a/YmsBVbFw8Est6yF543
	 EWbFYgMnQcRUTztvMDTQ/L21THS31SoQNL0hY70xRrun46jL3D5ONucrp555Mr28ma
	 sh8DCA1sfXgQg==
Message-ID: <0c5a5204-331e-473b-9969-ff96bf711ce5@kernel.org>
Date: Wed, 29 Apr 2026 20:29:49 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/4] i.MX arm dts changes for v7.1
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Frank Li <Frank.Li@nxp.com>, soc@kernel.org, arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-3-Frank.Li@nxp.com>
 <ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/04/2026 16:03, Sébastien Szymanski wrote:
> Hello,
> 
> On 3/30/26 4:14 PM, Frank Li wrote:
>> ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy
> 
> This commit breaks Linux 7.1-rc1 boot on my APF27Dev board. I see the 
> following errors with earlyprintk enabled:
> 
> [    0.346162] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node i2c1grp
> [    0.354438] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node i2c2grp
> ...
> [    0.636217] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node pwmgrp
> [    0.644346] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node gpioledsgrp
> [    0.657247] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node uart1grp
> ...
> [    0.868102] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node cspi1grp
> [    0.876513] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node cspi2grp
> [    0.888903] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node fec1grp
> ...
> [    2.413181] imx27-pinctrl 10015000.pinmux: unable to find group for 
> node gpiokeysgrp
> 
> Reverting the commit makes the errors disappear and the board boot again.
> 
> Should I send a patch reverting this commit ?


If you know how to fix it, then better fixing it instead of reverting,
but otherwise yes, revert is justified. Just give a few more days for
Frank or community to reply, because maybe there is a fix known.

Best regards,
Krzysztof
