Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40711B423B;
	Mon, 29 Dec 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013264; cv=none; b=gQQok+Vh11HoWTAmOPBaqWLEzBha0kE5vQYxgnttwMl4R/zxzlRpTVyZzGAD04DO7dBamR2mWyHiouXkbRVeN0eqKD2CXG8Fz/HDZe1fBqIg68lEbSY9MFSe/oZDqaCbarl/OSfs6RYsTxqYsXP367EtqjfZc5HQqamAiah4MiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013264; c=relaxed/simple;
	bh=mmjJboZKrZmMHhATWamcObm/1IvNb8WQs2oweHCNOP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKbst+uRH1bZReJB9fpzG0IfG1JQkKWdwrvAsEJdveiZOZV7bU6+AZOUMfeCmBV6NM13141bTavpBox7WfGAGTa3ICFoA7dSo5Znbl9uTipDCq8NJIi+pYuRaiBPXYbYC4AMbK5dyQw7bpr/6leTdwndBOa0+dwdtbB3MOfu1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3NDcqui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3NDcqui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A0DC4CEF7;
	Mon, 29 Dec 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013264;
	bh=mmjJboZKrZmMHhATWamcObm/1IvNb8WQs2oweHCNOP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3NDcquiBoavGRJbcVpmy2lzbQuLgx9RqhNPLAFWSz7SGNqOgbKh48WV2BXovpVW1
	 WF0TiokarvtZb+f8KIVdPxs9nkfDw1u+RH0qmdQxiWJ416KXHu87XUU4GHBzlZpe7H
	 Up7wMIQYNgveHofGUqo9M10X4okTh2SuKZDjYLHctBPEK0pFnG737H1SLJeOpf4xGO
	 X+HQJgEdu+xXOw21Ejf4vOpXopFGqmIzRyu5e+meUhLlZbI2MNf887BVkHHTQeTta3
	 wAWYhsShAG0XY/PNB9huEi61CtzAgXrPC4cMOP7LNV+64omg6rLR0SR6a6bKFJYcVr
	 7RD6+W7g6uDyQ==
Date: Mon, 29 Dec 2025 21:00:51 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx8mm: Add label to thermal-zones
Message-ID: <aVJ7g9bcilXJEbND@dragon>
References: <20251124092242.3378017-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124092242.3378017-1-d.schultz@phytec.de>

On Mon, Nov 24, 2025 at 01:22:42AM -0800, Daniel Schultz wrote:
> Add 'thermal_zones' as a label to the thermal-zones node.
> 
> Without this label, it is not possible to add additional
> trip points in board files. For example, to add an active
> trip point for controlling a fan.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

Applied, thanks!
