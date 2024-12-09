Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD4D155751
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733729632; cv=none; b=ffqEIg7ysbzCacHo2iHKpOUnb+EGeo2gNoGBsa4TeRuXBIOA9y7eEd9fZ6+rH6p5fzCicm4xk6oH+ZhXVM6W2rvmGvTnnxaSC4IIrL1qwmXn9yZxhayRlUyLSVEhUTcwXYF/1Dpe/Ho96d0qRsjgX/Q86TcsmqxnEL5OywxDV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733729632; c=relaxed/simple;
	bh=/7H40Njj3gf7vZrVb7miUhyDm6kTIHd1JIEUnPm70+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJSnQto1RjA0amnJNWXfnHsCbPpV2yfNknyIvviIO2o1TPl+7Li6o/59goigFN+h9ceI4qdrB5NgSfia64pyeaJpLCvj2etGEvgBLBVJR7s/VrvxKae0zhCB2lUhizJWAJYvy4XOFznwJJKiSuDstLxhmCu6n08V4xp9J3aJINo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Hfayqua+; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Hfayqua+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DFeocjNOUdIRJAXa/Rnba2ub2M7xywjcZC0gF4rAoMk=;
	b=Hfayqua+CSqQlibYs6L8LzVaOkTNskyTk/hsL30DQNAY+UdzhKUb6IA9KyfpaV
	YrOXfh6CNUcVk6Kd9nM7/eMj9INb1NO0QoObb/JG8m248rS5u9vHcgW0VT7uZu75
	JPl3/pU5w0RFqF8w7O19h1wefCwXuC/0l/udP2qdJnIkM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnpl1CnVZnpINvBA--.46282S3;
	Mon, 09 Dec 2024 15:33:24 +0800 (CST)
Date: Mon, 9 Dec 2024 15:33:22 +0800
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
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-zii-ultra: remove #address-cells
 of eeprom@a4
Message-ID: <Z1adQsiNfYMuVgp+@dragon>
References: <20241018183117.740439-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018183117.740439-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgAnpl1CnVZnpINvBA--.46282S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Xo2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWeNqafwAAs-

On Fri, Oct 18, 2024 at 02:31:16PM -0400, Frank Li wrote:
> Remove #address-cells and #size-cells of eeprom@a4 because no children
> nodes under eeprom@a4.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

