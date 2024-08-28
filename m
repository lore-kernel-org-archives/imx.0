Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CDD125BA
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814873; cv=none; b=tNlHXFZdQr/UvOTIvgRg7KLYNLaGwEX/eI1FU6/+pzVp8hLBlQo2u6pQY5M7hv7g9vkU8IKOjDS3kNkoJOScHTF/IVNZDnZza95xsHVLdwB4JoP2prxwXjph9MIERlND5rXwgauPXvVF17bEOshCCWoTSGe3PLFoCIyzuHbPPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814873; c=relaxed/simple;
	bh=CSU9auxuLhf6sFomUIH5ASPqNAgWKlIDFlEAOr2nIYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVp4U9utImLVa12sEaqtu8poQ03t7fJBXVDtuWENMDvsXHEzn8nSsm6NNEUvRKPqX1sKxRVjaezUMjdhdMaY3gjKvvS2NO9V73m21vqZQ17s4Uu5XUtpdwvJjllEF57Mq+abV5d5GqE8KiUIvxP7jm2N2CQmaQot2s6efOr1DkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nV1sagbt; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nV1sagbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DWhb0jkM2zlEwmTC/i7OXXZ3X6PAwFSXHLBj8sVkZRo=;
	b=nV1sagbttxgblcchakJnGQEo6ygbWaLQrPT5waylAoxxJQ7exLRH9J/5rEfWeG
	lbImF5Iq+WO3RHnVk7vAdULN8Luv4YDpzN650Z0Mjk89ciWP+8xwnbUsfGI8lRsS
	4AfFmkZmjK8WBgzgJk25CQjVXBgQEudc0gpjVlwTlYYAk=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHbjP3lc5mJG0OAA--.21770S3;
	Wed, 28 Aug 2024 11:14:01 +0800 (CST)
Date: Wed, 28 Aug 2024 11:13:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: mba8mx: Add Ethernet PHY IRQ support
Message-ID: <Zs6V9+hKTgb3eqbb@dragon>
References: <20240812130636.180483-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812130636.180483-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCHbjP3lc5mJG0OAA--.21770S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIco7DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxRJZWbOh4I-ZwAAsG

On Mon, Aug 12, 2024 at 03:06:36PM +0200, Alexander Stein wrote:
> The interrupt pin of the PHY is connected to the GPIO expander, configure
> it accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

