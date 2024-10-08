Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8422D762D2
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379318; cv=none; b=i7W1vZlmCIOpTRGsnBuUa9xZmDPaHLs49Ovd1q4Q1OaB4Gaeas2snTn9dRWZm55vj/iu8bgV5kbVnsTGkOoH9wzDj3ciOmk3OGPZiM4IunL0kbBDw0ShoqLHUp060bgW4oMDgG87/vyAWtjUg+MFHh7H+zrXW/fzX7ywTrtBHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379318; c=relaxed/simple;
	bh=5EYqTaH65chTt/LnuwJZgF8ia3vSrrdnjA7snFEHGqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8LG2R8e2znjilcVBQdn5diVPlm4woNoPHmmCAlJ/R+H0GqVoVMiFhC7zuP8PJd6iF4vqKLIPzNqkwtG+aP6az6L7yHUXvRdKBdqzStHb4cFvprFLZb6VqV526q1RovwCGUjwFLSxrPJhkwQsjfAAjAb70ndnfxyzb4DhIhpdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OpwYvbnr; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OpwYvbnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PJZdc22OCR844nkMs2ao6cs66z7059vtXIHCyFffkPk=;
	b=OpwYvbnrgpjlqKX5BnUpeI3nMk3cUj6Xfs7mEVUIQD6IwhgjOfyo1ayZvAC1mh
	MAonW5dn/A+cQLzU8rFn+BI2rb3ZVaIRJrjZl4rMBf0H/cpGV44/etOSUx8Nh2Y9
	12DsQZH3pn0fOKo+RTLQRsin7/LPVpK7xWFqMsYHGbdZo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnlx5O8gRnBRXTAQ--.54852S3;
	Tue, 08 Oct 2024 16:50:23 +0800 (CST)
Date: Tue, 8 Oct 2024 16:50:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: imx6qdl: Add reserved memory area for CMA
 memory
Message-ID: <ZwTyTZH4+CS8lm0Q@dragon>
References: <20240827142458.265558-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827142458.265558-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgDnlx5O8gRnBRXTAQ--.54852S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVxR6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR9yZWcEqhjkVQAAsh

On Tue, Aug 27, 2024 at 04:24:58PM +0200, Alexander Stein wrote:
> Default CMA size is too small for HDMI output and VPU usage. Increase the
> default size by providing a CMA memory area.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Changed subject prefix to "ARM: dts: imx6qdl-mba6: "

Applied, thanks!

