Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04566207A27
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305675; cv=none; b=VM0uHbONWK3Y9Cli2/Ze47GGPFjlb2A6Lc2XRRDideWzjZLgfdgPEV7pFETzvvIc7ZEbanlxtFf7Y0BqWIcmHRZW0PqoVxRfRawtnDPaWMQMuORYUz1cohU+8KN0UiMcIKA1fojKL79PdlBPxZZpt98rOkSl260GWaaaYl0WYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305675; c=relaxed/simple;
	bh=5ciXbicx0GrUAe2a6Ake+9ssAyQWJquLMJMIVbsjX1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IS/iU/Qu2HxbWlOaU7aDX3dfDq2fpRp+vJu2ZfLgCIZRPyYh4TwY5oASeHGbQig4v3e9/tTYdARdn336oDbl3ZqtmD0Jfeq+clKXFk2661gVTyRBYBExKxUXyOT9DUHkAhgrZwM8WqS3eRm6KMwlccQgb7dNLKOrXH/Agc4AB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HUnFwmnP; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HUnFwmnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KnuhDIQHNaECsEm59Nxn5Me/W5soIU7h5crqTMNWTVA=;
	b=HUnFwmnPibjlj4W6KrKKeWx/Z1Rs3/bLJvV4OMFgztVcpnzquQPf1+80SLqL7i
	prrBCud7S/zL8E0hEPnbrU8UxMfTy5J9glJCn8UIHfe/+dqdhW6LbfSa3VKTLe/Y
	ctj8asyB23tQyOr7kKFib9UgTOJwQZd6ENsoNxV2JMUr8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_zpui1Nou2r2AA--.60288S3;
	Thu, 19 Jun 2025 12:00:48 +0800 (CST)
Date: Thu, 19 Jun 2025 12:00:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/8] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Message-ID: <aFOLbiHgnpyDtUHM@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-1-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-1-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:M88vCgDX_zpui1Nou2r2AA--.60288S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnHq2DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBNxZWhTcvRhSgAAsV

On Tue, May 20, 2025 at 08:34:50AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Document the compatible strings for the Moduline Display controller.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

