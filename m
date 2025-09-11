Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5E74BE1
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757558217; cv=none; b=k5am3/GHTEXSB7gCqMCMUdfhpIjjxUhsPWRncd650pFrbxcyLGeBzG6rr9tfno7ntyI9eaICinryEWrlJaGBa8283aGicFYVxaFkh+rzc7keSD8gCciT/akKBqy2o7V4r0dnerAzV5oca/5mixdj3x8P2rc7gI7mB77Y8CivwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757558217; c=relaxed/simple;
	bh=fZnQdAvO46ck0hoeOgRAeVwDLANdJVf4Jk/B6m+N1PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8xMBM8G80TJN8+WeR8YNFjtCxJ8L9ld+ArTPPZrJIQObpFzwjvIWHY8SuG+BXl1lMSX9wpS8FKw6L4+pGosfHDRbBSIOlR/IKj/WEkakfhSkB91Fhhr6c6+df2hqmRHs9/wnfKi0AeBXpZ3IAuNuHd9Oq02KRYd/ViLDK3WkZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LNUxbfE6; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LNUxbfE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Zu/ILIakLLn37rYFw5PvXVXf22PCnsMSBiyyFDARzl8=;
	b=LNUxbfE6VV4SLAXXaUc2enyKWX3CzNsQeTquFa24c/YqA3DtbIWaWxSlZL2QTY
	j6r6RKdmhYJgOsiVLuvuKFbEgPyZaPGWzN61nCOmjZfyZ0X5u7dwNL1V0cjh+Lae
	eI51un27bmcSFLxOLoGJoerqTZZUZrqziKt9H752u3gjk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnX_mnNcJo1g9gBA--.44535S3;
	Thu, 11 Sep 2025 10:36:25 +0800 (CST)
Date: Thu, 11 Sep 2025 10:36:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: Re: [PATCH v3 3/3] arm64: dts: s32g: Add device tree information for
 the OCOTP driver
Message-ID: <aMI1pidrSAIAwab9@dragon>
References: <cover.1756800543.git.dan.carpenter@linaro.org>
 <7877e1958fa92df92b2b5229365c86493c620c8c.1756800543.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7877e1958fa92df92b2b5229365c86493c620c8c.1756800543.git.dan.carpenter@linaro.org>
X-CM-TRANSID:Ms8vCgDnX_mnNcJo1g9gBA--.44535S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzcTmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAlCp2jCNanx7wAA3w

On Tue, Sep 02, 2025 at 12:47:57PM +0300, Dan Carpenter wrote:
> Add the device tree information for the S32G On Chip One-Time
> Programmable Controller (OCOTP) chip.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

It doesn't apply to imx/dt64 branch.  Could you rebase?

Shawn

