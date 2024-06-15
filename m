Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F6717C9B
	for <imx@lists.linux.dev>; Sat, 15 Jun 2024 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718439114; cv=none; b=fuCPjG2J5ST2Kqx7E84sf+SchRidQQ6XLTG6GPeqO2kVj50hx1vC1uv99pqRRT1qnY2JKV/Up6YPrkpzF1cOsfEQHxpGkwlMwb8CMWCAby8S3ppRFHCMGivUZQ959HwjqlR7J69l+LZU+H1n4VuyifCwtoIq8cqVu4yruT1CG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718439114; c=relaxed/simple;
	bh=z7xzY9BANm/spwJcIm0bUUa2s9EHOEM//nitveJyGBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Byy3ezw6zkZxt4Tdne6auCdNFmHjQMlfD+xjYAg4I6Q+fpN7bJGwJNdZYh1HMm81/WRGAATocdBoesETiKQgG/gIJ8WK1PozTFL4/Q9OJXOkKUpoSSmRTmlAmqYP48BRgZ/XqJqc3vL99UrnFKe7NMj9VUE8/NXL3dEl8ByKQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OpSQ8LKR; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OpSQ8LKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Kv/0OpESA8neJmt74/g+kzxdmLs4coxB4dCFElKdJ0Q=;
	b=OpSQ8LKR6hiRNjfYsm1gXnFrH5OoTjOiXY8F1oGlqabtQjJzOT+tjV9ymn5Rix
	HZF1MVMY365nZ+DHomw/86CaDsXsXqXa+ICvsqNS9ukWiYJu1GQ7DFUR8LU+KRSb
	BjHwKA7nfjsgmuHM078Wl6p1gbIs/Awj4aaHLrlY4ptuc=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrAD3_0O0TG1msRfyBw--.30197S3;
	Sat, 15 Jun 2024 16:11:34 +0800 (CST)
Date: Sat, 15 Jun 2024 16:11:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql-mba8mpxl: Remove unused
 ocram node
Message-ID: <Zm1MtOgPe5bumchX@dragon>
References: <20240516112344.200166-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516112344.200166-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:ClUQrAD3_0O0TG1msRfyBw--.30197S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUswZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFRb+ZV6NnPtUjwAAs3

On Thu, May 16, 2024 at 01:23:43PM +0200, Alexander Stein wrote:
> This node is unused and origins from downstream kernel where it is
> used for the DSP.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

