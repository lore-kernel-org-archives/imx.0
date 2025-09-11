Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A128A17D2
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 00:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757552099; cv=none; b=sgAdo7msXann0XOAtFU1e4u+4mjRwxL9LgqYfwfcUc482Iyx6S4C/2R3tIG9hPrw3tSPouJ6DZ3QwwfFi6YWhjx3fE33a4lTmxnL/tD67RE30uHtOEpTiaayj30+6rCp83UyV4EknwJ1z+rhq3tzPbuTm8Gcq3hanqSG8vBWFg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757552099; c=relaxed/simple;
	bh=lZzCS+MeXaNofG/AVijdQBYuo0tukXfrPem+nM3WxZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ate4zHFBd/1gmH3VKBsADWiOqVm/ZYY8cGQYkpv2rpMUBU7xEQIMePRUziC+/iK1oPgCMH8nVHhpM8pAN8ZR5ov6mMg9ql3dccStbmnXidK74uu+FnJ5kVbIpdoc9UYT/1qzfqjWpYYpijzetlYE8asbPtE1cgMptiC7xfgks/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=USDNm4tN; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="USDNm4tN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VWNzekpPLwPTQVybzuyW2DHLqEF96+Dlyy5rNIWbA7o=;
	b=USDNm4tNkU2k64S9XzIbZLGDzVIk/XC/RsjSRoSgD+c3gEduwW9DX55lUZQHyA
	L7y6RVcSz/gQaAE67AWdTUdElPAgD7yA0CmulF/oyjOWRqruFciH0Swpmn2jbcPJ
	pqWimNutWW7FyJzXMfA23UfhFa//WTCZhcZvgFhkQ31iI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3b7rOHcJoCbFNBA--.8694S3;
	Thu, 11 Sep 2025 08:54:40 +0800 (CST)
Date: Thu, 11 Sep 2025 08:54:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: add interconnect for lcdif-hdmi
Message-ID: <aMIdzu2eLMXk_OLp@dragon>
References: <20250821160137.108735-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821160137.108735-1-m.felsch@pengutronix.de>
X-CM-TRANSID:Mc8vCgB3b7rOHcJoCbFNBA--.8694S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOksqUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxBGq2jCHdDDJgAA3I

On Thu, Aug 21, 2025 at 06:01:37PM +0200, Marco Felsch wrote:
> Add the missing interconnect for the lcdif-hdmi.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thanks!

