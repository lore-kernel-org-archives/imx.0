Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B172F4A
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763562; cv=none; b=X/3RFh9pA6P6FdRCFEl9KHWtomcgROZYW2smZqFb1N5bfgjTBOwGlodlxq3RcfW7Y7tCMZ2FQyuKoG0BPznpDeS3VDRRsaTjD/33fNmI73nyMFPlIzvZfrax+yGN/f9jUdCLTZR3qcQ4u2vmgRLuT8ruPz2XijFPjoI91xhgSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763562; c=relaxed/simple;
	bh=2eMsqlZvaI7r1XsM6Mfdx+rXe7GGSP61IGJmjFAGA1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXRGNarqm3GhIyYyNKiOnkqCl4L/ivEqm4hs6HBuzuXYSBR2+obAeQjgESxkpTk6q6XHf5V2G7E68dgngIRmlCBBKwZDBQraNZtUyg7Oe4jzvnECIKgDBjNz2BeygMZwgL5OyEQ/L2VJYnHI5V8zi3WwMUKgJPOtSRVTfqPcZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ai6YzjaK; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ai6YzjaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=iz16ggPl0fT3RVXnz81iuKxXxLF6gIVdgoLvPtuFQ9A=;
	b=ai6YzjaK3ckMOnwi5QSbxs8PgXPTVvpjONez8ZQ/0W3fyxptM7Al1gNuq5ig53
	QgsUpi8zdz6jFn5xw4dn5YPNxAzx9duXbM3peyAhT7RzOxmRh+XHCTbqtTByC2jU
	9NAD+TPJ738FqKdYgIKr6xbd3um4NdW3SnylxE8brn3To=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3vvYo06ZoTvMZAw--.64178S3;
	Thu, 21 Aug 2025 16:04:58 +0800 (CST)
Date: Thu, 21 Aug 2025 16:04:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device
 tree
Message-ID: <aKbTKJqoxwKKJsu_@dragon>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
 <95b3a17e-a5a2-4d84-960c-2539af9d5450@kernel.org>
 <e4c5fe15-87c8-42d5-b4d7-09e3d1f7e712@suswa.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4c5fe15-87c8-42d5-b4d7-09e3d1f7e712@suswa.mountain>
X-CM-TRANSID:Ms8vCgC3vvYo06ZoTvMZAw--.64178S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy7Zr47Xw1xCF1rZr4Utwb_yoW8JFyxpF
	W5CF1jyrWUtrWfAwn7J340gF45Zws5WF98Wry8u347CFZ0vwnYqF92grWY9w15Wrs5Gryx
	AF4aga4xCa4DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrOz3UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwvCKGim0yuvEgAA3d

On Fri, Jul 18, 2025 at 06:21:00PM +0300, Dan Carpenter wrote:
> On Fri, Jul 18, 2025 at 08:58:19AM +0200, Krzysztof Kozlowski wrote:
> > On 17/07/2025 00:46, Dan Carpenter wrote:
> > > Checkpatch points out that this should use spaces instead of tabs.
> > > "ERROR: code indent should use tabs where possible".
> > > 
> > > Reported-by: Xu Yang <xu.yang_2@nxp.com>
> > > Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > 
> > Patches were not merged, so this should be squashed there... or you
> > meant they went with Greg USB? Then no, that's dissapointing, you are
> > not supposed to send DTS patches to Greg's subsystem.
> 
> I worry that I have accidentally stepped into politics...
> 
> Yes, it went through Greg's tree.

I don't find two DTS patches in v6.17-rc1.  I tried to pick them up, but
this one doesn't apply.  So you may want to resend them.

> I'm just using get_maintainer.pl.
> Looking at it now, Greg and linux-usb weren't even on the Cc list for
> the DTS patches.  There was probably some b4 magic which let him apply
> the whole series.
> 
> How was this supposed to have worked?

The DTS changes should be sent separately from usb driver ones.

Shawn

