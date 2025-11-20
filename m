Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE842DD60F;
	Thu, 20 Nov 2025 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643424; cv=none; b=o+2FMHXklADI6FVI0MhkeYAN91ttgE9hdDehiWwWQo/VHqyrMfPdY6kltGnraVjlejY7lU7LHR46cMR28b3X/rXPlDlY+vADGk5xteko+tCW9/Ad8urta1r+nLRFE763DrYmiJKEgqWUSqqM97uaVUU0pf8WIQ/j76Ka44JF020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643424; c=relaxed/simple;
	bh=hd6sMa+SJ0IeZhB8q+41mcbcn0mY0yRYIRmyqvPmaik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GYRBukpAnEkcOJ3eR5246wZm33GXdlxeVKhZ8ZM0C/mQoPTAtrFulU8TRC1SSLYWeWZToql5kV++4Y2009OreZFvqPD6O0L/D3yde+acMQTX6Z9zO9gk7c0dW2vfVVOOYTanPuDtH2AKHuN9fQIkCX5m7uZJKtS4AzVQMuXG2Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIk84AwC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIk84AwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8180C4CEF1;
	Thu, 20 Nov 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763643423;
	bh=hd6sMa+SJ0IeZhB8q+41mcbcn0mY0yRYIRmyqvPmaik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IIk84AwCpW70QPcyH44iGemY/PEWQqx1UuYyyWMez1ZnwJ/4b/F3kUhDIrynAn0hl
	 E+NBDmgXCxluUyUhml2IQ0mgKEwUPPvqtxnWCmMy+WmQB3da7RtxRH/YYZrB4K4sLm
	 2763X5T502up7yFiAJHRSpvIm6FC4M36saBHszG3tRB+DLOZKpk2vImv52nuSBtLYl
	 LD866bZN1zO0if13q3NIhGvFht6RMX9oE5A0r9klZM5cSpwxPT8nIrhz7Mxq8r8m+s
	 VYp5azP2RSID6Bb1dKNH0+EVcBEdaFQ0m+WhKuwk7J7hLOQ5Mqz02tPKzB8c0xmYiR
	 oZAUc1LUEy/bg==
From: Lee Jones <lee@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20251114213037.1211907-1-Frank.Li@nxp.com>
References: <20251114213037.1211907-1-Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v2 1/1] dt-bindings: mfd: Convert
 dlg,da9052-i2c.txt to yaml format
Message-Id: <176364342167.681756.13300303810982487090.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 12:57:01 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 14 Nov 2025 16:30:36 -0500, Frank Li wrote:
> Convert dlg,da9052-i2c.txt to yaml format.
> Additional changes:
> - compatible string fallback to dlg,da9052 to align existing dts files.
> - Add interrupts property.
> - Add ref to /schemas/spi/spi-peripheral-props.yaml#
> - Add dlg,da9053bc.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: Convert dlg,da9052-i2c.txt to yaml format
      commit: d2b240f9a180ebd63477d0534633f22e16fe41ad

--
Lee Jones [李琼斯]

