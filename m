Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B63A1CFD;
	Thu, 20 Nov 2025 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658963; cv=none; b=Ig23B8nA0ynJ4y3uBhIrZZA1/YHTXkYD00Xzc/2qoHAaa1aHEhnbHBg6C4Z8UboOr5CKD5iTn/Hz8oUCfAaYCvQPjCDhLRpNq9JXx43ds65Is6QGCZr9DKMXJIGFr30JAAlKbu7BfXwdep54ApXOTUmkXiVfMEeoVK9Zum+Garw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658963; c=relaxed/simple;
	bh=qSfOFD+42f1IICxdofg+0sJjXxgykQIN2e/Hg34usak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQT5gk+Ej2UADIagVQ2bKU/vU1SrwaOyhZCZNPoGo5OMlHcQbQBhn3SHrsvirtM7FfbodXxibPQxjPkZkAcueFoN/3mTNygPmkImQynHbZdKd8ns/kQdfhaS1mDUeLWme8za5dP45Jw2cNWcDcFPNDrB+6jq6dvaKTvqNGTdvvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb+5A4Ku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb+5A4Ku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA93BC4CEF1;
	Thu, 20 Nov 2025 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658963;
	bh=qSfOFD+42f1IICxdofg+0sJjXxgykQIN2e/Hg34usak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb+5A4KuBIguT5VutFWGsjF3qZyiSAtQLddvB4rr4iqqRsqL4a9IA9pr/sxiHuCCQ
	 tbaW1XCpdnnbtFTkV0qDmRr5rClXW03bu76YEIvl56psKpKhy3YK4DSFxjFC8QpcPn
	 ZJ7Bwy5svKP/j1SYGAFd5I/U7xH4Ms9d6tlttZnq4bBjnqiaXiUPfqXwINV+5Sq60I
	 RmE/OBrlsAdAAHJyCLS3V7v3ZnEpw+j+eLEYC0+/Ep/4g2BX5fErXGos8AH4m5xd0V
	 OVYbgUH3CfkqtmnRLcYDZJgiMRCTM5RYRdJQWVR9axKBykIlQWor2ZTUYpAPmpr/NR
	 bqeeX3kEDl0uw==
Date: Thu, 20 Nov 2025 11:16:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Christian Eggers <ceggers@arri.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/4] dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard
 v1 and v2
Message-ID: <176365896117.1563647.15336573113314132301.robh@kernel.org>
References: <20251118121513.88352-1-marex@nabladev.com>
 <20251118121513.88352-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118121513.88352-3-marex@nabladev.com>


On Tue, 18 Nov 2025 13:13:12 +0100, Marek Vasut wrote:
> Document ifm i.MX8MN VHIP4 EvalBoard v1 and v2 reference design binding.
> This system exists in two generations, v1 and v2, which share a lot of
> commonality. The boards come with either single gigabit ethernet or an
> KSZ8794 fast-ethernet switch, boot from eMMC, and offer CAN interfaces
> via Microchip MCP25xx SPI CAN controllers, UART, and USB host. The GPU
> is not available in the SoC populated on these devices.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Markus Heidelberg <m.heidelberg@cab.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

