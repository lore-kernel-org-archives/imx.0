Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3CA41;
	Sun, 18 Jan 2026 02:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768703660; cv=none; b=YKBzN8rETyMixX90A4aFK2hurjz0GeDvk9Ox9ubsBdjNxZ/c4/LEcslMmY5A0y4pAH56pB4y9Xj2LJlg/SDUp5rRiVQGT1chNks26u/yfxldeY2h3FfNnpj9Nutw9HM7/jKWkd+8uPInhHdX9qJzM3M3E324/xOLnwNz+FKs1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768703660; c=relaxed/simple;
	bh=apwvLBDBISFrwUMw2VgWLrYuwUjiJ3bx+VoBhh7dTMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8Ce/qjWkLONeglNr6o8jLPKBonKDVMqBIWeyUHd8jsPHtjd42Bf7+HNUtvMv0GFHYp9KL6IsmqQXxgXV3yEDhYQaOTxJ/kwssBKV9syid6tn2oVM6So0YW/OPptDf+V7Aphadvt2Q9xjvru9w4iOAAkGntCfabfthGAAGfvQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGmwWkgj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGmwWkgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813BEC4CEF7;
	Sun, 18 Jan 2026 02:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768703659;
	bh=apwvLBDBISFrwUMw2VgWLrYuwUjiJ3bx+VoBhh7dTMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGmwWkgjpUyKdcNrcUoPywQrBgW3lbY8UYEn5OQMVNQTRt/KdOKXbQnwRi7fP2w/8
	 vsQrRTPWeSuU0tNASu3EH5ZNnhKYFDR9V38zUmKPTITCfNrfNxZpfMHWrzGaf/cG7Y
	 MXgh7iIm1pHObYItQg7LhcPl7rHEcwcX+4FiFnaFW/kPjS3vV13mgFTJm2vMm04N55
	 xkLj2AO5BjIN7AwGf1rKQN2flk+EJp9MfqjQILAeh8hs4zgWt4780Hxw8DPYx+nT0T
	 oHBVo2K7THeODc3o88uIKuiGbTsHCqZwnz89SVO4nD8rr+a2r+YnT3wXWJWwDH4qrI
	 /gi870EGpopnQ==
Date: Sun, 18 Jan 2026 10:34:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
Message-ID: <aWxGpYwRYMI4dN5D@dragon>
References: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>

On Wed, Jan 14, 2026 at 06:12:41AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> imx8m_soc_prepare() directly returns the result of clk_prepare_enable(),
> which skips proper cleanup if the clock enable fails. Check the return
> value of clk_prepare_enable() and release resources if failure.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!
