Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40511849
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718520956; cv=none; b=o+jWXwB6rH3quRt4rk3VrGichyIV+aeLPUDus+UOpuOaelwcmIXfigbspInYMZ9yp7JuR+SXw06+jZB3V9Hspzo32G4ygPB93vEmyPBYqyw92qPimmFpcLu5LRWQtId2x3hMf75C1NKbuk6DVL+dafn7uErPIokW4Gl0n7SRAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718520956; c=relaxed/simple;
	bh=weXblZGQTXhCcgWR2tS3lV6++Dz7ruXUjcEWPz8id/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAVGc4uZLm41osS8C5YSKTApHwoIP3d1elubJnU/lIT3oeuONLtJpmtb1RX0rXnr8kjTejuR4fPKgUNesKWZzdefDT7hIp2W8ULgQShtYI0bqvxpaWsfBLGxXtN8jlFKHakdtUMonDImwmLkn7VRgipqS8Bn3yf2q5ULjaRGIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DT3Jk8l6; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DT3Jk8l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TyImyxiwmiztTDCYgP43q/RjNR9SBQZeJHg9PIFjFpI=;
	b=DT3Jk8l6eeEGnQo8LCRh9X3zSiSOQbhsb6CK2wQ6BwWb+yfk7xwlmBpfRHPNIa
	BK0mBSN0isIcW7lEu+ClbmcIPGUZigzpH1GTN2tIhJ0+9ApIdGj5oUK34pm5PdwS
	2Ggr3ngKpVsCPOaDwyJMbEgwabCYT41BP9EgKa6KW/x8E=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADnD1BtjG5meRfBCA--.30676S3;
	Sun, 16 Jun 2024 14:55:43 +0800 (CST)
Date: Sun, 16 Jun 2024 14:55:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: shawnguo@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: ls1012a: Reorder sai dma-names to clean
 up DTB_CHECK  warning
Message-ID: <Zm6MbW60pmIFY+rS@dragon>
References: <20240531215017.1969431-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531215017.1969431-1-Frank.Li@nxp.com>
X-CM-TRANSID:C1UQrADnD1BtjG5meRfBCA--.30676S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsiF4DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDxAAZVnxc0p68wAAsi

On Fri, May 31, 2024 at 05:50:14PM -0400, Frank Li wrote:
> Change order of sai's dma-names to clearn up below DTB_CHECK warning.
> 
>    arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sai@2b50000: dma-names:1: 'tx' was expected
>    arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sai@2b60000: dma-names:1: 'tx' was expected
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

