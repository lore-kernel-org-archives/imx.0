Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3946EB65E
	for <imx@lists.linux.dev>; Fri, 29 Mar 2024 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711681941; cv=none; b=WLAx0rSEe+cPpUmgmw78KCjv+Om+GrTIU653i69SP2aidGEBNsSH7K35uo4y87aohY++J0qT621to7/NOnaAYwuGaZ4Zh9Fq1GpXXNS470G9PPu20vE9K/kIjPa5a8Q7GLNUnxsBhSKUxfhJkzP5Xw7FztwY50YNQLfrIgTC3mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711681941; c=relaxed/simple;
	bh=jK3dY3GoNx4EVppbdIQ7dxkkOvAyy7lkytbsA4pUkQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mukyaT/cCB3RCujd7BoVQINW0Wz8unPIOFAaZxvQAkD52G9+pHivpIAjRgycOD2NoVWTqN92Myn/j7DokAtPxA5Crhik8w8xzYUqtw8aY2+Cwt+QSlAAFrlN5GEFtDZJpj88LBZM1MYUsta8mB9Pk5rL5sK+a2UYSgW5hgUwn7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=L0GmIJGE; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="L0GmIJGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=58Hi+vSS092qGoQrkwZyJIgAtrDsNlDvJNKO6UPHRZM=;
	b=L0GmIJGEIFvJf5nYxJZ2SrJ0ALNA2t7yd++QmDAQIEnAYuaimDmrSSvUFMJwFF
	vSDNQLSB1KXIzkxpyhCEaEbPxBq5ttYX7Q83RsH1Kub8N8cBQ/1g18ndtba2l+Y2
	NG4N8bMtW46FrwTcmmZ2Kav7V0iNGoA2+XyMi45a6oLIo=
Received: from dragon (unknown [183.213.196.225])
	by smtp1 (Coremail) with SMTP id ClUQrADnr0JeMQZmqENdAQ--.13207S3;
	Fri, 29 Mar 2024 11:11:27 +0800 (CST)
Date: Fri, 29 Mar 2024 11:11:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: imx8qm-mek: add adc0 support
Message-ID: <ZgYxXniaORoXOi3t@dragon>
References: <20240227193049.457426-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227193049.457426-1-Frank.Li@nxp.com>
X-CM-TRANSID:ClUQrADnr0JeMQZmqENdAQ--.13207S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQ6vZVsVCaj6-gACso

On Tue, Feb 27, 2024 at 02:30:46PM -0500, Frank Li wrote:
> Add adc0 for imx8qm-mek board.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

