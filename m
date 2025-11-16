Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8671B22256F
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763295928; cv=none; b=QEnvFCTzdm6Odl0BTLB3kunfpE6cSrodTUrLVSOv4pgsu1R8QQcDo6gqsu3A/uyi9tscD/egkRYc++EvKEPvM2Yyb8/2jWpZ2gJvOHXp58D+0uhBkgSs1eWAH2lRw/kZ66tk6z8zbmk+3Hh8eZOMVyM11XN32kzDX/jYZtQ0+Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763295928; c=relaxed/simple;
	bh=kClM97ZV0xHAhFhYdVnIuaBrHpIXn69pRXLepiwbH+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcVaOst3Rw22RKbApFYomhRwdlCIoyVJ4bAVuR3CnZ90QQtxa5HMhsX4UKX7zGTf2+KYlSwce1ICDJ0HFMzuE+Csp5MkbABxi1+AOSZg114Ou5MpcDMUazUAyPg6UBuj3uDSfVJPD2koJsmUZ81rLbJBBtfjTYG3szOzvd3NtW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gbE7CM0N; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gbE7CM0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=b2Tzy4wpEnBc0N39re5MYS8e6Cpyy1OT/u1kY6JsWT4=;
	b=gbE7CM0NAwSA09/hPaYqd21DLNQ39SGc+N7sEA4KoeUHRwGOlm6GF/W5hlEwlJ
	Wd0LVyxzpZ8znLc/wDxdoiLXIGn/f28f5RVE3nkUOLL74fmgmMaK8/ZtqqypcUF6
	gqp6HZcYfY3/FohbeCd3OfoGZZuW2sLTndSv8lHHUuPBI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHw0agwhlp52glAg--.8033S3;
	Sun, 16 Nov 2025 20:25:06 +0800 (CST)
Date: Sun, 16 Nov 2025 20:25:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: jan.petrous@oss.nxp.com
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v3] arm64: dts: freescale: Add GMAC Ethernet for S32G2
 EVB and RDB2 and S32G3 RDB3
Message-ID: <aRnCoAjkfti12We1@dragon>
References: <20251103-nxp-s32g-boards-v3-1-b51db0b8b3ff@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-nxp-s32g-boards-v3-1-b51db0b8b3ff@oss.nxp.com>
X-CM-TRANSID:Ms8vCgCHw0agwhlp52glAg--.8033S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAryrCr17tF1DZr48JF48Crg_yoWxWwc_Cr
	y7GF4kAasrAFZ7Xa4rKw45XFnYga15J348Jws8Xr12qas5G34DZFn8t34Yv3yfZFZ5A342
	9wnYvr10ya4ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjHmh5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOAJ53mkZwqJzCwAA31

On Mon, Nov 03, 2025 at 10:24:01AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for the Ethernet connection over GMAC controller connected to
> the Micrel KSZ9031 Ethernet RGMII PHY located on the boards.
> 
> The mentioned GMAC controller is one of two network controllers
> embedded on the NXP Automotive SoCs S32G2 and S32G3.
> 
> The supported boards:
>  * EVB:  S32G-VNP-EVB with S32G2 SoC
>  * RDB2: S32G-VNP-RDB2
>  * RDB3: S32G-VNP-RDB3
> 
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Applied, thanks!

