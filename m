Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0C221DB6;
	Thu, 14 May 2026 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741038; cv=none; b=NqsHcnPt2bHbZkd7JTpBqeWT556LVS6cCYszmelNLtA0n6f5Js05OurorwHbJU6Wgej9wkYHggpxYolEyilVU2gsGvKDn55KEisX8WVmQCk15aH8FVmUSVTiR9KVXTMmElM2xIzxs4/tp3lTAwjx8Odo1iHpsiasBEnU74Yifjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741038; c=relaxed/simple;
	bh=z4iol9lK0tCBS7gF375F2wgexcgoZs/yOTdmOdhJrT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8gJ2iySQ7VbOkmAb6bjP1VnROHFNRyiFVPkfHJfi7nnLtgRHSqzw4OkyxZ5Lo5Dnu4iGCDAPkezWzd77zfR/SQgHFCXSBE4g5AtEHUdJnsnzGYFSlNBpMPxeSQvN1BmTQpIbKaQCVZ1A85MCtriZ2V962f/0zuDYI8qhr12V2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eqb8nqJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eqb8nqJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEDEC2BCB7;
	Thu, 14 May 2026 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778741037;
	bh=z4iol9lK0tCBS7gF375F2wgexcgoZs/yOTdmOdhJrT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eqb8nqJRD4jn8FUHLZb1zwzarUwB4NXIhnDJ5PXTpnFHWgPdxLXzWOxNiqTvn1dxz
	 9rVAASvmP0A334BlZgTwN8EljEGAkxucD2GVY/BbOLLyFmrWHVhx/VHk+xv47u3q+y
	 1WiADo//KfcdSKqvkwyHzxAIC+WuaZ7btXRjGTr5l7G8FxrBmZiTnqLxfTOCUf3hag
	 6MUCNPcLLac1RM4IYOGp/0xShHU+vbukrN86N3yMcl+PQOFhn5Oma5+Zu8zXOUGlU5
	 BNqjnQKD4aaBKc+wMFZ+YwAYc4M01+/41ln8ozk2JMZ6fZiTg/6K9Fd2O81QLeLu9M
	 Q9B7DCbpfbadw==
Date: Thu, 14 May 2026 08:43:55 +0200
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
Subject: Re: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a
 twins board
Message-ID: <20260514-macho-white-tapir-4f8cf2@quoll>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
 <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>

On Tue, May 12, 2026 at 04:39:00PM +0200, Josua Mayer wrote:
> The SolidRun LX2160A Twins board supports two configurations, one with
> with a sinle CEX-7 module, and one with two (dual).
> 
> The dual configuration was not yet tested.

And how do see dual configuration? New compatible? For the same
hardware (the same because from SoC point of view it will be exactly
the same)?

You must post complete binding, otherwise this feels risky and when you
actually try running dual configuration you will see that existing
binding makes no sense.

Best regards,
Krzysztof

