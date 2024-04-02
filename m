Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2C7111A3
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 03:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712027300; cv=none; b=AjnltmIJQMXqeduh2jT7t5njmcoxEmvnqGJfQq19hoVHAL5peG4l4UzqG3ueGjwnwosp20nyfYpdB9qYrpUnC5UpcYk+Qv3Xb4iZL26hTJxHqnDxveVKP2JqaygrYZ7JqC2sjoRBKQSYjpvRMPd7F+OwkxM+OB+1WBdGjDl8j4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712027300; c=relaxed/simple;
	bh=THQJhfCI3NV5s3qjkmDdRQIp/h1O0ux7I5EUAKOnlPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWFDcLsFn5vA6YWP2/PKlMsuvPeTlCCaXkvpNW1XWLB3qQCKAWGJhlkQaZxhJ3zYRAvFJ70BZ0Ppn3fSrjD5/Dyt4rSPOs1X4prpz8TK/R42fTny9ifMVG9u8b9Np6uEdU0n139yS37A7tm8GTgj+a/nJ9q108NHz9YhcMqP+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iUoylHQ8; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iUoylHQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=W6kztPF8aGTaXEy+y3D7Q11qG0J7JfUXpshpfWhBdVE=;
	b=iUoylHQ8JHjmTiqSGgUuCITSuEb+xlWu2gRbtA2mMmYeHL12YeppOYvXSEcUkh
	eL5W2tCt9ChwKKraPstlr+LmIpKWXszKtHLjIHDQALwQkYgfI+bT+I4YTGwD1H5Z
	hEMwdO4SV/c7bV64bTtT51wrkVNj/o9WH/iglbwZkp0sk=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAC3v0N8dgtmfdWdAQ--.42632S3;
	Tue, 02 Apr 2024 11:07:42 +0800 (CST)
Date: Tue, 2 Apr 2024 11:07:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: frank.li@nxp.com, ping.bai@nxp.com, lgirdwood@gmail.com,
	broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 3/3] arm64: dts: imx93-11x11-evk: add pca9451a support
Message-ID: <Zgt2fFO43Bi2Kl7s@dragon>
References: <20240320062849.1321423-1-joy.zou@nxp.com>
 <20240320062849.1321423-4-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320062849.1321423-4-joy.zou@nxp.com>
X-CM-TRANSID:ClUQrAC3v0N8dgtmfdWdAQ--.42632S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUISfOUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDx+0ZVnxcmVXzgAAsn

On Wed, Mar 20, 2024 at 02:28:49PM +0800, Joy Zou wrote:
> Support pca9451a on imx93-11x11-evk.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

