Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687520264A;
	Tue, 29 Oct 2024 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187542; cv=none; b=C47dwGkpajtsJ4+db8fKJUedgbN6wgROXbKarJisYpsDsl1babj4qGytyQzIZW3sk1EVNAUcsfiyApGkN4ulV/y+WWjSAExX9rOi4T9FlCJwtPTrXcqO6fyDiPzj3di2GMk/favist9/1bonU7MizbKkxbiRYe7Ed90A7QcBlT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187542; c=relaxed/simple;
	bh=lvRF6OQNxK4XvjtKLyh5uUXjztm7duAnqUDnMK2nn3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhcBfv51d4sBfGGyvoGSKTwRPVjRBR2L1ZkHGz9r6Mp/sSQBmTXngD5CsWV7lQWgPIyRmOM6/vfRygThi3Bn7c+C8EzGYSIrdmX4923iJNonru3o1CBQearRmYn8DOBt2AgwJnLLRpVtra6H+f4IAK93ZmqgOWVflP91tyKFPfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGswHJok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGswHJok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDCFC4CECD;
	Tue, 29 Oct 2024 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730187541;
	bh=lvRF6OQNxK4XvjtKLyh5uUXjztm7duAnqUDnMK2nn3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGswHJokD3l5cEDdtfhJaBrDXZfvGMq4lXn5lpOOf4IhN4VbvXt95/NWrBGxJ8nNx
	 tmAfKWtNKpRAA0Z8cABsKXY/XpAWqQWIFQ0ZitZYPNPwJPukqgpevj77gwwib5zOOx
	 igXipatVXqw8D/dYnfYT8RIVFdE6lRtGYHKktmAU6j2q7nDwYBlc6X7Dop52uowtm3
	 ZLfbdiJxwog/45x92BLzPRKN3l5fIGW6wIg609PsP+uimLfJMw3csS8q4bWhbE8qVU
	 sUO15H0XKWNMXqr72QqDtbZAWN1JN1uqmbsaVaH8KJ2qSGWKbq6wT+bUZbsTp8e0jT
	 52lra3wFltg6w==
Date: Tue, 29 Oct 2024 08:38:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc
Message-ID: <fc5wzr4uzoutpxwc6itabcdtbn72ele3mki7or6luomhtg4muw@4merpns2rwrq>
References: <20241028124518.72576-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028124518.72576-1-festevam@gmail.com>

On Mon, Oct 28, 2024 at 09:45:18AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Document the existing fsl,imx6sll-gpc compatible used with fsl,imx6q-gpc
> fallback.
> 
> This fixes the following dt-schema warning:
> 
> ['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

