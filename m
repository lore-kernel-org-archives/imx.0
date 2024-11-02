Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CBE1DFE4
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730518011; cv=none; b=dDypGVu1b9qYBhKNlTTlpa4LrhJqKinGt/iM06A6xqXmMAucxwRWIjT25kwgWeP7CXt7BiG5O3VS+s8FQWFJWAw82mM/ayUfJh8BQOT016Y6gj5fVyf4gZvGP4ogg/nTrGtkkgTEs6me9V92GlU6PdzcUA6YrtWY2QBhSj28utM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730518011; c=relaxed/simple;
	bh=nD+iQCLJh7+NDL5u79e4KYk9wGpDwt6fXtMLD4syEW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+9ocLejwaHyjD5HOTmxe0bsj3DS2FdCM0VkSHXOb1/Lss1v0uz5cnYnup9KcAFm8RCmSxMW1wpLOP2w3UimCud4j9buKwny6fm0v6mIoPS0NSZ7w5fh1hjF3qQ+aLZfk2xYHFunzFQ7+h9+JLHOM7T0PW1sQcIc8q5YALpkMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dAN5qZ1e; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dAN5qZ1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QEtnDnK/7wth/uKbwtADHbubamilF5yoOXWVFYE6lhk=;
	b=dAN5qZ1eUDXdEyf5meWRioT+DSfcFfDJWtgxxUNSgJPuk7x/kUuTQTdgxIEe5Q
	4NcXaFp53WBFh6WqAiud3lnU7k9M7KEXa4Xixsrulhnmdb/vQSfe9peRRC5/Xx1e
	JUbOlnorWPWxC7GSphvb1TKPiZwjzNlOILK2BaqPFFQ3E=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnAIbkmyVnBSB2AQ--.14854S3;
	Sat, 02 Nov 2024 11:26:29 +0800 (CST)
Date: Sat, 2 Nov 2024 11:26:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] ARM: dts: imx6sll: Remove regulator-3p0 unit address
Message-ID: <ZyWb5CBbGDfJ/Nmf@dragon>
References: <20241025010855.1593365-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025010855.1593365-1-festevam@gmail.com>
X-CM-TRANSID:Mc8vCgDnAIbkmyVnBSB2AQ--.14854S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx18BUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERWLZWcliaEkcgABsX

On Thu, Oct 24, 2024 at 10:08:53PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to imx-thermal.yaml, the anatop regulators should not
> contain unit-address/reg entries.
> 
> Change it accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied all, thanks!

