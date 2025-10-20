Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108D230BEC
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953708; cv=none; b=dTsmbPsZ+WpwXnp8/VsnvY2uGsoSz01RYVGwWH8iZ3asHR4UsxHetFLV34HXITcawrvXLVv5xW+9jQdGn/npT772B07DE/ZZk5v2OmUqA9Gs8f1R/qxvkSIdjjwP2ef6YIZMqERQecKHIzTvz9TtNEDIjOKul0TLYlm0b6g0Des=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953708; c=relaxed/simple;
	bh=ek7hXcjHfSQNfshdtQ9VuzGH6TYTSrmvRDEFyQJSzMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZJ+YsbLo2Zd1fyBaxxXiKwILeLvXAWZv8RuqroAngwkC0hvnfxa16uHm0PqSOzJ55RoKZAvjF1zzczr0HOwixpN4gYkevCUvQgenmocFRmK2zAWnWc1C/L4fa5zPaMaGOIv70mg7IO1qikvzDXXKcXj5AWPfopajMgJFvyVAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mWcRVKqq; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mWcRVKqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ek7hXcjHfSQNfshdtQ9VuzGH6TYTSrmvRDEFyQJSzMY=;
	b=mWcRVKqqug1bMs4Cgl7P9GItTyL3VXvC38rpN+vmjwC9emt/RfOm5zkq58oU2V
	8e5iF29jzuwua1M9BAW0/vuWmGimqQYPl00w804ktNcu5Ndiri/pqFJAZZUqH8gy
	AdYRCTt+6ourUYnq4VtJK1M4rM8BmN1X8uD9cmckPzSbY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX54tJBfZoTepRAA--.25208S3;
	Mon, 20 Oct 2025 17:47:54 +0800 (CST)
Date: Mon, 20 Oct 2025 17:47:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrej Rosano <andrej.rosano@reversec.com>,
	Andrej Rosano <andrej@inversepath.com>
Subject: Re: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
Message-ID: <aPYFSKQ3T3I4VTff@dragon>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
 <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
 <aMKEF4wAeET3Ntus@stjenka.localdomain>
 <78cae034-77a3-43bc-87c1-18344d5ba8c8@sch.bme.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78cae034-77a3-43bc-87c1-18344d5ba8c8@sch.bme.hu>
X-CM-TRANSID:M88vCgDX54tJBfZoTepRAA--.25208S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx2YLDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgsrkGj2BUvImwAA3R

On Thu, Sep 25, 2025 at 06:44:37PM +0200, Bence Csókás wrote:
> Would it be possible to partial-apply just this patch? Or should I maybe
> resubmit it alone? The patches in this "series" are not really related after
> all.

Applied, thanks!

