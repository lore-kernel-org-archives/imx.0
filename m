Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A402136354
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536896; cv=none; b=DNexp4p4Dw/ac+C1zwmfE1maa9csYr1qpOLyrBM4Et9KAGOU3TnxTw5eEFxxagxsZniiIs71bzdqix769ZkoV6mdlWUo3WlP45ZyhmidwBPwAjd1g+dQuv+R0ZFgO1pZ7leHOOa2E/I5GksuNY8H6KC0S9hgwmXGjXT2uFfj32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536896; c=relaxed/simple;
	bh=3AyQxuUOn0ZdX0WCT7YlYt5V4PoOCIpo7SKBHIAE7r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzvGkRmKXmTYouEhyRUIyhSRG6nYmtpUE/cvz21tRxMizlo1FDy34lpK4P+wmJ4Ip3N7UVeRoj4eDwzl0UvcNQs6KH2vxEwZhzWI2yHMvMxGshksoIV82Wsm5OKNjw2Qmog8u75cUTSYPh9JkqBz51y6ca24u9dsZpSDKQUZ+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GVRG9SPn; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GVRG9SPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Vy3wmrLVcBgYdFbXv+wcegrCL/A4+QLP9Z4SXXo1iw8=;
	b=GVRG9SPnEhDEtcyMcrz/JZIRjVmlDkztIumIGCsWNEIiGcf6Ru6LHxqw1yXXrw
	S7OBmNLusHtKJ6fvetulcaUYWPp8lbe1kn4+8BQpiYZ9XB8wyDqH/Cf8wXqspQ67
	ZGlpKNljaj8bAHVbGttPmUrnd6dlP9jE5+AERF7VkpVlc=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3f8DkFbtmcCYbAg--.8967S3;
	Tue, 13 Aug 2024 16:14:30 +0800 (CST)
Date: Tue, 13 Aug 2024 16:14:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp-verdin: add HDMI audio support
Message-ID: <ZrsV5GNh7fyOUFo4@dragon>
References: <20240807135419.248219-1-jpaulo.silvagoncalves@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807135419.248219-1-jpaulo.silvagoncalves@gmail.com>
X-CM-TRANSID:M88vCgD3f8DkFbtmcCYbAg--.8967S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsPfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhw6ZWa7DWMZOQABsT

On Wed, Aug 07, 2024 at 10:54:20AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Add native HDMI audio to Verdin iMX8MP and all its carriers boards.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied, thanks!

