Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE141380
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730530506; cv=none; b=do/UDxTGX0cYzfEO1dH3VczmUGfdX/26xQYTDaw7pA+EucNdDtKabRrpXLVcrVyyJbNyYG9p4cCqS4vtzAgkYaQdm6wmxmy7fP0Qkm8UlSb49TtITZ3iApHdPq4t48uWd0g2MAci55x7mejCTuP6zYdVyCPIeCUnjEY2IVM9QnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730530506; c=relaxed/simple;
	bh=LIKrC1PC8f7PG/hdHrXkTxopHQsZDRMpMKMkHe08hBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sc/kfXghJdJ10FjBZyzRvHRroZF5FctZsZbvTrqbc+yLiPWUccuN9l9iCJCUpSuQKRCDj59hbz7589Dv4RjMWjbpk+rsM1SwtTSF83tMR27Dqx43VmdTYT7vj9YcKze3Eg05qAaV7fEsx+Mz2zqCqFNfHNf5OHm10QH6/PkAJfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Eg6HOusQ; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Eg6HOusQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qPj1anUEXZHf/a1qxTMG7RLU/90Mk03XP663TewCDgs=;
	b=Eg6HOusQP/Yc7vhQ1yztgmQtYUgUV8RiJhezoGlRgI6ohMPymLyw5HTpm8P49O
	Cujla6ELoaoYavWsZAZGjF110N+t2Iq1qOSzmGQ8esR94udtbUrw61eYkNx+qCDi
	g+LXjnYmc1Eb507Uwhyydv5bJQrqWqkPbdrrc6Zh30zHI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHecCyzCVnCQJ2AQ--.14608S3;
	Sat, 02 Nov 2024 14:54:44 +0800 (CST)
Date: Sat, 2 Nov 2024 14:54:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc
Message-ID: <ZyXMssAspMI4uYS7@dragon>
References: <20241028124518.72576-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028124518.72576-1-festevam@gmail.com>
X-CM-TRANSID:M88vCgBHecCyzCVnCQJ2AQ--.14608S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcy8BUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCLZWclsr81+wAAsk

On Mon, Oct 28, 2024 at 09:45:18AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Document the existing fsl,imx6sll-gpc compatible used with fsl,imx6q-gpc
> fallback.
> 
> This fixes the following dt-schema warning:
> 
> ['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

