Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38F31DED5B
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757560978; cv=none; b=ntU72+OprEXCc3Iu92LD2hXH92Q2FkQCFGbjjPhOjG0oFwz4BEk2ZXFdgHbjcm1xvIUMHBv/jBnBeNxTeOJJxQyu6bluGl/S1ed4+SVfHQTQ7eTBQdCB5Caxxmjdnr3dKRwclUun99/g36ObHzAt11Iu+Iz7Aw1klgCyNcIjTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757560978; c=relaxed/simple;
	bh=1G77BigPRMZi5VbYGFj3vPc+tY7bX4tVaDZbtyle2Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSXwTOiNPXYzAuvPy++6NPc50Vm2O6KMarDbCi5fgsG+YO3rWXs1r3yjdbBoyEqBvDNOR1G5gobqGX/6YtdjgPj75Nlb00z2o0qWwCzqNfai/5l+R0+BX4vhc72i1m5rAlpYJe6Ndy6QZip24SL9LG3KlhF5Df2bS2GTlJzCh2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=frCjEGxs; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="frCjEGxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=THlvFbB78RIDz28+vysH0ce88JgTgR3a3bl/ZMN0Ldg=;
	b=frCjEGxsW1ezgKWmLhsN0TmHjLL2JoC5L+raMBoyUyvnOAOSNStaIaJQGHF9u3
	zurLhWJVjJIDL19H+plKT5YNLLNmV3Zu9IwdertN/JX3hHRrbUpnOg4xPwGS9Fg9
	kkbbhEEmSiIpiv3TQ115gyE+1rAtcDiKciz7UAZ8EhWU8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn3wx_QMJoV4hgBA--.15626S3;
	Thu, 11 Sep 2025 11:22:41 +0800 (CST)
Date: Thu, 11 Sep 2025 11:22:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, Frank.Li@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: add standard PCI device compatible
 string to NETC Timer
Message-ID: <aMJAf_L0AbVfat5m@dragon>
References: <20250904020049.1397308-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904020049.1397308-1-wei.fang@nxp.com>
X-CM-TRANSID:Ms8vCgDn3wx_QMJoV4hgBA--.15626S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQL6YGjCQIJmVwAA3g

On Thu, Sep 04, 2025 at 10:00:49AM +0800, Wei Fang wrote:
> PCI devices should have a compatible string based on the vendor and
> device IDs. So add this compatible string to NETC Timer.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

