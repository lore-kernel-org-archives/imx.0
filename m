Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901EE17D6;
	Sun, 18 Jan 2026 06:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768717928; cv=none; b=D9rCRXjz/4auNf1RcQSntRjw7hh7hr2lq0McFtC+hdBwtxGpWpDAZ2gmhb/bbQbflQV2BQ7Q9Lb5xds5npBraEuPwLtDWKTbU3j8cwzwq+qZHo01LRPcrZiAZp5Wun17TZF8UqRoL8n1uu1ueAeaYQyw5rLZxDcFcy7pN48YZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768717928; c=relaxed/simple;
	bh=xwxFLFB+V+PALi90Qr98yNFTuLUgRc4/aKQHk3Dh4Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVPGgNGxG/FNLzKJCUkATKstM++zFEso2vKYRUT22P3WOaPe5a7Rp8VTR486wRemUawjwoZysrQrB/vR+moWnIx83PJNH7R5vX3JYnjfJ6MwwfsEXlQezVLxAU2QGijOhnPJ3duk8vpyQGLnL4JfBkP3DnwDnHrcSpG2OahFZxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZICJ/9Pu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZICJ/9Pu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D89BC116D0;
	Sun, 18 Jan 2026 06:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768717928;
	bh=xwxFLFB+V+PALi90Qr98yNFTuLUgRc4/aKQHk3Dh4Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZICJ/9PuP8XqJ8eNIBY3QzoVGubh2h24qYSCNx0hjKx+MLu9oMBlfBtPfDx+d9a4+
	 G07nnNAYOw5hRlVDUqVlVMttV4aBOPp5Z8s99A0skXt864FYdu7blGUpw09DrS4sAi
	 zVjxwTm7V1s5nbw2w8FA7XSdspl2+QnPIBiB1agHrjlX9ujwdTSfF95nEeWTdddut0
	 IgEiAi2TzcQmTYmvNNOm0GhQw+gdYNwbBhXQqw6zqBlquXHFJvR3MBAFKWvHNsjYO2
	 S8UMug/9/fDIJD76T8CPAPTM89snBe13uhzhK3iH1FNeLzWAz8W2LBKrehSN0bcB4r
	 bnyjLCRFHiFQA==
Date: Sun, 18 Jan 2026 14:32:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
Message-ID: <aWx-YmUJiu403JPM@dragon>
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>

On Thu, Jan 15, 2026 at 06:41:10PM +0100, Francesco Valla wrote:
> According to the HW schematic, the CAN transceiver does not have an
> enable pin but a silent one. Fix the GPIO property name and polarity.
> 
> Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>

Applied, thanks!
