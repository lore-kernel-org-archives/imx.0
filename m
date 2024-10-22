Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64B0A927
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729560386; cv=none; b=ELkTo4rtWxcRzTszUrD/QMgc9hJR5bMC1UZuPGE5ohLpMxr2I+VjzneERF6WtD4TqqDlrfyR8YVNyjfs1P3awdcwPQAVeE5cKrnMnm4aHyNp4LDUXCVuBdWA1nF4NhmufYVzbu4fMaR/X6B/01sU0rpVVtInpfYpQcmBAvCSvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729560386; c=relaxed/simple;
	bh=GNEsb1IDR1LtCglHvquGxieYelSvfTTE/KMUc/uVdmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrrK/qqyqZrKlwPX0fE11x4k9jRsi+HI7aoi+wjW5p6jnySsU109cXlX6KnBPFZrVeRhp3EDxv6p7cWn/qzkAUasqGAcv1ISJT+P36bOVnu14WwhrFpUeBRH2hGF7n4ijBaA4AtoC8njcUvJGE+YzIOj5Xh3ypeueFhOz9TkRdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Nj86iHVW; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Nj86iHVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sZCXentdPD4D2xRsno79MZC4VEJPNh7C5JfKH0j0D/E=;
	b=Nj86iHVWI4x6AgMry/rjvx5arRkwQ2tGH+BctwDvjvf2DQmR/C9WcS2I4Vtlfb
	trMWjRXK7iWRrquJ595I1fxEIv/bzLJ9LJeBjfJfLy4sfoadD7QPU/il2i03Ikya
	WHlkj+oRh46qiDHeXqcwrBedNBiYMp7sG5BBF5FA3AdQM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBn41YY_xZnu7ORAA--.5277S3;
	Tue, 22 Oct 2024 09:25:46 +0800 (CST)
Date: Tue, 22 Oct 2024 09:25:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrew Davis <afd@ti.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 2/6] ARM: imx: Switch to new sys-off handler API
Message-ID: <Zxb/GEC2OXNs9K94@dragon>
References: <20241011201645.797394-1-afd@ti.com>
 <20241011201645.797394-3-afd@ti.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011201645.797394-3-afd@ti.com>
X-CM-TRANSID:M88vCgBn41YY_xZnu7ORAA--.5277S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVFALDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER+AZWcWdwL5JAAAsy

On Fri, Oct 11, 2024 at 03:16:41PM -0500, Andrew Davis wrote:
> Kernel now supports chained power-off handlers. Use
> register_platform_power_off() that registers a platform level power-off
> handler. Legacy pm_power_off() will be removed once all drivers and archs
> are converted to the new sys-off API.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Applied, thanks!

