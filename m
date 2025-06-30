Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8C3D6F
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 03:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254575; cv=none; b=rNds/zaVyQmpWAvC5dhS/owGItMJZEUTTd7qGVqZaluPPkHMNE13ognnGZLzOM0ntevrYhlhOgfiVQ8TYES5vNTTrhzIMf7FUzkkNmAShlSuxxDD+QlQdI1/lGodwJSV3ndxBiMxOlxTsnqAHMQD/Ghx095UKzD2jB6Kusn5kJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254575; c=relaxed/simple;
	bh=nz/6V9DH4cKVb4lElTTDh2PykRGAK5Z38f16mJFADDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWf3JgZcAT+gWOMRJL5SBFTbjMwvEsdgODc5uYu8GHiA5ZoLZRy2IcZIi8foLsL+0Il4pxOgmC3zBm416WfeUQIwB7rZxCydDNJzZewFY8EurDRJ9S6zXBl7XzCE+eJBrhoEYir4t+fFxn/8smvDzo3Z8Nx4OityF9Ox/yHgNoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gvVCSYMT; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gvVCSYMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qdncWhYOth4XsRh697dCBi3DdkMHRax6Ejf9OY8OaFU=;
	b=gvVCSYMTCNoxNh/h6g8VWMVoFtxUr7hJIEcpiUCa1SM+RyIi9/56dcfsrqM8kG
	jg+Q6EPq+v4M1GIa4Kgx1Wt9RXTyzDCcknDaS9p1F9GSMhOvsMb8jjqYHtC6e0++
	advQTP0riI22qgS3Fq/zsrJJVcnw/hA6RciTrNSfTjI/o=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnnw4RBmJouQnOAQ--.13995S3;
	Mon, 30 Jun 2025 11:35:47 +0800 (CST)
Date: Mon, 30 Jun 2025 11:35:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, Frank.Li@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] update NETC node of i.MX95
Message-ID: <aGIGEVXNyCQZwE4A@dragon>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528083433.3861625-1-wei.fang@nxp.com>
X-CM-TRANSID:M88vCgAnnw4RBmJouQnOAQ--.13995S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeksqDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QABsm

On Wed, May 28, 2025 at 04:34:30PM +0800, Wei Fang wrote:
> We found that NETC has an overshoot issue, so the drive strength of the
> related pins needs to be reduced. The first two patches are used to fix
> this issue. The third patch adds SMMU support for NETC.
> 
> Wei Fang (3):
>   arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
>   arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC
>   arm64: dts: imx95: add SMMU support for NETC

Applied all, thanks!

