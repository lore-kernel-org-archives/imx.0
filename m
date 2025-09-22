Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739472E2850;
	Mon, 22 Sep 2025 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557794; cv=none; b=RdQ2Wz8U7sECKnqVo75bClxNA9brUZ88qKqG7iUT02XQOceg1unW0fAbc3sZM7GnpCUriACBfRYlpJppj6Oua6vY9L4vXMU50ldIlPSGWQIbOfH0OUoZzpJlDnqkj82dBZqhL2j+GcU+YqjJAc5r2D/CUqd/XbN3jczSbQa1k2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557794; c=relaxed/simple;
	bh=1dfMpJNe9CaQr+gmF+4ghG/X4jd+YzJxvDL8/008AXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rcn5thASjqQw0Ox/1vb/XEdNMlQJw+OZRbjis4fSWi37RSte9bT7Ueel5tz8qhAMrsz2MKS3mRxn2MT89gyR+vovXT7QrlQHZgPAlxwd6dgeBsLG8eYz2UWcU8glKgJl5b49fB6TTMo5DKBsFWDFoSIYXr+93uyJUA9EgpjPP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvAGmm7b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvAGmm7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA87C4CEF0;
	Mon, 22 Sep 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557794;
	bh=1dfMpJNe9CaQr+gmF+4ghG/X4jd+YzJxvDL8/008AXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvAGmm7bHQaJTtovurC5Tgd1tn9qExeJQlWnQ829g9Sz3HIU2MtewyqqT8t4yWxTS
	 mqmOH10mpt9skq8e0m+5ex9mRyG2MQmV+OsrXtLnv1DfdzCJcv1+1a11FHS09l2cxc
	 3DBV1KZJePYrJoC9YSCHvOcKJBwZh5xQmFZ1F+n+uxcrX5ri5ltj7V3/bBu8KuNKIl
	 u9lenqys7VfZvMK1BeRvWBZzovdzsqH3QQlJOhzLe0gCbG6JV5y437PTGTH69cIjPe
	 T/nb2lGGSbCUp+qYnvAxRJh+IqAo10mTVTRMBnXd1iC0njEs5IVEIGekEAzSRGe8py
	 q/d3PU96U8bLg==
Date: Mon, 22 Sep 2025 11:16:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] dt-bindings: display: simple: Add
 innolux,n133hse-ea1 and nlt,nl12880bc20-spwg-24
Message-ID: <175855779086.199115.18124595806588777298.robh@kernel.org>
References: <20250915155123.3250823-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915155123.3250823-1-Frank.Li@nxp.com>


On Mon, 15 Sep 2025 11:51:23 -0400, Frank Li wrote:
> Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: /panel: failed to match any schema with compatible: ['innolux,n133hse-ea1']
> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /lvds0-panel: failed to match any schema with compatible: ['nlt,nl12880bc20-spwg-24']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - update commit message to show fix CHECK_DTBS warnings.
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks!

