Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44A270023;
	Thu, 27 Feb 2025 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740681527; cv=none; b=hpT+fP50W3uauLKdGDR7/ecx3KedbkDHEh985r5N5QvShazTUnNnDHMn9KBsBe9ByR3YXZkn0np5BK4e15YfChGR4WOJOR4adjLWIeYnumSrRQv4Y6n/yIxqVe2RMMqzsLagn/R29X07Q1nbKx0ENM8hXsiuMdOAFJwreXHpW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740681527; c=relaxed/simple;
	bh=ZEh0HdUPc37gEQdO1Yx/0m4K8N8QNoJ4XE94JSmyAUQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ujWJl/2k32OeujL0HIQ5ff7F4Oc4/4uuBEJ0sAqMCNlEyVqIUdQ19w3OeMagqilAU6pFdyUYOQWSrnuGsMVnD0qCU4vIltNhJM9TGSJRlUEcK6uuyeepR0b90zuKHT1UW5xqbHQiMLQvM3jlOjzaCBXQg0WmtWxWWlvq9iVaSMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGbhO7gH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGbhO7gH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763AFC4CEE6;
	Thu, 27 Feb 2025 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740681525;
	bh=ZEh0HdUPc37gEQdO1Yx/0m4K8N8QNoJ4XE94JSmyAUQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FGbhO7gHJzXUFnJvil2Z/hNik5CP824c9iXnrwFxeS6bvvm065zFRSAUXn2XGChVw
	 vMDYP2iEXww5CDxkLwLFmG+QVX81Zqpvf7e6oQiSmVW+Doop55Vft930CC47G2ZmAE
	 XeRvCl8LlRixsPk7hr8j22yXmhrKOFMmFuMy16LmjdFPtFosmE+dYxjmkFNA6Mwkoe
	 JHoUtXwxQWwAmyu+YYLKK3pnV0rbXwh152+IMJdXzuaZ4I08OvokN/a7EOp3TNT9/l
	 MxoUt9KXcQPRyUlyAERV4Nwp4JT/vYyrqce4Cv4oiJId+0qUnlleaiN3LprxnmZ0gL
	 p/FLINMGKEUYA==
Date: Thu, 27 Feb 2025 12:38:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Maxime Ripard <mripard@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-4-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-4-marex@denx.de>
Message-Id: <174068152031.3906478.5706475681847116220.robh@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-valhall-csf: Document
 optional reset


On Thu, 27 Feb 2025 17:58:03 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for one optional reset.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-4-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

