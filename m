Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C52D29C3
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763295245; cv=none; b=JZjSgsz2fGVnRt3Y21U/CpnLgXb16rT2jAwoaBBNB6zGMr6BgaFpp2Kn+zeV8r1iDWhLEgus1NUuL1zrEV9RoKR3bY+k3YvilnGmmUJ24J6uHBbLk1+9LIgcftPfF+UqCZYw+jL5qQGWrFRf5C523Ba2xGZImHJUDidpg4RGgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763295245; c=relaxed/simple;
	bh=iJ01YwiG2W6Icq7YmLu4Ty5cSzM3LN8706VHTmyAh1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVVVYwL9yXYWUekrnu9xpu6PPea8IeolddTFacwn+EOthmRUHiRkSvLLarHAo2W5vQ3YYZtfI4KlZQ7bWf8gc2z+YLD4gk//P40KTcCjsMhORwP27v7jE3zDC5uxU90oknBLPjaiuuveJgubwNcn0GcShgoxHeBeOC6PUhxypCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iTFGbxP+; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iTFGbxP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/OPyiJznobP/BHgzUxfvT09XKk0Ntk9H61WV3izV1lk=;
	b=iTFGbxP+M1RUepI0KtUkpEd3L+aOtVf8Tn2bX/apDpjKL6YjvlFNTTlRTDoVwU
	g6nC2Ee1uOhQtuDA3zN6A6SPJJR9JgWsCGLEBAKYsQW3VwJZoWrx5jVlOSB/7Onr
	bMALZvZCmHLWwo5IPClwNV0LGRx8TtPRM0QjKMvSPR9HQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnMQj4vxlpXUglAg--.8013S3;
	Sun, 16 Nov 2025 20:13:46 +0800 (CST)
Date: Sun, 16 Nov 2025 20:13:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-apalis: add pwm used by the backlight
Message-ID: <aRm_-PWcJCW3SPsE@dragon>
References: <20251031125510.433175-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031125510.433175-1-max.oss.09@gmail.com>
X-CM-TRANSID:Ms8vCgCnMQj4vxlpXUglAg--.8013S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2eHqDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxrONGkZv-pOBAAA3o

On Fri, Oct 31, 2025 at 01:55:07PM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Add pwm node used by the backlight output pin BKL1_PWM and
> reference it from the pwm-backlight node.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!

