Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0843D4117;
	Tue, 26 May 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786948; cv=none; b=bxZ8X8ZeFnm5Xmh9KwaOJ4HA/7kKgdeScmm/DS7FqdKAIZynEgNoF+TbqSAZ3yS/uLYGuy/NcIAd/Qq96lr8YKbuMsjc7FrtVxelMYbHbhWDhZVuDTemsZT2788LnNsHv/q0fvyQ5J+psvkYvsMyykNDV25qnsuxCo9WXv5uNmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786948; c=relaxed/simple;
	bh=MUveCWBRKEdrtpYai39yjlDIrY+rOvITFNiwehEUWr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb0rfriqDM/SwJy6qM4iV3rx9hBo7kfPm5SdbvYWZtzP3Z4YoooTtoMkkneQMLsk1B8nStVKgun68Ig9Ub5bf3it2qgT/JVe+xsmAMVJEiyUza3HlhSm/o8XWxqtOCG5uNmWEAONMBwY86o/TdWYprE8+kBYr6y7mUe93FNpS5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsnWb1K0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsnWb1K0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC2C1F000E9;
	Tue, 26 May 2026 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786946;
	bh=6E3Xn+0H1KV2KOlPaoQck3gAXVlQji3IkxvruzI4lDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RsnWb1K0ajUHP8IwU5f6eZwKWwbz6K7rzyl+65TYWoHyYnhZsW7GRlua5Hy+Rxt1g
	 282gOx6iSsQyMmxVUXAmlPLKq3Db7pVAJSWC7LZ8yUZDXnqTfiOh1SuF4dJEbTgKRB
	 t/jlnuoXkz4Y7grj5n3hI4+Q5veW3udBqpwrfTESfe9Neric9tWe4nmS7rTpnFYuwj
	 DyDiRUd0Wgd30akzJvi1OsK8DKPfIkV6YLwPyp7090SX6pq9KaW/Q/kgE+WiuMIy+c
	 x32+zr8zha3TO8gklohdgHCkQFzo8xgGmzetgisL9CGGdcyQu78G8AV0xf4LI8/TB8
	 SZ8lQJY3p2oZw==
Date: Tue, 26 May 2026 11:15:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 5/9] dt-bindings: arm: fsl: Add solidrun lx2160a twins
 board
Message-ID: <20260526-offbeat-musical-frog-94fec7@quoll>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
 <20260524-lx2160-pci-v7-5-09370c23b952@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524-lx2160-pci-v7-5-09370c23b952@solid-run.com>

On Sun, May 24, 2026 at 04:54:44PM +0200, Josua Mayer wrote:
> The SolidRun LX2160A Twins board supports two configurations, one with
> with a single CEX-7 module, and one with two (dual).
> 
> The single configuration is a specific assembly that maximises
> connectivity for single cpu by routing some second cpu resources to the
> first via zero-Ohm resistors.
> 
> The dual configuration was not yet tested and is intentionally omitted.
> 
> Initial review strongly suggests that the dual configuration will have
> different bindings, because from either cpu point of view the board
> appears different (e.g. different number of sfp, fewer i2c gpio).
> 
> Add binding for the single variant only.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

