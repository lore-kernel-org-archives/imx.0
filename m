Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E714D428
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745761957; cv=none; b=isFXlxsCXS3LkFvIX2nPUi99tsyA97nz2DtqhoCfsOhYaq/YDqUcbYegag4iPqUBzAuXVKiX/PHPtLsQTf0TfKMdy+IA/C0o/nNospKYvb/dIuikjp0jeIq4TAgcBlF9Fg8kECaf6PEy+s1qxOnHx3NVsAePd7lyVxGaLsG0aNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745761957; c=relaxed/simple;
	bh=UoIHPJ4depb+g8pAi0LtyZ8iSz2y4kJvvn2d28X511c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCtkhMWEkV5JrcxYch/+izmhXzUUqbwHa9gIpWUc9S/Y2cFqeKqAUdDDwZ4yUR1ufRdZfF0SLIrHFj5LgwBAeBuYooEkDhdHyDElN/9Ho75DFzMUNSKBDKf/22IeUFpJtmE24j0a+f69WtbPwWBoYtBkIpXyIv5bJvMR0Mo15BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gFF+/ZQY; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gFF+/ZQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=i4Fnrl096oXKF65tzuRQZ6eRc4onRrFK13fpUbFl9Pk=;
	b=gFF+/ZQYa5fCAE5KYgEvYnr15hbTuWaIQYDpVPvL4hRk4V75FQLpe+wAQEgPJs
	YjpTRhGSpOLJ5Z9JvtLRSAEEfwa46u3/q+ui6qPzsEK6LgcWMoyhNHYpdNQrLA9x
	HYLSj8IGOSJx6x5e/WjQ3RhzPf6vGoqR5qlspjLDq2Ly8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3p0tlNg5o4Vb3Aw--.41011S3;
	Sun, 27 Apr 2025 21:51:35 +0800 (CST)
Date: Sun, 27 Apr 2025 21:51:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	Manuel Traut <manuel.traut@mt.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <aA42ZS8xeyDi9xNO@dragon>
References: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
X-CM-TRANSID:M88vCgD3p0tlNg5o4Vb3Aw--.41011S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4UXFy3Jr47JF4xWr1Dtrb_yoW3uwcE9r
	1Fkws5Xr45Wr45Cw45tFnxZF48G3W5Kry3try29rZ5Ar95AayDJFn8KrZ5Zr43WanIvF9x
	Z3429rs5trW7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8GXdUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwA8ZWgODbOJNwAAs0

On Thu, Apr 24, 2025 at 11:59:14AM +0200, Wojciech Dubowik wrote:
> Define vqmmc regulator-gpio for usdhc2 with vin-supply
> coming from LDO5.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> 
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
> Tested-by: Manuel Traut <manuel.traut@mt.com>
> Reviewed-by: Philippe Schenker <philippe.schenker@impulsing.ch>
> Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Applied, thanks!

