Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3B6ECF
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580966; cv=none; b=qWHYMEtgHgJps7LLWuAeFaTjEzTFq/HfOeKXQ4h4dtuMUYC0Kpm5Y35n9XmzNgnHFdVA452KAqM2ML5DUNGs+KlgZZGjpk01hBol+EW9EajDTTyxp92Iud0VDHxXB5pAW7YxWYmgqWuhzaIXKGBN/d8g5DHz5tgWEMs/Iacxtpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580966; c=relaxed/simple;
	bh=F2pGJFZvAS93RRGHRnOOtCcR2uywgJ39N6SWByHUWQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCpI184igic3A7mEihg8Q3unn7yRChPS7XO4el9Pe5bY13H1Y3+EQMKfT3UP4itbteP2QFPBPEr7ty3HUFysmEy9rQLx74ugPlxLVVVtNxfNcEqizx5l9aIEDGaGAruU1GcVwKq1juxOgAqXvsMI/M01a8lnEZoTmH7vi6cYSRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=g4Cha1eO; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="g4Cha1eO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=urf7iwFKePih82jCH/ZJLZxlP6KdixdHAfOoTpE97FA=;
	b=g4Cha1eO0e4pr+cb0DogV/VY4KKir20AAeLLZJRVjK1oMCHPE56rrgjCy5Byk0
	TxnTTqEUwR6kIizoDrrwiG1mn7eGPkqSDifO5ZeI80Ya/aLxLQUwRj6LIOAB9xn9
	myjKEQIRVCi5YNU3Ak0M2Nah0DAGSYPdMtyxhREdsj/Kc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXztGJTxdnA72WAA--.5447S3;
	Tue, 22 Oct 2024 15:08:59 +0800 (CST)
Date: Tue, 22 Oct 2024 15:08:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6sll: fix anatop thermal dtbs_check warnings
Message-ID: <ZxdPiUdLj+s7iq/L@dragon>
References: <20241021183244.303329-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021183244.303329-1-andreas@kemnade.info>
X-CM-TRANSID:M88vCgAXztGJTxdnA72WAA--.5447S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa038UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ2AZWcXART5fgAAsb

On Mon, Oct 21, 2024 at 08:32:44PM +0200, Andreas Kemnade wrote:
> Fix anatop thermal related dtbs_check warnings about node name
> and missing thermal-cells property.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thanks!

