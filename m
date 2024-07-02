Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055DB335B5
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719893724; cv=none; b=N4gRpcYuzSTpiZTJhP/WuwcjqUSPw/WkPMG88wEeeM/qObWwdQTYFjbdKhEdnHODT3BCFJfMT1VfFCW4ooeIdHWL/nvzDznAjTNGlGdRCxtnNITObKu5S+hl1O2W8vR1nuydEhe5jQ+ak3qg2c5RWto1QUC3W2kiGxZJyCpDcis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719893724; c=relaxed/simple;
	bh=B6JQ1lFaaesqbygFK3DaqXC/sXzecViX0oE8axOCyxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOO7Q7c3snNTmcmg+emV8s6OI5GLz5Lxgs3HNPZj9Gwbn7PjzSrQE1p9ehJyo/MN7efUsq81fLgxTNbMHRZBrUEfqGIp+7+DV2HWZ8hLxjU1c7tZ/ZZtwhWyaPZb8eDMb9x6/0Pv9ZK2dYq6eJDc9NIy96BQrnlCDfgwbDuj948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=T0aZp4XZ; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="T0aZp4XZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=3vKI+MzES17VVsUxVndZKuD9mJDGOI0oaeEUsf55ffk=;
	b=T0aZp4XZo+o5opEzlG6QWhkgCtcDcN4FJA5s+CVmJuZR6cnf180nqenx2MX4q9
	nPHFJgwlbN6Fd30cBzk1p4egSGm7lbLytfTQ5LCIHRSZPC3P9LqAkdIhUiQdTamE
	gZQpnf3D4cAH30W4EfVNMlWhyho+AffKE2uZMTjyUmCrA=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjyfDfoNmhv48AA--.8122S3;
	Tue, 02 Jul 2024 12:15:01 +0800 (CST)
Date: Tue, 2 Jul 2024 12:14:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Remove 'snps,rx-sched-sp'
Message-ID: <ZoN+w6jNx+EU04dO@dragon>
References: <20240701205458.164053-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701205458.164053-1-festevam@gmail.com>
X-CM-TRANSID:Mc8vCgBnjyfDfoNmhv48AA--.8122S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx66zUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAUQZWZqrzHYLQAAsT

On Mon, Jul 01, 2024 at 05:54:58PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to nxp,dwmac-imx.yaml, 'snps,rx-sched-sp' is not a valid
> property.
> 
> Remove it from the imx8mp board devicetree files to avoid
> dt-schema warnings:
> 
> ... 'snps,tx-sched-sp' does not match any of the regexes
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

