Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E53FFAB4;
	Thu, 14 May 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773216; cv=none; b=NPjA6nPkpe5heCfgXXnE0yclE00iU5hMc3xiBFCgBDuIV5P20XDAroGRMmiqu3BAgSmTMRgE5h/1EABJd4haCkuNpPMr5lnSTm27nwNgqzp87RLMxEnb/AqJV3WTlLJuUYD0UmHou+X5dp/r6k4W67ZB06e3pRE8qmhNaH9LWr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773216; c=relaxed/simple;
	bh=tYsv36+PT51x8rdLun2D3vh6RINRzkNfY2gGHnYj0lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZJ9sRgoPv4RuzFk5JSA/jai8t5GssvhkW4wVbRHS5w3h4PD4N8YeS1WFDhZfvFthtrQwDSS41UjpImNNyCR3D0p2sBk4IZlgKMdRHWvn8Se0pcQU5v1FxsqjBJ5VP5jzWgjnFcWtE2dx1fXbcNyiZ/wyqVcYsbI7iM4ZPBktcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMUGQjNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMUGQjNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09393C2BCB3;
	Thu, 14 May 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778773216;
	bh=tYsv36+PT51x8rdLun2D3vh6RINRzkNfY2gGHnYj0lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMUGQjNM/m8h2xsMDll5ItMrYXeFePrY6CzbuItO/7SqnuZJkao0dGIm3rm8Svdbd
	 57GxSXcQ/ojQGnXI/cuEAoBtyfBPgSwmx3Etu+ydL4bGFOL+J9hW9cn60pGRJrTqWV
	 Jof5afrL/7gtlnLbj2VPdYk3fJNSyJYWFRrxhmAVlVMkGzORiSxZASAQg0Aler9061
	 x4ZX/3pSWL8h7K3IflC+gaP68zM3YQ3uQ8WK+oBgOjfX+PQUhr2x0RhoRTL/k0hBZs
	 HooAl1//3QGmkNR09TQ+9zE0BSaNqd06mwKEvMa8Z3zvOHVgFJ6Ic+KAI8TrGcuzyB
	 ZopBGILhzT9Fw==
Date: Thu, 14 May 2026 10:40:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, jacopo.mondi@ideasonboard.com,
	alexi.birlinger@nxp.com, anthony.mcgivern@arm.com,
	laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, frank.li@nxp.com,
	linux-media@vger.kernel.org, peng.fan@nxp.com, mchehab@kernel.org,
	linux-kernel@vger.kernel.org, paul.elder@ideasonboard.com,
	michael.riesch@collabora.com, daniel.baluta@nxp.com,
	ai.luthra@ideasonboard.com, imx@lists.linux.dev, krzk+dt@kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add nxp neoisp support
Message-ID: <177877321312.739505.3760588703401775306.robh@kernel.org>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
 <20260511132629.1300868-2-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511132629.1300868-2-antoine.bouyer@nxp.com>


On Mon, 11 May 2026 15:26:21 +0200, Antoine Bouyer wrote:
> Add the yaml binding for NXP's Neo Image Signal Processor (ISP).
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

