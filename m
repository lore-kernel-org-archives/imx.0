Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3712F215F6B
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734672; cv=none; b=rx/Wmn8MFaOfa26Tm1+bbxj/mJYTPngJfugvggtPeEaJQYMo5jYfIyjypOmwfbLDsdPQvUNCx32apfHKdZUAzweEoQPxWaXs4XHg61jqRx17iN7U9XhXbWQVWQu625pQcLsDlLMVJHKmlMNYJH/n9sPIRIh3FpV2UKVrPvRtbt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734672; c=relaxed/simple;
	bh=UFKhxK+cDFEI4y3RjLQDe9PWlFuYbRZmoAxoXWWzp5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmnBg1DpMcLmUjhrrchVTrCCEfJt/If/gdZThaX0AtBtQeo5xwVzPo3Mb0fqa7RsEjsBzT3wKH7goc1SmqlCxNy3aSO7Og/wsVkM5zmBG0QxOx4xZbtdlG6vURPRBtgW4+6RTxeqtXXTRaL+frJsk0np8E80R0Gk/iYOcEzVbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lPkb5FsQ; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lPkb5FsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6At0GdwrBbQRQtGqN9J/OMjpky8vIXhTBbHz6TrbWzE=;
	b=lPkb5FsQmQQdQWYcOzNMDtKfRo1KvT3RUdQ65WJyafYZMQH73wbDb4z/tBVvXp
	EPf7uwabkJEdy02G4PoQDCh2m0gVWNxAAgU1Bx319nuoUnhIhRrY5ndrT1KBNsAt
	janG84vU51iRqBU7JeilP008ItQrUcHMePQOX294kZG0A=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXPuxxrlZnKVSNBA--.47957S3;
	Mon, 09 Dec 2024 16:46:43 +0800 (CST)
Date: Mon, 9 Dec 2024 16:46:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <Z1aucR3ueKIxOjSX@dragon>
References: <20241107085705.490940-1-lukma@denx.de>
 <20241107085705.490940-3-lukma@denx.de>
 <20241119165236.69438f75@wsk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119165236.69438f75@wsk>
X-CM-TRANSID:Ms8vCgAXPuxxrlZnKVSNBA--.47957S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4CD7UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgiwZWdWlR95wQAAsc

On Tue, Nov 19, 2024 at 04:52:36PM +0100, Lukasz Majewski wrote:
> Dear Community,
> 
> > The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> > some extend similar to already upstreamed XEA devices, hence are
> > using common imx28-lwe.dtsi file.
> > 
> > New, imx28-btt3.dtsi has been added to embrace common DTS
> > properties for different HW revisions for this device.
> > 
> > As a result - changes introduced in imx28-btt3-[012].dts are
> > minimal.
> > 
> 
> Are there any more comments / suggestions for this patch set?

Patch #2 and #3 look good to me.  That said, I'm waiting #1 to be
applied first.

Shawn

