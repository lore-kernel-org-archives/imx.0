Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E844374EA
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733732864; cv=none; b=l85p6Hc83KSNibfCaj0dwwsPMv98lf+x7Jy0S6px3V41Nw25gu3smUjIMJnygEfTlpeAUCH5WdSFvhMZwvR1ElYDQ0xWinOtOwIiIRm8ANWahtYp5RHrrFUM3/ZrYy7ZAQbyAtxHniDmIB/l3FG6zscKsFUunDaPt1++jCh8rbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733732864; c=relaxed/simple;
	bh=i6UXFMAMIY3QiR0e6G2t/WA9FEry4P3PLtzEmgPIU5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tX/dB+UjlIATxvKnywX7NlqgIobc0/8Mec9Yedh/ZWUzzaXgr6w0xmJi7nA/lTVO2blcmdGj4fs/9zSDhe0WBMAeC8Pln3SO4Q6WCVJNpFQz+VqzllIfI2sf5P9IkPqqBSYDqulQflI2YWGACzOtX/2YWDARyzcY0JFW/+KwSMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AYBY+R2Y; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AYBY+R2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Uck9vxqkblasHvKIYn8GVu5axHgPGfdiHnrPp5elho4=;
	b=AYBY+R2Y5CebWsEEabugNRT1aE9+ieboWGLmtFlDxH5T+brP7bxBHxhheEhVCx
	ciqsJR9CwFRGe4bnLHy4dYj9OOfMK9HHlfx7WJS+6U12tWiYGPT7rgRwDteZxTw7
	XneVSL7O8SZgwuTWrUfsPGaAEUMqvUZ8h0G5iBi/mUwlA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnDkXlqVZn58h6BA--.46377S3;
	Mon, 09 Dec 2024 16:27:18 +0800 (CST)
Date: Mon, 9 Dec 2024 16:27:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: correct the address length of
 netcmix_blk_ctrl
Message-ID: <Z1ap5M0KGCcz5rfl@dragon>
References: <20241105054603.1470260-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105054603.1470260-1-wei.fang@nxp.com>
X-CM-TRANSID:Mc8vCgCnDkXlqVZn58h6BA--.46377S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-PfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgqwZWdWlR9k4QAAsj

On Tue, Nov 05, 2024 at 01:46:02PM +0800, Wei Fang wrote:
> The netc_blk_ctrl is controlled by the imx95-blk-ctl clock driver and
> provides relevant clock configurations for NETC, SAI and MQS. Its address
> length should be 8 bytes instead of 0x1000.
> 
> Fixes: 7764fef26ea9 ("arm64: dts: imx95: Add NETCMIX block control support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Applied, thanks!

