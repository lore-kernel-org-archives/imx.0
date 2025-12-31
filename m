Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791332248B0
	for <imx@lists.linux.dev>; Wed, 31 Dec 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193603; cv=none; b=iP16fajnY58OL6xI2i9nMyD8j8MzBWo/hUnXmfOI/pavR1kuHZjF606dEuxGxV//N1dDr8IkwP+LSzorUwzjvMOP32LDTg/sbE3Pvr2xKVqeYGtg2fz1b3uniGa6GRzSOdwRVzYHN6+qkhfDgXRVllVSrlna/16IuWV6MRtvRIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193603; c=relaxed/simple;
	bh=mwLe0hg4gRppnufmu9WMc1YOzRwOt3oj6WZDNTVFyp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4LGoA/pNu8EcVVPUCgyXMCGIJaT87zsBUXeL6pNgQ7wVFWZgyXGQHnnpCj/UMJHCRr5yk3HGUT/kiD5t0HSC1B8YFB5M4d3m6+nI+53LfARRK0uSJcqdGOk3qQPk7y6Uawq0+CFG9Yw6kAXtOTyB7z+1A2ciTaBqn/lEw+85V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Asx1XP+i; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Asx1XP+i"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhCwG0DDkz9tl6;
	Wed, 31 Dec 2025 16:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767193598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lM/LDEXQ59nBAxlq+a/Py0Lpzo0PBuXD2pbfBww4E0Y=;
	b=Asx1XP+iK6i9hd9W7t7F6twLwvZLgknRFiVWAJtmFEKwWhEpg95MI/5bPlJ7BuTiu9g4jZ
	zwLA4V3y5lWOjd1jhSVH+2OE8Z9jy33X2Z/OBimKm9vYIganTuJN+dObTeGLj9fT5yyZRp
	dJcT3/qsedaLjTXA4e1fL/x2pP99YFb350pAtz7Dy7AfiKdOMiIWzHPS0XuJJ7n8tXrW49
	yG5jgR7LNN7ejW2yPmqB+F8vfNG76QzcGpqus0cEMxDE5JZuxSoB1LvYhvyq8JwBpUDmc4
	OG6Y6VoLWEvvETwUSIpt8kiiPGOR4NMBIpHVwmvPzDHMGmiBtd3bbAjVXj7b0A==
Message-ID: <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
Date: Wed, 31 Dec 2025 15:11:21 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
To: Rain Yang <jiyu.yang@oss.nxp.com>, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, Frank.Li@nxp.com, liviu.dudau@arm.com,
 Rain Yang <jiyu.yang@nxp.com>
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cj1nf6xkoodfn1a4i3danjiknax1xpez
X-MBO-RS-ID: 487dd8ea82aa49fe10d

On 12/31/25 4:19 AM, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
> complexity.
> 
> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 88bde59e61b2..ab446aa6f73c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>   		gpu: gpu@4d900000 {
>   			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>   			reg = <0 0x4d900000 0 0x480000>;
> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
> -			clock-names = "core", "coregroup";
> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
> +			clock-names = "core";

I don't think this is correct, SM can disable the GPUAPB clock from the 
SM monitor:

 >$ clock.w gpuapb off

Linux has to make sure the GPUAPB clock are enabled to access the GPU 
register, hence the clock have to be described in DT.
