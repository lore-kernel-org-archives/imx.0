Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4F225762
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853720; cv=none; b=hPYPOTe5pxy6YqHTRf9fSONSdqhSDeW6ZPyB7TWtS87jywEOIUahnJDg5/4cp0yrfHwddNwrrZI3eEJV/eYZGZcK0jdYD5YYvLTyA5jxmeBuiA13GN1Y3lXvPFGUSHp8K7Z+/CKGNteL2a8NnLfymbUTVQJ6rjOer8e8G7PnP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853720; c=relaxed/simple;
	bh=AMVish0knTsB4uHBVqWYys6IdJKKToqtvi+Dm7acPA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICMSjkcevr4PbMfiQjEOwSw7r30QgLSrjB6zpYW/Ak4mKAnnBdsN5iQcksdj+IxOHN0HOa3yA0fmhMIR3LAg1apbG0+NfApK282Cwc+gwWnluY+MlIpgo5NWZ6CoRfJDTCi+WyONlA/6ZqdM70Hj6PVQoTEznT5MiTiVuqtdQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Pchf78Se; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Pchf78Se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Pq5FIUVbk41Ll/76FA3FSDCaWx/FphWlFTXL1AII6Jk=;
	b=Pchf78SewR9yVH/4I3ViAbKvx71tObGe5nO5njKpURzIBpJEBfC1caRw2jy/Vi
	L/NwcAPbNAHe98ktwWpogq6Wn3vbd7r6xaExL0w3nrUfRubrgaNM+tNg1p6xWpY7
	a4yU5jiqLxcdsItELiVlIqFevVEYHHHh3hldooBQFQwiI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXDveBM6hoij0oAw--.7939S3;
	Fri, 22 Aug 2025 17:08:18 +0800 (CST)
Date: Fri, 22 Aug 2025 17:08:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 resend] arm64: dts: freescale: Switch to hp-det-gpios
Message-ID: <aKgzgMMFvofPi_Tz@dragon>
References: <65670a9983c47919317e02557f072dbe0426f48a.1755099817.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65670a9983c47919317e02557f072dbe0426f48a.1755099817.git.geert+renesas@glider.be>
X-CM-TRANSID:Ms8vCgDXDveBM6hoij0oAw--.7939S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5VyxDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQMxlmioM4OlFgAA3S

On Wed, Aug 13, 2025 at 05:44:46PM +0200, Geert Uytterhoeven wrote:
> Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in
> Freescale Generic ASoC Sound Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!

