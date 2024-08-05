Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34216143C65
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841544; cv=none; b=VhoU/+Sup/xoQTj87qy2IT87KppoWIjK54bEpdsoVOTdxW9v86+9Fliidi9nKZOFgPjjv0shnv4AjhY1ODVqa1euEq7YtTz+zNyN8zkvGjg5z5Rzitgkq0D1ppTSji4bUspMMRcYjMp1JpQsFokhUkTlXtDq19JsBXGnqca83Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841544; c=relaxed/simple;
	bh=JOMYg8DOG4tLI+5jybSvb28Ohz8S17Lfyr4ACTh6HSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glFktatvqbfvhH/jeI9AGeK0K3R01cdJb1wgQW2Bv9xoD+0l1KfaPkadj8r52k2gntJdSdBNonuUaTmOqGw6SEu/s791i43ctIZCUjN4UxTEa7QMVk4xhH0oz2p14/4R66a0ilwnJFRHclAe4ohOBe+2c3ImWcY+X2fuI3hYUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jnsBO+ej; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jnsBO+ej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/DT/wia1GTJIcjE3GVqGNEeHp3aRJfKhp1ZNlHAsXNs=;
	b=jnsBO+ejPa7FzyvtRqQeJWswmPCJsnE0VSg5vnZalUmcFnuYXWxNLzQa2L2oSS
	T50mCk9s/iypfqGbCzO31LY1QMyipcMjyx7IZcWN3rLVBiMkSyLT5AO/p7intcG3
	KXWkNr+R1ZL1g7fM1tgm6QjJPLUuFuUZ/zX/iJnW1gpN4=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3P0umebBmO_TJAQ--.28452S3;
	Mon, 05 Aug 2024 15:05:12 +0800 (CST)
Date: Mon, 5 Aug 2024 15:05:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX93 14x14 EVK board
Message-ID: <ZrB5picooEBIYlRJ@dragon>
References: <20240628121542.2000184-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628121542.2000184-1-peng.fan@oss.nxp.com>
X-CM-TRANSID:Mc8vCgC3P0umebBmO_TJAQ--.28452S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB8xZWavYGtqTQABsr

On Fri, Jun 28, 2024 at 08:15:41PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for i.MX93 14x14 EVK Board.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied both, thanks!

