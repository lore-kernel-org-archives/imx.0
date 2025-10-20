Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186AF311599
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963367; cv=none; b=ro944EgACLOA3B+u9jm5uA6wutN5wYLQGoMC3Ci5D8D3wqwvbAAiwuLEUSYhGEPQ5/zhVXW7t7MQMhyXklx1stqBNz/ATpdcfjgHGkXmFuKXGz4aNHfsWQD/kzWEsmAZhGgGbziMniV5kdhpVgmwCYGvm09pgPHJc67M4QaAna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963367; c=relaxed/simple;
	bh=C5o/D+uvtyWHzdNhyg9IExSHWIVjy3lpGv0CFy/MZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TD/aRoBk3gLNLvYPYUM1SettMGxTaaSWj9Dw4tdY8M1zFDWE3ZVkeTN9V/4j6PjYNPd0r20yNB+KssbYoqcXaHi8QoPsLRyAojpg/333JYMBjJwa1MIOSO5bGp7ZzgisGfy4j3fIOe+674Xas5WNUIyareIcGJ01Dj+ScHJSQRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JKAqWX5X; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JKAqWX5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LJn9fnOUcCS1mQTvgDWkMQL7/Wza3X8Ei2QFf8PWwBE=;
	b=JKAqWX5XH3ilwfNgT/VBxvt0be3Q3kSdPjrNHVAs0shs2gQMEKcmP5j+ymvCCK
	jLmLvzIRBZeu1WmyE/yFMugqDZboC5RCHWFt9twb3C9CvX7bHVDKnAT9Dt9h71Xq
	I8Y8NuNVJvY9jiBzaYGuMDAptqE/SxI1zZBuqv40lhMq0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHtQQNK_ZoIc1TAA--.8980S3;
	Mon, 20 Oct 2025 20:29:03 +0800 (CST)
Date: Mon, 20 Oct 2025 20:29:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
Message-ID: <aPYrDW1lrlWFKw8X@dragon>
References: <20250916055119.135637-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916055119.135637-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCHtQQNK_ZoIc1TAA--.8980S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4knYUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg+lC2j2Kw8e1AAA3n

On Tue, Sep 16, 2025 at 07:51:18AM +0200, Alexander Stein wrote:
> MicIn is connected to IN3_L. Add routing including the Mic Bias.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

