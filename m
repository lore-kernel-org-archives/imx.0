Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F7A35B632;
	Fri, 17 Jul 2026 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280246; cv=none; b=G7CJKVoTVL+X4Vt7H8MjMwicW1cKuTuMwZXaRtr7BjdpJ5725eOxJTJy42tDtBGNCwmTvsk7wBxUyF7dLTktUSyZ1IGnYcZCDuXLMVtfUWkls7Hsv0+AlpY33b/WFvicTlwXTDRP/qyGvsdfjCk4bvlGJLOfqZeVhY7wNd58xwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280246; c=relaxed/simple;
	bh=CJ19lLGQOn5O7YjGMJqDE8or+V8OVoPKvW1ILaHdqkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH361VmWtgjHJfLoT4zAH6QTE1MMTXbK/qTM/0Qgt7KMAiMSFrdbjemmXtn9tcPmkHCRp1fnGqGPUcMSch6oxFpqVqRDCz+xFvEZIIRv764tDTDJssLHkM2iMPHtRxTK2oHpnBj1yx2cnZ0EdPwJS6TZVJEpqHYXibBqYNKI+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmGX2+aQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmGX2+aQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4631F000E9;
	Fri, 17 Jul 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784280245;
	bh=i179p+qdZ2+KrAUDiAAeGJP057hLaGH1bH5xSwDIdR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LmGX2+aQhfxSIbGXPpuazumaYERS77FkVW+MVgQnURQ0r+InE+e/n/9FrpO23zOGD
	 HtbPoq063IxzybRiw3ajVUpB0OM1bsuwxX5kOz4disYEoHveCsbMKGWkmb70ADXPE6
	 A/dS1S7zpdfLaXCp4qmjPJlc4loAaTewnyWAv/fR+OWPSC13qWabhghgA0jWtbQNyO
	 pz4cqmAf67I7o45OQA7fcW666WcwPx+UAF0H74S4FoB1C8/vmDI1U6EW1js39qppnj
	 li2EAh4WRzCc8jIdaxztlCUFMy+trp8OCB13hM2fYNPKHZnmX88Rvz0xzxWEBZiwkn
	 oA1xrkLsvC6SQ==
Date: Fri, 17 Jul 2026 11:24:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
Message-ID: <20260717-generous-grinning-cobra-14f0cb@quoll>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
 <20260717-imx93w_frdm-v1-2-0cca6c0ba2f5@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-imx93w_frdm-v1-2-0cca6c0ba2f5@nxp.com>

On Fri, Jul 17, 2026 at 02:11:53PM +0900, Joseph Guo wrote:
> Add DT compatible string for NXP i.MX93 Wireless FRDM board.
> 
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless FRDM board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 FRDM board, with some minor
> functional and pin connection differences.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

