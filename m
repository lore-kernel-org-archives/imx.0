Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D91B22ACE4
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872660; cv=none; b=fonDelpKXORZqoq8zvl0lm8AGsitOKI9BNuJ9tFIfVZnhjJBTHwlHUEmlvKqNJbmDeWxrLeR+tYNRs+OS9QT0y2fFSftT5oU3+vkVgkgywYVShf5UEFrsmqvmTFPPVy1BYDowC+eWX8mA9BzRpr1YDMVUV7sJwvNYkDhy+72/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872660; c=relaxed/simple;
	bh=kN57ERp8Y9kUTSjAPit4bQSVDsUEPxYZREqQRm7B5JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3NkHsXLOXJK4KPB5UM9V/BbQgIzOtUXQKL9DXVhjA/RiY53N3zTI+iTOq7s1TkUXcDUcDcAebUTeETay8Rc7U3g3ud+roOTwGo1QIvKiXT0rs/z6cOzLQk0WmlFvupR7eieMRLWOEkhRE3vy0BkzkqTktN/2G8A6V3gPfFgBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=X7x11O0c; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="X7x11O0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9n2z0wCEyjkNcU3SBpQ+OIPzr8YGZnJEpPBZ6X52Eiw=;
	b=X7x11O0cfhOkh7QqmPdahaBDzQX2VIzz67S8tv3SzAoYQEUZ4Z7ir3Zm4OESP0
	a7ww92AlY+2mNMJAXKk/i+bv4gOGx+uqjXMliyJfEZnVHQlxRFq1HDyGT40Esnuk
	5AwxTTwzdbIMtDC8qLl2giRNZaS2lxlzp9EL2WYJjosGs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXeKB7WbRnvMNhCQ--.20537S3;
	Tue, 18 Feb 2025 17:57:17 +0800 (CST)
Date: Tue, 18 Feb 2025 17:57:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: vfxxx: Fix the CAAM job ring node names
Message-ID: <Z7RZezqCgwDy10vf@dragon>
References: <20250112124127.994141-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112124127.994141-1-festevam@gmail.com>
X-CM-TRANSID:Ms8vCgBXeKB7WbRnvMNhCQ--.20537S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3jg4DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQL3ZWe0S+A3JQAAsr

On Sun, Jan 12, 2025 at 09:41:27AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,sec-v4.0.yaml, the job ring node names
> should be 'jr'.
> 
> Change them to fix the following dt-schema warnings:
> 
> crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes:
> '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

