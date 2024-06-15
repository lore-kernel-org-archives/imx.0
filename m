Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F15524C
	for <imx@lists.linux.dev>; Sat, 15 Jun 2024 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718437118; cv=none; b=VpJzTUSDqd7HSgqncA7rwRL4798jtBAxgFezKt6fHaj4k63Ph6BMtWiXO4Gqd2QXWg4wygXyzZ4RWAWuDzyNFKkuOWaVh6aogBY9g3e7xznV9C3VP1SkZFktzQtW2ihLUyquqsrZ90EPQw5wje/IrT3xz9AA/hzG1D7Sxm3WjpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718437118; c=relaxed/simple;
	bh=VtscccgBqPZ9Al4kyY/5E64fLc7TJp+Nx04NWxp9nTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIzi2y2BaYAhVlBfOs0jAz3qra/VSfvDpts8DKZYhXi7Rhisgr2LP/IyqOhc8Mjx8GeWJbayTkXC+1lxN1N2HpuLc5Y4HArehEly1ykbDW778/4VCOt6AxLMZR/LkfSUpzOxpNsAMgG4m1IKqhlsTFc3BT0Dk911kUykmI2XN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZqosBIKI; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZqosBIKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OXJBh4XRa9tXn6n19F9dZpPyn9bj5wawMCr1I33Nqxo=;
	b=ZqosBIKIsIUFOigT6BUEVs0LUvTK09H/2l3gc3hV3rN1ttp6ovncDA9CMhXCjA
	Y+wyBKdTcxXlWtsBkqkVR9svH10ZxihRDmxXOofAcZOWY7j2qLN4N1AHu0ff574A
	rYOOoD76a4Y4RjT7DkQfjWrnEfOF9O/WZxHEgPK/AVXLg=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrACHbfbvRG1m3q7xBw--.33414S3;
	Sat, 15 Jun 2024 15:38:25 +0800 (CST)
Date: Sat, 15 Jun 2024 15:38:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH 0/2] arm64: dts: imx8mp-evk: support bt-sco sound card
Message-ID: <Zm1E74loyi3a4CPA@dragon>
References: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com>
X-CM-TRANSID:ClUQrACHbfbvRG1m3q7xBw--.33414S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI2Q6DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRH+ZVsVCphLrwAAs3

On Thu, May 09, 2024 at 01:14:56PM +0800, Shengjiu Wang wrote:
> support bt-sco sound card
> 
> Shengjiu Wang (2):
>   arm64: dts: imx8mp: Initialize audio PLLs from audiomix subsystem
>   arm64: dts: imx8mp-evk: add bt-sco sound card support

Applied both, thanks!

