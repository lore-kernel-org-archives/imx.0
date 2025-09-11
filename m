Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4964205ABA
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555516; cv=none; b=inDTd4GhO9hoN7H3SSpKbX9C/JLwiqjDT1lXlNtpHt7RSV2D4hW5Ku3VnVtnAlBJLtNauXfWJdE11ZYYrVbrjFrCaM4Rx3NLeq7uVeNSA3bUcZi/vSnoYd1QxQnDm3f09cz2JPWmfbqKOasA6IRYtGxwr+2cYrRECxnjmyjWTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555516; c=relaxed/simple;
	bh=bCPB1xnoe2/GO/7enylpCb+FDL8XOg3ocnPOQMjuVIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqqTwFvRdXHVHVPchLR1whqg+MLMIenQ0XqzqKMwuosOIzhPgd/zB2aHJ8+l0rrHAojknXlp2FCWfcNCn0fkaEpJVvk0HapDvlcedJA3PxnQn6TAc5adfUp5ogcwwYbprXhfe7Qoaly8NTmhkbMzwjUAZARcIM4Cy1Nnr+RsScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PvVI6CX7; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PvVI6CX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A3gOQobAEWqrV+LkJ+Gu41Zy/G5CF74YMZ/R1K637H0=;
	b=PvVI6CX7zrc6SmuiytFNyZtN1EFexELhvMIVXIHPCtvcNn9yWNnn5a6pVrYEdh
	bAAi6JiVPKnaV8XXcUUeG5VR3BjB9rA4uUxzXicUC6/YPU4sGUBX0ALnJAJRPRBn
	gYifKf+PHc09NEyHsE1VuPZKjXiVXbgUKDwT5x2wahdns=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3n94pK8JoLltOBA--.48607S3;
	Thu, 11 Sep 2025 09:51:39 +0800 (CST)
Date: Thu, 11 Sep 2025 09:51:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Message-ID: <aMIrKYBPF2kMctIE@dragon>
References: <20250823-imx8mp-sr-som-v3-0-a18a21fbebf0@solid-run.com>
 <20250823-imx8mp-sr-som-v3-3-a18a21fbebf0@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-imx8mp-sr-som-v3-3-a18a21fbebf0@solid-run.com>
X-CM-TRANSID:Mc8vCgD3n94pK8JoLltOBA--.48607S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy7tw4rKw1fuF4kGF1fCrg_yoWfurX_Xw
	n5Wa1UX3y8KryfXw4rAw45CFyI9w1DWr18Wr1rtryxX3yS9wnIvrZFq34F9F15XrW7JFn2
	gw13KFyIkryxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9NVDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAufBWjCKyt+bgAA3L

On Sat, Aug 23, 2025 at 05:28:23PM +0300, Josua Mayer wrote:
> Add descriptions for the SolidRun i.MX8M Plus System on Module based
> HummingBoard product-line. They share a common designed based on the
> "Pulse" version, defined by various assembly options.
> 
> The HummingBoard Pulse features:
> - 2x RJ45 Ethernet
> - 2x USB-3.0 Type A
> - HDMI connector
> - mini-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0/3.0 interfaces
> - M.2 connector with SIM slot supporting USB-2.0/3.0 interfaces
> - MIPI-CSI Camera Connector (not described without specific camera)
> - 3.5mm Analog Stereo Out / Microphone In Headphone Jack
> - RTC with backup battery
> 
> The variants Mate and Ripple are reduced versions of Pulse.
> 
> The HummingBoard Pro extends Pulse with PCI-E on M.2 connector.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

It doesn't apply to imx/dt64 branch.

Shawn

