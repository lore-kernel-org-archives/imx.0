Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA7A21C9F0;
	Thu,  1 May 2025 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100649; cv=none; b=BtlK9HMIv8scSMqD0G7FB4KiNjaESwbRaFVxIqdqTOEADAh7fNisyd2KaTX5JQsQKmBEq+UDYoMBGntcmOhkLjALT4u+KzrlUo+ww6RgSaA8mBhgXhAHzUiW7QmdCQ7NJbFQGz+HacSr2EME++lxag1VBBaZ6aKM8GrnZzV+i4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100649; c=relaxed/simple;
	bh=AaFZYNZaVoJdnT4CJkDiw+CwenfpvYlqV7aZGMXp690=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+STQufqlXht4arnyNDcvUC/+zqBGM2mveKK6wc06sVmEoX3WuD8qMaHX8JkelcGIlD8yx1jRngbYqWDmCeUi+gofRxvbqOYDDALVrgfk/zmxP5EiJu16s2Ddsb1lzQyHctKPECHGUIT5mODcmNOc0A4BWytBqOr3BFh66sE9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfPs0BOF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfPs0BOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558AC4CEE3;
	Thu,  1 May 2025 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100649;
	bh=AaFZYNZaVoJdnT4CJkDiw+CwenfpvYlqV7aZGMXp690=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfPs0BOFLsZdNpTmh1FdTynzp23DXKkkIxax057Ff51k1w8vZZ+RKuJA7/JDu7Hph
	 X4wHVGmBW2/sHPBNUDziYUc5m6jD17F2E/67GCMoqiDJJGF6L1vA6V1j/tTyt8sCi3
	 gJjVE4wRNIMN35yYpLJF0Q0NehqftjQQ1GK8wBHSJ+RJqEaibETUTsrVE374flGRIe
	 Ficrw/H4B/TOonZxIpIfTlGiLFpBEGh3ZbLt51fzEtCvA9hrTd73cJgAsPdh8+jZp9
	 ZrU/YVHxyh7LRJJl0rb11iLes/8EgOHITgVbuvE7vTqzcA0BGCxU38v0S0VhJ91TfP
	 T4C/pghSNIY/A==
Date: Thu, 1 May 2025 13:57:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: imx8mq-usb: fix
 fsl,phy-tx-vboost-level-microvolt property
Message-ID: <20250501-jovial-sassy-rottweiler-9e416a@kuoka>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>

On Wed, Apr 30, 2025 at 05:44:59PM GMT, Xu Yang wrote:
> The ticket TKT0676370 shows the description of TX_VBOOST_LVL is wrong in
> register PHY_CTRL3 bit[31:29].
> 
>   011: Corresponds to a launch amplitude of 1.12 V.
>   010: Corresponds to a launch amplitude of 1.04 V.
>   000: Corresponds to a launch amplitude of 0.88 V.
> 
> After updated:
> 
>   011: Corresponds to a launch amplitude of 0.844 V.
>   100: Corresponds to a launch amplitude of 1.008 V.
>   101: Corresponds to a launch amplitude of 1.156 V.
> 
> This will correct it accordingly.
> 
> Fixes: b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning properties")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

