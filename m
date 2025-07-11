Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A84469D
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752212947; cv=none; b=ljJ+LO693eQ1cdrJYXqj3GvLbcWzZ4pZe/1szv1RhRNmJDuIfDan4KKZOfw2htL9a83sV/tbYazUbVnYpeaIRKJmUVKuoufUvFJN+L13H4rroYAcKlVh1UexmQLPGoVstXsdk+9tEnlZQ3PuuXJ6tg++zu7PPeMOQbPQ8xFuZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752212947; c=relaxed/simple;
	bh=nLHSptOydqU3sd1HGj41xS54ASHMzq03kbynAozo8V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X81E9fNAwnulhBryXPwj4y7G3YAes7eKEZbZdhChBnk2uXsKAuCc3srIBbwmYytwRObzVhAJMww1S1dXW3NxGT2C+a++Xn9O/aF6rhTBdbDmP2yAtYIGbAI5R8Q0bWA4wKMc/BPKb+WB2usfTr4tPvi8/5avWlzEAg8L+eGqcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Y/qrJMXG; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Y/qrJMXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GlJko1hEIFB3Xv6RCR38uaerUEqKv1vPAiOCkuwmKnw=;
	b=Y/qrJMXGUZrgz17RUlwvQNX6XeMaE+1+eVcSakyEbmHNY0dxF4fsSb9hxhHZlm
	iP6+bd/GdNtZvvJA+OEcnJ1PcG1GfSpx9kn986y7LRdmfwe7C0UikcUpO65+eqZk
	SyZcUweGyCQUh4QxAxWakFoTDnGvGD7JmZB44N9+Y2LBo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXNos3o3BopgpPAA--.47957S3;
	Fri, 11 Jul 2025 13:38:01 +0800 (CST)
Date: Fri, 11 Jul 2025 13:37:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode
 nodes
Message-ID: <aHCjNtw9G7joUnka@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-2-Frank.Li@nxp.com>
 <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
X-CM-TRANSID:M88vCgAXNos3o3BopgpPAA--.47957S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzxhLUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgSHZWhwe3SZbAAAsW

On Wed, Jul 09, 2025 at 10:48:15PM -0400, Frank Li wrote:
> On Wed, May 21, 2025 at 01:34:04PM -0400, Frank Li wrote:
> > Add jpeg encode\decode and related nodes for i.MX95.
> 
> shawn:
> 	can you help check this?

It looks good to me.  But has the binding change been applied already?

Shawn

