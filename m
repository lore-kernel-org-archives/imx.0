Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94883215F70
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786803; cv=none; b=NJoZQOdB8hfw/KehMSm4PAx3BcHuhB4CzBPCa4btTihDWVQMs+B7hxBzNcudGV4A3Wx/ICy3KALm1f8H8/GrIrjons5WRdDhp0hCf4CBW7L4fCAnW/DjGn/FoyfJWxfVUTqTmfUGkF/IX49oftVuQfTb+8FLPGFTCRIzd24K330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786803; c=relaxed/simple;
	bh=DORebK+rJAkcdpfoUg2yLd6mXT11QhnNS8Ys58jtV1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMK4pzfB0tdfrUigZodRY9ryVljnag3bYOxMuvV+auGydYv7t53VZg8lNXuocOmO4ek7Vk3nWkdqnarj8B1Zxq+OQ78HOa1wsaU9s/+dGwntI8eHbCebNworGG5pmHHRh+JZSm1Y2/frgCSiTrlaEMTzPI+uAKzvkVr+mYC+oT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hORx4vwo; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hORx4vwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jLolwAPvGVxT6aAEjL3uBdU5olsoXzQXTlC8GliVIF4=;
	b=hORx4vwoIpdqKgJlUC3/ma9uoQDd0rMVBbSndCHQr2X9D+MakWX6BD+LBIbW8G
	P4qnO8OdzRgydsARR56PTkD5kxBOVFq5mGG/cgs1UwQSkxXxYmCopfxETjCOX4ye
	2w4He0t2ffaNutgVbo7wr8qS/S5RsouKfSUv5uOX9mu/M=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHTzUQCrNn4KomCQ--.17144S3;
	Mon, 17 Feb 2025 18:06:10 +0800 (CST)
Date: Mon, 17 Feb 2025 18:06:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: arm: Document the btt3 i.MX28 based
 board
Message-ID: <Z7MKEBkiBatFl54o@dragon>
References: <20241107085705.490940-1-lukma@denx.de>
 <20241107085705.490940-2-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107085705.490940-2-lukma@denx.de>
X-CM-TRANSID:Mc8vCgAHTzUQCrNn4KomCQ--.17144S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Xo2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERn2ZWey2VbYUgAAsL

On Thu, Nov 07, 2024 at 09:57:04AM +0100, Lukasz Majewski wrote:
> The imx287 based btt3 board is very similar to xea in terms of used SOM
> module.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied 2/3 and 3/3, thanks!

