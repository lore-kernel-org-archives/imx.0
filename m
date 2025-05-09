Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC042741D0
	for <imx@lists.linux.dev>; Fri,  9 May 2025 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781361; cv=none; b=TVhjp8bKb3TmSnhDqOUMPEvaaYbPyflL9mL0+BBiiTozd0UvQ4eMhHGIDEfZHnGP7d/nbfBS9f3rUh6eFAUaajHooGzyAQRB43XSNJor4S7suq2LzxXLOvkf+HBW73xYdRDVcfkyjJ4EiBnaFAmju1awPnTXw0GGNuYRs7UFPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781361; c=relaxed/simple;
	bh=ZB3tj06qeN82pVJBNAkf9mM1YqIK1Py3qttOmFT+8hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkGtvejEY68YsQI1NBpGYjEemipK1FTwIVtoKS6THC0T/7qk+cZM/NFmgG5o6OQD1LXknqmOjnOnlfdRfhJhQz0G1R7pog2bH5UNAcmbtYDr8uchWWY4ySL6bA2OrwL95Mg42aMxX2cvMLHjLUk1MgqhI0bfjXf8rO2C4CqE0D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nITavCfy; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nITavCfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4Z44hOc56sc7tDRp6LbTKZWFuBCT/ZU5M/Ll5S92O8c=;
	b=nITavCfydpUq/zRugVRUmUqjDHZzSEhZApe6hu18hrqWJt8EPGBlZEK9abq0Ws
	thu8xstxrqVlqceZMaYnjZA8htnbfglFCHLHakRmb/FqNJly1MZY3QLn1nGe/zHA
	VCN9sXJHVqpaSR1snDBQbo7Iar9QyHYJbUeO1KrXSqDfo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn7xOTxB1oaO6kAA--.37046S3;
	Fri, 09 May 2025 17:02:13 +0800 (CST)
Date: Fri, 9 May 2025 17:02:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, upstream@lists.phytec.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Benjamin Hahn <b.hahn@phytec.de>, Jan Remmet <j.remmet@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC
Message-ID: <aB3Ek7Hs2KFTxOfH@dragon>
References: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
X-CM-TRANSID:M88vCgDn7xOTxB1oaO6kAA--.37046S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOAwsUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxJIZWgdnAu0RgAAsk

On Thu, Apr 17, 2025 at 02:01:11PM +0200, Yannic Moog wrote:
> Yannic Moog (3):
>       dt-bindings: add imx8mp-libra-rdk-fpsc
>       arm64: dts: add imx8mp-libra-rdk-fpsc board
>       arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay

Applied all, thanks!

