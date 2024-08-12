Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC2020322
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463129; cv=none; b=Uo4u2MHOdIKhBnJRBHO84UOgG7elQFdi7BAHTurSP1a5LdnibPYV/knWNIE1fsuvX9L0n2EYvb55DcBLghWw72kVCEjewdwbd0z+YavobpAA+RsWhDZhdfTuF8kyNIN3bSj79+df2mkBfapO+o8OdD4H6yj/osUw6pWo4w2hbFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463129; c=relaxed/simple;
	bh=RQzIP98eTU09Qu10gILWyWOC5UI6sWVuzdcLl7xrMCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0d4i6djUzk6q2fzr5Mls/8Ne6lDmJ/btpoMgsCFIC47lKebJzePSpaq5vbQ5f6VK+hobRr7t1jUmY7NvHQOdvRUVUmUUnSqmP10S4BmGHj2PgM6HgKCXr7qsm7QomgrNetg2gHqAw9zk0jRgiWOo4QUtUvZ2z8h+N1UsXNECAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QLC1x0dn; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QLC1x0dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aorH0qG+kJbHSBn1vZn5uJ/vcbDeUNHXpZL0nUzb42Q=;
	b=QLC1x0dncSAh6SzFT1xX6OeXAgRUJCflkbo5+usXM5Lmu+6G5F2rZe0IMrWmkF
	ifzuLwj2oEzb6vuHG7HCoh9t3FflhwnbT7u23rp8V0+VxhPS2+IskkmSNN4pYioo
	aw5fiQ9kKP/ezGBaKM6sPuWA+0y52+wp/qDubSFWJ5D3w=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnLy3A9blmjN1KAg--.44347S3;
	Mon, 12 Aug 2024 19:45:06 +0800 (CST)
Date: Mon, 12 Aug 2024 19:45:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx8mm-tqma8mqml-mba8mx: Increase
 frequency for i2c busses
Message-ID: <Zrn1wA6pJXXa7Nec@dragon>
References: <20240723110146.3133155-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723110146.3133155-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDnLy3A9blmjN1KAg--.44347S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa0eHDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAc5ZWa57GwZnwAAsG

On Tue, Jul 23, 2024 at 01:01:46PM +0200, Alexander Stein wrote:
> 100kHz is only needed for the USB Hub TUSB8041. But as this device is not
> connected by default, the speed can be increased.
> The other busses don't have any 100kHz only devices attached.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

