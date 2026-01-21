Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142EA46AF30;
	Wed, 21 Jan 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983261; cv=none; b=X654VwVZgdfp947dpsPjTZOOnf40G4lmkRWptg2JiShEsnrB0nWa/gbVsRw1EqazKJ7YbtmStqZMgQK5Q35/77XhfyvxQAfoowmkLt8B6+BShmv7/qjSkrTIMV5wIE5xTKn4o2Bwg7pa1NxOfTagWMnJmid7JjiAsxYog4bwHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983261; c=relaxed/simple;
	bh=LUd6a+A/qmpOJ4h1J+lALT0u6YXdBVWgT++FjFAtcAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hn/GAePBCc8/s2qxj/gkXs02o7+b8yQ4NEK27aTD/FkYlos9ofyCQvwgFd0d4H2CvpCgLg7xccNo5iXX9bkwSE/4pE2MyvJ53KZPUFZHvDufiCVmFOXD+w7ZEfApuu2Md4S4qP+4YwdeGMiWg1jaP2696MziFXq1eYxFoOIG5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noaZ1R7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noaZ1R7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C49C116D0;
	Wed, 21 Jan 2026 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768983260;
	bh=LUd6a+A/qmpOJ4h1J+lALT0u6YXdBVWgT++FjFAtcAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noaZ1R7tUFKK9vwfLJTtv/iJ2yo6C0dn6JZRcFS92NhtVmdIg/BYhAgUJ0h+g/UdD
	 SDe6I+rjF/1g/eig0E0opc/l9nWvM4PYNXrJH9FzBN8t3FEjxqoErfbHssu895OUNq
	 6e1KHmgdtJ8E0V39rWYrWeKw0mRu7d1KRqfUMypq+GMuAboHg2peNMhT3k88pikfLD
	 NklIRpuWvfro/o4+5bjEOMxbRaGmBzklhdauYeAVpnMfOAmlbRyNaySxtW70XG168H
	 IyoLPJF/HMHHLFt5urIGseiyif1aS92vJBJ5xaKyjSlOVQnENiTV46m0iQuKXHvfSX
	 2IIxapw68XDIQ==
Date: Wed, 21 Jan 2026 09:14:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
Message-ID: <20260121-snail-of-magic-order-e83d16@quoll>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120150329.1486-2-laurentiumihalcea111@gmail.com>

On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
> the SM coprocessor. Thus, the programming model needs no handle to the
> GPR node. Make it optional.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

