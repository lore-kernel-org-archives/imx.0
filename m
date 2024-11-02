Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB12D1DFE4
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 03:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730517709; cv=none; b=iCGUqzN6CYzqoK7rJNNyChv0FJ7Wn5XHhIxdglX+gpI9sz3ImoYv0E5XUSS2GAT4rpONuvvfepWAZ9YNi9FkpyNTyl2AnTNzkOJcqB7q0cSzkQZxoMrGCnOjsoiN5ECecH4dDoRaZefMenVAFF1bU/+4oA5rCXCZiLYIf30idvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730517709; c=relaxed/simple;
	bh=r/WgMGi6XV+IlJ3veJC+r5p6U8YQuLgByj1FhqkANFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6XFQ2D8dsO7270Hl669Jj4wcBkuDaIug/hm22OGK5HF7d6Yj0IZDSHap3OPiDYRaJ5Lo1YENWlZnpv7tyO//Lf/RGKk4+SNWtLW0cpIsdTpRE++xcB713M/Yi8Zuwa+XQlqht9WsUnV0rHy8TpQ2wv8k1iQxmk5c4rZUPuTRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YvqeqwxU; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YvqeqwxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JjL0raJiVUlycOYhCY61dJCO2t6SV6L7FxvmwMjQWlU=;
	b=YvqeqwxUiIF8HgDfuN/yIassynajvdq7Mh3cKvrq7U7SJCGFJM+oy4IoWDE+t7
	Ay37B2QzF6wl9G7Uf0z6ZYaebsm8n44x/rOiR0olwmquDJEl+I2DSYe11imhGbkx
	opZytiRLbRBb8C/pSDWHFvSsOsRvVk7mClivoTyMWp4Nk=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXz0qvmiVncM5yAQ--.14512S3;
	Sat, 02 Nov 2024 11:21:21 +0800 (CST)
Date: Sat, 2 Nov 2024 11:21:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7
 irq number
Message-ID: <ZyWar1bUUufm1fOC@dragon>
References: <20241025004159.1571782-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>
X-CM-TRANSID:M88vCgCXz0qvmiVncM5yAQ--.14512S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx0eHDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERWLZWcliaEkcgAAsW

On Thu, Oct 24, 2024 at 09:41:58PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.
> 
> Add logic that contemplates such case to fix the following
> dt-schema warning:
> 
> anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied both, thanks!

