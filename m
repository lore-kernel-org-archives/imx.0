Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF40EBE
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725237066; cv=none; b=F/KAt8JiFQKkvzGnAQZNSQ5XtmUgucOJ/Jgy1QGMOYh8cdBa5vgtO3V8pPPEGfA0TI3DJmDrDBhumObKUsEHpx9x0wQjtK+nkDyb/5PqP3esEB1J2DVZTER/1ij0bgS2H4miM5lp3WueA5NjjF7SOaePlJEOp4qxE1hlaeklul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725237066; c=relaxed/simple;
	bh=5Ni5xmZ5s1jOJyHB1+Euf+oNvve78sG/JGZNDDZsCpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq5eO5vda2EGV7LZpwa9OSIVc7tiEWf6HA3oJuJG5muZRDaforqVRdf1Z5AsMKJfwvsOnFogxVmOvESNJ1Yyfb8kYlH2xOPSoMczFuLxPA1VCLBNHo6R3YF86QFVpP4lnB+gICe8V3uzOBrSlrZtX0zjOZAUfzKjKH0Ni+bzXzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=n8duNEyS; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="n8duNEyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=odYBsQzSId1TEjPBzPPEa7UrY1IArw1yNoSnzcBtmAU=;
	b=n8duNEySSje2OUT0XGHTNBtkR0pUMp6PxkVlAV0h6+dqQQV9laXu8qA7fWdh4H
	YtNxnow/K/OMkG0WtIVaecU/XjEWwyB5FMSBp1Ggbwh2phlSdSULaqkSnWEQOLzI
	vsId0ZKayN35ehm6gEvy6Wl4yV1nB/tpVnx3jQhmZxQ1A=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3v_QUB9VmbYpKAA--.43359S3;
	Mon, 02 Sep 2024 08:30:14 +0800 (CST)
Date: Mon, 2 Sep 2024 08:30:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 4/4] arm64: dts: imx95: Add NETCMIX block control
 support
Message-ID: <ZtUHFEeIY/RgISdI@dragon>
References: <20240829011849.364987-1-wei.fang@nxp.com>
 <20240829011849.364987-5-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829011849.364987-5-wei.fang@nxp.com>
X-CM-TRANSID:M88vCgD3v_QUB9VmbYpKAA--.43359S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Xo2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgtOZWbU5Xc8DAABsj

On Thu, Aug 29, 2024 at 09:18:49AM +0800, Wei Fang wrote:
> Add NETCMIX block control support.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Applied, thanks!

