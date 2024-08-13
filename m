Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BDFA29
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723534318; cv=none; b=kgTurl6t9XwL7/YxNrCagaaAO9fbAdeCyzsCCgT63s/w4bXQV0oOJtjeoRmDGIM0RhSZbOa003PCvtM3d0rIC9Ri3o+cloCIVV7tfiVBP+lVTljGWgxwZBXAPH6/quIuvmYcdqKO+ayRyr67e5XNqpjbvpnL/nwt41X0beOqoo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723534318; c=relaxed/simple;
	bh=LNbX/eGj7S6s2oQOxIXOz4b2aAignCwMHqgSXjse6/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXjUZJ1AOObvZNXL0dq8JcPYnCFRHVNhMCctYU/MmcLUIMTG7pvJOu7/5X9+wkaqvTIlFpsmekzgxtjxg9xDJV9FgfihrRMdZOpbopENnYLehRWxUnbymY0TERA8HbUcwczTocUUq4pYV3Hobx5vtwjqMEEQuXsjCl5tOJbxGL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ocyy+UZ/; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ocyy+UZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ukwzqntnKiYBe01W6Rd4Je4ETHW/Jrrdv/yN98FKgbs=;
	b=ocyy+UZ/pXoblY3mHzRyFuJ/zgFWPUtsXrLra0hexmbZlOK+Bxal2J/g31csls
	MES9SqkXGacB76coMRN1z2WbrcG3PPye7PAbqRhO634hLru6p/e/SVY5tmH1D1qG
	ls58Qhy9uNVEDbEKoZ9ynrZF2+3Ddk+W5nwhUJlqYdKO0=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3_Y7MC7tmbM5hAg--.39332S3;
	Tue, 13 Aug 2024 15:31:25 +0800 (CST)
Date: Tue, 13 Aug 2024 15:31:23 +0800
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
Subject: Re: [PATCH 1/2] arm64: dts: imx95: add DDR Perf Monitor node
Message-ID: <ZrsLy7hu3gBMedCc@dragon>
References: <20240805201416.2974996-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805201416.2974996-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgA3_Y7MC7tmbM5hAg--.39332S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsPfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRE6ZWa7CfsF3QAAsw

On Mon, Aug 05, 2024 at 04:14:15PM -0400, Frank Li wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Add DDR Perf Monitor for i.MX95.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both, thanks!

