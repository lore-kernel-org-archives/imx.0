Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74901C07D5
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767238; cv=none; b=TiCGY0PXWW5Fa4iGa5wJzWJokLPq+U+elMwLxcne/4R+POUqwy7doVPLyV/v18KovmWkZoyx/dZ90VH/ElaeMZlg7c/2upzmzuYWCtZzah0BP2pU01BD4PH+G5vAeMQmmD7dMIMGgx/K8ZzwRflRtnxkb0DolfWpBpYhVUQC4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767238; c=relaxed/simple;
	bh=DADR1KcJWYsRX0FLB+e/yIKuNZYMWl/9h91AFMVlqpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIBPbWTJ2DXJ/byxoX36chc2kyRmsUUY2GC+M8ccXLhSCuSCsAexEV3BI4CxIBFoByCgXm9TIfdrrS3gxaGNawnz4A+cIsHyKC+vjhOMtLnxMaCMVEik63D3JCDkNGJdl3Avs6X9z0lRwZ4fXnopywERQ228GmVaXzK9V6Y3Ulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=eQ8imoeE; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="eQ8imoeE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E13D102901D2;
	Fri, 28 Feb 2025 19:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PSz7ZuQ5nzLnJet5Y9kbEfPUEX42BXLUnRfN3fMKwQ=;
	b=eQ8imoeEEwidEDudYu5MHyQsLjGLBO8dj5+QfJK9e2JR0FczsFVk87HbncD71csVZAqfeX
	NqtxMeJMIE2eDYNpvkV6pDJpNYP2pKf4UpMnXXPmNweU/w9RFgQHyHC3Vi/kDcQDtgIgTU
	lGkR9vFKdJPU4zaH4OEzkKqebb5/sG74EKmGOKYh5PFC/7XScQvvcbC2GXgL3WH16wBk3q
	AB4jy9asH5ejxdYyy6Z6DdnfxSOwE8I/HdYJN9CFrbULwwWdeBIdG0OzU7y/roQOtPbNYz
	O3lTUWEFE3vEf5Tt37NRw/70PeHGwBobRkeXb5t8wOkcncG9sgLeV8oSL2MBfA==
Message-ID: <b6eed3e6-e416-4c36-9fdf-f14471b029a8@denx.de>
Date: Fri, 28 Feb 2025 18:17:03 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <20250228123010.GB2321092-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250228123010.GB2321092-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 1:30 PM, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 05:58:07PM +0100, Marek Vasut wrote:
>> The instance of the GPU populated in Freescale i.MX95 is the
>> Mali G310, document support for this variant.
> 
> You should combine patch 4 with this one and make resets required for
> imx95 since you said it is required.
The reset support is orthogonal from MX95, but I did add the resets 
requirement for MX95 , thanks !
