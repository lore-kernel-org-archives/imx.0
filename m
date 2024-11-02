Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E32B380
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730530233; cv=none; b=Vfhtyfdc5SIN0Nkn0auR9cbTog9qvowGvbPDKzNy6x4K64o6mtJsilMQpEM2QDantPwAmXyYrT7/5iXbEelSSYqQNcB7nOtAprU23rkr+byttlHPmbWIZAlzVf9nUIIzg2ctuYzqjbWyoQ3ROMUk8K5vvhQ5p93N8kxFiLkWVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730530233; c=relaxed/simple;
	bh=gJg6Qs98qNWypnWQ6w3U/ETMeZRhN6VcNBmQimqCW58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pek6bpV+f3+sSNJqX/GDPEHQgoQgSfHAtv77qTxa0oKRwx7R9436Vm+V7DZrxssDy2oegxt39H7xHoL2lFkl604Ev/ZxUWUQvkBzMG9mBRWiHiprc/s42LZGnGhgNTjgBSZXJ32R02nHwg0KgD7DiHVwxtBrpb6bcRaH1lSzs7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bXg6nIqe; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bXg6nIqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vvmNlpMTSaGbNzPaTN+BMBPIP2pkxKmlsbNMka7+MqM=;
	b=bXg6nIqeWrA0J7CAwyYKPYT+bmO+9lZe0hSd5v63NxeMawf1h6dYI8451rB10p
	OaR4I82z5pJFlYW5r/k8IIcyj2n8PsjdsmWBi7rnTEKRvkv7R9t2w/2unR/JW5EZ
	V7tl0db3Sn+s9dmICkOkSjYEg4qCksyWYpJhUY+au7gGQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnrySkyyVnoHd+AQ--.15062S3;
	Sat, 02 Nov 2024 14:50:14 +0800 (CST)
Date: Sat, 2 Nov 2024 14:50:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	shawnguo@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com
Subject: Re: [PATCH] arm64: dts: imx8mp-navqp: Add HDMI support
Message-ID: <ZyXLpDoyNtzm2RRy@dragon>
References: <20241027225408.195475-1-gilles.talis@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027225408.195475-1-gilles.talis@gmail.com>
X-CM-TRANSID:Ms8vCgCnrySkyyVnoHd+AQ--.15062S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx18BUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgCLZWclifuLwgAAsF

On Sun, Oct 27, 2024 at 06:54:08PM -0400, Gilles Talis wrote:
> The HDMI connector on the board is a micro-HDMI (type "d")
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied, thanks!

