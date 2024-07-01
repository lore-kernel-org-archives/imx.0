Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBEA15ECFA
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719841880; cv=none; b=KHM1FDK9l30vSXJ9IkP1bQq7EOG6ur4vcWRlMte1VHgsqUKtWZbpiBepSH9yGCfRFsPLM/c/MUUrhBLPuWN3GGIgG9DqsoFtQVa/yJx6suXr7WvyxAATU01gXt+IQqyOPcGPsIgotbsFGJFFh0ZjA9om99K45dhOeGguuPdKX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719841880; c=relaxed/simple;
	bh=WJFcrpAfZ6kI2zxHwjgX/7RRQzrcoaIk1p4RHYDLG6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktxyyDHML6rUo+tLM2lRAlGRedMFAedCTlbCb3Q+4nR1UYJKeIcBAV0w3qZFFL5KBujKa686KoEhCnptJB7C0hiyBKvt8SSvMacZRVg38zlzd9txbgXmZBOxK3HxkkdkzEnqLBidXWz0+xwH6+oCwVN708ULRtleykLVh6Vh7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TDjtVtGv; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TDjtVtGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=46sR/V9dviRjPP8fczYXYSmC0ZFzyAg7+5eAMPqu8VY=;
	b=TDjtVtGvOiV4G3I4CyMU2yX6yusj8RjKxWWm8PBa/POYrSIvZPMO+LG+5n5i8K
	mOO+GcgfYGyW7Nls1tJNmXAxWnc0tImyXe4vAACJ30YIn3JS57hrBEfEGUpO4uNB
	6GnmyJ6miDhDWy3KSKzO6+lG7ex0MuqvbpEwASxyk07Jg=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3H444tIJmlLU4AA--.1103S3;
	Mon, 01 Jul 2024 21:50:50 +0800 (CST)
Date: Mon, 1 Jul 2024 21:50:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp-evk: Add audio XCVR sound card
Message-ID: <ZoK0OCYzcvLDH7F5@dragon>
References: <1719481981-4069-1-git-send-email-shengjiu.wang@nxp.com>
 <1719481981-4069-4-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1719481981-4069-4-git-send-email-shengjiu.wang@nxp.com>
X-CM-TRANSID:Mc8vCgD3H444tIJmlLU4AA--.1103S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIF1vUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBoPZWZqry+fPwAAsY

On Thu, Jun 27, 2024 at 05:53:01PM +0800, Shengjiu Wang wrote:
> Add audio XCVR sound card, which supports SPDIF TX & RX,
> eARC RX, ARC RX functions.
> 
> HDMI_HPD is shared with the HDMI module so use pinctrl_hog.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Applied, thanks!

