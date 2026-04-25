Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897A34C121;
	Sat, 25 Apr 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777110619; cv=none; b=anRNa1Q1qjdGzdAo4QMmSMCy4iWt8BBgpgkcsc3pVRpitZydkjvYNdhwyD/NotPSGulbqFTtENxSqONm3Sozf2PzOlrc/ZAcyTDMFTPEEOl+gAVW6wPwzeIrMY8LOqZA931q0T5/uSKQOODtpEQT4C5Jwc/uPR/VekIQFhFHFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777110619; c=relaxed/simple;
	bh=4f6t3Sb+5WpOwg7rfE2gwJx2q9oS7oSz10XpoMjqoIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ta9dO/Xzb/OKrVlcPfr/56ru3esubZAEuX1Y41ijZk7LWo0iFGL72qWi8smm8VBKYPDL1Ej60BVbKXGElfZ8/D9X37Ww1Yd+pJBg7Qn/Qml9FVBvQVSQzN5nbinLW1broeI9aOhuKbpAdqEYfa49dWNYE3oTkJNrp+LJ2NV+aII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGo9EEqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGo9EEqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4F1C2BCB2;
	Sat, 25 Apr 2026 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110619;
	bh=4f6t3Sb+5WpOwg7rfE2gwJx2q9oS7oSz10XpoMjqoIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGo9EEqimnVTSOHr9uENOHFVomTqo6i9d+urODiMlEPqWC/aRn+WI2++B6vs5DWzZ
	 RtmUH8GNf5EpZcCNqp6ADd1X5j6tQPFpoW/xGTsxL4aqhu96yQ6xRsm/7W7qaiIhMw
	 ZIq/5/Y5c0d0d5gLa2Xrg5shDr9NUVVl+U9vbBd3PUYVNWC92/bHhut/ze+UM/U9eZ
	 9Vc+RfuFF7aeIVH0mEndBj052fVtyVQnM6ymTpgYgQpLuJ4K6W79YayEBjKoum8utE
	 pi4AhTYkOO8+0NeV1tEBEa/M66VMmfvti/Dn3zwkF6/JN5zTWN2rwUO9B54tdi9fB3
	 GLzrJBVTTDmkQ==
Date: Sat, 25 Apr 2026 11:50:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 6/7] media: dt-bindings: add NXP i.MX95 compatible
 string
Message-ID: <20260425-ninja-labrador-of-authority-0bc1bb@quoll>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>

On Thu, Apr 23, 2026 at 04:23:01PM +0800, Guoniu Zhou wrote:
> The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
> main difference being the data output interface:
> 
> i.MX93 use IPI (Image Pixel Interface), which requires:
> - Pixel clock input
> - Software configuration through registers
> 
> i.MX95 uses IDI (Image Data Interface), which:
> - Does not require pixel clock
> - Is software transparent (no register configuration needed)
> 
> Due to these differences in register layout and initialization needs,
> the two variants cannot share the same compatible string. The driver
> needs to distinguish between them to handle the interface correctly.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add dedicated constraint block for i.MX95 to reflect different clock
>   requirements (only per clock needed vs i.MX93 which needs both per
>   and pixel clocks)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

