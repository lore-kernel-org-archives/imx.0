Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964123B632
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547494; cv=none; b=j8u6gJ2B2RlRbclmERt3KOrMwZwPCQDXBvfqIXZNzrBrqTIKrifhZV6MHRCpoLQBcas5GNuG36YKtGUg8bXOTp5n8oIZzxNvdLls6Q+cUVy7ChEpUR8p512jeGWBY0UATFhWwqnElN0n66b/wrj1RopPwtNtTHuRihncIzKUpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547494; c=relaxed/simple;
	bh=qvxtg5gk0Lr/ga/OeGDgHXNL3rEoGup+muqlFn3EJ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+gqv68UM6IOTsQx+J7puY68CWelQWCJwLd3HufWc55wcOJAoCE28TYRSpOpXsx4O0KnoFYMhaSMkJmAr/8g5Vq/oha6f4QsXZQNaiBVFdAxT1dPbnRHjnvMMB1p9o704GWyB4QogJCU3VRKidN1ABthysQ/pdWqS+fe9k8xacA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lE629Zb2; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lE629Zb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=uTONtzzDCzYkWQwYqhc3PDl6+i8mJOuSLhFAjzgzdlI=;
	b=lE629Zb2rdpzW8UCnswCe24aAxqKE7PzYPKYv8FSfJfe39kvC3PYFzD2iF3UI2
	dZD/Ezqj9quZ3mcfCLp0R8BIsAAdt9rE7aRL5lo5DaeqKw8AtHxDCXjvAdVvQrUC
	OLCrvAelb2cUlAF+/+ZUSwHShxmubUDQ4ZyD7LlIm5CZ8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD331XQFP9oZPu+AA--.28142S3;
	Mon, 27 Oct 2025 14:44:34 +0800 (CST)
Date: Mon, 27 Oct 2025 14:44:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] firmware: imx: scu: Misc update
Message-ID: <aP8U0PNGA2d0kSZE@dragon>
References: <20251017-imx-firmware-v2-0-b58f68ec2ea9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-imx-firmware-v2-0-b58f68ec2ea9@nxp.com>
X-CM-TRANSID:Ms8vCgD331XQFP9oZPu+AA--.28142S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUemhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBJTuGj-FNJBTgAA3T

On Fri, Oct 17, 2025 at 09:56:23AM +0800, Peng Fan wrote:
> Peng Fan (8):
>       firmware: imx: scu-irq: fix OF node leak in
>       firmware: imx: scu-irq: Free mailbox client on failure at imx_scu_enable_general_irq_channel()
>       firmware: imx: scu-irq: Init workqueue before request mbox channel
>       firmware: imx: scu-irq: Set mu_resource_id before get handle
>       firmware: imx: scu-irq: Remove unused export of imx_scu_enable_general_irq_channel
>       firmware: imx: scu: Update error code
>       firmware: imx: scu: Suppress bind attrs
>       firmware: imx: scu: Use devm_mutex_init

Applied all, thanks!

