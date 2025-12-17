Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E315B971;
	Wed, 17 Dec 2025 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960548; cv=none; b=kafOoKx/86jfgN/zm+PJSpS6GaAb+UuZTRaHb+vR3g43uRTU5cPQtDiglquMLzp8rqrkM7Z7w0NSkN/YDqFRIrtbWwzkU7slIzOLLyV77NsQ8IQDbz07xp+SBXU3oE+GUbKQ2JX7TZhiRqKyBxjvuzuiBOZLrA+tyP+ruhoqk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960548; c=relaxed/simple;
	bh=qUGP+pe/nIe1zLPJjHrZrQ+CEmfL7inuKRsC5Gm7snc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdjROKi66P8qxWja/1ArDQD36e62ghEGdTFljBRNr8Al5omO7+2RmLT59VdHl3y8CIs8yiKZl5zAyAtAdXxEdyDKdkn/XaBDjNUX5dJDqOQBu1UcZjF48c8KqOxX9Ro7RGKG50b1lO7GVQ6oQ1reZGzQ16Cri+0Xi16jNLiHSVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ca48HIVk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ca48HIVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A260C4CEF5;
	Wed, 17 Dec 2025 08:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960546;
	bh=qUGP+pe/nIe1zLPJjHrZrQ+CEmfL7inuKRsC5Gm7snc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ca48HIVkg4W0V+oR3u1f6NgN8SwfJRJuE4ivS1XpkRRbB3C37kFHlt4xnN/ZZQ9i1
	 0JQgKbLeOSUfattAB991r9Omqo/9/BT9YgPimeBN5xYkqGN3pAJEbxaioje9Yi/RlK
	 OPpjl0GX1JMejr8uKHp9AkucijJ88NocnNALotwQuoIb2oV9jGjgPzujC/EDpQzw/P
	 CYDagn0memx/qwFjpK84ARrgdaYIAe3EA6EyikCADRYWXuN8+0yQRGVPbAiGzrzV36
	 uGI2JWRaNJit+fYz8WnXLo0Xn1IBdlnjQy13Zz416pQMXRX8qouGNc/PNidJPi2BvL
	 sh6Plw0HfT1gw==
Date: Wed, 17 Dec 2025 09:35:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linaro-s32@linaro.org, 
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
 for the NXP S32 SoCs
Message-ID: <20251217-sociable-rich-beagle-9321f8@quoll>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <792d3f59b9f519529b94e673faf70d77c4b61fb3.1765806521.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <792d3f59b9f519529b94e673faf70d77c4b61fb3.1765806521.git.dan.carpenter@linaro.org>

On Mon, Dec 15, 2025 at 05:41:52PM +0300, Dan Carpenter wrote:
> The NXP S32 SoCs have a GPR region which is used by a variety of
> drivers.  Some examples of the registers in this region are:
> 
>   * DDR_PMU_IRQ
>   * GMAC0_PHY_INTF_SEL
>   * GMAC1_PHY_INTF_SEL
>   * PFE_EMACS_INTF_SEL
>   * PFE_COH_EN
>   * PFE_PWR_CTRL
>   * PFE_EMACS_GENCTRL1
>   * PFE_GENCTRL3
> 
> Use the syscon interface to access these registers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Use nxp,s32g2-gpr and nxp,s32g3-gpr instead of nxp,s32g-gpr
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

