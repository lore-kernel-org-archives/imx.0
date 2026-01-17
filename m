Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6122F77E;
	Sat, 17 Jan 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768628341; cv=none; b=Koe7fSHSgJt9Pda4BDEjHnZPO/8yMK4/A7Dzy/E4MH3UipPd9yMyOfdft6maajabRxTKFK3ntQIsCPrUKfwH6kVfqMO04fDzGO9/O1Ud370rG6PVwQhoZOq8sCAvxLxxKnxanC+caSuasV4EXBD6gOwwBARu0fx2BvOY4tv6UhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768628341; c=relaxed/simple;
	bh=ffjNgoEkUFx0Ov+DoPjdJsmbtQc/m0PgNqHfL7T8fVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pmazb09ucwSr6YqTsTi+OESH8bl+AdQTbkIO8O9lRA8p1PuCJkkRNB6xCOogn31c2yE5fQFobPQ/5gy5cBI14Vns4s+mjL+rk5GWRMKfmdpgft+9fHexVLtJx5gLEWpVWAHpi3SHQDIi+n+DmB6PmD/51x+7KCXIkghHz6amwDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzCLtg7R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzCLtg7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CC4C4CEF7;
	Sat, 17 Jan 2026 05:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768628341;
	bh=ffjNgoEkUFx0Ov+DoPjdJsmbtQc/m0PgNqHfL7T8fVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzCLtg7RF2u/RhuXIQID61h62qoYrXAU79ubgPuZSHjuvnVRjtkN57NVCr3iETHXr
	 zLottRLn05jEXJncLjdaqfAiB0LDhKqf6Lw8QzyB7cLSNki6Iq7xeaieAoovuGJdz3
	 11eXgResvJDQbD8YjmKkM1DipjFkxSq4df6v9m0nlUnoYL5E/T1b0uP7YD7mTjRfBd
	 F8UnP/FPqXyoJPF3VLnAk4KmXXCQZCGU/o+kEbSXPe82KyiBbuldGqjm9JY566uPON
	 DZxkjoM6UZmyUiqFVKzqqvmiTFjPQTYctKYRHmJawej+zvkph5/dy4T0KQz2DB1Rd4
	 vCuIEBsuvMjIg==
Date: Sat, 17 Jan 2026 13:38:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 0/3] soc: imx: misc clean up and support i.MX9[4,52]
Message-ID: <aWsgcN63ooD0ilSx@dragon>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>

On Wed, Dec 17, 2025 at 08:42:06PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       soc: imx: Use device-managed APIs for i.MX9
>       soc: imx: Use dev_err_probe() for i.MX9
>       soc: imx: Spport i.MX9[4,52]

Applied all, thanks!
