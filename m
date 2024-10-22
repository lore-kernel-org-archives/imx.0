Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1241AA927
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729559998; cv=none; b=HN1k/ysQjoxE2Yvq0nXEM3xyK9MDSri40/jenBrolZ+ApCNT08EY30NDklkRFIMUFf/ZLEXXPLAUzoUd9Y0e2ZMej1JF3gxmyEQbHO9ttpmpbaPPy/EESr8j5wUwxzqnf4cV4NlyCFMNZNmTaCMebqwU2+dfNqikjZoX0/pzwwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729559998; c=relaxed/simple;
	bh=5baJspTJ0J5mx7/6wivbGp1IqsNi/PO6dUDpAATa/xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOQwUPj9nf5O7A8jIkhKbh3Nl6LnlDsLYxfppwY8YMCOSBNNbBR12bOaAyRfUEsA3bQIRd/ZjSj8cLkRFZ26IiCFyRVjXJGQkx3Thbs80Hv/1H+B9qH90zJ1ebzEQUUEo8Usj57D7UiEIdn74Hg7u8gL7jLgPlQqjWNQhcKaYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=E/g9X6wz; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="E/g9X6wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bOjL/jQ40KAe5D/J0GrcWh3Utm+eplr07wGvM4WXZD0=;
	b=E/g9X6wzZuOWtCp6wpKcHREPql2/hX9i9msqUG8sDQ1eboqbxh0RXJPq9tWRM5
	l/7YZIHlc8eLy9igDv8eIA1X9xUdwiXdtm56Le+lqavaovPDTQWN3X1myl1hsbUw
	0dt1gpdjjSHLxW0ZRESWwyQJXml0rQtVGFA28hf6rFVdY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCH9fys_RZnBviUAA--.5363S3;
	Tue, 22 Oct 2024 09:19:42 +0800 (CST)
Date: Tue, 22 Oct 2024 09:19:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: imx[6qdl|7]-[apalis|colibri]: Update
 audio card names
Message-ID: <Zxb9rOJuRBZR1LTf@dragon>
References: <20241010171128.107819-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010171128.107819-1-hiagofranco@gmail.com>
X-CM-TRANSID:Ms8vCgCH9fys_RZnBviUAA--.5363S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVcTmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxWAZWcWn4mgTQABsw

On Thu, Oct 10, 2024 at 02:11:25PM -0300, Hiago De Franco wrote:
> Hiago De Franco (3):
>   ARM: dts: imx6qdl-apalis: Update audio card name
>   ARM: dts: imx6qdl-colibri: Update audio card name
>   ARM: dts: imx7-colibri: Update audio card name

Applied all, thanks!

