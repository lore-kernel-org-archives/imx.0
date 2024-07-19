Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85EC84037
	for <imx@lists.linux.dev>; Fri, 19 Jul 2024 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721397046; cv=none; b=oZWbTdsusyukHbfWUtiGm4VguQEiauWtB8uXsJHidamGYLmUdDVQHuKIgq3t9M+oljZqTpSzfPdxMPrFUG3OJz2ahFxQcCJdKBG1WoOVWebT8nsnbLXe0Vd7OL56xsie7qFlPzY5Dt9L0367RQMgX6CI9Ifhf5RMdMiFjH5Kfc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721397046; c=relaxed/simple;
	bh=bB62eNn1Si6jo67dIW4Oct7GDuuKGuL0OJSsuqAUq38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMIazikb5KtZ5tl6J7+bd7W1X0aan/tlj3y1CX1u1hhE9HiOTWPWMD7NUw2tB5zWdMoczDDhrrQBjQLJKenhEClU6zLFTxX+RLdfaXsvxPI5MohACpsC+A2TdotvNUyqdbC8xYtsdq13SjqnqThlyIgCBwO3XLFbScFaa1Hp4AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t7IUVOMz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t7IUVOMz"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6173473E;
	Fri, 19 Jul 2024 15:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721397001;
	bh=bB62eNn1Si6jo67dIW4Oct7GDuuKGuL0OJSsuqAUq38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7IUVOMzcZ0mwQUpW0UjfwzeHG6iQldkK0cOyH0hi2vHuT49faWsHBl6s8cmXjgJO
	 aUw9sve33iuqUB2kJH6FOwab8gpGWshlPGrKtGlcuzsq00NZGxRhlJBybXeLtQVsr7
	 ZSpXsUZfVzcqBfNfkRHDhg4tO0yZHQS0ZuWUhWAE=
Date: Fri, 19 Jul 2024 16:50:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Clark Wang <xiaoning.wang@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
	Jindong Yue <jindong.yue@nxp.com>
Subject: Re: [PATCH 4/6] pwm: adp5585: add adp5585 PWM support
Message-ID: <20240719135025.GA637@pendragon.ideasonboard.com>
References: <20240716-adi-v1-0-79c0122986e7@nxp.com>
 <20240716-adi-v1-4-79c0122986e7@nxp.com>
 <u7xii4lfvjk6gbpmq7qtqckoznddiyno7xsaa74ufuxwdob532@wxuawwiwjpgm>
 <ZpfVNHQQaJvdnB+B@lizhi-Precision-Tower-5810>
 <CAOMZO5CGqMXmcUg=J0OOtsq4ZpnVD7GnpxzEQQQ1Cq_dR45Hwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5CGqMXmcUg=J0OOtsq4ZpnVD7GnpxzEQQQ1Cq_dR45Hwg@mail.gmail.com>

On Wed, Jul 17, 2024 at 12:35:29PM -0300, Fabio Estevam wrote:
> On Wed, Jul 17, 2024 at 11:29 AM Frank Li <Frank.li@nxp.com> wrote:
> 
> > Thank you for you review. I just found someone already submit similar patch
> >
> > https://lore.kernel.org/linux-gpio/20240608141633.2562-5-laurent.pinchart@ideasonboard.com/
> >
> > Let's wait for laurent. If he is busy, I can rework base on the above one.
> 
> Adding Laurent.

Thanks Fabio.

I had a quick look at this series, and I think mine is better as it
supports more features and more chip variants.

-- 
Regards,

Laurent Pinchart
