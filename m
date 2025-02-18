Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D149618E1F
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 03:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739849001; cv=none; b=Dvkkt6T3nIEFWNbQoonAZBn/fATbbmdWcaaN+SCzpfdiSDE2XHHPVh+Kd2NF4nAlggmUoeTfRxIf0prN7rJS1IK57IQWuayqQyRXyMpCXucYJ2liY+TwMPgzKbHSEN0k5orlARR3lor29NTNLvKrequYFDhTKP5N2iVuGsC8XHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739849001; c=relaxed/simple;
	bh=ACESIAg5H6NmE8Oy8ryhBr2hRmE7wL/qW1OgxW4HKyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7CfpaCAMJ6/yLvU6fhZEE41Vv+VX19MGipWX8pSJoi0OJdgkZUDf8A/vCCXbDVTiQofNhBuIH1mfzL6v4a1bNH4JSNMReUCSLsAf23iaVbgHdbLfVpgNBdGcENMYQUj02yVxEilIBB8g8M6gc78s/C3+U3z2iFxw1hEkOBkY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TGQHxA2V; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TGQHxA2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yJKZPKhZSBu8m7jUY8+yqAqrfXR481jG5y0tqh7GeT8=;
	b=TGQHxA2Vacl0E9BffGFFe1GpsOVIejfkDDKhdRLIQhO+QiVXmUf37Ib3yDIJmy
	MLXEt31+qG3VEdpVxEIDx/Oh9E7CRBnZEoEBHcJXTgrrpmLDmUDNJLtMB//UOskZ
	F4TJPm4Q/RHU4NAHtaID4iB/TobJcPrrfe4Yc99gsw1SQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHLvoV_bNnQ9QhCQ--.17752S3;
	Tue, 18 Feb 2025 11:23:02 +0800 (CST)
Date: Tue, 18 Feb 2025 11:23:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH] firmware: imx-scu: fix OF node leak in .probe()
Message-ID: <Z7P9FU0WJ2eNNOtp@dragon>
References: <20241224033456.1312930-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224033456.1312930-1-joe@pf.is.s.u-tokyo.ac.jp>
X-CM-TRANSID:M88vCgDHLvoV_bNnQ9QhCQ--.17752S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUe4E_DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwr3ZWez5oCC6AAAsL

On Tue, Dec 24, 2024 at 12:34:56PM +0900, Joe Hattori wrote:
> imx_scu_probe() calls of_parse_phandle_with_args(), but does not
> release the OF node reference obtained by it. Add a of_node_put() call
> after done with the node.
> 
> Fixes: f25a066d1a07 ("firmware: imx-scu: Support one TX and one RX")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Applied, thanks!

