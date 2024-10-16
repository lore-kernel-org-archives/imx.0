Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BDD1304BA
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 03:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050715; cv=none; b=s/pMcihbgqDJNPktZi+t+9+xm7flg7vMbWsa8M8YypkfEPCVOo4HsKpSU2eljW8wFcjSJwwwP/UQv7ZJ8v1GerI+YjeWxNrQ6RMwEnUyaqhXgBiXbXbxoidO19WYeq05Sb7NFiS1mlmHJLr2+c3ncTwSrrmkpdDO9xMbDB0Epjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050715; c=relaxed/simple;
	bh=i0oyF3S1jAQPmVHT/yiLKVxqroap7/90JcQ7zu3JOWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOWt/OHGBQB5Qu/Nd2fCojpLxUu2xNxnTSFhbnJZDjPQDE7Gs1bfCBk/7x3FaXPfV3m+hoHzGUrQoiVrDTzxun+7K55OEzOHd+gwQhSjNzY928PtB0MmIV+TzzA0pPISncxdM21e7tDNGgiCTywbhjBER6uS0tvrZ+wyMYzglj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nlWN4ORL; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nlWN4ORL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jmFozbLWgaQflNtxAhxn4cd9iiQsaZAwFfFa3MgoSxs=;
	b=nlWN4ORLR38AmQbvEj7YsgVRs9qD+jHkac4N/1xLqkv8OJ0C+vk2J8QUGOsc+k
	eoDdCxqZar81ZoDEy8e8G+speyNbLWG8Gt0TdGPixxSIKix1HeBvQR0T8z1SlelA
	t77DAR5AFS7VCNACVqejKaseK8A5CR1CfDERXxnyFesRo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHk_1BOA9nTY4VAA--.259S3;
	Wed, 16 Oct 2024 11:51:31 +0800 (CST)
Date: Wed, 16 Oct 2024 11:51:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: imx93-11x11-evk: add io-expander
 adi,adp5585-01
Message-ID: <Zw84QZlvEqKa4PKv@dragon>
References: <20240903185450.1486505-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903185450.1486505-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgBHk_1BOA9nTY4VAA--.259S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx96ZWcPLTgmEgAAsC

On Tue, Sep 03, 2024 at 02:54:47PM -0400, Frank Li wrote:
> Add io-expander adi,adp5585 under lpi2c3.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

