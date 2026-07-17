Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA12418A3C;
	Fri, 17 Jul 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296792; cv=none; b=mSux7qrHB3LWSe7OVNv9gJrmu8xduS7qks2Oxz+T4L55l7B6ZzbgRwgLjScwkt7VlOhi7l9m2Rx3RhzRDHnE8DMx4VTgYvIRhTbX6diDH1QAwpVkBLClLtNot9drkocGiS+UeLG3Wjn5PSxY9OeAMgs/n34ZcIUzo7XDoHU2fiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296792; c=relaxed/simple;
	bh=cy/xsKq3fMo5CXtvCkmfY7yTRVSjvkgSfPW2ya5IdDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv/wAIzIguJ7M0aADuEpcdsREAW0YVsF3asIHvN/nQ1vlT1QQ52RK6xXTQZX7fPToS56fJ+biymK6/SQpdudJKlG1TWHzuZJslxOgXvIHF6f+OHAny4zHe6G0ODmFkSGwipg3YjMS+dYPH73RUpgVCHAPNd6dYQSE1pRB1yUafs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaziPRFN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaziPRFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686751F000E9;
	Fri, 17 Jul 2026 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296790;
	bh=Iu1fYMemoRzsLaUDl+FpewPLFgJ5kKqgw36YQDXyJEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaziPRFN8QO4BZ1W9/a5ZtmZBroMmzgtfSeNF2GAyhSPqpTXYewMZBgR+1uasZZfM
	 Z/z3KRSCLHFuVf8xiRUCazJHd5VvMwX/3AGFCurqBATvSapSBizoAkStbF4qNeNTXn
	 tqPgzTKvuLwKmaJCNTtvo8/AJxBDU4xLMl+ZEDmVsiPm7HviaDusPTY4VfReO8WiQs
	 2+f0bZrp1hm8wtngFhaKLeccUuB6bIEKnfQ3R6GVu3EGxqH9Nx/0eH7UCpW24JbDWF
	 v7cOUH130ViIYeZoOCpQzg5L66SPahvmVTm9/XWu1nYwJwuIy55u0HHM3r9j0kWDL1
	 5l+pyf6Yv9S6Q==
Date: Fri, 17 Jul 2026 08:59:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Linus Walleij <linusw@kernel.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Lee Jones <lee@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
Message-ID: <178429678856.574428.4894136808352380805.robh@kernel.org>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>


On Wed, 08 Jul 2026 15:48:56 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
> st,ref-sel. The both driver drivers/mfd/stmpe.c and
> drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
> put these properties under mfd, but some put these under child node
> sample_ts.
> 
> Allow these properties put under sample_ts and mark as deprecated to fix
> below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

