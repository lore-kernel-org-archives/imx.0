Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129B74C8D
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 02:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723515311; cv=none; b=PNnaaMjiYkpA/es96v+FludyHgl0tAzlaU111fGfj/Y7KMZSZJ4QFmMPvjw2OanE95R3DuX/n3SJTnZ8UrEPtoqtZRAxWiHp2LxlTjGzHUAo4sGlUGOMZsgEnfCZAll6lF2tSWReNTia2Q2m0+yvPamhww+ZkvUeWIWmO5bVECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723515311; c=relaxed/simple;
	bh=Pf5ZElkQmNA2m6aY8AbUjVYVSC9zVbF068LhSQLoXr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMdQxlV1AR2a/PeZ619sepF/PWL8OUNPFIfMGK+GrJtfpckLqB+Vi5YrOrMq3YBzi6ENldn/bu2SK/ICbKNgOjsJshWvTfzQIL+KxNSCtZN8zH2AvI2lcZMK224uhUKFoeSYJl0Cgn4uWNAr4spT3zti46f/IJOWU2ojltH1uuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FKumcd9P; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FKumcd9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oWH5Kdz5Je7Il8az5t2Br+k/4wua5bwNMFZMwTB36X4=;
	b=FKumcd9PEMy5CjqLJzuzMacub1nNOhjTrEekrHs0N3bGfDTBlu8+tgFpmENbd8
	rIEBmWAzC7JAuGOHfCnyoaUmYeTxr5ooMCKWKgKlgixj9B7qT+XswpEP6QSVWRwU
	gZUKxRraVzzmChMxdXBhSgy5QSQbwsXBQYQNOhAr52XQw=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_w2Rwbpmk5UXAg--.8638S3;
	Tue, 13 Aug 2024 10:14:43 +0800 (CST)
Date: Tue, 13 Aug 2024 10:14:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: krzk+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mm-emtop-baseboard: Add Ethernet
 Support
Message-ID: <ZrrBkaNZz9xFQK4G@dragon>
References: <20240725122522.5030-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725122522.5030-1-tarang.raval@siliconsignals.io>
X-CM-TRANSID:M88vCgD3_w2Rwbpmk5UXAg--.8638S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRs6ZWa6WIL-LAAAsY

On Thu, Jul 25, 2024 at 05:55:22PM +0530, Tarang Raval wrote:
> Add ethernet support for emtop imx8mm basboard

s/basboard/baseboard

Fixed it up and applied the patch, thanks!

Shawn

> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

