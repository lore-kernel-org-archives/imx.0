Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3592D10A2A
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 02:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723516463; cv=none; b=i3zfLahasCvj+bOgEa0AicOVxFN3Jg3JQqfEitdg4G3mmRUII3r5x7tKbJgbnjkTuFASdSKgHPLzEZKntjc7aHiFoRgjetvxp0txG6zLzt8JEGAauC5aNNOYSyoO6lRAY71DqTI4ql39yWODr0QXz7NSsJlnRYwkjYtuPuX5xCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723516463; c=relaxed/simple;
	bh=EMeH1NJHx5IUNy98hKE4tOu9I1lZRfEgI6otXBXVUIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXWNahVvRqsH4NT0eblXoZM9fempwnFJEvC0/O+c0C4XFaeJNFNKmyIz+zz28uVBJyNsG4YC2+DZK2uWtdiZ4WRA5eViuwc35rEwlQgBj+FXSGlxMAQMGSGBuD5bskBvn8qcST/EPzdf83WzB1RSK1EHkfqIfwUdh1Xn4qKCwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=XWV/BGCh; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="XWV/BGCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0ZFfYlPCfZ60YODfVnYog5x+aSANQghjZgqNXkiTGMM=;
	b=XWV/BGChF2An0Wg1diKhPt6UtZe94DgIZQlpHqlF4JV4s7g7MxGmv/a8PW90xD
	2IbtGooY88UEzWzAkm6q2lGNhBezZWO1JAnepyvMAKFFpzr5vJDWs64PF2tDixrr
	p0WqYI4KOR8dyTZwn81X2ESfhPSydfvbP/kEl2np+sRQ0=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHz4fyxbpmFMReAg--.37813S3;
	Tue, 13 Aug 2024 10:33:23 +0800 (CST)
Date: Tue, 13 Aug 2024 10:33:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"abelvesa@kernel.org" <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 RESEND 0/4] add NETCMIX block control support on i.MX95
Message-ID: <ZrrF8b91WAsmuFG9@dragon>
References: <20240729012756.3686758-1-wei.fang@nxp.com>
 <PAXPR04MB851069B02D5B71BC7AADD38988852@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB851069B02D5B71BC7AADD38988852@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-CM-TRANSID:Ms8vCgDHz4fyxbpmFMReAg--.37813S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVxR6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRs6ZWa6WIL-LAABsZ

On Mon, Aug 12, 2024 at 06:39:05AM +0000, Wei Fang wrote:
> Hi Abel,
> Can you help apply the first three patches to your tree? Our i.MX95 Ethernet
> driver depends on this patch set to be able to go upstream. Thanks!
> 
> Hi Shawn,
> Can you help apply the last patch ("arm64: dts: imx95: Add NETCMIX block
> control support") to your tree? Or should I wait until the first three patches
> are applied and then send a separate patch about DTS?

I will pick up the DTS one after the first 3 patches get applied.

Shawn

