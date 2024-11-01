Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6EE145323
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453341; cv=none; b=BYvGeGPYSnXKzJ7EHgwjLZmb3BSLN4ld8z0Od2fvM6Y3N2FZpgg/DhUS7bycFpWORr5z5+G5g6YHmnCqnQZk5GNKl8r6FEN92ktuchaTnw0u1X8mmifCZXejJgCy2zHIKCJo/OwuzU4q+cNC3HolE7bXcguI7vOc3M2INDavhBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453341; c=relaxed/simple;
	bh=f6BIz+ojUJWTypTM8zGtuhsZ1lVFeNYt74FygA8sQ4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grayrm2CC9dUx21VSAIDNFdSHVUZZhryD01ziWiSSZ+UnsCm4oWl9EnxcobpVW6fpUy50uvJttHX7kBzEF6fFyTuiGwRz5r6L3es8hw5HAsCs/w7wk8tZycQUzViDYanM07d7UYYSPUBmhi1qbgUDabvMke6pKO1U3GETZvhRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GBkr7Vc4; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GBkr7Vc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Z2TwBYfpElSm/MhOCL9/cehfvLVKgyMFtIi/m3/gOgU=;
	b=GBkr7Vc41c4uZsN7uGdzBSK5PTxR8rNYIUVi48x0UG1KRLZiRwH8X1LX9LrnKR
	XlGZgzpCuj12tyOrfEy45sgOK9k3ma+KzQLqkCbJwBGR0JdFqwjAk4JW+QEUvf9Q
	H8jucQXf5cBqf3stjvlMAP0xS+YLBN6K5zHFhP/XnRi/Q=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3lMpFnyRndp5jAQ--.13947S3;
	Fri, 01 Nov 2024 17:28:38 +0800 (CST)
Date: Fri, 1 Nov 2024 17:28:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v2 0/3] arm64: dts: imx8ulp-evk: add sound card support
Message-ID: <ZySfRAjsPSsgbhk0@dragon>
References: <20241022052919.1946074-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022052919.1946074-1-shengjiu.wang@nxp.com>
X-CM-TRANSID:Mc8vCgB3lMpFnyRndp5jAQ--.13947S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVcTmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR6KZWckjmUy0gAAsw

On Tue, Oct 22, 2024 at 01:29:16PM +0800, Shengjiu Wang wrote:
> add bt-sco and spdif sound card support.
> 
> changes in v2:
> - remove 'status' in edma nodes
> 
> Shengjiu Wang (3):
>   arm64: dts: imx8ulp: Add audio device nodes
>   arm64: dts: imx8ulp-evk: Add bt-sco sound card support
>   arm64: dts: imx8ulp-evk: Add spdif sound card support

Applied all, thanks!

