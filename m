Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0995110E5
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739856925; cv=none; b=nqxqbfD4wcK94YXa6/3LRhbWNL3HFRZwMlgSgtqNUdCDhfSOTTdIf+/y6PKgiZevmAsDRk6TbqWPj4OM6oVhNjGqbxxAcz490GxMH6MBh5lfyPV7vuNBXwFnnFelRT933kc04V9/WW7fgVKV/AXyFPr9uWhF8ciVu3IBmQnHzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739856925; c=relaxed/simple;
	bh=GXux+2bNHW/ofqMkyaA5cdZj5doOFYWe+KH/9bczihk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+XICdzqKMnCzTGZoL4McBTQSgWfW0ZZ3zfCAdviR1gq6f6Hbox/eyzE43yF/h75Xrgzn4DaE69Wo+xI3rrQcfugzMh3hcE6gR73GPwfkaWXVtsuELDSXW6s0A6WND6upu0SnMbdTG+eEkWDufSlH/ERWjbuHogpudXrwgjKNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Vpvn7bDV; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Vpvn7bDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bhwcdtlEhV2tm8XYwIBp93zYZFnlA/GalM7yZ7Dl6nU=;
	b=Vpvn7bDVzGJEPcjeB2eOS2HvMEpvkz0Ni43KP6fFREs7anhS8dJHZ51zfsHNEI
	P+n1IaqylkvNly76632VKXldXSNVf0vzVSxmnAm1XHHXjXAp/MpgAoVN0pYPBTXN
	VQ/Irmbz7GNgWrubDB/PGATW+OI8xpl1c5oK6GkkxWJtQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCn8YsGHLRnKZ4jCQ--.17131S3;
	Tue, 18 Feb 2025 13:35:03 +0800 (CST)
Date: Tue, 18 Feb 2025 13:35:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] TQMa93xx fixes
Message-ID: <Z7QcBZSU28w3tC8f@dragon>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgCn8YsGHLRnKZ4jCQ--.17131S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgACsD

On Tue, Jan 07, 2025 at 03:11:14PM +0100, Alexander Stein wrote:
> Alexander Stein (3):
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
>   arm64: dts: mba93xxca: Do not assert power-down pins
>   arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases

Applied all, thanks!

