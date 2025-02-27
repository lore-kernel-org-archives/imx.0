Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8889270023;
	Thu, 27 Feb 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740681527; cv=none; b=FFc7uDLAJOEL9GA2Okcyu+ONN5UEnJwl5EWd5TemFIqrF3jHYMMcnQLkNpJ9T8EB8cXTORp6DLK21AOSJKPF/Hk9FVgBjJ4UN4cxChH8dGY38Zy29+1iSFkLu5mpWMI3SNI6xQmS2VaBGj0TtIL32UeCjBx93anMdXD0I9WF74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740681527; c=relaxed/simple;
	bh=Z+caVF3WAY2knsCtcAjSC7EXLJEDrKmetnCISZqADto=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bnU/e0zaCr9uETQyC73ju7D9HNnrj7eaMOjBvAUXN23EVVhjBhOhi2Hjlre8jtWFDfUpx1lM06JgQGuwHcGncflxmi6NWyHV+a2+dBsGF0fhl/0sbekYi0EM8NA3SbUqNcPCyRhTy2INbh7CTm/88+CLTtQ+LqC6P20sTMPoH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0dFvaV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0dFvaV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333F6C4CEDD;
	Thu, 27 Feb 2025 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740681527;
	bh=Z+caVF3WAY2knsCtcAjSC7EXLJEDrKmetnCISZqADto=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=K0dFvaV768MG9I4/TmzvJjYmxtETOpnaffL7ns6oEJdi9HKOEQhS2q1IUraAj8j01
	 0JghJJYNPVjxMmyMwljsL/Md1nqoABcOmYcB5BoCHyAfkoaXYOHycTOtiTZKXlKdav
	 /F3bwBTVyEzTIvkC16xSMH1yDWfricDLqixMLDW0b3nTxyyS11BznZMoOJ+Zu/UIgg
	 gMJ2SBNeHE+K32sVE9vQqTny0c1g2+ROndctN6sogrT4ha7JVb7HOiz3KvyKYhdS7E
	 chcUldFeBAS6npmMbclOBoILZHrMLz6TFlYRUd1F9S8LBPJqjxe0In/+s27POxoCfm
	 F6x2H4O24GVxw==
Date: Thu, 27 Feb 2025 12:38:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
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
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-8-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
Message-Id: <174068152164.3906545.6393185343383919273.robh@kernel.org>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX95 support


On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
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
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

