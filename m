Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3822577E
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 20:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688825; cv=none; b=hHXs6Ws4p7Gv58d2AFZn0VGKnBpGO/wqjLnGv/AMqTd0fKwOn3F3BQM/3w+XaO2A1EWXq5OWdE19jTABgVFwiw5B/a+t3aAn8cmlVpElFL30lwZTAdyERYn2JricZYSsyFk6aNCPQ9FFAL9ZVzfTmrJekP8taknsmwG4Pzk8Wlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688825; c=relaxed/simple;
	bh=6kHYC34m/Jrp2iEtPPujcH9Lz0QPRllSdJNcwgdUZyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fn1paePxeMhP3/wtXWTbIaDmHX9mmXqyBynzo0aflw0Nxw96ZAXj+QJw0v9hte1C5fjgVQmh+3XhhAmAsIAfWIXWdbcJIjJLm+HJKfYJyPtoEQ3NsVnBBh8EfZGo90rL0/VSFnPKvPtjVFAJwZ+1i+0BwL5ZZqYqNxl264IzQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bjzE60xn; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bjzE60xn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA6DA10382F09;
	Thu, 27 Feb 2025 21:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5paXk8CuIpllFtZyzBI8hLiK7ySHpJX/BjOS1QXq1c=;
	b=bjzE60xn2grbCyDLcgf4cvBjgXrgbTgdCZusBPh/MjDLbijsz7kCSuJQZDVxz+Qeb1x7Ad
	9Gnsm7K6hNbl4UksrjfhaPt67lZLYimUv9rtg/YSZMlUkfHYwOemCV7R0bex8trcHLM6Ec
	TvD1qNWAUI9nMS8Ldp+QXsa1oo7leylqHHja2xJ2pPmsh7VAk8/kn4tc7aAYxWXuRUUk+d
	kme3oH/nvnLQrrBczjGB77HYUgVs4YoIwy/1wUYBipx3v67RpmTXnp1BuwK3lPTh6AcSA5
	3pca0iff+GNUwQYsacCr1LuRzOjLbfAH/svVd30/KM1s8DTJumXHlg9cyZif4A==
Message-ID: <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
Date: Thu, 27 Feb 2025 21:31:48 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>, imx@lists.linux.dev, David Airlie
 <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <174068152164.3906545.6393185343383919273.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <174068152164.3906545.6393185343383919273.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/27/25 7:38 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
>> The instance of the GPU populated in Freescale i.MX95 is the
>> Mali G310, document support for this variant.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de
It seems there are no errors in this list ?
