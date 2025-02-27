Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344719DF52
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688822; cv=none; b=eEfce2AAzex8LFBm0Zfn4YmekZDJAqLgvhtw6IUGAo0ljbuJPoIdrKghwDutUWYHtwju/oOlsIXGKu2g2I4pv1Qcjf/1V9VFs6JDupF9OKR/5Qz/MlNdcj+RfAv8RVfn00rsDQOG0pilA9TwZv/sPobqf+ufoV2oP06SXsvjZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688822; c=relaxed/simple;
	bh=MF8I6te1K3qz6y2VrEfd37qQ99PRoXXDs9VHbbxDBi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QShwcymtKR1629ovSs19+t5lVc3pJ8Ub68OBrqvtcNWq0ozPVqpPgneGLhlXMkw8JWBZczBXiqeAXpTntzgRqvGYouURkcRaS6E30ZsI6WeSSPR7hJFWOYHCYHB8P0UkumUUOi8oqKonQbudX5A8VXmKeqos/n3paon7cywHeDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Y6udNiAu; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Y6udNiAu"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CF6E10382D2E;
	Thu, 27 Feb 2025 21:40:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8ACEuyNDLYUMJdsnlbLhn6wugLzJDUc8NzlV6FztT8=;
	b=Y6udNiAuASjGCPGlDzD77fbQ7ezJlJ4K2/iMpZltQjf5aZffExkoSZB9KKYv+95Fqsvb/q
	nkcIXtTK3MtOF6SVtekIt7nyeVCsrq9VfxTci6Bk5cCyBlisvdNPb4m75jYpY4Nbfvu0e7
	hscqaePaHkjchYcwSAhQGqPLEM2hNUjUK8UuzxowRAh+n7LGWtmOx8Sgij+43mgyc0HCcd
	r5j/Iba2E2z0zKQ8hmy0egAmG4CyyDuVEVMZ2mr0BDYploZQkWcf1WPvy9xtBpWmy51zPn
	GUWOnK6CDK4QJNhOi+zneKlA73/eQPbBb4015Y2mAjzdchoIDwnfBpUpX96JDg==
Message-ID: <53b63cbd-612f-4da2-a957-ab7adbdc3802@denx.de>
Date: Thu, 27 Feb 2025 21:22:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-2-marex@denx.de>
 <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/27/25 6:30 PM, Frank Li wrote:

[...]

>> +examples:
>> +  - |
>> +    reset-controller@4d810000 {
>> +        compatible = "fsl,imx95-gpu-blk-ctrl";
>> +        reg = <0x0 0x4d810000 0x0 0xc>;
> 
> No sure if it pass dt_binding_check, I remember default 32bit address
> reg = <0x4d810000 0xc>
> 
>> +        clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> 
> suppose you missed dt-binding include file for IMX95_CLK_GPUAPB
Sigh, I knew I forgot something before sending this series out, thanks.

But we have a bit of a problem here, the IMX95_CLK_GPUAPB macro is 
defined in a header in arch/arm64/boot/dts:

arch/arm64/boot/dts/freescale/imx95-clock.h:#define IMX95_CLK_GPUAPB 
               (IMX95_CCM_NUM_CLK_SRC + 42)

Shouldn't this header be moved into dt-bindings/ ?

I can use fixed number 83 to reference the GPUAPB clock in this binding 
document until this is solved, even if that's not a nice thing.
