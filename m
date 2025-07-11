Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F2D1FECB4
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222260; cv=none; b=A0PrYpZhuUE19IURizaodavt/b1BVqd1AQEEdZqJk6kKKp0p147Ff23Bo+YB83dbfR5U9y7UvhUU7wR1QwXKkyZ4HfUPJWkBZEt/lB+H5B6OOxIaMk7waXjluWnPs2tolQgUTcSbIcByA2Rv4S3mjm/aQF8S6KqLTJ3yJJEADa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222260; c=relaxed/simple;
	bh=oe4lhkLGr8IVFpNtn+zfgMZ6IZRAf5sC+irhj7PnqPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzhWUqEMBcfuUzdHtOEUUlZNx3YHpMoKRvNrV6Yfmlfxk+rHXKeCe3CDTkSppHKHI/ZZ18XA02EszOBy/rXz/bnwHALPlkJdbnDMhQq8k+AyhD4spHgJXyZJsv4syjqiR3HmeN6WbmoaHmc5Tkd2dBcmcRNBHyreVMQHP4zprGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kcMqUPmh; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kcMqUPmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=M8HMI4dBSHOZzYxtls69B2jOiIgFLybmVcuOyVJM9LE=;
	b=kcMqUPmh/qagFxTfJHasI3aSRZlobqClH28SagoqLkvIgkq4ih8ujofBHK1JMe
	MRsQwq7V2CuHrl7nntwpxJwZUP+u7tfgQsIOsXyAu1s51sCbYOm66k0+yP3+/tkr
	Pf+A7uK0HwDdqYKceOGcGzj8oJRuFNM638KyKV2lnpotA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3d6YJynBoKCtSAA--.9983S3;
	Fri, 11 Jul 2025 16:23:39 +0800 (CST)
Date: Fri, 11 Jul 2025 16:23:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v2] ARM: dts: imx6-gw: Replace license text comment with
 SPDX identifier
Message-ID: <aHDKCWFd9oOZu6NC@dragon>
References: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
X-CM-TRANSID:M88vCgD3d6YJynBoKCtSAA--.9983S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoWxKFXE9F
	W8Ww15JrWSgFW0k3ySkF1avasrKFWDZr12qwnYqFZxJF98KrZ8WFn8Wryqvrn8Xw4xtrnr
	CF15Way7C3sxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9NVDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRqHZWhwiwXXmQAAsp

On Wed, Jul 09, 2025 at 09:26:41AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!

