Received: from proxy41135.mail.163.com (proxy25215.mail.163.com [103.129.252.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCD23C8C9
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.252.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631209; cv=none; b=DEHI++RAoTObfZGlGiXapBjmFNnUGTfA+SwUTuLNTI3PZwryzkyCy6fMcl4uDpYohwcua3TGA67HDQoaIytGuDRbaGF71FsGMNw09iz/JxmeDSim6NBlGFAaJUuckoBvBaWspyufFTaujQOWRx45hwZBzk+Y4fCV2o2eBIfENUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631209; c=relaxed/simple;
	bh=K01kD1CXP4y2QvIDW79/rq2TlSMRwkIQQVW462JBFmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH5YdUT7S19UhAk4G7sd4JCNZzwyZMa5uBeFGLcd2d2+CY7RXMQRS4HwLx4jAsqasrVp/bIMWr+Ju5LpPsSD8n4DSZrrOkKtGZ+On873R5GwqNKs+mteusceHIUjIXMz11ngrdCoA2S5TX/Xdllq+fDOjvLJq0q+t7PsOJ7iEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cXeBc1fD; arc=none smtp.client-ip=103.129.252.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cXeBc1fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ahMwYnzAqR2ccux8pEM9neDBaxqHAvqHao7Hj/i4BgE=;
	b=cXeBc1fDyuCnOgI1P/kEJBnpW0hvRhbh+DUKSFrRLqp798QPGZtjWM+AleqnS4
	UdkB0yM0B0UpZBk9YL8Rbs0oTRvlDIO1pBFdLatlmPSDattVvdTbGkqcJedj5W18
	NobAAPqqAYTnn4oMeK9oYqLLdhK5J4UYwTCPYMCAaytbY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3180UPkloM8lpAA--.43803S3;
	Wed, 11 Jun 2025 16:28:06 +0800 (CST)
Date: Wed, 11 Jun 2025 16:28:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Message-ID: <aEk+FEq+Ivj5wfVW@dragon>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-4-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-4-carlos.song@nxp.com>
X-CM-TRANSID:Ms8vCgA3180UPkloM8lpAA--.43803S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOKsjUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBYBZmhJPhYL6gAA35

On Sun, Apr 27, 2025 at 04:32:30PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
> compatible string for all imx95 i3c nodes.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied, thanks!

