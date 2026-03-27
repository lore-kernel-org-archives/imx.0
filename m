Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9AB3537C2
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612314; cv=none; b=RVd7DLGELMZN9yN0aC5p9mp36m71IVn8h6uIetCn0KFKGkJBQMXWHiU9j+AEGBKdXf7rQWsSxs30ZGTzS2/vERzbmwAWcSSROwgswsdX+a5t6hR/ODu7phD13StQ5UANF2vo/mU40s/MiWOVMnDhiRJAw85iufgM6D3aC21ccHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612314; c=relaxed/simple;
	bh=QGuvPPe1JtZ1isWkV9NXorQ9KG10bT2O55AFrSSxNUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmHw4qD4r/5rbl5Xnp6cDTgOk7MARTZHVWJme13qThbKdjBjN018GuSPKisP8m3WzId+hmMaLtk1hIg9bAWsHz4l/q1FrZFnLPopGNLYkPIMYwzpe/Jxcr0u1aGpRpNnLYG4dMNWGyYjZHsXpWe9inujfhMT2fR78C4i1X6QnUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIpT78a5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIpT78a5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A3BC2BC86;
	Fri, 27 Mar 2026 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612314;
	bh=QGuvPPe1JtZ1isWkV9NXorQ9KG10bT2O55AFrSSxNUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIpT78a5sMOBFX5NsnyJFZHgB1KFWLuNu8+A54M9fKOAD1eIo2GgRVA7fJhis1Asm
	 RyhoIOfYpP9wQWFuR3exP+z763/5teNmCEGZru0gFdRmmvlpwd9xxR3P9UM1JXceMs
	 mAjT2PxqgsxQMTyQ/stl3UNpOvzRamPg5iuFtlLUiE4COvvzp9xdm+Rc5w234Ng0UF
	 Ez3q1Jg4Rt8AFPXPhrnGK2/0LClk2r+CUSSCn2QRcPtgIV9P85G6nQ0f33zNKPAxp0
	 HrNcDOGuJKGTbiW49pPtrU9CjKGR/Kq6g3aT6aJuF75I8qwZSDp+BH4oKtefgD5qdq
	 RMSklOFToqarQ==
Date: Fri, 27 Mar 2026 12:51:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX fixes for 7.0 (v2)
Message-ID: <20260327-glaring-aardwolf-of-joy-2201e9@quoll>
References: <20260323162849.1203617-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323162849.1203617-1-Frank.Li@nxp.com>

On Mon, Mar 23, 2026 at 12:28:46PM -0400, Frank Li wrote:
> From: Frank Li <Frank.li@nxp.com>
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
> 
> for you to fetch changes up to 511f76bf1dce5acf8907b65a7d1bc8f7e7c0d637:
> 
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-17 23:24:44 -0400)
> 
> ----------------------------------------------------------------
> i.MX fixes for 7.0:

Thanks, applied

Best regards,
Krzysztof

