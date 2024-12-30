Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB1910E3
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735531500; cv=none; b=OBRCRWVNNQU9wg4rPsZYWC8PR7rwjrxwgsRcomEU27ucBgLtzU24Yt+yvd8l2xejEfVjjbB+8xekdAxloMOCASEJjEmHO8Ur82CylA9jK93DmAvt3hfGjzivy1nGkJ6BXyRTUTO8CRJeYOL/pBNGbQmNeXJ6Vl6mItUoktzB0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735531500; c=relaxed/simple;
	bh=YbhemzYc3Dcvk37szIuBL/A+XxwJHE+4xJKHD04qIXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QClIZ3xCNbDbEUbEjxGuVgesfHTekHJFHuSrQHjdfc9S3j1gTmUV6cduWo0pbRnqLS3pwt+pqbVKb9WFGbFGlMdhPpuRCFbTmfBvaFL2uQiFm5unYALtDJ7e5TtqHYXjvIsZ9ol3LX1RN3LwJctEMqLzxB+Qp/RtKyM2HZYdjF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=clyx2ISe; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="clyx2ISe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OX/rFN2ToZOmzEtAbDTU/7yu2ExFG98z9SCi/hu5y6s=;
	b=clyx2ISeKZvpsx4/Q0hsEBdY8F0aZEnH0jhUk505EoZSMzEGx1CAhAftHIu8aq
	x/hhy1Reucjb0w0OTlBbC1as1oFOFznbWOYvI3T/bR4e13vZyH5HCIeb5uD0EBRW
	8qIWIRSjGSa9lSgN2PpXRaouQ5xvkp2xaf5BgYNqCo3o8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCH28jQG3JnIsD1BQ--.59947S3;
	Mon, 30 Dec 2024 12:04:34 +0800 (CST)
Date: Mon, 30 Dec 2024 12:04:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: imx: add phy-3p0-supply for i.MX6 series
Message-ID: <Z3Ib0FYfgMxQuePa@dragon>
References: <20241126-v6-12-topic-imx-3p0-regulator-v1-0-c618ed111c75@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-v6-12-topic-imx-3p0-regulator-v1-0-c618ed111c75@pengutronix.de>
X-CM-TRANSID:M88vCgCH28jQG3JnIsD1BQ--.59947S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUea0PUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgzFZWdyDiU6ZAAAse

On Tue, Nov 26, 2024 at 10:22:12AM +0100, Stefan Kerkmann wrote:
> Stefan Kerkmann (3):
>       ARM: dts: imx6qdl: add phy-3p0-supply to usb phys
>       ARM: dts: imx6sl: add phy-3p0-supply to usb phys
>       ARM: dts: imx6sx: add phy-3p0-supply to usb phys

Applied all, thanks!

