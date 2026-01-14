Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA83451AA
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372744; cv=none; b=JeiG5fp3Z4OsQYpB7Bfmc2AlNPu7KYS3gVWG69V7Mbu/PjWDCtsKUXcGx4i3unXL8G4yMzR+Ec68NKzRhLhp5oOR5tNk0aWgVzqtBVNnQCJmHrOkZhrOkkvuAD6W0Z+GkOosxlV0I/6UOMvpUSttkaLbJ/LcxLs5tW8TQMLnJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372744; c=relaxed/simple;
	bh=FxiQuTruxqzqdtmhzZTPGFyUF9BQ6uvXVj8epBaQIvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVZVjHkTpPzPK7D/+3zo5xMGvIhKDZCpSBHF4IHhY0UhCpvvDIQpNE7f76Yd1biaxtia/gJS+jZF+G2j7HpPu2/QudahmJy2kqhfhnXt07SgIMCtRj45Vm9WVOjOi6atAvVY96j6k2yFnPITgJpO90/l7ee0WxEYCHWfs0EO4hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfuWn-0007HT-29; Wed, 14 Jan 2026 07:38:49 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfuWm-000Xuc-1Z;
	Wed, 14 Jan 2026 07:38:47 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfuWl-00Bca9-2D;
	Wed, 14 Jan 2026 07:38:47 +0100
Date: Wed, 14 Jan 2026 07:38:47 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
Message-ID: <20260114063847.bu6dx5w7h5jlg7dg@pengutronix.de>
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
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-01-14, Peng Fan (OSS) wrote:
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

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
