Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261F1C5D46;
	Wed, 10 Sep 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504326; cv=none; b=b65ab6L2TbpkQThokJ/EEJSlrlKqsDuro4yhJ2Tha5B/OkBiTe47InO++ZBvsz9WlpN8gep3bCd+qjC31FNeTLEUJIYDTv5S13wpe0ddwPHMuFmDTNYmfwD3AYwYYJ5NZG2LZYbgGgom7XOMGqj9avACteWXlZBEGGhgtxiiHco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504326; c=relaxed/simple;
	bh=CfDP9NnOJJ4XePyfe8vxmQejIgGJ0Qdeqb1FNfRZmZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i//tL7irBj+jruePgEDoTvhRtmeu2tfIxZ3QXPb5N6Kn5uuunjvCgWJWtDPSkIouJxRZrdmhc3mUsOhnSoFxcYsETdyQxPStyi0G3T5n44Y3w/lRvsUaE9lPuu2abQILv7FwL0aG6bA2z2NQo59ykBcnLqftoOEVXwxTOTCX4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvEKwMyY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvEKwMyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE9AC4CEF0;
	Wed, 10 Sep 2025 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757504325;
	bh=CfDP9NnOJJ4XePyfe8vxmQejIgGJ0Qdeqb1FNfRZmZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvEKwMyYoI6KNd8d3uhEdSSM6OPwToO2EECRmEowA5aAqOg1XoJx3TG5hkEdSlRvA
	 QjZsQ1Nkd7v54hDO6mtBrQ7RJbvrci+dOGU6qwPKAsIp7ILvApFPa+V9bBFSjS91wo
	 R7EKGfVwgv6xKSQYIIQTZDBy4YQBYwx6mPI/GRsTNRIbOyIdTBV93Ob0W+b6+lKCW8
	 v3LXrbV6SGWsyhKBh7+6BrvcA6DS572J9jy3Tcxhp22bIJfwYMDUSr98CNjYddjc8z
	 a3guo0jykFZE2a+5Y+tONtYGC5nA6s+W1jHTXzasBqsZXeJeNrBqBACI0BozyXx/Uo
	 wHpea8Aaoj0/A==
Date: Wed, 10 Sep 2025 13:38:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250910-crafty-adorable-sheep-f6265f@kuoka>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
 <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>

On Tue, Sep 09, 2025 at 10:33:02PM +0200, Andreas Kemnade wrote:
> To be able to fully describe how the SY7636A is connected to the system,
> add properties for the EN and VCOM_EN pins. To squeeze out every bit
> of unused current, in many devices it is possible to power off the
> complete chip. Add an input regulator to allow that.
> 
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> ---
>  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

