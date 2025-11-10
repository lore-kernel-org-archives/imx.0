Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8395D2F25FE
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762897; cv=none; b=Qps6ah5dbD+4GuB6Ah5yw5TZwnM//BMxCQjrTO2jBhrQ2BQ9osJmQhVaWiVTqrnTw2i2hproI9qCOfIZiSs5TfSqLNK1VWC3rulJQsKzse3+tjIvzLWl7uYwNMxt24gmdQ3dKh3QXivsRCsVsf2nlwKrXvrPwZkBdYbZynrzCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762897; c=relaxed/simple;
	bh=+L5S8M9NwbNFyLKE+NHHxSeXwcBoQ3PcgR08aMX1pM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUxOv686VA8oVFB4M8rkDiDv8lJGicRM9aIWFlqU3K1pRP6saYxJg9fu6MXJAjK3134442Vwx5dbBhOzeM2c/BzBHoM3ZCHNP+r8cbP+DzozS8YXqnAfrSw8Jabc1g6jMKpdVcuvt93DelgA9azdQ7R7oIb3DYOAk220hjiXtmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=P/ZGYtgC; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="P/ZGYtgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eQQspempRuzg+/pvUMO0GYbWj2MHdaUyQn/zQ2LI1C4=;
	b=P/ZGYtgCijSMXhLYalW9PVAkJcjLLbjO1JUKQ17kYv7Ru7y1JTttSu2clAwYhq
	UpFNPU6g1yrnhJVCGxF1Slop7Gggkb28gQvHoZEfZVoKNAy1SnShAmvPq/WhA96H
	K36S1WBv6bZblvkVJHTGX4rZ6T2r4tOVKkMj/yQU6L96c=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXQNHKnRFpNY2yAQ--.4669S3;
	Mon, 10 Nov 2025 16:09:48 +0800 (CST)
Date: Mon, 10 Nov 2025 16:09:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 13/13] arm64: dts: imx8mp: Specify the number of
 channels for CSI-2 receivers
Message-ID: <aRGdyj3B_KMCiJiL@dragon>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:M88vCgBXQNHKnRFpNY2yAQ--.4669S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOKsjUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg05nmkRnc1hEgAA3H

On Fri, Aug 22, 2025 at 03:27:33AM +0300, Laurent Pinchart wrote:
> The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> in the device tree, to enable support for more than one channel.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

