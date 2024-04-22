Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6050A819
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 03:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713757924; cv=none; b=Vnplq+fcb7QV5NtEKkw6uoUNs2OSrkASom0w+41ZOkpMZaZTloci/DnlFSe3kUOnekIRwBBb6uQCnNkIvpXuOksllzEPrzv8QKGJ11npVAIwdBmzIA/w8ucr0ua1pOCAzUk99AoArPDNn0wYez/5mLYBXQbL/txXXz8MkOOr9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713757924; c=relaxed/simple;
	bh=qh2lATBnUzpzdGwkWu5xianoE/fEhMZqMckQVquiV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMkZp45wzPgHdEmMuBG1sbP+0rupjcOsog3Pcha9imrR7BRfRKiD1jT88v6QRcL5S15apnKv3KL5dUaFG73ZrdTc7WnsC3l6jq4W4KBZxuB+c47gkZHbekn6xVznYgdnQbTTZsvPNirUdD4XE/UdodJVVIoIxvb7ndn0I2XZat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=foSg7VtP; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="foSg7VtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NOwt1UGzpwYrljiDMRzV2Nl5es+FS2lFQ8lExF5kDl8=;
	b=foSg7VtPVvtudsSwbGV+piQkV5VJoZhu+wuOXNp6BoxNaOoupkj7suXFaT+MFd
	9YBBeTY+I7ndVdLBAeufvZ4qEWa+5GP6xCYnBwzRpsMpbMyfrzDLaUbfZIZnCWOs
	4+xiSiInrjfOBrNc9UySLuHr565AZK2I0UAmxw519vxaQ=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrABHrxiT3iVm6gIyBA--.28493S3;
	Mon, 22 Apr 2024 11:50:44 +0800 (CST)
Date: Mon, 22 Apr 2024 11:50:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/7] dt-bindings: usb: usbmisc-imx: add
 fsl,imx8ulp-usbmisc compatible
Message-ID: <ZiXek6rDRdku9Bfm@dragon>
References: <20240403090438.583326-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403090438.583326-1-xu.yang_2@nxp.com>
X-CM-TRANSID:C1UQrABHrxiT3iVm6gIyBA--.28493S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxGYLDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBTIZV6NnuIK1wAAsT

On Wed, Apr 03, 2024 at 05:04:32PM +0800, Xu Yang wrote:
> Add "fsl,imx8ulp-usbmisc" compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied all, thanks!

