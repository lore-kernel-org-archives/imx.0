Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8057823AB
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725176363; cv=none; b=s2K8lTnSAXJn/nWcxXa82VDmcZoyFAy3O7OKjLe8AWOQsrMdcLZboWno4IqZ69AOdD/EhPhEt4jry3gvQMUuHWBu6jlpZwEnsxLmIc/vHVATDKE6RaW8vldygZeOXcjevPYWyD8KN7vLqkWsFMSeSlf+XaMZbcO98jgPxbsCgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725176363; c=relaxed/simple;
	bh=gMVfahwDd8Bg+Um22R0oyOMnqP9JF6rpt1c3+R0yPsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBChbI4r4C1zaaZFzUnmm3d9PqPY6tXUk7jNTSaWSSdr3e7AXvEaaCkHWM16m6I2lgVnoHylbQR1XdLRvEum+EtGoNepl0SlJegt5BcybNpvi5Q+KFw0q5nan52DTKzm55eZCfQvLmN0rRinYoa1aqz+dwy8a5r9dAtYKrXvDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NvXgLli6; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NvXgLli6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=nkkAvqscjV3VwDh+ot+genWNqMJPdPuo/uhphejIV/s=;
	b=NvXgLli6WLZPoDQ0XyEKC0aYGmLi5vKPbv810e9CQOKyPf8ZsCORYmIkYEPbUY
	8N87NWGO7meYMWjaaEeHToUwgLswt5FNE6NxucUp/NJ+QYwZOggLj77PxoLGWilM
	yEzEF08+NmrlksQI1awmve6oeeBdUW8smfNt3NoeO1L9w=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDH7SYQGtRmwxNDAA--.6687S3;
	Sun, 01 Sep 2024 15:38:58 +0800 (CST)
Date: Sun, 1 Sep 2024 15:38:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com
Subject: Re: [PATCH v2] arm64: dts: imx8mp-evk: Add native HDMI output
Message-ID: <ZtQaEFhedn3X7Cpp@dragon>
References: <20240823021257.1067054-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823021257.1067054-1-victor.liu@nxp.com>
X-CM-TRANSID:Mc8vCgDH7SYQGtRmwxNDAA--.6687S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4GQ6DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB9NZWbUC2If0QAAsm

On Fri, Aug 23, 2024 at 10:12:57AM +0800, Liu Ying wrote:
> J17 on i.MX8mp EVK base board is a HDMI type A connector.
> It connects with i.MX8mp HDMI PHY.  Add support for it.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!

