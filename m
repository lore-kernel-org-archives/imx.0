Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76395155345
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735544987; cv=none; b=rhOs6sIH85sZKKnJAvuUqb4blXvDBXKGT6Dq09er6ZKb8LcFuKpAvrm0M5o/tuoRrkq5aF2kwmH5c1ncZoMjOnJQcSQv21ScLWsNHaW0cP3F/j1jPNzZ0X62oWCuj+dW/HXfb7hSpi4SrcoGWXPbbFqw+Zz8vLrJLHdRxNE5F2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735544987; c=relaxed/simple;
	bh=vyceG+Jy1jCQ/j83YmEe2FiALq+lYcu6uHB00cE+1Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCf3E9V8GLpxvvMM8ECxE46NrhxsppDk7gTKAKPi4YnKQcWGmOtigHOYVKIBiaA/1bRjgUySXcH+4ekD/FiRU5D7WMx2Eif27+k3NTc+1mw9EnEzmdiuBHfvcIduKq41QLSChmx3ElF444b7kp3ukiNmcYn30vVMuEL5VvhJp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OYM1922p; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OYM1922p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=stkkzQ0NGdLWxEFE8mBuddW732lN8XbJUV0E782b7gs=;
	b=OYM1922pSwyShKq9idwjWUua37d1pRxWhv6A//z7mlnkF8Nzk1FCTqt+iSFG3V
	hEsCEPN83Pm+H80cY03ZorwVfBw/wiIoJkeACS97yLGQLr8Oh1GUR+pwc7hGGfeY
	9GOqNcNfaCXAB4M6vfBRJn+Kxk5RHM20QhlO//6dmG5wg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBX+Np2UHJnmRwGBg--.61233S3;
	Mon, 30 Dec 2024 15:49:11 +0800 (CST)
Date: Mon, 30 Dec 2024 15:49:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, shawnguo@kernel.org, xu.yang_2@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH v2] ARM: dts: nxp: imx6qdl-sabresd: add dr_mode to usbotg
Message-ID: <Z3JQdnIObYJk/rtW@dragon>
References: <20241216040722.21738-1-hui.wang@canonical.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216040722.21738-1-hui.wang@canonical.com>
X-CM-TRANSID:Mc8vCgBX+Np2UHJnmRwGBg--.61233S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIb10UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxjFZWdyEhDb4wAAsc

On Mon, Dec 16, 2024 at 12:07:22PM +0800, Hui Wang wrote:
> Currently there are 3 type of boards (imx6q|imx6qp|imx6dl-sabresd)
> based on imx6qdl-sabresd.dtsi, they all do not set the dr_mode for
> usbotg device node. The chipidea usb driver will configure it to otg
> mode by default if the dr_mode is not set, but some testcases need to
> parse the dr_mode from DT and decide the follow-up test strategy, here
> set the dr_mode to otg explicitly for these 3 imx6qdl-sabresd based
> boards.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Applied, thanks!

