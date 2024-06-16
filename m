Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D472A20
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 02:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718505539; cv=none; b=fFcqL2P0LgmjC24GUpzCCnvjhoiwsqSfwKUu9ion8oqdA6zTFxdbjKv7xxRMLpGS9UBeVtLrbe41Bm8x50iHOQud6RWDmJ6wuVxfxBUrdZkhz7VypuETV+SP2uRTmwNqQTiaiTz5LdyRwU9quGpqJMcfWxYW0la11N/qG8hHLcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718505539; c=relaxed/simple;
	bh=h3UxODdhVFKy57fvxy0AhCt89ubN8DhI2wS+NbCXvoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc2xNI2UuLIIPQ35y5rW4pQviWKTuPndJ0j8NZ+sZRjUqK8cQ+UyvOeHCrofoZTox1A42uzr+LbkezCl3V0FKrnjw4onPyxuZCzZDHjGXOX8yyAB/fSfddMxwS0gDrY/m6bVMRQE9FZ6rBQRK4FA+52ezZZF3j/XLSdEt8zFnJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BEtHa3gC; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BEtHa3gC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/fdF5cF7gtCPZ5J0xBShhC1HtNc2hgeK4MXcbJ1iUkE=;
	b=BEtHa3gCUBtjR8WKWQJgtaV5GWyHoW3K7ZMpKIausend7UJZeUWqlGK6bAM07c
	FEXlfmIPQ4zWD7Hg6J4Ur0DE/rKaDz6fXeGmVn+BSTLc4SE/DmPsH9gYZpnFLc8s
	uqYFFeW+FwPba3ysqa8BA9OuwuSZMwxOOPqXqHr1qLIQ0=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrABHrxggUG5mkJ6+CA--.63515S3;
	Sun, 16 Jun 2024 10:38:26 +0800 (CST)
Date: Sun, 16 Jun 2024 10:38:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] arm64: dts: imx8mp: Add imx8mp-specific irqsteer
 compatible
Message-ID: <Zm5QIBDVpFejmqZV@dragon>
References: <20240528071141.92003-1-alexander.stein@ew.tq-group.com>
 <20240528071141.92003-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528071141.92003-3-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:C1UQrABHrxggUG5mkJ6+CA--.63515S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4GQ6DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRwAZVsVCpobjAABs0

On Tue, May 28, 2024 at 09:11:41AM +0200, Alexander Stein wrote:
> i.MX8MP irqsteer has power-domain support, so use a dedicated compatible.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

