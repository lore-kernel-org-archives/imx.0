Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B58319258E;
	Mon, 29 Dec 2025 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013926; cv=none; b=Eq8W/aNlCVOe7GQoBdmON93NrVw/URNI08ViVGaqkGcRalS6htUuQcC/PKvPiRaoehDiG+x/fxKZw1RsPASWQHdLjGL5TEE/3jEoI8lyJSqSmxfmMJ+48P8tgBh/A88GE8MExWCsxOmQfua1rm37GqgCziLPWasueUQjDoNFRvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013926; c=relaxed/simple;
	bh=N70FETDs3GIYWbTtsUuIUscz6f9NjW6JqolYZNJHKVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5zwOt4L0fIuYWIVw+L8EL5w3yau1187ayxZ1yiA4vJ2azTL27id9Gjzs/NOhcxqRVlIzMwZDdD5aYUNkTaHwiqZXOoJkLa2Bon6eaM35ZxbZwMFDfPvqC8/Z30mP6UZoTox25Y/+mheR7Vtr4DJ4ZA7l9apvd4tDMOtioNECK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwhDpJVX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwhDpJVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C055DC116C6;
	Mon, 29 Dec 2025 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013926;
	bh=N70FETDs3GIYWbTtsUuIUscz6f9NjW6JqolYZNJHKVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwhDpJVXauRnVw3ifyNjriNvPRlrkqBlsGtxVVbxdwOhJuz85OEN3m+mMrXmtg8yr
	 3WAHSkG3mflcn/TaR3Uu/n33jBxVHIeV+L8sMv/4j/LrCKPSFKuCW/vb+J0eXdH14E
	 eH1FVpi9xYr3uBfXsCuurQ4XWW1GM6svsPTEqVUCEUMz5Ni7eINY/bH9x1d1Pz9IlX
	 a16IMJPSar8Dwqj/inbLLcR0tDZIqVuPmnhaKvgYkwCJF/1gDHKfDY/sg2/PAyctSR
	 gUTh77AK/vyKFITvnGJYund1b+4Lgtp510zF2mGrI6TyPogkc7sLZlYmyH+X0NjGLb
	 J5N8oVXhX/MWg==
Date: Mon, 29 Dec 2025 21:12:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable DA9052 and MC13XXX
Message-ID: <aVJ-IGz9YZajTzaP@dragon>
References: <20251128-imx53-qsrb-pmics-v1-1-a96f43ddbb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-imx53-qsrb-pmics-v1-1-a96f43ddbb59@oss.qualcomm.com>

On Fri, Nov 28, 2025 at 06:02:42AM +0200, Dmitry Baryshkov wrote:
> Enable PMICs used on i.MX53 Quick-Start Boards: DA9052 for i.MX53 QSB
> and MC13XXX for i.MX53 QSRB (it has Freescale MC34708 PMIC).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied, thanks!
