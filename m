Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080372343C5
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872961; cv=none; b=DZkLJlOjfqB4IkvzveJ3IH9DhSb4vW074DQY5ApqNbsq8Wbr2OB53rUOUvNN2pU+AWUvhzw/Xxbf+r6tOv1cETRrUikQFZpMSpa1ugiknYCRtv2ryKBGULKGYqJCkWLm143GgmFFGeJPQAreiVxwr6VJMqvSGTBuQAFDHL8uo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872961; c=relaxed/simple;
	bh=yGAS9BJDuUiHX5bsVDV2uJP5vXig9Fk2mk29K2nc028=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyzdMBfvMGDuHxkom1s3Bdyr8yGKCqHTCOWMCkUp2uD3v4vEeKbTWU0oQhO/YB9VOmVzIhoHckz+CpZ72FD0QW17kgog1AKQ9JQXrzrMXY06TvHaDZmyPsVRD+oA+gqRdMbpd3eZwyFQt7yLmyVi4g9K5rJdv/3FVkcdprKeDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=O7Woy1Y6; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="O7Woy1Y6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zaXVPd8t0VO67w3iZYFtfLXnSe8QC8xmMPBwsH0TuvQ=;
	b=O7Woy1Y6fI1cNidy2k135tVAb7Fp/6WiaMGPD6RhQWIyc8/2aUF9eKC637+Yxe
	QujN/GV3PqtH9pZrbXJ68ReIFmVa2hklGpGRthsKVFuSpON9tejdk9PsXlVrVXPy
	Oyg+Hfrv5TMBKcoAeIAfxwP2P25lB1J9a60aJdmD4FzEw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCX3MqnWrRnpNZhCQ--.20227S3;
	Tue, 18 Feb 2025 18:02:17 +0800 (CST)
Date: Tue, 18 Feb 2025 18:02:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx5: Fix the CCM interrupts description
Message-ID: <Z7Rap8/l2/V5scVU@dragon>
References: <20250112152745.1079880-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112152745.1079880-1-festevam@gmail.com>
X-CM-TRANSID:Ms8vCgCX3MqnWrRnpNZhCQ--.20227S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcGYpUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRn3ZWe0TrUtvAAAs7

On Sun, Jan 12, 2025 at 12:27:44PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> The CCM nodes are not following this format and cause the following
> dt-schema warnings:
> 
> ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long
> 
> Fix it by passing only the two interrupt numbers.
> 
> Run-time tested in on an imx53-qsb board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

