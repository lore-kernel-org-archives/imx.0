Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63240101F7
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 01:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723513592; cv=none; b=phwgeE1gAZTUYy3lxRgPWW5wZQH3n6/JdGuzmrzqsivLvaSZIQrq+53LnEprDxC2gCUJ6H2ivWY/EBt5haHzTj4gPg5EOFXVtLjxm1DQvWITGsMx6UFYiNzK3ysPg+Lt/2KLh1nWdGLxo2DHFH5yqURrKcwqIIMqDAeko+Vy6tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723513592; c=relaxed/simple;
	bh=3ghMVHHy8SiX0w5LJOiikjGvC26Y2DBCfESc++S90EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7J/eH/Hy6QmnC08JDfpb68tXZkK5gn/rgdWLMSqsAyl7iPryNFyf9IRAsIX7UwueLfFVBza+A+HQA6y7uueKsniO/aPYyzwxxbMeN6ETy/ijbF5QdGL63/pB9qt77Y7T3ncMFDJ4UQsqiwBYxnCoj90WTMFwVWLBfWArbTc0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kK0XCXep; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kK0XCXep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=39oKZo1tR8lcqsDZPVTXhqeGc16qjfsZRRH1tPjo9ew=;
	b=kK0XCXepoWVU2RJyCir8xKw+oPcELlYpoRUlGbMAeaGDPI2nQWd+xnLrkwL3Up
	YB1Gp5kttel9w4UhXx3TVJliKnX6I6q4YPua6DNWBT5+W+d1NYX8k4yR6mvSnk0J
	xIlpOSDH0idhQpTEQogfNfN4bQPBKUYCf2PKT2+ihrkfw=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAn75DNurpmUUReAg--.38403S3;
	Tue, 13 Aug 2024 09:45:51 +0800 (CST)
Date: Tue, 13 Aug 2024 09:45:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] arm64: dts: freescale: imx93-tqma9352: fix CMA
 alloc-ranges
Message-ID: <Zrq6zXTowvXIUk1r@dragon>
References: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
 <20240724125901.1391698-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724125901.1391698-2-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgAn75DNurpmUUReAg--.38403S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwk6ZWa6Xp3TZQAAs0

On Wed, Jul 24, 2024 at 02:58:48PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> DRAM starts at 0x80000000.
> 
> Fixes: c982ecfa7992 ("arm64: dts: freescale: add initial device tree for MBa93xxLA SBC board")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

