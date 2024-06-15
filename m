Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64F61803E
	for <imx@lists.linux.dev>; Sat, 15 Jun 2024 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718438881; cv=none; b=ZFuEE1HdG2lW2b1jorby4JwTYMypv5O1a57hheBcHizUqNn7sq+lzAtbAui4Qi3F3LEzQdBKOzwNZI3282cqLJXzwjgnUN90YlL29NJzpiRtexMW3F+F6fLiH3iUKADEyYarbNGmo48KAQJpS13Yrl1AassgHV9Z9i1m1atFJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718438881; c=relaxed/simple;
	bh=rPgCc9oeqCVfNZ8wHQbb4DAAw3Bq7+5vbSGwXTvp2p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnZ9ygYGWJqsUiqYQfdgWaDhzcqSwVrdeGyF8tnsLHA+9NA0fjGYLQahSUg/URvxwGxA1xuP5X+IjWZ4MZ3gg0+Ux/F5eVPAFkmP6Ju5mlQLq6t9kskQRJ9sbtpxMS4dRViyCaIXvfL8rgcC+Z9ckL5dys/iqB2rfS05zSk/JC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cSpa9X0I; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cSpa9X0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/iKjibvMsxezGFlPSNPKpOBNVsf+6rthH3pcb2WX1No=;
	b=cSpa9X0IMbQKAzcN/yz/8EXPeA/EMwh8Ujy3dqSwaVMna++cJGjIHFOptHf+pT
	4OwVYNQvrDW4ylikwSuEoMdEBaja2yNLBdrQeet2c8KZV3ppNxuzEidY6I1ew8Dq
	NjL6q5HtOm1NOl+gl86hUdbqGZ/2nmmKXNjvlyMGhOS/Q=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrACHjxDRS21mwOK0CA--.43334S3;
	Sat, 15 Jun 2024 16:07:46 +0800 (CST)
Date: Sat, 15 Jun 2024 16:07:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] arm: dts: imx53-qsb-hdmi: Disable panel instead of
 deleting node
Message-ID: <Zm1L0fyKupDFDOUX@dragon>
References: <20240514030718.533169-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514030718.533169-1-victor.liu@nxp.com>
X-CM-TRANSID:C1UQrACHjxDRS21mwOK0CA--.43334S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUswZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRL+ZVsVCphcKQAAsl

On Tue, May 14, 2024 at 11:07:18AM +0800, Liu Ying wrote:
> We cannot use /delete-node/ directive to delete a node in a DT
> overlay.  The node won't be deleted effectively.  Instead, set
> the node's status property to "disabled" to achieve something
> similar.
> 
> Fixes: eeb403df953f ("ARM: dts: imx53-qsb: add support for the HDMI expander")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!

