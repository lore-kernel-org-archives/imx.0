Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F43176AB2
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 03:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718593990; cv=none; b=EmGvAphkCS3K5SrcTL5HHiwUJUxCprqqqTgqkIKEBSUaEWs+xaxMr3PGxla3CNbNKvtw2Bf1TTgsX3M0pX8nD7xu1hcVZh0SFsClLPub6Bybvheekezx8AvVe8FMKxx4p7jFATdUl9CMirh5WBebtVayeUm7WxtKxn6U3nHU0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718593990; c=relaxed/simple;
	bh=zj/fqqcObenxYpX0qz9FYtu/tltE0vWw6FSWiUkxYZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNZUOWAE5gvm76AzB/dFwboFJLW1zRlZ260Iiy9T6x796Sot9XZBa4JHokmOuedpWynOnqX0i0o5r+ESu4XYdqj8yHfzL0mONf80d5VIeSKu8zaBM53huZwwUXLC2adqUOq2hXHTXmocqQvijz7KQoQTnRIkXj5LPcAA2uCxcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lthuXdck; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lthuXdck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Elo/3F/DKvAhetW3CuNDbc+tEfHM8u7qL4S3xO4cKOU=;
	b=lthuXdckltaT6StJ2NUBkR1X6QTCPMJFxlsoVTrnCY7UgNFBhv+45ok6FY9OE6
	+ArWZ92Sne7E3CiNXx/6HX9bx/QZHqmLivc7jYuJndOo62WY20UBe/nxbV+zKz7G
	rC/xIuvCiXh9jDb+gLJQAKb7H69DWjB29KK43K8gKa6uI=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrAC3Hxm3qW9mycHOCA--.4193S3;
	Mon, 17 Jun 2024 11:12:56 +0800 (CST)
Date: Mon, 17 Jun 2024 11:12:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: arm: fsl: add i.MX93 9x9 QSB board
Message-ID: <Zm+pt+gg4I9YOp9Y@dragon>
References: <20240617031145.20057-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617031145.20057-1-peng.fan@oss.nxp.com>
X-CM-TRANSID:C1UQrAC3Hxm3qW9mycHOCA--.4193S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIku4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQgBZVsVCpzaawABsB

On Mon, Jun 17, 2024 at 11:11:44AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for i.MX93 9x9 Quick Start Board.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied both, thanks!

