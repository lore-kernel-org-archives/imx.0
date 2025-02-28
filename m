Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA626AA83;
	Fri, 28 Feb 2025 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745512; cv=none; b=LpxhElCC4kjNIFJnmY64HOH+FmB+HEsw1hpdyUGJnuWFy8wnpwHZ04lpYH6FHBEFu4XodANpb0d962cYzFYCzufR6W/T7BYuRE0PzeotPovnQKvR4PNNQq2uRAZ7fkuNWnitN11CiGo3sgF9+V7C5BXjT5jvWDjifLraXAE/+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745512; c=relaxed/simple;
	bh=8xUimPw6k9q65+hF485fj/0AqnwZJKhGHir+ktIZLPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcoC2WyqchRCNkOGANFTyTUvKD0XP4n/jn8VvOL1z/32e9nQ9ECOlM/4/bPtyLkL4FqjV/8R1D7NGj0bis/yV6UjkXGf3WMfObJJ65xKfTm2VMXJD2gGzJwgvaTK+i7+lvBvlcuNhnwlIMClzA72FdOgheXlVbIcI3Dk9mUgCwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+LfRLrw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+LfRLrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7A1C4CED6;
	Fri, 28 Feb 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740745512;
	bh=8xUimPw6k9q65+hF485fj/0AqnwZJKhGHir+ktIZLPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+LfRLrw+TXG2vm0sDdtVDrAtD/TQmOeDHr4QC8Whf1R2tJuFBvXnzIycRY2KJF0K
	 z33WOOtp+MXMqPWAm1KMVhF5iQOqQfdtdVft7rT5PsVWQDWTUS88CiIoimBX2Erjdf
	 mZ8AUHJcObU9AdODGCdsOuA0nnli58kvWj/YNM1Q7K8RhECd+BZNgXz1krZzsGnhML
	 7DbB8Uy7zReNcDgDTZ/rpNDuT1vKVnTePpQ9RMXCGRAPzVM9+VBSaIj3KacGC6TvTI
	 dG4jYsZIyOLj2vv153M0Dfiw/RrH7GM8pmpz3DgOrYpqMced1CKUiOMDXHqAW+oAee
	 zZTDI8Iv8OSPg==
Date: Fri, 28 Feb 2025 06:25:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Fabio Estevam <festevam@gmail.com>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-valhall-csf: Document
 optional reset
Message-ID: <174074550945.2320385.13428412876070691467.robh@kernel.org>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-4-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-4-marex@denx.de>


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

Acked-by: Rob Herring (Arm) <robh@kernel.org>

