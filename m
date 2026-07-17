Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82468418A3D;
	Fri, 17 Jul 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296686; cv=none; b=eIyNje90wdGU3AlWW1xm3FiN+FNME+OcM4TG/S3XpzgW8VkWKZTbtup2tjH9CKCdmHYFC3UGgPJSCKK/4sMf3qW/aOuW2tMbNDFchPoq3p4YKYnLLf65AcIRcCDWmg5q0N/BbLAIc4uvYj9jn9+1A7izylVwZdPSROeJVkgev68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296686; c=relaxed/simple;
	bh=vduGinzofTHDtS4pmaRqqxEKz3g5MKrCf0cYhLTkvRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hc27S0nOyWBGfHyrUDI2sAXVwSC/58+wNDdno8urS9OA1+d8vEu97MKXe0GgcumAmo3FAw2mn7r5azVICIaf/015QllFT0yweaED+X3p4Jt1cUqh35ZAqZQIaSRpMohDJYt+aybqulDtiqmcZzrSmToNTfNgHqZYzSNERgRnQ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuehBKMN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuehBKMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A521F000E9;
	Fri, 17 Jul 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296685;
	bh=Ku8ol6I2GNj8amr+d2Px6BPLZyxkkAZ51ZvVoBjHDw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuehBKMNwG1Z8PCSI4dvXGpYCjybkvEAlRP0p9Umzzcp4xgaplJbCVTI+m3y6MB/u
	 lSA/L09u88ejFOTtTd5GDDyualgbWeJf6EtTu1psxb2zeJ4RfwxLo4zemhTZ75M1Qv
	 zCWL2lLYwQeNo0aE+oBPBwjz27F54qm5cnR4N0rVVIKpTVNfna2YzfP2dpM5FStCZQ
	 u8fUYrQdAO9O1KxkAfVAZmfnrhop0HJrh9XqGwza06ryY/CV2z1+bl+58AfXuMDArf
	 KmyIE8oXhJ2QDClDiTgVVyRcI3hIL9QP4Op8USxFQ8Kzn118Vck+ViiSEzaLawfKfv
	 244dVDCJxacXg==
Date: Fri, 17 Jul 2026 08:58:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: linux-arm-kernel@lists.infradead.org, Alison Wang <alison.wang@nxp.com>,
	vladimir.oltean@nxp.com, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, ioana.ciornei@nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add deprecated property
 display and display0
Message-ID: <178429668300.558362.15410591849658624332.robh@kernel.org>
References: <20260708-ls-dts-display-v1-0-1986b2611895@nxp.com>
 <20260708-ls-dts-display-v1-1-1986b2611895@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-ls-dts-display-v1-1-1986b2611895@nxp.com>


On Wed, 08 Jul 2026 15:39:51 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add deprecated property display and display0 to allow old platform lx1021a
> (>10 years) to put display timing under dcu node.
> 
> Following patch rename display@0 to display0 and mode0 to timing0. Fix
> below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: dcu@2ce0000 (fsl,ls1021a-dcu): 'display', 'display@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/fsl,ls1021a-dcu.yaml          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

