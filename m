Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A23D1D6783
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346278; cv=none; b=E47KkdIsF+eXfYAgi7pnzv+jGJcqRyM6fHH7ojtU1F/D/tBs0dfnX9sXBhzwske2OlyMI7AtADCQ8QNz03msAHcnaxRqYfbPHdUVV+NqU1a4paF7KY1v7eZi6F+lK6ykcP+PtZTWIcn1lKf6ft622W9BYUZvxDZH9LE/taSbtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346278; c=relaxed/simple;
	bh=+8DhwfeIUfdwg8dPl1HJqPNLFuN0uTr25CZKKjbIBT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTOp/EGxTFV6Fp/CJic2N1zWAEuT/CDpYTuqoRWEJvGoKu29vpwoI+MKcmtsmI+kFNf2Z0GauCkq2OLpHeI31ZQKQq/NWuuh+ufQ9x/8pJ+3HO4XzupEZ5BTv84lzcHk9/bGniFWtSMGvbpqnMKzXpaEo4Efz0n573C+mZSV03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hMhz/Ndh; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hMhz/Ndh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=55f4XHL37VsO9pcrHztaTRFVBDM376ggqSU6M14kBEI=;
	b=hMhz/Ndhi7BpzOY84uNWJr7cFHmisZX0ABOOWpzUOoDMxgOijGr+USneaeaY8w
	LpgGL34XYHxLjfFgxwEdbTbV924+4KbouFB8pItKJK/+AduYXWFiS4fBRJjKInwl
	mjlhO7PysnV/Nx7V/BU5XSxbGpQOeUzcuXcZw8KaTHuWs=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDH7SbGsdZmYLZaAA--.38886S3;
	Tue, 03 Sep 2024 14:50:48 +0800 (CST)
Date: Tue, 3 Sep 2024 14:50:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: frank.li@nxp.com, ye.li@nxp.com, ping.bai@nxp.com, peng.fan@nxp.com,
	shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: ls1088ardb: add new RTC PCF2131 support
Message-ID: <ZtaxxsKXwpLYPufQ@dragon>
References: <20240902103626.1414595-1-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902103626.1414595-1-joy.zou@nxp.com>
X-CM-TRANSID:Mc8vCgDH7SbGsdZmYLZaAA--.38886S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIco7DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwRPZWbWfG6ojAAAsj

On Mon, Sep 02, 2024 at 06:36:26PM +0800, Joy Zou wrote:
> Add RTC PCF2131 node for new ls1088ardb board..
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Applied, thanks!

