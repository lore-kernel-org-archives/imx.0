Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6D10A1E;
	Sun, 18 Jan 2026 02:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768702326; cv=none; b=KBVHmXtIYhSkFmpjXrCJYrhpWKtaUyQn1ZF46CUwcfLzvrYs4YTtofJEI0bQ6CaXhkaJew1TKdrjXzL5obMQPyINwRjKWbmHhm9ZW/0cucftTBPkxX4UDKI/QFW85ZMrFVhRvU69tu23A0z56xyMh3mG2o0EHLABIg7g6algjl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768702326; c=relaxed/simple;
	bh=M0zEiZONb5Cqp7BvBz5QafxzPpNTVAMF+5FojoxCvUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJJslpPJG1rUblHF0ZiQg9dTRDBYQQjCxfLbPF0xq3JHlK7AQ73CeJEKniq9D5jks+JQzmnzffuzua9qtXDCVVnP9p5xYV31WLzKc/5HlC/GoP6Japy37/bh1Q9r/XMVylWyDqAGrwX54Xx45P2+HmXX/KtCQvSPCJQt21AOTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn/9aonW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn/9aonW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0ABC4CEF7;
	Sun, 18 Jan 2026 02:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768702325;
	bh=M0zEiZONb5Cqp7BvBz5QafxzPpNTVAMF+5FojoxCvUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wn/9aonW34wkqORoUULndtMn1sU65BOVXkG+yXpMdGOLcnkaqlGG3rxCjZJ8ElJ4U
	 i9f7n2hjLeiHG7F12FuGaKh9sCZ7wgN75zQ9mlEhTi+fz723w/fFiQ3acrt5Uq3k8/
	 N7/4EHqAjXdoeuoUQnTzG1l8RHXyjZbulpnslZvHwwZEVjNisT5eMolYwxCgchbtx7
	 0a/PMwls2U+DSCuFGxkytvMgoxVCEYavU44SIS3JN2t//O1O+7oEZgz62n7906xbEG
	 QHOOU1iSlJGEaiHwbVxPsN8f8f/144FQKGOUsXcPymgwdJrhshPbCchXiYTvJ19uRi
	 45giCk1t7v+IA==
Date: Sun, 18 Jan 2026 10:11:58 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Josua Mayer <josua.mayer@jm0.eu>
Subject: Re: [PATCH 0/3] ARM: dts: imx: wire up the TPS65185 for various
 ereaders
Message-ID: <aWxBbnO028gYWvlm@dragon>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>

On Tue, Jan 13, 2026 at 04:31:33PM +0100, Andreas Kemnade wrote:
> As the driver is now upstream, wire it up for various ebook readers
> containing imx6sl/6sll/50 SoCs.
> 
> The driver for the EPD itself (not included) still needs polishing
> which would be the consumer for these regulators.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Andreas Kemnade (2):
>       ARM: dts: imx: tolino-shine2: add tps65185
>       ARM: dts: imx: e60k02: add tps65185
> 
> Josua Mayer (1):
>       ARM: dts: imx50-kobo-aura: add epd pmic description

Applied all, thanks!
