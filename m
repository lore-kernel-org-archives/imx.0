Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE212AE8D
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735533688; cv=none; b=tkO+F0KagaljhNcy3zSZkDlYm7uXjbE7lhJEcA/P1aZQof5sTZ7h1/9W1F7qP6E6NGy/4fbQbnJbiFkZtHBEx/8PjG3c4HSlO5dT5LQmzcy8H2h2oRsx49Cf97qd9k7duj3KCTLtu2TtbP38AjYRTvSxK1HMboA+1qj+rNcXqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735533688; c=relaxed/simple;
	bh=01AEnGO9TM16o7SKHfLWZaq1gvfyVrFYBYCzXmijilY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nawyqWxSNyh+xMhFNG81j1Cc7JT5yo4qRmadBtBZfIxy/1cuDhMe15Q5AMjPHF9sy5XM+P96OkYTrb3JcpKxCDXIgF4fprI973iqR4Y809Jc2I8rjCcPx5U5GO1c3bOtvMgPSAZtc1/Rjl2+eLkvz3ycXrhah3Ozjn3uuQwwG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kQzYwbRG; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kQzYwbRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=byvfiLkLHPQubLRAWzosDVyl6ug4veFdMUvKeRG1Mgo=;
	b=kQzYwbRGvjebhm7dSfWJz53E+xjqhVOpw2A5AY1Oc2e4KzaSVjn6Mp+SlrtiUo
	+AG1q50CCEAF11eBSeD5PdbOkcx1LnZt5jUNuZXIaZqgB0GRt0phigiQhpjBrg/p
	Cxcd2uKl7JFrmjZC2WegXb0B73gB8bN4tY2SkzU0zwAZ0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX3ghgJHJn9CX2BQ--.60471S3;
	Mon, 30 Dec 2024 12:41:06 +0800 (CST)
Date: Mon, 30 Dec 2024 12:41:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH] arm64: dts: s32g: add I2C support
Message-ID: <Z3IkYGFGb12LCVIO@dragon>
References: <20241206123119.1688712-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206123119.1688712-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:M88vCgDX3ghgJHJn9CX2BQ--.60471S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWDtr4DWr43Zw15Cw1xZrb_yoW3Jrb_ur
	WSkr1kCrW5JF4xKr4fXws8Gw1I93ykGrn3Z3ySga93Gas5Jrs3GFZIqFyjqrsxX34xZr9I
	vw1DJF40krZFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0wYFJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQXFZWdyEUJH+AAAsV

On Fri, Dec 06, 2024 at 02:31:19PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add the I2C Devicetree nodes and pinmux for S32G2 and S32G3 SoCs.
> 
> With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
> (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
> are quite similar. The common part for the EVB revisions will be
> centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
> be placed in 's32gxxa-rdb.dtsi' file.
> 
> This refactor will also serve for other modules in the future, such as
> FlexCAN, DSPI.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!

