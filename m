Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86E19D8BC;
	Sun, 18 Jan 2026 02:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768701602; cv=none; b=udtzVsUGJXy0C4DspW2+ZEBCSzcnbrLrwZaU0b7DuZBIkBosSK2N7xYVnnZbaqmgEvUhAtmoz4RKpEzZrvJgQKPHafgJzmVeqywdT3vySdCbHiPV3o1LCvJZd1JCSCi6XCS5+dM8MEnD1ZHheB5n2yg/+w9pZ+kb/0Ohy5aauss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768701602; c=relaxed/simple;
	bh=FtOo0L3HifSIJ+5XkW0NZr9NZ2kybiEIkSrdj2Pr72U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8rB9xh8qNYIt8NEodHmOjzzWAXi95URwsFnlxjfngZu78GPySC4F1wka5ZiY7OCtLBxJ85n9Ir4SLeqB8SfzeqSIL7BAzyT/lZ37RMsZ5vvQ+IPFKXUPSIqz+ch2Aufjfep4g4ZGfJqdOqP7MMDm6f9/tYcNZ8RRigUSYmzlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL4dgnpq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL4dgnpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D4C4CEF7;
	Sun, 18 Jan 2026 01:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768701601;
	bh=FtOo0L3HifSIJ+5XkW0NZr9NZ2kybiEIkSrdj2Pr72U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL4dgnpqh+r2yxGfutgxcqivh6xUBnPlybffBO26X1vT8DgOQNIDekFpX1zmCzCQ8
	 wiHMJg8yfv/9BmT3QyGzObqm2aHWiTjBwdeuUkYoRhKWBXTG8oFaiKMG8R6sbuUXzX
	 he/DQ903SiMomx1mGRBxdDN5uenWLHzERsZkA78/jyDR9NwffboqFkzMQ9z5bcJ77Y
	 7P6X0RyG+TAKpDVYigQRX/p/KoH8kmh79r7g4iQLyT4KAxASL7/UBvIdOCvayHpzsf
	 5/rX2IkbUVOycki7C23Fmpzr2IMP0SVcA9NQ/PR1hyOYwyoe90eGN0KAmfcRm+EQrx
	 zrfbSm2dUOvkw==
Date: Sun, 18 Jan 2026 09:59:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tom Zheng <haidong.zheng@nxp.com>
Subject: Re: [PATCH v3] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Message-ID: <aWw-nArlfnG4PjQp@dragon>
References: <20260113075002.561453-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113075002.561453-1-daniel.baluta@nxp.com>

On Tue, Jan 13, 2026 at 09:50:02AM +0200, Daniel Baluta wrote:
> Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
> by adding sound card description and enabling sai1 and mqs1 dts nodes,
> together with necessary clocks and pinmux.
> 
> This supports audio playback via SAI1 DAI which is connected to the MQS1
> block.
> 
> Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Applied v3 instead, thanks!
