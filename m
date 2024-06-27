Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D757172F
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474765; cv=none; b=TUsIXo+eyRU1s15hv/Bd+LV9dx7Whq3D9vEvsVv3OgI9Kswz3nmGxTnZh/5IJeRoVGIZxEbuKaCcPKTFdLrzOGEHl9GaGX+kr2rK15hdn9U9C88L8Ecb7H8Ef1ub46kyehC41Y0W7TV1YJEu6rOS0gC5xJT/NVboX52iwkDfN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474765; c=relaxed/simple;
	bh=GYU8HzIdO9hP2JGYf0FV96iOrnHzrbnLscaU/Hs1bXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpuQ4JKr/fNdjW/Z1vp+2qgCZsWkIQFCIPmjE8b+Aok7ZS+Im/uKQS5dKcpKXkl7LdsPCMclG1vhW/DKXZr5sTwNk6leXO7r+WGVhhUE8WZ5EtvwpomJg/58vBF95SUxNR7UmrOzB8u03Icb3aKz19xBbx5WnGn9G9jGhZxm7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SmeuuByr; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SmeuuByr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QXWOD1o91C9uwUf55ogz7RKsgNBQyzukXCYzNlkSrzY=;
	b=SmeuuByrA3RzzJp+BSKvb71mCndt/XQo1w/fuzaVqXpXv1Rft3U1xsVsswJ4cw
	njUHA39THvCIDQLa5znKVjmYjJ+7EOLWDyStZFgJS/ZVDx7Kd0pf+BnFSYKznvJK
	54xEalcn0jl7PJ79ZMXqU7eJ8DB8wBnlKHEOemYi/PojE=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3H44vGn1m8t4ZAA--.53094S3;
	Thu, 27 Jun 2024 15:52:17 +0800 (CST)
Date: Thu, 27 Jun 2024 15:52:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix pgc vpu locations
Message-ID: <Zn0aL5jz8162ImRr@dragon>
References: <20240619101045.6317-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619101045.6317-1-aford173@gmail.com>
X-CM-TRANSID:Mc8vCgD3H44vGn1m8t4ZAA--.53094S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-o7KDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhELZWZv-cxPuAAAsi

On Wed, Jun 19, 2024 at 05:10:44AM -0500, Adam Ford wrote:
> The various pgv_vpu nodes have a mismatch between the value after
> the @ symbol and what is referenced by 'reg' so reorder the nodes
> to align.
> 
> Fixes: df680992dd62 ("arm64: dts: imx8mp: add vpu pgc nodes")
> Suggested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!

