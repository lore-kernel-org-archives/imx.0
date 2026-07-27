Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA03BED11;
	Mon, 27 Jul 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183515; cv=none; b=EdiJWomXXxBmI+eOc7KM8/3k0hn3h90GS+d/i8KRKo0aksIJ9qPTuGGMG9qu+40aC9EaIs8R4A90W3CKYZ2xZYed6Q62JgIguS2kY04YCpvW7aJtJ2+eWqvOVQUh0jjBt6i5nAozPtO7taY07vMsfQ3Fa5c7/evCpEuBt37k4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183515; c=relaxed/simple;
	bh=fBeDd6xQsIecio1n7usPBzmhYwPSoravv+zJaDzKRHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scaT3Ult37FlJlz20KUebKxUGBdrv/CU6sChG/1j8C34GP+YkxseoTGJEFnZ5AEB9bmGB5sexvPP5ooipL8yNidDhUvsQxc0ZoJZY6JecnyyhIgo5LkycgCvqNMeJI8ocFBxlsvK/o+Sy9SIbzuYuuny5CAjInX90f1XrjKtGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hskR9Zyy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hskR9Zyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0741F000E9;
	Mon, 27 Jul 2026 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183514;
	bh=Gn1LMmg5xd/1wmch3JmNgrwmjfmtCzeFUam6KU6FCBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hskR9ZyybGADQ5axPG8gT6HgVQn0kfO5Ne4Us7xr+1b5OGm2CajuD2kdweBtonFHP
	 R3j4rTrZOplKopZ9UFsLxp8QnbVR9HvOXF+W6w5EFxrrGmclhkkbMAevEHTc/ap7jF
	 E9dOoQz6IdMXKM4vNuecpnv3/4cyORBvLb+4lsGJOJf76gh+YC8H+JgoyiBKV3iYUO
	 AlluXjUWaddeanbMdTQHi6Vtqt3Roq7uzRA95j8Da0GJwWuwHalvIcB4uqypudcf9V
	 LjShjji8zWrDHda8ha8kjbjjdFwy28h8N2z2FjG2MEdjAmMSpxxlP5i3vIsE7TqFel
	 MXq90TJ05IoJQ==
Date: Mon, 27 Jul 2026 22:18:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] arm64: dts: freescale: imx8mp: fix sort order
Message-ID: <20260727-immortal-acoustic-buzzard-932ab3@quoll>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-1-ca8a0446166a@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-1-ca8a0446166a@pengutronix.de>

On Mon, Jul 27, 2026 at 07:31:04PM +0200, Steffen Trumtrar wrote:
> The imx8mp-skov-revc-jutouch should be alphabetically before the
> imx8mp-skov-revc-tian variant.
> 
> Sort the entries in the correct order.

Please sort all the entries, not only 'skov'.

Best regards,
Krzysztof

