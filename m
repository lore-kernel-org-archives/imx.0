Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933CB23AB
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705237; cv=none; b=pFec1vtLypHwkNgNfk88qPGemT1+AaKTiW79Ud8KNLPqZ8y8u0S0lcuhhdyqNX0rXKfzh/A5Ldl/feDCVCe/Rb9rUNrWTXBtkfF9Hkc/FU4VelqFLng1BXpYzQFX+O4Ks4R39NadKb/wjrsMSpcvdN2hXsl06ldENR6UOpQOwGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705237; c=relaxed/simple;
	bh=GiRQ44XoYqE07fZW19TbFukpCo1Y0A4Rlx7CJg8YJac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkIIQCzTRr55jnYHGnGn8zMpcr85TvlJDSGV2LpHJ3RaBO4Dtgi69m4g6ljOm4sRM6nLgI6DM031n8ryrknldU8zZUQb0TticMmz47D/1Z0oHTf/2EXYiuEZaf0IM//iVGWLt60yzSNnT4AP399D75jeFmwJte7SQKFk54nCtWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QyaHgJGp; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QyaHgJGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eCrYpQmHtF7S8qAhF1e10rg05ea10pvsNpYjs321mqo=;
	b=QyaHgJGpPpHLQyiIiQjRLzM7UFFWU8yPtjZfta4ZdxbGxCWvmeWHKpcNWlPew1
	aGD2uMgD6tl4nzxOS5oUqioXtN3cbDBC0ufkeyAvwkEMkckqTzXwikf2Dcxya5qQ
	XXqBtbr/31ojJj2vqgxM9bwvHcbHbE97/s6xAVPBJ4xlI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBX3tQqdyhnhWKmAQ--.16318S3;
	Mon, 04 Nov 2024 15:26:36 +0800 (CST)
Date: Mon, 4 Nov 2024 15:26:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v4] soc: imx: Add SoC device register for i.MX9
Message-ID: <Zyh3KkEQ7ZFY9870@dragon>
References: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
X-CM-TRANSID:Mc8vCgBX3tQqdyhnhWKmAQ--.16318S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUciL0UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhqNZWcoMhXQgwAAsb

On Thu, Oct 31, 2024 at 02:54:38PM +0800, alice.guo@oss.nxp.com wrote:
> From: "alice.guo" <alice.guo@nxp.com>
> 
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
> 
> Signed-off-by: alice.guo <alice.guo@nxp.com>

A side note: could you git configure your user.name properly to make
the author/SoB appear like:

  Alice Guo <alice.guo@nxp.com>

Thanks,
Shawn

