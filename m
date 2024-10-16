Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D77B290F
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 04:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051252; cv=none; b=HNxeESQn8uowyVoYd/pT3hTg+1l5QVH0ecKxNZV4iT+CLxfIHQqjP4Lj7NZioz1yRbuUoTFDrspEeeaDqOL9TwULQzf9BVZxW0mdiYdY0GrKoauyc7COecpFvaZwq0Da6VKgk8nVSxFu4ZcQu8P4X69aEa3Lp8yWD/QO1FIboFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051252; c=relaxed/simple;
	bh=omqPBGfL8vY9QxcUXb4IxqKQrV+7pN418hzMeS5LWDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1fSksCsM2ZLCA9gcWsSFR/TQVURd3aZhyLgK3UOxyOVK9sSUfWCxeXCm8GdtMDt5gz6VHXpy620qpEC5OQB8fCmRelUcBxdLJqJp0EGn5I23GubPVREV4gB0EwK21jWGNfP1ClU4oiVukQkNU1cS0dlmHCNg5YKBJHOeA5vwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GxGuLaez; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GxGuLaez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vPZCVFvAXxX1o1BhtfXHyQ4idi+RTaxyCNJJM4SgxMU=;
	b=GxGuLaezYXAzAIcfSWa1mg2l7EgwfX32PDzftal5vs9HxR40m6+5GtW7+EIqAU
	TMHlSACRjCioCvGDMn7FVqOUQDgb+EIS/+Gbu2caKN1CyqbjABJ+gEmNSCMTb5hN
	ljZ/mSmZhdE5Vb8Z0MhOe5TiWFe0jl0Ce3Wdh4sM4lm9w=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3Pw9fOg9n2rYVAA--.293S3;
	Wed, 16 Oct 2024 12:00:33 +0800 (CST)
Date: Wed, 16 Oct 2024 12:00:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shijie Qin <shijie.qin@nxp.com>,
	Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8-ss-vpu: Fix imx8qm VPU IRQs
Message-ID: <Zw86X0V4qBJdcP+a@dragon>
References: <20240904114104.1841269-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904114104.1841269-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgA3Pw9fOg9n2rYVAA--.293S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7g18DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhV6ZWcPEZ+TTgAAsj

On Wed, Sep 04, 2024 at 01:41:03PM +0200, Alexander Stein wrote:
> imx8-ss-vpu only contained imx8qxp IRQ numbers, only mu2_m0 uses the
> correct imx8qm IRQ number, as imx8qxp lacks this MU.
> Fix this by providing imx8qm IRQ numbers in the main imx8-ss-vpu.dtsi
> and override the IRQ numbers in SoC-specific imx8qxp-ss-vpu.dtsi, similar
> to reg property for VPU core devices.
> 
> Fixes: 0d9968d98467d ("arm64: dts: freescale: imx8q: add imx vpu codec entries")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

