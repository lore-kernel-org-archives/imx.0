Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DB30BBB9;
	Fri, 23 Jan 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158836; cv=none; b=jEQORhbEaR9isS/Ri8Lc6Yt1egKw//8SP2GZnAesfJGKb+zSjl5Y4vdKV/ody1EFxtHQPUZ8lMtSTvP+7VEm5ucP2/67ZJvO5lpqOKF8aIBU5Im12rDe/IOWXDGJ/Rplt8ORfNu2x1x28ItlH1nHfr+PH7HXAbO440xgI2Zs6Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158836; c=relaxed/simple;
	bh=rqpHCY0UZ9Bi+mBISQ+KV7wmWiiY0F+JIqbEBubEN5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK+fJquvnc8IvosNQCY3bILtms1EnErUqnE37Tga+/H5MzbYyNRq9np0zZa7DmLIy6KoKE5onncUh41sfkDUd9GKRmd12GnWfKi7zYivgCaqcO6IVac2mnkacR8mvPOBWKBlCYePkuK/AlU00Y0pYlvhH5BdTOHElv6d23aALT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+j9DT+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+j9DT+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3956C4CEF1;
	Fri, 23 Jan 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769158836;
	bh=rqpHCY0UZ9Bi+mBISQ+KV7wmWiiY0F+JIqbEBubEN5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+j9DT+VQ0UfZBjHzOZAQGPfV3W6xsZo9tdEfqlftDIoTB+TdgCwTU/cgn+IFClCb
	 c9rpetTu1sgQB03j5mrIKZ9lWruBDB/vfsq1x+QnEuuroVx88rdwTD4QKCqT2zjgSb
	 NBHeBkza4fkea415oImiLQUZArpFnk40pIBDOe6iDH+8PrYcZgdvmj9txw34EtdPvB
	 AqJmsdQIEnXaPP4oBTm0tmLSpbJ7Tw8MC3acnGRhaThk+R/XNAlL1tBYiCe8ykGdkj
	 yW38a63gAcYeMBvJgoKLN5iDx/VhCRjDqvPlb0psnfqMbOPO0ot0bxkk1qf33WGsVT
	 lrP4s+TUVpKTg==
Date: Fri, 23 Jan 2026 10:00:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com, 
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, 
	y.moog@phytec.de, josua@solid-run.com, francesco.dolcini@toradex.com, 
	primoz.fiser@norik.com, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK
 board
Message-ID: <20260123-hallowed-authentic-scallop-b388c0@quoll>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-2-sherry.sun@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123024448.3909345-2-sherry.sun@nxp.com>

On Fri, Jan 23, 2026 at 10:44:47AM +0800, Sherry Sun wrote:
> Add DT compatible string for NXP i.MX93 Wireless EVK board.
> 
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences.
> 

I will leave it to the platform maintainer whether SiP deserves its own
compatible. I imagine that yes, but don't insist so:


> The detailed differences between i.MX93 Wireless EVK and i.MX93 11x11
> EVK board can be found in i.MX93 Wireless EVK DTS patch commit message.

Drop. Do not reference other patches in terms what do they provide - it
serves little purpose in git history.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

