Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F22256A
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 01:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718586720; cv=none; b=J4w5kueBe1kD+7FwZ58N6XHdN0bD+VYOyFE7ezOp+7ceIj37i7+xE5pHgDFC7RiGj37S00cBMglGCEAFOkAQRvbCUjD1NkMOvn+gPQ+yqCI1iYTWHSH76RK82r2OmZwEon5z8rEh2ZlnG9wrflIZ5idftJzEjEIntT7+cDULv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718586720; c=relaxed/simple;
	bh=CyvIaEn5iuYOqrb8yjEXHPmKIrnGbCY/lTru3LsPQek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgIA1Ul8v5rErjjvfGIWUozcKlTBtbYq1bJ/teBKias4kU1/9jRyOwy/wC9bbJn17vNJxeJ55VPQnFBCeS515Imkdsosdv/KH1Z1RryVa1qkLFn2iaHB8Xmr7Rqp6XKQ1hQE3XmMnXYw17bzF46X5PV/hhRs2t6//BKKEHfzT0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PCYL7qJW; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PCYL7qJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aAq9Gr3amCNlURamGwpyh0KqzXamXGYVnTXo85CprPQ=;
	b=PCYL7qJWLWSg3pDxWVLfOZ316TzJ290TIbRVhZwLiueEtsA18X3gZk5gGGvOzn
	GZi6dxamVb+iY1PR9UXmi28f4SMfJKDpwjavKeVuueYwXV8nOrsfO5bTa38RBXIR
	V9Pyg0qpcrDd0+30Qef6UA5pU2oITfKme58yXBJdgaPu8=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrAAnCPFMjW9m8jkLCA--.41607S3;
	Mon, 17 Jun 2024 09:11:41 +0800 (CST)
Date: Mon, 17 Jun 2024 09:11:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: e60k02: fix aliases for mmc
Message-ID: <Zm+NS5Y//+R6w4lI@dragon>
References: <20240605083950.134479-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605083950.134479-1-andreas@kemnade.info>
X-CM-TRANSID:ClUQrAAnCPFMjW9m8jkLCA--.41607S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsznmDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDw0BZVnxc0xPZwAAsZ

On Wed, Jun 05, 2024 at 10:39:50AM +0200, Andreas Kemnade wrote:
> Since commit fa2d0aa96941
> ("mmc: core: Allow setting slot index via device tree alias")
> mmc numbering are changed, confusing boot scripts. Fix that by adding
> proper aliases
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thanks!

