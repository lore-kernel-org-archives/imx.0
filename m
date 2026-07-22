Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A090470E81;
	Wed, 22 Jul 2026 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748991; cv=none; b=Lno2ukp48HUzeeKpY49hoANW9wc6/yNxWgyRNpYpdxjzE03I7WweSQQVNKNDj9m8n28KbCQ2ryNMrv3hmmKiQs2ClYAvLIB8W39eyl72MWPDpzBPoRx+FghUghO+7V16WZAQi1NM/wKFJ+JLefh/XKotJeKi+umpLOhiOreLVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748991; c=relaxed/simple;
	bh=/+Up4uk9y6kZVos1eSAdFUSTyR/vl1WOg7Sm0Udvvdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6U55G9uicWHdGPuBhZ75O92+Cut+3gGDHpSdiMafqHlkLvyo51XiuhahowXjkhD2eKPIu1a4PkMokiQopT9yo1Zjr7vI/fgBZqpLg5+EAtvV/zrYfpI7R7oy2CM8Gwv5uetj/h2aI1N+2AYt3z14+cVY4dm4YinDWzSwcZ1E4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e653/8oK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e653/8oK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B79C1F000E9;
	Wed, 22 Jul 2026 19:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748989;
	bh=X/jEUlSOlMTPAXncWOP9Efk1rF2z5f3nT6juyMPsE9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e653/8oKStnMB2iXpiVBVtU3r5sNFtcL5A2y9jK+RXJ7AFCG1jMXJry2AWZx3NjSb
	 l+uQTSmneRCFGDGmyVYJ5QgbKEGoN2ewFa4Wwv33P080EVtHNrSHJM/r6Sma6dBKTu
	 930PdEj1o0hsnDOKCL9XFsoqrQabSRlBu4ngw/V2mDZ7dlOpLWd8r086natFxF4jv7
	 ojuU3r6ZbtIWzMH23gTlrCbNNHgld4WjrtoVQMWiPM5mmSBbeBT0i7ZkEOXFBcyYB2
	 tnDD0xYV/IpVyd/Nsjf+NXu6Yg17S4sZI9HV9L+KdvD6jU3iTE1a05vgdpWv+HstFh
	 f1wq38ZSDUsOg==
Date: Wed, 22 Jul 2026 14:36:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
	David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: display: lcdif: Allow display0 child
 node for i.MX6UL
Message-ID: <178474898849.1558828.15144971025208605122.robh@kernel.org>
References: <20260718-arm_dts_ldb-v2-0-f5669571aa2b@nxp.com>
 <20260718-arm_dts_ldb-v2-3-f5669571aa2b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-arm_dts_ldb-v2-3-f5669571aa2b@nxp.com>


On Sat, 18 Jul 2026 10:45:34 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The legacy i.MX6UL LCDIF binding uses a display0 child node to describe
> the attached display. Update the binding schema to allow this child node
> for fsl,imx6ul-lcdif.
> 
> Fixes the following CHECK_DTBS warning:
>   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> A follow-up patch renames the child node from disp0 to display0 to match
> the updated binding.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> sashiko report problem and allow dma/dma-names for i.MX6ul. which should
> be fine for this kinds of old platform.
> 
> Ideally it should use port. but platform is too old to avoid break back
> compatiblity and leave as it. Needn't complex if-else branch.
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

