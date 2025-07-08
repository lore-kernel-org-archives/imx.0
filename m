Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63F22154D
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957654; cv=none; b=cO8t+qHz3kAFxr6HjiVyxSNvyPFIdzg6gCS4EEgAfnf/itXNANqwy+pQ+igjb5jZKAI9m1Eg+tWnFeUQ987aIyDY9oVLvafrKTCwcxtO/ThrJmjb6JvPbsEVaLmLllnIY8p8tB0H/0eol/1U9i6K5xLh7Z8kt/ERYzYWwltdrdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957654; c=relaxed/simple;
	bh=FmXpT1oIQU7+FHH0NMYMs/qchqVTDA4tNNONibA/G7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trS7ZtZeJzqqEVUMFy4sY7sItNNdomNHFjHYGEC5OSvkBff7kzXOAtqtBdw5VdVI0aIpNWKhlO8GdCxTCZMiT74n0nGmVN0YWgT8mnFqZWuxbA0O0y0CoquHFCyszijkTPpDPCxPKV9Woilq4gv2wQ1fqpcI8APFaYfM+Q9qxz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=k6YUiYfq; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="k6YUiYfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aenlRMHsQWf230y3ByJlfMQQ8hx6Yn/ZktY6wc88/wk=;
	b=k6YUiYfqUwGLNoz6thTc/RodI5PlHSS+JlBjI080QfgV3Zmdf1apTg2Y4DecnM
	wrG558i6bjxgyuFVNlgLNvVqDw/FsrCiBZXm9X3aRlvDc6OvabntbToTds0cEr9i
	t+tgks8HPtDZM+E3ZSFQZk6ZnmFMCBFJhLIGRDEBHzgsE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3vxZuwGxovnOJAA--.44602S3;
	Tue, 08 Jul 2025 14:53:36 +0800 (CST)
Date: Tue, 8 Jul 2025 14:53:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: Update i.MX entry
Message-ID: <aGzAbk8dYliAfCrn@dragon>
References: <20250707063753.1684144-1-peng.fan@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707063753.1684144-1-peng.fan@nxp.com>
X-CM-TRANSID:Ms8vCgD3vxZuwGxovnOJAA--.44602S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8BT5DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR2EZWhsn652vgAAsA

On Mon, Jul 07, 2025 at 02:37:53PM +0800, Peng Fan wrote:
> Add two patterns:
>  - Documentation/devicetree/bindings/firmware/fsl*
>  - Documentation/devicetree/bindings/firmware/nxp*
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!

