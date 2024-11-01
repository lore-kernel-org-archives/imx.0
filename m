Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E30156649
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449614; cv=none; b=bdKE3/phB83otqRM2ALz304c2oFURBQZJwvw/4a+rIRFfmZxcpA8yhC/q4HJJ9YF4Y5WOt6UTwnOXmAJ4oN/A6ugtSdORgqIEDZSE8wOJFGNHH7kCEtlBCAuynaplTnGXWAu8TGLRIJawklksvBFEQS6Utq1fNH0CzrOc+DcyO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449614; c=relaxed/simple;
	bh=qz+sStLf3csnHSVervtbuwoNFwpbuAjWD3eBqYi2Rrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ1PvGWh7waKEM1wGhoUbSCcWiiBf1ksP+ba9IQPV13ww6WeLXrZNZlBBfoFwwRmHi9sKjcS5gUXA2mzx5x3JkyExbH0lFPGVO1fssk+YSH7U8NUPK2dY5ge6W69Gz125wjGqZ3dx5GrP0ZY5DnurNMgrGOxF4FJdsTE7uBmTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=b1KqIXuO; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="b1KqIXuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pIZ4297mYks9TlNfZB/eCFyx2Nv7liMlVOj3Uim+dgg=;
	b=b1KqIXuO36LLkH4jukpFtZ/rIBd49x54x//dPgK8gHofkebhw4UwICLC6q5WgX
	YmZI9DjdyVt+iezP72zjkg7z6TmUT21jj/n+0QPct7A+quZGWK+5goZG4gut+bq2
	UnnJ70z01kWqBGST65ni7unB6dOIL5o1HIlboqbV7HSfY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnxfgMjiRnKmJfAQ--.13668S3;
	Fri, 01 Nov 2024 16:15:10 +0800 (CST)
Date: Fri, 1 Nov 2024 16:15:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: carlos.song@nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	haibo.chen@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH 0/5] arm64: dts: imx: Add LPSPI alias for
 I.MX8ULP/8QXP/8QM/8DXL/93
Message-ID: <ZySOC+STuelEZykQ@dragon>
References: <20241018034532.2552325-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018034532.2552325-1-carlos.song@nxp.com>
X-CM-TRANSID:M88vCgCnxfgMjiRnKmJfAQ--.13668S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFWxtF1xJr1DGFWkZw47Jwb_yoW8JF17pF
	W7XFyxKw1qkr4xur4kZFW8Awn3JaykWF1fXr4rt3yYkwn5ur98trW5Kry5KFy7XFW5ZFyY
	yayUJ3yxCwn0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jb5rcUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBWKZWckjIUEMAABsB

On Fri, Oct 18, 2024 at 11:45:27AM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Now there is no alias for LPSPI on I.MX8ULP/8QXP/8QM/8DXL/93.
> So spidevB.C index B will be automatically allocated by kernel
> incrementally from zero according to the order of registering
> spi controller. In this case, it is hard to determine spidevB.C
> is spi interface of device C on which LPSPI bus. It will cause
> confusion when operate spi devices in userspace.
> 
> For example, in I.MX93, When LPSPI3 and LPSPI5 are enabled
> without alais:
> 
> :~# ls /dev/spidev*
> /dev/spidev0.0  /dev/spidev1.0
> 
> After LPSPI alais is applied, fixedly B is the LPSPI index and
> C is the spi device index in spidevB.C. They are the pleasant
> spidev names. Directly spidev2.0 is the device0 at LPSPI3 bus
> and spidev4.0 is the device0 at LPSPI5 bus:
> 
> :~# ls /dev/spidev*
> /dev/spidev2.0  /dev/spidev4.0
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> 
> Carlos Song (5):
>   arm64: dts: imx8qxp: Add LPSPI alias
>   arm64: dts: imx8qm: Add LPSPI alias
>   arm64: dts: imx8dxl: Add LPSPI alias
>   arm64: dts: imx8ulp: Add LPSPI alias
>   arm64: dts: imx93: Add LPSPI alias

Applied all, thanks!

