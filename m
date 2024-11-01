Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B8542C0B
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454428; cv=none; b=ablolUsZhOGM/m45hJ0E7GOt41hZnzdX52c5yHyd3XM9v/aWKksFO6ZbEug9aiZgvkR9W1rsmrYHf0rV1IzgHHpPSO+BjTvpGqF1TBp9cSPfuER4OjTlObc9iO8Spoq1U5iRnkZaZea0Gxs9yU3pntwUcxpX9dhl5/MzOsOHxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454428; c=relaxed/simple;
	bh=O6KjtlHE1QXZ928Gz3ob82c3DeTDOPQt1OyRh19DMoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaOjGAV1YWZx0bpBrs//tsQ1IqqZ6u2mE+N1aao9Kcj+0vE8Q+RiyNH+jaHQ7Tzn5HjOE07eas8VFgpeL9UUfTwdW8YYQqjgA+QESij/YZdrlwJNR5Ce61jAAQKleMjbR/VSOm3RWegIVlJZawutc/SLWnZ4TI3Dxa1680QNEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HviupgDX; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HviupgDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QFuLgNX9fkcpPMjhL7ilmrg9CYQNaS7krIOTJ2ukDpY=;
	b=HviupgDXgAzd3KIuYZWn43osSUPIGJqwozopHAcfiKxR9rdFfDExPtlg4NJH0U
	+4kzbhgTZESmPbeWwaJUV5ISNHAE7SbjFqbd8anewriJVi5ig2DK8Y60oIGGI7nD
	tNJZi/folM9usJW9Hn99SPul5eCpUVPAFsk9ZxusVosUg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3_q9_oyRnxt5gAQ--.13557S3;
	Fri, 01 Nov 2024 17:46:41 +0800 (CST)
Date: Fri, 1 Nov 2024 17:46:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: freescale: mba8mx: remove undocument
 'data-lanes' at panel
Message-ID: <ZySjfxOXOB4+xyZa@dragon>
References: <20241022202342.1263766-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022202342.1263766-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgA3_q9_oyRnxt5gAQ--.13557S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEguKZWckdPuMCgAAs8

On Tue, Oct 22, 2024 at 04:23:41PM -0400, Frank Li wrote:
> 'data-lanes' is port0 of lvds bridge. Needn't set it for simple panel. Fix
> below CHECK_DTBS warning:
> 
> arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb:
>    panel-lvds: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
>        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

