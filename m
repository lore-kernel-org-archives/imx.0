Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2446BF
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553384; cv=none; b=GdrXZDaK9sn/xidnAL69ZBtZy76wxl/CF5uQ+KYyP9HmkEgwCevUFPIKZ9xxaZWNPMjgLWyPCBZsaMrxuusecPEqIdn1zkClZoCiwSWIafKUqfVp0y4/GoJfJHxiion4YFXfzGeUZTVcp2V+4xKD8DsTQJeQ/A8wX83k4uqmPpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553384; c=relaxed/simple;
	bh=TNfS1Hh2qDVkwp9g09AAfhxKpsuDn8HCPg4JSdtr2jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8sKSdYJkeZ9HrSbQlEjg2cKTZrNKTGZCjFZhauc9QfZbZnfuMiwgpx54I+JOwzD9fG24cMBo+M1SCJIXRoW/zPxHlEn2HlPtxtmvvx1ZWRPqI2RFeE8MM5FsIqS/lJTSyWv0BXqJoo21uGwmxbRYWGBzn0Xy/l1CCp4O9V7LUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=c5Jzhewp; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="c5Jzhewp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OANMSXSGbzYV2Jbq+Hxc7epsRFSMcP+fVcz9O3WcUGU=;
	b=c5JzhewptWMmVhFVc7D/bgU2nsO8dbCyPPfwINcNGBHwYqR3TrZ/Q3qX5iHOfA
	auFAozEiNugEZkdS/J1vWTW4pFBoL7YJ4Bycbih6s/6FJkRK1h0CIGqtwzv7YSCQ
	+pt7t9r8fyfmCdA3XER6FLSaVt0Yd4XBJAH03VqD1Lnhc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCn1rLRIsJokvRNBA--.58394S3;
	Thu, 11 Sep 2025 09:16:03 +0800 (CST)
Date: Thu, 11 Sep 2025 09:16:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: mba6ul: Add MicIn routing
Message-ID: <aMIi0WuQQJpyJYXG@dragon>
References: <20250822134955.3321137-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822134955.3321137-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCn1rLRIsJokvRNBA--.58394S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUouWlUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxOH7GjCItPSEwAA3V

On Fri, Aug 22, 2025 at 03:49:54PM +0200, Alexander Stein wrote:
> MicIn is connected to IN3_L. Add routing including the Mic Bias.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

