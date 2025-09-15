Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0C288D6;
	Mon, 15 Sep 2025 00:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896313; cv=none; b=s7LrRXptx4k5cGx80EWnMgsCfOWDdV5Pmn8PgJcA9ta2RbBnJfYXdBT7PiYTl60BUBlum7rH6sMcQ6wU95oJYSBy5J8XqAi8RkZijVM5H65hEclfb7scCCe3NL0xwIu6GOwgttTroQoDB7qLRKGWCDZ6FprITgQ6F7EKyc+T3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896313; c=relaxed/simple;
	bh=4o0YmVyHmVWaq2at96tQ0tiR/PkE6ZDwW+ZN9xlB0lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmyUwXw7AqCcRSa6cwqyVLQyXE2tvstnmH3trQRPmCcAjOqjSy8SRYvH62ToudG6IXbuGNBQncSNmoM3qMpYQyCS6eaXt2qVU3B5xzfLd9jLk+5I52e8qHupCcgeK1lOyDKG2vR06irPKSAkem7g5qdTCQgCxp/f8/8Hss9F/aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5hMe1dX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5hMe1dX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE8FC4CEF0;
	Mon, 15 Sep 2025 00:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757896313;
	bh=4o0YmVyHmVWaq2at96tQ0tiR/PkE6ZDwW+ZN9xlB0lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5hMe1dXiprsNDyFwPihatD0CDifPrvmYxtwQ/n21XVMCqr60HeYYFjg5jkY2QHmm
	 zTKIzGanLRCSMULbnZz3EpkralNJyzarG3EoW/X/i0fiFQSxY1PrG0kyQwTw1nIcVC
	 T9lde+PdAQGGmy85CqsCArXXBGTd47clTUoj2yx/Qren9sAd/canh55yOET5zc8c5d
	 CP6ajbraB2jI7u9jF8THxMIjqjkcYuc2zypuHCVpudhGcVsWyUZFtACJZg1TBKsuqF
	 bEWEof4gOOa4BJaVAOTLF4T1aCHTf7IB06syFAWboJCyCUK/PMqHJ7LV2lS48JJI3E
	 8Sg2/lPrjHaSw==
Date: Sun, 14 Sep 2025 19:31:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, shawnguo@kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Message-ID: <175789631104.2317240.10004704514465285001.robh@kernel.org>
References: <20250910233402.567245-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910233402.567245-1-festevam@gmail.com>


On Wed, 10 Sep 2025 20:34:02 -0300, Fabio Estevam wrote:
> On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:
> 
> - ipu1_csi0_mux
> - ipu1_csi1_mux
> - ipu2_csi0_mux
> - ipu2_csi1_mux
> 
> As they were not documented, dt-schema emits warnings like:
> 
>   'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
> 
> Add a top-level patternProperties entry for these CSI mux subnodes
> and restrict it to i.MX6Q.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Restrict it to i.MX6Q (Frank).
> 
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

