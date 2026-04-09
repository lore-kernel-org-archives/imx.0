Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DF34A791;
	Thu,  9 Apr 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724519; cv=none; b=mhhADGcQlHm31sykMuPiCptvFTWrHNtf2eb0YWDZwqU57p7agPLriXI5HIfMyZsQrRbuMQ0Au/3s9aL31SNHSA9v1MvFN/uCsXTARAf70ZJwLODDU47AxJBRDNzNNUF6EorkPj7D9e3Pc1zODbVo2lV/68ghQEiyYg+DPxPBRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724519; c=relaxed/simple;
	bh=Ucrrm+UdDjJaW/Cy0XhWuFhqJm3EGIewHjfu8mGM1Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE8sYtlQsQkUIOV/6yZBOXuCKlqefiqEOs3Vpr6N+sOzyPuaU8OtPpSnRf/FmiWjQ3tjzmqJX8coNdhgtHc6nBPvazOLi0+5zBPQRN7UaklAKwRQ6/MDqlYUXUEpg3S4dwZanpb/haUu7DugfNbZoOpG21F0j4v/898bbQmqFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9YuU1OK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9YuU1OK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41636C4CEF7;
	Thu,  9 Apr 2026 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724518;
	bh=Ucrrm+UdDjJaW/Cy0XhWuFhqJm3EGIewHjfu8mGM1Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9YuU1OK8hE77fbU342lH4ZxNDHUGbiWDT+bNv77/ibID3TxtJB/L7lnD5BHwT2YF
	 RfmCi4Vi8/nRGhRmU0dz6z5TATqJAcNwrjiQzpnOcqTsYzPgAldDVHZY+wie3uuLIX
	 SaoKKeFcbNmJVBB+gFz8iIiTCXogInrBUR1vBCRDMMxG9YNOMV64JmHFqIkenqEv9f
	 skIv/KmbeI4Z+Qh0A3W3T0OsOuTMC5p0HLPkrwS+nSEt1whsmKZexnq4PccbqePGAu
	 U426Wrvo4TLGE/Hvn4ebV6g9fQ8XZ9ZMR0Nbiy7V3INjewrIxucUU9mGx51nzHegFd
	 rpA4Zl9s32ABw==
Date: Thu, 9 Apr 2026 10:48:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and
 HummingBoard
Message-ID: <20260409-peridot-lynx-from-uranus-75a502@quoll>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-1-ce5a39acd713@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-imx8dxl-sr-som-v1-1-ce5a39acd713@solid-run.com>

On Wed, Apr 08, 2026 at 08:38:36PM +0200, Josua Mayer wrote:
> Add binding for the SolidRun i.MX8DXL based System on Module, and the
> reference HummingBoard Telematics.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

