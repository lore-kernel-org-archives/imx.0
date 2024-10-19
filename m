Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFA38FB0;
	Sat, 19 Oct 2024 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327226; cv=none; b=Dposh/BazmQErxDZcmSm+ZrSFJ/XtMZhSmOnpmlylrx/UdHYi1pxbXU0XmWJUHVyAB3F/wtznSLfSStaFJs4r0UYQlKFmaYvPMUPCATpLUhTncz49ARTdE55BLkgl2TQi/4g1mMlxNBpa0FCOZ11OahyOOMeifOFBA62T1mEu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327226; c=relaxed/simple;
	bh=N8BrTf043Kg/5LG69/CHaIsAu47ifAFK6oa+MQYQ/YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhZdEYTleL5IARVeDXJzIMxBZftMyFl5Ods/26hzQx/04nik6EG6ST6dQJOyFoXY0M+KHg8LyUv4PSw/qr5BBpZP9DE/a0TUFqprYTywsRDdmfKONAr9q8Meghmc4XIlYwOB46kurz6S95ZS+UwQBKufYDqg2aguigSgrGCEftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFQcHKbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFQcHKbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3929C4CEC5;
	Sat, 19 Oct 2024 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729327225;
	bh=N8BrTf043Kg/5LG69/CHaIsAu47ifAFK6oa+MQYQ/YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFQcHKbH/kocuUnGxi+nHxXBO4fQuxWduYpv0qRioKodXJQT5VT+8VP6hqORKZEF+
	 dDRfg4HOnsQiq54AEM2GanGtWj40Vd6NQ240gJtltRebVzD/6qrrr8pBat64JRKW+g
	 mzliX5XkoXgO4igUfWNyBO76Mevf3Dk7fZFWqC0BdinHWbSZddkggjFyZzCxel0QPV
	 iHTTH2ytRjEbvHgPHADeQG0eXtGoziFEYHGKiHh+KBLj/J6Qg6vFTPL1hJxNBMLJhw
	 bM5VJlGCvKfoHIfrflMC+j+BTttg4Rd1DSKWLtuQUQeiwEBUdP5cUDdLq5WpClHZlQ
	 RITWupNH58XEg==
Date: Sat, 19 Oct 2024 09:40:20 +0100
From: Simon Horman <horms@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: robh@kernel.org, saravanak@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, philippe.schenker@toradex.com
Subject: Re: [PATCH] arm64: dts: colibri-imx8x: Fix typo "rewritting"
Message-ID: <20241019084020.GN1697@kernel.org>
References: <45F06B5D4CA9F444+20241018023340.47617-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45F06B5D4CA9F444+20241018023340.47617-1-wangyuli@uniontech.com>

On Fri, Oct 18, 2024 at 10:33:40AM +0800, WangYuli wrote:
> There is a spelling mistake of 'rewritting' in comments which
> should be 'rewriting'.
> 
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Simon Horman <horms@kernel.org>

